<template>
  <div
    style="position: relative"
  >
    <div class="verify-img-out">
      <div
        class="verify-img-panel"
        :style="{'width': setSize.imgWidth,
                 'height': setSize.imgHeight,
                 'background-size' : setSize.imgWidth + ' '+ setSize.imgHeight,
                 'margin-bottom': vSpace + 'px'}"
      >
        <div v-show="showRefresh" class="verify-refresh" style="z-index:3" @click="refresh">
          <span><ta-icon type="sync" />刷新</span>
        </div>
        <img
          ref="canvas"
          :src="pointBackImgBase?('data:image/png;base64,'+pointBackImgBase):defaultImg"
          alt=""
          style="width:100%;height:100%;display:block"
          @click="bindingClick?canvasClick($event):undefined"
        >

        <div
          v-for="(tempPoint, index) in tempPoints"
          :key="index"
          class="point-area"
          :style="{
            color:'#fff',
            'z-index':9999,
            width:'20px',
            height:'20px',
            'text-align':'center',
            'line-height':'20px',
            'border-radius': '50%',
            position:'absolute',
            top:parseInt(tempPoint.y-10) + 'px',
            left:parseInt(tempPoint.x-10) + 'px'
          }"
        >
          {{ index + 1 }}
        </div>
      </div>
    </div>
    <div
      :class="[
        {'verify-bar-area-default': status === 'default'},
        {'verify-bar-area-success': status === 'success'},
        {'verify-bar-area-failed': status === 'failed'}
      ]"
      :style="{'width': setSize.imgWidth,
               'line-height':this.barSize.height}"
    >
      <span class="verify-msg">{{ text }}</span>
    </div>
  </div>
</template>
<script type="text/babel">
/**
 * VerifyPoints
 * @description 点选
 * */
import { resetSize, } from './../utils/util'

export default {
  name: 'VerifyPoints',
  props: {
    // 弹出式pop，固定fixed
    mode: {
      type: String,
      default: 'fixed',
    },
    captchaType: {
      type: String,
    },
    // 间隔
    vSpace: {
      type: Number,
      default: 5,
    },
    imgSize: {
      type: Object,
      default () {
        return {
          width: '310px',
          height: '155px',
        }
      },
    },
    barSize: {
      type: Object,
      default () {
        return {
          width: '310px',
          height: '40px',
        }
      },
    },
    defaultImg: {
      type: String,
      default: '',
    },
  },
  data () {
    return {
      checkNum: 3, // 默认需要点击的字数
      fontPos: [], // 选中的坐标信息
      checkPosArr: [], // 用户点击的坐标
      num: 1, // 点击的记数
      pointBackImgBase: '', // 后端获取到的背景图片
      poinTextList: [], // 后端返回的点击字体顺序
      backToken: '', // 后端返回的token值
      setSize: {
        imgHeight: 0,
        imgWidth: 0,
        barHeight: 0,
        barWidth: 0,
      },
      tempPoints: [],
      text: '',
      barAreaColor: undefined,
      barAreaBorderColor: undefined,
      showRefresh: true,
      bindingClick: true,

      status: 'default',
    }
  },
  computed: {
    resetSize () {
      return resetSize
    },
  },
  watch: {
    // type变化则全面刷新
    type: {
      immediate: true,
      handler () {
        this.init()
      },
    },
  },
  mounted () {
    // 禁止拖拽
    this.$el.onselectstart = function () {
      return false
    }
  },
  methods: {
    init () {
      // 加载页面
      this.fontPos.splice(0, this.fontPos.length)
      this.checkPosArr.splice(0, this.checkPosArr.length)
      this.num = 1
      // this.getPicture()
      this.$nextTick(() => {
        this.setSize = this.resetSize(this)
        this.$parent.$emit('ready', this)
      })
    },
    canvasClick (e) {
      this.checkPosArr.push(this.getMousePos(this.$refs.canvas, e))
      if (this.num === this.checkNum) {
        this.num = this.createPoint(this.getMousePos(this.$refs.canvas, e))
        // 按比例转换坐标值
        this.checkPosArr = this.pointTransform(this.checkPosArr, this.setSize)
        // 等创建坐标执行完
        setTimeout(() => {
          // 发送后端请求
          const captchaVerification = Base.cryptoAsymmetricFn(this.backToken + '---' + JSON.stringify(this.checkPosArr))
          const data = {
            captchaType: this.captchaType,
            pointJson: Base.cryptoAsymmetricFn(JSON.stringify(this.checkPosArr)),
            token: this.backToken,
          }
          this.Base.submit(null, {
            url: 'captcha/check',
            data: data,
          }).then((data) => {
            const res = data.data.resultData
            if (res.repCode === '0000') {
              // this.barAreaColor = '#4cae4c'
              // this.barAreaBorderColor = '#5cb85c'
              this.status = 'success'
              this.text = this.$t('login.verify.validationSucceeded')
              this.bindingClick = false
              if (this.mode === 'pop') {
                setTimeout(() => {
                  this.$parent.clickShow = false
                  this.refresh()
                }, 1500)
              }
              this.$emit('success', { captchaVerification, })
            } else {
              this.$parent.$emit('error', this)
              // this.barAreaColor = '#d9534f'
              // this.barAreaBorderColor = '#d9534f'
              this.status = 'failed'
              this.text = this.$t('login.verify.validationFailed')
              setTimeout(() => {
                this.refresh()
              }, 700)
            }
          })
        }, 400)
      }
      if (this.num < this.checkNum) {
        this.num = this.createPoint(this.getMousePos(this.$refs.canvas, e))
      }
    },

    // 获取坐标
    getMousePos: function (obj, e) {
      const x = e.offsetX
      const y = e.offsetY
      return { x, y, }
    },
    // 创建坐标点
    createPoint: function (pos) {
      this.tempPoints.push(Object.assign({}, pos))
      return ++this.num
    },
    refresh: function () {
      this.tempPoints.splice(0, this.tempPoints.length)
      this.barAreaColor = '#000'
      this.barAreaBorderColor = '#ddd'
      this.bindingClick = true
      this.fontPos.splice(0, this.fontPos.length)
      this.checkPosArr.splice(0, this.checkPosArr.length)
      this.num = 1
      this.getPicture()
      this.text = this.$t('login.verify.waitingVerification')
      this.status = 'default'
      this.showRefresh = true
    },

    // 请求背景图片和验证图片
    getPicture () {
      const data = {
        captchaType: this.captchaType,
        clientUid: localStorage.getItem('point'),
        ts: Date.now(),
      }
      this.Base.submit(null, {
        url: 'captcha/get',
        data: data,
      }).then((data) => {
        const res = data.data.resultData
        if (res?.repCode === '0000') {
          this.pointBackImgBase = res.repData.originalImageBase64
          this.backToken = res.repData.token
          this.poinTextList = res.repData.wordList
          this.text = `${this.$t('login.verify.pointTips')}【${this.poinTextList.join(',')}】`
          // this.text = '请依次点击【' + this.poinTextList.join(',') + '】'
        } else {
          this.text = res.repMsg
        }

        // 判断接口请求次数是否失效
        if (res?.repCode === '6201') {
          this.pointBackImgBase = null
        }
      })
    },
    // 坐标转换函数
    pointTransform (pointArr, imgSize) {
      return pointArr.map(p => {
        const x = Math.round(310 * p.x / parseInt(imgSize.imgWidth))
        const y = Math.round(155 * p.y / parseInt(imgSize.imgHeight))
        return { x, y, }
      })
    },
  },
}
</script>

<style lang="less" scoped>
  .point-area {
    background-color: @primary-color;
  }
  .verify-bar-area-default {
    color: #303133;
    text-align: center;
    border: 1px solid #eee;
  }
  .verify-bar-area-success {
    color: @success-color;
    text-align: center;
    border: 1px solid @success-color;
  }
  .verify-bar-area-failed {
    color: @btn-danger-bg;
    text-align: center;
    border: 1px solid @btn-danger-bg;
  }

  .verify-img-out {
    margin-bottom: 12px;
  }

  .verify-img-panel {
      margin: 0;
      -webkit-box-sizing: content-box;
      -moz-box-sizing: content-box;
      box-sizing: content-box;
      /*border-top: 1px solid #ddd;*/
      /*border-bottom: 1px solid #ddd;*/
      border-radius: 3px;
      position: relative;
  }

  .verify-img-panel .verify-refresh {
      width: 60px;
      height: 25px;
      text-align: center;
      padding: 5px;
      cursor: pointer;
      position: absolute;
      top: 0;
      right: 0;
      z-index: 2;
  }

  .verify-img-panel .icon-refresh {
      font-size: 20px;
      color: #fff;
  }

  .verify-img-panel .verify-gap {
      background-color: #fff;
      position: relative;
      z-index: 2;
      border: 1px solid #fff;
  }
</style>

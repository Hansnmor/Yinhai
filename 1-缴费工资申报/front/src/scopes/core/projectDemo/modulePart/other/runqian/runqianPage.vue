<template>
  <div class="fit">
    <ta-alert :message="'该示例与<润乾模板管理>功能共享一个数据来源, 请查看示例时, 谨慎操作'" type="warning" show-icon />
    <ta-border-layout :layout="{header:'70px',footer:'70px'}" :center-cfg="{showBar: true, toolBarStyle: {height: '50px', lineHeight: '48px'}}" :footer-cfg="{showBorder: false}">
      <div slot="header" class="center-box">
        <ta-input-search v-model="param" placeholder="根据报表标志模糊查询" class="search-box" enter-button="搜索" @search="searchQuery" />
      </div>
      <div slot="centerExtraContent">
        <ta-tag-select v-model="tags" title="报表类型" :data="CollectionData('RAQTYPE')" :is-multi="true" @change="searchQuery" />
        <div style="float: right;">
          <ta-button key="delete" @click="fnDelTem">
            删除
          </ta-button>
          <ta-button key="add" @click="openAddWin">
            新增
          </ta-button>
        </div>
      </div>
      <ta-table
        :columns="columns"
        row-key="raqfilename"
        :pagination="false"
        :data-source="gridData"
        :row-selection="{selectedRowKeys: selectedRowKeys,onChange: onSelectChange}"
      >
        <span slot="operate">
          <ta-table-operate :operate-menu="operateMenu" />
        </span>
      </ta-table>
      <div slot="footer">
        <ta-pagination
          ref="gridPager"
          style="float: right; margin-top: 10px;"
          show-size-changer
          show-quick-jumper
          :data-source.sync="gridData"
          :default-page-size="10"
          :page-size.sync="pageSize"
          :params="templatePageParams"
          url="tarunqianresource/taRunqianResourceRestService/queryRunqianResource"
        />
      </div>
      <add-template :visible="editVisible" :raq-type="raqType" :edit-type="editType" :record="record" @close="closeWin" />
    </ta-border-layout>

    <ta-drawer :visible="printVisible" title="打印预览" width="800" placement="right" :closable="true" @close="handleClosePrintPage">
      <ta-button @click="handlePrint">
        打印
      </ta-button>
      <ta-button @click="handleDownload">
        下载
      </ta-button>
      <ta-divider />
      <pdf-viewer ref="pdfViewer" style="height: 600px" :is-simple-show-mode="true" />
    </ta-drawer>
  </div>
</template>
<script>
import addTemplate from './addTemplate'
import $api from '../api/index'

const columns = [
  { title: '报表标志', dataIndex: 'raqfilename', width: '15%', },
  { title: '报表名称', dataIndex: 'raqname', width: '15%', },
  { title: '父报表标志', dataIndex: 'parentraqfilename', width: '10%', },
  { title: '报表类型', dataIndex: 'raqtype', width: '10%', },
  { title: '上传人', dataIndex: 'username', width: '10%', },
  { title: '上传时间', dataIndex: 'uploadtime', width: '10%', overflowTooltip: true, },
  { title: '操作', dataIndex: 'operate', align: 'center', width: '340px', overflowTooltip: false, scopedSlots: { customRender: 'operate', }, }
]
export default {
  name: 'RunqianPage',
  components: { addTemplate, },
  data () {
    return {
      param: '',
      tags: [],
      columns,
      operateMenu: [{
        name: '添加子表',
        onClick: (record) => {
          this.openAddClidWin(record)
        },
      }, {
        name: '编辑',
        onClick: (record) => {
          this.openEditWin(record)
        },
      }, {
        name: '下载',
        type: 'confirm',
        confirmTitle: '确认下载?',
        onOk: (record) => {
          this.confirmDownload(record)
        },
      }, {
        name: '无参数预览',
        onClick: (record) => {
          this.toPreviewPdf(record)
        },
      }],
      gridData: [],
      pageSize: 10,
      editVisible: false,
      editType: '',
      raqType: '',
      record: {},
      selectedRowKeys: [],
      selectedRows: [],
      printVisible: false,
    }
  },
  mounted () {
    this.searchQuery()
  },
  methods: {
    getCookie (name) {
      let arr
      const reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)')
      // eslint-disable-next-line no-cond-assign
      if (arr = document.cookie.match(reg)) { return unescape(arr[2]) } else { return null }
    },
    // 获取token方法
    getToken () {
      const strCookie = document.cookie// 获取cookie字符串
      const arrCookie = strCookie.split('; ')// 分割
      // 遍历匹配
      let token = ''
      arrCookie.forEach((value) => {
        if (value.indexOf('XSRF-TOKEN') !== -1) {
          token = value.slice('XSRF-TOKEN'.length + 1)
        }
      })
      return token
    },
    onSelectChange (selectedRowKeys, selectedRows) {
      this.selectedRowKeys = selectedRowKeys
      this.selectedRows = selectedRows
    },
    fnDelTem () {
      if (this.selectedRows.length === 0) {
        this.$message.warning('需要至少选中一条数据')
        return
      }
      const raqfilenames = []
      this.selectedRows.forEach((item) => { raqfilenames.push(item.raqfilename) })
      $api.delRunqianResource({ raqfilenames: raqfilenames.join(','), }, (result) => {
        this.$message.success('成功删除' + result.data.rows + '条数据')
        this.searchQuery()
        this.selectedRows = []
      })
    },
    closeWin () {
      this.editVisible = false
      this.searchQuery()
    },
    templatePageParams () {
      const pageParam = {}
      pageParam.raqfilename = this.param
      pageParam.raqtype = this.tags
      return pageParam
    },
    searchQuery () {
      this.$refs.gridPager.loadData()
    },
    openAddWin () {
      this.editVisible = true
      this.editType = '1'
      this.raqType = '1'
      this.record = {}
    },
    openEditWin (record) {
      this.editVisible = true
      this.editType = '2'
      this.record = record
      this.raqType = record.raqtype
    },
    openAddClidWin (record) {
      this.editVisible = true
      this.editType = '1'
      this.record = {}
      this.record.parentraqfilename = record.raqfilename
      this.record.parentraqname = record.raqname
      this.raqType = '2'
    },
    confirmDownload (record) {
      const basePath = faceConfig.basePath
      location.href = basePath + '/tarunqianresource/taRunqianResourceRestService/downloadRunqianResource?raqfilename=' + record.raqfilename +
        '&_modulePartId_=' + TaUtils.getNowPageParam()._modulePartId_ +
        '&X-XSRF-TOKEN=' + this.getToken() +
        '&TA-JTOKEN=' + this.getCookie(faceConfig.basePath + 'TA-JTOKEN')
    },
    handlePrint () {
      this.$refs.pdfViewer.toPrint()
    },
    handleDownload () {
      this.$refs.pdfViewer.toDownload()
    },
    handleClosePrintPage () {
      this.printVisible = false
    },
    toPreviewPdf (record) {
      this.printVisible = true
      this.$nextTick(() => {
        this.$refs.pdfViewer.showRaq(record.raqfilename, {
          // 其他参数
        })
      })
    },
  },
}
</script>

<style lang="less" scoped type="text/less">
.search-box {width: 340px; line-height: 42px; }
.center-box { text-align: center; overflow: hidden; }
.disable-color { color:@text-color-secondary ; &:hover { color:@text-color-secondary } }
</style>

<template>
  <ta-drawer
    title="个人信息"
    placement="right"
    :closable="true"
    :visible="visible"
    destroy-on-close
    width="500px"
    :get-container="setContainer"
    @close="closeDrawer"
  >
    <ta-form :auto-form-create="(form)=>{this.form = form}">
      <template v-for="formSetting in formNormalShowSettings">
        <renderFormItem :key="formSetting.id" :form-setting="formSetting" :is-show="true" :show-values="formData" :simple-show-slot="simpleShowSlot" render-type="SHOW">
          <div v-if="formSetting.id == 'avatar'" class="pos-avatar">
            <div v-if="imageUrl && imageUrl.length" class="img-avatar" :style="{ backgroundImage: 'url('+imageUrl+')'}" />
            <ta-icon v-else type="user" />
          </div>
          <template v-else-if="formSetting.id == 'orgIdShow'">
            {{ formData.namePath }}
          </template>
          <template v-for="tag in tags" v-else-if="formSetting.id == 'tags'">
            <ta-tag v-if="selectedTags.indexOf(tag.tagId) > -1" :key="tag.tagId" class="tag-select">
              {{ tag.tagName }}
            </ta-tag>
          </template>
        </renderFormItem>
      </template>
      <ta-collapse v-if="formMoreShowSettings.length > 0" :bordered="false">
        <ta-collapse-panel key="1" header="更多个人信息" style="border:none">
          <template v-for="formSetting in formMoreShowSettings">
            <renderFormItem :key="formSetting.id" :form-setting="formSetting" :is-show="true" :show-values="formData" :simple-show-slot="simpleShowSlot" render-type="SHOW">
              <div v-if="formSetting.id == 'avatar'" class="pos-avatar">
                <div v-if="imageUrl && imageUrl.length" class="img-avatar" :style="{ backgroundImage: 'url('+imageUrl+')'}" />
                <ta-icon v-else type="user" />
              </div>
              <template v-else-if="formSetting.id == 'orgIdShow'">
                {{ formData.namePath }}
              </template>
              <template v-for="tag in tags" v-else-if="formSetting.id == 'tags'">
                <ta-tag v-if="selectedTags.indexOf(tag.tagId) > -1" :key="tag.tagId" class="tag-select">
                  {{ tag.tagName }}
                </ta-tag>
              </template>
            </renderFormItem>
          </template>
        </ta-collapse-panel>
      </ta-collapse>
    </ta-form>
  </ta-drawer>
</template>
<script>
import $api from '../api/index'
import renderFormItem from '@projectCommon/components/renderFormItem'
import mixins from '../mixins'

const showColumnFilter = ['password', 'password_2']
const simpleShowSlot = ['loginId']

export default {
  name: 'rowData',
  components: { renderFormItem, },
  mixins: [mixins],
  props: ['visible', 'rowData'],
  data () {
    return {
      formData: {},
      simpleShowSlot,
      imageUrl: '',
      tags: [],
      selectedTags: [],
    }
  },
  computed: {
    formNormalShowSettings () {
      return this.formNormalSettings.filter(a => showColumnFilter.indexOf(a.id) === -1) || []
    },
    formMoreShowSettings () {
      return this.formMoreSettings.filter(a => showColumnFilter.indexOf(a.id) === -1) || []
    },
  },
  mounted () {
    this.formData = this.rowData
    this.buildForm(this.formData)
    this.queryPortrait()
    this.queryTag()
  },
  methods: {
    setContainer () {
      return document.getElementById('userManagement')
    },
    getFormNecessarySettings (initData) {
      return [
        {
          id: 'avatar',
          formId: '',
          formItem: {
            type: 'slot',
            collection: null,
          },
          label: '用户头像',
          class: 'avatar-form-item',
          display: true,
          exist: true,
          formItemLayout: this.formItemLayouts.default,
        },
        {
          id: 'orgIdShow',
          formId: '',
          formItem: {
            type: 'slot',
            collection: null,
          },
          label: '所属组织',
          decoratorOptions: {},
          display: true,
          exist: true,
          formItemLayout: this.formItemLayouts.default,
        },
        {
          id: 'name',
          formId: 'name',
          formItem: {
            type: 'input',
            collection: null,
          },
          label: '姓名',
          decoratorOptions: {},
          display: true,
          exist: true,
          formItemLayout: this.formItemLayouts.default,
        },
        {
          id: 'loginId',
          formId: 'loginId',
          formItem: {
            type: 'slot',
            collection: null,
          },
          label: '账号',
          decoratorOptions: {},
          display: true,
          exist: true,
          formItemLayout: this.formItemLayouts.default,
        }
      ]
    },
    closeDrawer () {
      this.$emit('close')
    },
    queryPortrait () {
      $api.queryAvatar({ userId: this.rowData.userId, }, (data) => {
        this.imageUrl = data.data.portrait || ''
      })
    },
    queryTag () {
      $api.queryTagByUserId({ userId: this.rowData.userId, }, (data) => {
        this.tags = data.data.tagList
        this.selectedTags = []
        for (let i = 0; i < this.tags.length; i++) {
          if (this.tags[i].isChecked === '1') {
            this.selectedTags.push(this.tags[i].tagId)
          }
        }
      })
    },
  },
}
</script>
<style type="text/less" lang="less">
  .avatar-form-item .ant-form-item-label { margin-top: 12px; }
</style>
<style scoped type="text/less" lang="less">
  .pos-avatar { position: relative; overflow: hidden; width: 64px; height: 64px; line-height: 64px; margin-left: 10px; font-size: 32px; text-align: center; background: #ccc; color: #fff; border-radius: 100%; }
  .img-avatar { width: 64px; height: 64px; background-repeat: no-repeat; background-size: cover; background-position: center; }
  .tag-select { border-color: @primary-color; color: @primary-color; .user-select() }
</style>

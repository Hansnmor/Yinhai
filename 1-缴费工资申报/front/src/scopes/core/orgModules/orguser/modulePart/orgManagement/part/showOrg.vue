<template>
  <ta-drawer :getContainer="setContainer" title="组织机构信息" width="500" placement="right" :closable="true" @close="closeEdit" :visible="visible" destroyOnClose>
    <ta-form :autoFormCreate="(form)=>{this.form = form}">
      <taContainerMask :show="editLoading"></taContainerMask>
      <template v-for="formSetting in formNormalShowSettings">
        <renderFormItem :key="formSetting.id" :formSetting="formSetting" :isShow="true" :showValues="formData" :simpleShowSlot="simpleShowSlot"  renderType="SHOW">
          <template v-if="formSetting.id == 'effective'">{{formData.effective ? '有效':'无效'}}</template>
          <template v-else-if="formSetting.id == 'orgManager'">{{formData.orgManagerName}}</template>
          <template v-else-if="formSetting.id == 'contacts'">{{formData.contactsName}}</template>
          <template v-else-if="formSetting.id == 'tags'" v-for="tag in tags">
            <ta-tag :key="tag.tagId" v-if="selectedTags.indexOf(tag.tagId) > -1" class="tag-select">{{tag.tagName}}</ta-tag>
          </template>
        </renderFormItem>
      </template>
      <ta-collapse :bordered="false" v-if="formMoreShowSettings.length > 0">
        <ta-collapse-panel header="更多组织信息" key="1" style="border:none">
          <template v-for="formSetting in formMoreShowSettings">
            <renderFormItem :key="formSetting.id" :formSetting="formSetting" :isShow="true" :showValues="formData" :simpleShowSlot="simpleShowSlot" renderType="SHOW">
              <template v-if="formSetting.id == 'effective'">{{formData.effective ? '有效':'无效'}}</template>
              <template v-else-if="formSetting.id == 'orgManager'">{{formData.orgManagerName}}</template>
              <template v-else-if="formSetting.id == 'contacts'">{{formData.contactsName}}</template>
              <template v-else-if="formSetting.id == 'tags'" v-for="tag in tags">
                <ta-tag :key="tag.tagId" v-if="selectedTags.indexOf(tag.tagId) > -1" class="tag-select">{{tag.tagName}}</ta-tag>
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

const showColumnFilter = ['porgId', 'orgId']
const simpleShowSlot = ['areaValue']

export default {
  name: 'showOrg',
  props: ['visible', 'rowData', 'tags'],
  components: { renderFormItem },
  mixins: [mixins],
  data () {
    return {
      form: null,
      formData: {},
      simpleShowSlot,
      selectedTags: [],
      editLoading: false
    }
  },
  computed: {
    formNormalShowSettings () {
      return this.formNormalSettings.filter(a => showColumnFilter.indexOf(a.id) == -1) || []
    },
    formMoreShowSettings () {
      return this.formMoreSettings.filter(a => showColumnFilter.indexOf(a.id) == -1) || []
    }
  },
  mounted () {
    this.editLoading = true
    this.queryForm()
  },
  methods: {
    queryForm () {
      $api.queryTaOrgByOrgId({ orgId: this.rowData.orgId, type: '2' }, (result) => {
        const { orgTags, pOrgName, orgManagerName, contactsName } = result.data.taOrgInfoVo
        const { parentId, effective, orgName, orgId, orgType, customNo, orgCode, tel, address, orderNo } = result.data.taOrgInfoVo.org
        this.selectedTags = orgTags

        const orgData = result.data.taOrgInfoVo.org
        Object.keys(orgData).forEach(field => {
          this.formData[field] = orgData[field]
        })
        Object.assign(this.formData, {
          orgManagerName: orgManagerName,
          contactsName: contactsName,
          porgId: parentId,
          pOrgName: pOrgName,
          areaValue: this.rowData.area,
          effective: effective == '1',
          orderNo: orderNo.toString()
        })

        this.buildForm(this.formData)
        this.editLoading = false
      })
    },
    closeEdit () {
      this.$emit('close')
      this.editLoading = false
      this.formData = {}
    }
  }
}
</script>
<style scoped type="text/less" lang="less">
  .tag-select { border-color: @primary-color; color: @primary-color; .user-select() }
</style>

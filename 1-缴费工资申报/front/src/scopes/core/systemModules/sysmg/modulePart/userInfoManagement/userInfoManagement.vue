<template>
  <div id="userInfoManagement" class="fit">
    <ta-border-layout :layout="{header:'70px', overflow:'hidden'}" :header-cfg="{showBorder: false}">
      <ta-tabs slot="header" v-model="tabsKey" class="userInfo-tab" @change="changeData">
        <ta-tab-pane key="1" tab="用户个人字段配置" />
        <ta-tab-pane key="2" tab="组织机构字段配置" />
        <ta-tab-pane key="3" tab="功能资源字段配置" />
        <ta-button-group slot="tabBarExtraContent">
          <ta-button class="step1" @click="loadDefaultSetting">
            加载默认配置
          </ta-button>
          <ta-button @click="loadTableData()">
            刷新
          </ta-button>
          <ta-button type="primary" @click="saveSubmitAll">
            保存
          </ta-button>
        </ta-button-group>
      </ta-tabs>
      <ta-table :columns="columns" :data-source="tableData" row-key="fieldId">
        <span slot-scope="text" solt="type">{{ text }}</span>
        <span slot="effectiveCheck" slot-scope="text, record"><ta-checkbox v-model="record.effectiveCheck" @change="getRecord(record)">有效</ta-checkbox></span>
        <span slot="hideCheck" slot-scope="text, record"><ta-checkbox v-model="record.hideCheck" :disabled="record.requiredCheck" @change="getRecord(record)">隐藏</ta-checkbox></span>
        <span slot="requiredCheck" slot-scope="text, record"><ta-checkbox v-model="record.requiredCheck" :disabled="record.hideCheck || record.unchangeableCheck" @change="getRecord(record)">必填</ta-checkbox></span>
        <span slot="unchangeableCheck" slot-scope="text, record"><ta-checkbox v-model="record.unchangeableCheck" :disabled="record.requiredCheck" @change="getRecord(record)">不可编辑</ta-checkbox></span>
        <!--        <span slot="protectPrivacyCheck" slot-scope="text, record"><ta-checkbox @change="getRecord(record)" v-model="record.protectPrivacyCheck">隐私保护</ta-checkbox></span>-->
        <span slot="moreCheck" slot-scope="text, record"><ta-checkbox v-model="record.moreCheck" @change="getRecord(record)">是</ta-checkbox></span>
        <span slot="orderNo" slot-scope="text, record"><ta-input-number v-model="record.orderNo" :min="1" @change="getRecord(record)" /></span>
        <span slot="action">
          <ta-table-operate :operate-menu="operateMenu" />
        </span>
      </ta-table>
    </ta-border-layout>
    <ta-drawer
      :destroy-on-close="true"
      :title="defaultTitle"
      width="500"
      placement="right"
      :closable="true"
      :visible="drawerVisible"
      :getContainer="false"
      @close="drawerVisible=false"
    >
      <ta-form :auto-form-create="(form)=>{this.form = form}">
        <ta-form-item
          label="类型"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="type"
        >
          <ta-input disabled />
        </ta-form-item>
        <ta-form-item
          label="字段名称"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="fieldId"
        >
          <ta-input disabled />
        </ta-form-item>
        <ta-form-item
          label="字段名称"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="formId"
        >
          <ta-input disabled />
        </ta-form-item>
        <ta-form-item
          label="标题文字"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="displayText"
          :field-decorator-options="{rules: [{ required: true, message: '请输入标题文字' }]}"
        >
          <ta-input placeholder="请输入标题文字" />
        </ta-form-item>
        <ta-form-item
          label="是否有效"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="effective"
        >
          <ta-radio-group>
            <ta-radio value="1">
              是
            </ta-radio>
            <ta-radio value="0">
              否
            </ta-radio>
          </ta-radio-group>
        </ta-form-item>
        <ta-form-item
          label="是否隐藏"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="hide"
        >
          <ta-radio-group @change="(e) => mutexChange(e, 'hide')">
            <ta-radio value="1">
              是
            </ta-radio>
            <ta-radio value="0">
              否
            </ta-radio>
          </ta-radio-group>
        </ta-form-item>
        <ta-form-item
          label="是否必填"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="required"
        >
          <ta-radio-group @change="(e) => mutexChange(e, 'required')">
            <ta-radio value="1">
              是
            </ta-radio>
            <ta-radio value="0">
              否
            </ta-radio>
          </ta-radio-group>
        </ta-form-item>
        <ta-form-item
          label="不可编辑"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="unchangeable"
        >
          <ta-radio-group @change="(e) => mutexChange(e, 'unchangeable')">
            <ta-radio value="1">
              是
            </ta-radio>
            <ta-radio value="0">
              否
            </ta-radio>
          </ta-radio-group>
        </ta-form-item>

        <ta-form-item
          v-show="false"
          label="隐私保护"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="protectPrivacy"
        >
          <ta-radio-group>
            <ta-radio value="1">
              是
            </ta-radio>
            <ta-radio value="0">
              否
            </ta-radio>
          </ta-radio-group>
        </ta-form-item>
        <ta-form-item
          label="属于更多内容"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="more"
        >
          <ta-radio-group>
            <ta-radio value="1">
              是
            </ta-radio>
            <ta-radio value="0">
              否
            </ta-radio>
          </ta-radio-group>
        </ta-form-item>
        <ta-form-item
          label="显示顺序"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="orderNo"
          :field-decorator-options="{rules: [{ required: true, message: '请输入显示顺序' }]}"
        >
          <ta-input-number :min="1" :step="1" style="width: 100%" placeholder="请输入显示顺序" />
        </ta-form-item>
        <ta-form-item
          label="内容长度"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="contentSize"
        >
          <ta-input-number :min="0" :step="1" style="width: 100%" placeholder="请输入内容长度" :disabled="formDisable.contentSize" />
        </ta-form-item>
        <ta-form-item
          label="表单元素类型"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="formType"
        >
          <ta-select style="width: 100%" placeholder="请选择表单元素类型" @change="handleChangeFormType">
            <ta-select-option value="radio">
              单选
            </ta-select-option>
            <ta-select-option value="radioButton">
              单选按钮
            </ta-select-option>
            <ta-select-option value="input">
              文本
            </ta-select-option>
            <ta-select-option value="sensitive-input">
              脱敏文本
            </ta-select-option>
            <ta-select-option value="select">
              下拉选
            </ta-select-option>
            <ta-select-option value="select-multiple">
              多选下拉选
            </ta-select-option>
            <ta-select-option value="slot">
              插槽
            </ta-select-option>
          </ta-select>
        </ta-form-item>
        <ta-form-item
          v-if="currentSelectFormType === 'sensitive-input'"
          label="脱敏规则"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
        >
          <ta-row>
            <ta-col span="10">
              <ta-form-item style="margin-bottom:0px" field-decorator-id="protectPrivacyRulePrefix">
                <ta-input-number style="width: 100%;" min="0" default-value="0" />
              </ta-form-item>
            </ta-col>
            <ta-col span="10">
              <ta-form-item style="margin-bottom:0px" field-decorator-id="protectPrivacyRuleSuffix">
                <ta-input-number style="width: 100%;" min="0" default-value="0" />
              </ta-form-item>
            </ta-col>
            <ta-col span="2">
              <ta-popover
                width="300"
                trigger="hover"
                content="配置脱敏规则, 内容开头从多少位开始脱敏, 内容结尾剩下多少位不脱敏,  eq: 手机的脱敏规则 3,4"
              >
                <ta-icon slot="reference" type="question-circle" style="cursor: pointer;" />
              </ta-popover>
            </ta-col>
          </ta-row>
        </ta-form-item>
        <ta-form-item
          label="关联码表"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="connectAA10"
        >
          <ta-input :disabled="formDisable.connectAA10" />
        </ta-form-item>
        <ta-form-item
          label="信息提示文字"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="tiText"
        >
          <ta-textarea style="width: 100%" placeholder="请输入信息提示文字" :rows="4" />
        </ta-form-item>
        <ta-form-item
          label="验证表达式"
          :label-col="formItemLayout.labelCol"
          :wrapper-col="formItemLayout.wrapperCol"
          field-decorator-id="validReg"
        >
          <ta-textarea style="width: 100%" placeholder="请输入验证表达式" :rows="4" :disabled="formDisable.validReg" />
        </ta-form-item>
      </ta-form>
      <div slot="footer">
        <ta-button-group>
          <ta-button @click="setValue(currentData)">
            重置
          </ta-button>
          <ta-button type="primary" @click="saveSubmit">
            保存
          </ta-button>
        </ta-button-group>
      </div>
    </ta-drawer>
  </div>
</template>
<script>
import api from './api'
import extendResourceSetting from '@projectCommon/js/extendConfig/extendResourceSetting'
import extendOrgSetting from '@projectCommon/js/extendConfig/extendOrgSetting'
import extendUserSetting from '@projectCommon/js/extendConfig/extendUserSetting'
import guideMixins from '@projectCommon/js/extendConfig/guideMixins'

// 字符串转base64
function b64EncodeUnicode (str) {
  return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g, function (match, p1) {
    return String.fromCharCode('0x' + p1)
  }))
}

const columns = [
  { title: '字段名称', align: 'left', dataIndex: 'displayText', scopedSlots: { customRender: 'displayText', }, },
  { title: '是否有效', align: 'left', dataIndex: 'effectiveCheck', scopedSlots: { customRender: 'effectiveCheck', }, },
  { title: '是否隐藏', align: 'left', dataIndex: 'hideCheck', scopedSlots: { customRender: 'hideCheck', }, },
  { title: '是否必填', align: 'left', dataIndex: 'requiredCheck', scopedSlots: { customRender: 'requiredCheck', }, },
  { title: '不可编辑', align: 'left', dataIndex: 'unchangeableCheck', scopedSlots: { customRender: 'unchangeableCheck', }, },
  // { title: '是否隐私保护', align: 'left', dataIndex: 'protectPrivacyCheck', scopedSlots: { customRender: 'protectPrivacyCheck' } },
  { title: '是否更多菜单', align: 'left', dataIndex: 'moreCheck', scopedSlots: { customRender: 'moreCheck', }, },
  { title: '显示顺序', align: 'left', dataIndex: 'orderNo', scopedSlots: { customRender: 'orderNo', }, },
  { title: '操作', align: 'center', dataIndex: 'action', scopedSlots: { customRender: 'action', }, }
]

export default {
  name: 'userInfoManagement',
  mixins: [guideMixins],
  data () {
    return {
      tabsKey: '1',
      columns,
      operateMenu: [{
        name: '编辑',
        onClick: (record) => {
          this.fnEdit(record)
        },
      }],
      tableData: [],
      formItemLayout: {
        labelCol: { span: 6, },
        wrapperCol: { span: 18, },
      },
      currentData: {},
      changeList: [],
      drawerVisible: false,
      defaultTitle: '',
      formDisable: {
        contentSize: false,
        connectAA10: false,
        validReg: false,
      },
      currentSelectFormType: '',
    }
  },
  mounted () {
    this.loadTableData()
    const steps = [
      {
        element: '.step1',
        popover: {
          title: '加载默认配置',
          description: '此功能可将配置还原成系统默认的配置',
          position: 'left',
        },
      }
    ]
    this.fnCommonGuide(steps)
  },
  methods: {
    loadDefaultSetting () {
      const msg = this.tabsKey === '1' ? '【用户】' : (this.tabsKey === '2' ? '【组织】' : '【功能】')
      const confirmMsg = '该操作会直接重载' + msg + '默认配置，请确认！'
      this.$confirm({
        title: '重载配置确认',
        content: confirmMsg,
        getContainer: () => {return document.getElementById('userInfoManagement')},
        onOk: () => {
          let settings = []
          if (this.tabsKey === '1') {
            settings = extendUserSetting
          }
          if (this.tabsKey === '2') {
            settings = extendOrgSetting
          }
          if (this.tabsKey === '3') {
            settings = extendResourceSetting
          }
          this.tableData = settings.map(item => {
            const setting = Object.assign(item)
            setting.effectiveCheck = setting.effective === '1'
            setting.hideCheck = setting.hide === '1'
            setting.requiredCheck = setting.required === '1'
            setting.unchangeableCheck = setting.unchangeable === '1'
            setting.protectPrivacyCheck = setting.protectPrivacy === '1'
            setting.moreCheck = setting.more === '1'
            if (!(setting.validReg == null || setting.validReg === '' || setting.validReg === undefined)) {
              setting.validReg = b64EncodeUnicode(setting.validReg)
            }
            return setting
          })
          api.saveDefaultSetting({
            type: this.tabsKey,
            settingListJson: JSON.stringify(this.tableData),
          }, (data) => {
            this.changeList = []
            this.loadTableData()
            this.$message.success('配置已重载')
          })
        },
      })
    },
    // 查询表格以及模态框的数值
    changeData () {
      // 在tab切换后加载，否则会闪一下
      setTimeout(() => {
        this.loadTableData()
      }, 650)
    },
    loadTableData () {
      api.querySettingTable({ type: this.tabsKey, }, (data) => {
        this.tableData = data.resultData
      })
      this.changeList = []
    },
    fnEdit (record) {
      // type 类型：组织、个人等等,可直接用表名 FORMTYPE 表单元素类型  DISPLAYTEXT 显示名称
      const msg = this.tabsKey === '1' ? '用户' : (this.tabsKey === '2' ? '组织' : '功能')
      this.defaultTitle = '编辑' + msg + '详细信息'
      this.currentData = { ...record, }
      this.drawerVisible = true
      this.$nextTick(() => {
        this.$nextTick(() => {
          this.setValue(record)
        })
      })
    },
    setValue (record) {
      this.form.resetFields()
      const updateFormItemValue = TaUtils.assign(this.form.getFieldsValue(), record)
      this.form.setFieldsValue(updateFormItemValue)
      this.handleChangeFormType(updateFormItemValue.formType)
    },
    saveSubmit () {
      this.form.validateFields((err, values) => {
        if (!err) {
          values.type = this.tabsKey
          // validReg 处理
          if (values.validReg) {
            values.validReg = values.validReg.replace(/\\\\/g, '\\')
            // values.validReg = b64EncodeUnicode(values.validReg)
          }
          // 脱敏规则处理
          if (values.formType === 'sensitive-input') {
            values.protectPrivacyRule = (values.protectPrivacyRulePrefix || '0') + ',' + (values.protectPrivacyRuleSuffix || '0')
          }
          api.saveSettingTable(values, (data) => {
            this.drawerVisible = false
            this.loadTableData()
            this.$message.success('编辑成功')
          })
        }
      })
    },
    getRecord (record) {
      this.changeList = this.changeList.filter(a => a.fieldId !== record.fieldId)
      this.changeList.push(record)
    },
    saveSubmitAll () {
      api.saveAllSettingTable({
        type: this.tabsKey,
        changeListJson: JSON.stringify(this.changeList),
      }, (data) => {
        this.loadTableData()
        const msg = this.tabsKey === '1' ? '用户' : (this.tabsKey === '2' ? '组织' : '功能')
        this.$message.success(msg + '信息简单项编辑成功')
      })
    },
    handleChangeFormType (val) {
      this.currentSelectFormType = val
      let protectPrivacy = '0'
      let formStatus = {}
      switch (val) {
        case 'radio':
        case 'radio-button':
        case 'select':
        case 'select-multiple':
          formStatus = {
            contentSize: true,
            connectAA10: false,
            validReg: true,
          }
          break
        case 'input':
          formStatus = {
            contentSize: false,
            connectAA10: true,
            validReg: false,
          }
          break
        case 'sensitive-input':
          formStatus = {
            contentSize: true,
            connectAA10: true,
            validReg: true,
          }
          protectPrivacy = '1'
          break
        default:
          formStatus = {
            contentSize: false,
            connectAA10: false,
            validReg: false,
          }
      }
      this.dealFormDisable(formStatus)
      this.form.setFieldsValue({
        protectPrivacy: protectPrivacy,
      })
      if (protectPrivacy === '1') {
        const p = (this.currentData.protectPrivacyRule || '0,0').split(',')
        this.$nextTick(function () {
          this.form.setFieldsValue({
            protectPrivacyRulePrefix: p[0],
            protectPrivacyRuleSuffix: p[1],
          })
        })
      }
    },
    dealFormDisable (formStatus) {
      const newValue = {}
      Object.keys(formStatus).forEach(key => {
        if (formStatus[key]) {
          newValue[key] = null
        }
      })
      this.form.setFieldsValue(newValue)
      this.formDisable = formStatus
    },
    mutexChange ({ target, }, mutex) {
      const param = {}
      if (target.value === '1') {
        if (mutex === 'hide') {
          param.required = '0'
        } else if (mutex === 'required') {
          param.hide = '0'
          param.unchangeable = '0'
        } else if (mutex === 'unchangeable') {
          param.required = '0'
        }
      }
      this.form.setFieldsValue(param)
    },
  },
}
</script>
<style type="text/less" lang="less">
  .userInfo-tab {
    .ant-tabs-bar { margin-bottom: 0; }
  }
</style>

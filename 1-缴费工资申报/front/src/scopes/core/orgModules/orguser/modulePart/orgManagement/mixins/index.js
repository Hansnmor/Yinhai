// 动态配置支持 mixins
import $api from '../api/index'
import extendOrgSetting from '@projectCommon/js/extendConfig/extendOrgSetting'
import { isArray, } from '@yh/ta-utils'
import commonMixins from '@projectCommon/js/extendConfig/commonMixins'
import guideMixins from '@projectCommon/js/extendConfig/guideMixins'

const formItemLayouts = {
  default: {
    labelCol: { span: 6, },
    wrapperCol: { span: 18, },
  },
}

const mixins = {
  data () {
    return {
      formItemLayouts,
      extendSettings: extendOrgSetting,
      formSettings: [],
      ...commonMixins.data,
    }
  },
  created () {
    if (!window.mixinsOrg) {
      window.mixinsOrg = true
      $api.queryOrgSettingTable((data) => {
        if (isArray(data.resultData) && data.resultData.length > 0) this.extendSettings = data.resultData
        window.mixinsOrg = data.resultData
        this.buildForm({})
      })
    } else {
      this.extendSettings = isArray(window.mixinsOrg) && window.mixinsOrg.length ? window.mixinsOrg : this.extendSettings
      this.buildForm({})
    }
  },
  activated () {
    guideMixins.activated()
  },
  deactivated () {
    guideMixins.deactivated()
  },
  computed: {
    formNormalSettings () {
      return this.formSettings.filter(a => !a.isMore && a.exist) || []
    },
    formMoreSettings () {
      return this.formSettings.filter(a => a.isMore && a.exist) || []
    },
  },
  watch: {
    ...commonMixins.watch,
  },
  methods: {
    ...commonMixins.methods,
    ...guideMixins.methods,
    /**
     * 设置弹框、抽屉的位置
     * @returns {HTMLElement}
     */
    setContainer () {
      return document.getElementById('orgManagement')
    },
    buildForm (initData) {
      this.formSettings = this.getFormSettings(initData)
    },
    clearForm () {
      this.formSettings = []
    },
    getFormNecessarySettings (initData) {
      return [
        {
          id: 'porgId',
          formId: 'porgId',
          formItem: {
            type: 'input',
            collection: null,
          },
          label: '上级组织机构ID',
          decoratorOptions: {
            rules: [{ required: true, }], initialValue: initData.porgId,
          },
          display: false,
          exist: true,
          formItemLayout: formItemLayouts.default,
        },
        {
          id: 'pOrgName',
          formId: 'pOrgName',
          formItem: {
            type: 'input',
            collection: null,
          },
          label: '上级组织机构',
          decoratorOptions: {
            initialValue: initData.pOrgName,
          },
          display: initData.porgId != '0',
          exist: true,
          disabled: true,
          formItemLayout: formItemLayouts.default,
        },
        {
          id: 'orgId',
          formId: 'orgId',
          formItem: {
            type: 'input',
            collection: null,
          },
          label: '组织机构ID',
          decoratorOptions: {
            initialValue: initData.orgId,
          },
          display: false,
          exist: true,
          formItemLayout: formItemLayouts.default,
        },
        {
          id: 'orgName',
          formId: 'orgName',
          formItem: {
            type: 'input',
            collection: null,
          },
          label: '组织机构名称',
          decoratorOptions: {
            rules: [{ pattern: /^[\u4E00-\u9FA5A-Za-z0-9_/\\-]+$/, message: '只能输入中文英文数字、下划线、横杠及斜杠', }, { required: true, message: '组织机构名称不能为空!', }, { max: 100, message: '组织机构名称超过限制长度!', }],
            initialValue: initData.orgName,
          },
          display: true,
          exist: true,
          formItemLayout: formItemLayouts.default,
        },
        {
          id: 'orgType',
          formId: 'orgType',
          formItem: {
            type: 'radioButton',
            collection: 'ORGTYPE',
          },
          label: '组织类型',
          decoratorOptions: {
            rules: [{ required: true, message: '请选择对应组织类型', }], initialValue: initData.orgType,
          },
          display: true,
          exist: true,
          formItemLayout: formItemLayouts.default,
        },
        {
          id: 'effective',
          formId: 'effective',
          formItem: {
            type: 'slot',
            collection: null,
          },
          label: '有效标识',
          decoratorOptions: {
            valuePropName: 'checked', initialValue: initData.effective,
          },
          display: true,
          exist: true,
          formItemLayout: formItemLayouts.default,
        }
      ]
    },
    getFormSettings (initData = {}) {
      const propSettings = this.extendSettings.sort((a, b) => {
        return a.orderNo - b.orderNo
      }).map(setting => {
        const formId = setting.formId
        const label = setting.displayText || ''
        const placeholder = setting.tiText || ''
        const propSetting = {
          id: setting.fieldId,
          formId: formId,
          class: null,
          formItem: {
            type: setting.formType,
            collection: setting.connectAA10,
          },
          label: label,
          display: setting.hide === '0',
          exist: setting.effective === '1',
          disabled: setting.unchangeable === '1',
          formItemLayout: formItemLayouts[formId] || formItemLayouts.default,
          decoratorOptions: {},
          placeholder: placeholder,
          isMore: setting.more === '1',
        }

        // todo protectPrivacy

        // rule 解析
        const rules = []
        if (setting.required === '1') {
          rules.push({ required: true, message: label + '是必须的', })
        }
        if (!isNaN(parseInt(setting.contentSize))) {
          rules.push({ max: setting.contentSize, message: label + '内容长度不能超过' + setting.contentSize, })
        }
        if (setting.validReg) {
          let isreg
          try {
            isreg = eval(setting.validReg) instanceof RegExp
          } catch (e) {
            isreg = false
          }
          if (isreg) {
            rules.push({ pattern: eval(setting.validReg), message: '请输入正确的' + label + '内容', })
          }
        }
        propSetting.decoratorOptions.rules = rules

        // 初始值
        if (initData.hasOwnProperty(formId)) {
          propSetting.decoratorOptions.initialValue = initData[formId]
        }

        return propSetting
      })

      return this.getFormNecessarySettings(initData).concat(propSettings)
    },
  },
}

export default mixins

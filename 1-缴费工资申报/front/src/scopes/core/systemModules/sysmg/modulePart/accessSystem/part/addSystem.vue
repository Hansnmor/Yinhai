<template>
  <ta-drawer destroy-on-close title="新增接入系统" width="500" placement="right" :closable="true" @close="closeDrawer" :visible="visible">
    <ta-form :auto-form-create="(form)=>{this.form = form}">
      <ta-form-item
        id="sysName"
        label="系统名称"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="sysName"
        :field-decorator-options="{rules: [{ required: true, message: '请输入系统名称' },{max:10,message:'不能超过10个字符'}]}"
      >
        <ta-input placeholder="请输入接入系统名称" />
      </ta-form-item>
      <ta-form-item
        label="系统自定义编码"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="sysCode"
        :field-decorator-options="{rules: [{ required: true, message: '请输入系统标识' },{max:10,message:'不能超过10个字符'},{pattern:new RegExp('^[a-z0-9]*$'),message:'输入格式错误,只能有小写字母或数字'}]}"
      >
        <ta-input placeholder="请输入接入系统自定义编码" />
      </ta-form-item>
      <ta-form-item
        label="协议"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="protocol"
        :field-decorator-options="{rules: [{ required: true, message: '请输入协议' },{max:10,message:'不能超过5个字符'},{pattern:new RegExp('^http$|^https$'),message:'输入格式错误'}]}"
      >
        <ta-select default-value="http" placeholder="例如:http,https">
          <ta-select-option value="http">
            http
          </ta-select-option>
          <ta-select-option value="https">
            https
          </ta-select-option>
        </ta-select>
      </ta-form-item>
      <ta-form-item
        label="前端地址"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="domain"
        :field-decorator-options="{rules: [{ required: true, message: '请输入前端地址' },{max:100,message:'不能超过100个字符'},{pattern:new RegExp(/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/),message:'输入格式错误'}]}"
      >
        <ta-input placeholder="例：127.0.0.1" />
      </ta-form-item>
      <ta-form-item
        label="端口"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="port"
        :field-decorator-options="{rules: [{ required: true, message: '请输入端口' },{pattern:new RegExp('^[0-9]{1,5}$'),message:'输入格式不正确'}]}"
      >
        <ta-input placeholder="例：8080" />
      </ta-form-item>
      <ta-form-item
        label="后台地址"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="backgroundAddress"
        :field-decorator-options="{rules: [{ required: true, message: '请输入后台地址' },{max:100,message:'不能超过100个字符'},{pattern:new RegExp(/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\:([0-9]|[1-9]\d{1,3}|[1-5]\d{4}|6[0-5]{2}[0-3][0-5])$/),message:'输入格式错误'}]}"
      >
        <ta-input placeholder="例：127.0.0.1:8081" />
      </ta-form-item>
      <ta-form-item
        label="菜单服务"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="menuService"
      >
        <ta-input placeholder="请输入菜单服务" />
      </ta-form-item>
      <ta-form-item
        label="上下文"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="contextPath"
        :field-decorator-options="{rules: [{ required: true, message: '请输入上下文' },{max:10,message:'不能超过10个字符'},{pattern: new RegExp(/^[a-zA-Z][a-zA-Z\d]{0,9}$/),message:'请输入以英文字母开始的字符串'}]}"
      >
        <ta-input placeholder="请输入上下文" />
      </ta-form-item>
      <ta-form-item
        label="系统提供者"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="provider"
        :field-decorator-options="{rules: [{ required: true, message: '请输入系统提供者' },{max:10,message:'不能超过10个字符'}]}"
      >
        <ta-input placeholder="请输入系统提供者" />
      </ta-form-item>
      <ta-form-item
        label="接入门户"
        :label-col="formItemLayout.labelCol"
        :wrapper-col="formItemLayout.wrapperCol"
        field-decorator-id="portalSystem"
        :field-decorator-options="{ valuePropName: 'checked', initialValue: true }"
      >
        <ta-switch checked-children="是" un-checked-children="否" />
      </ta-form-item>
    </ta-form>
    <div slot="footer">
      <ta-button-group>
        <ta-button @click="form.resetFields()">
          重置
        </ta-button>
        <ta-button type="primary" @click="handleSave">
          保存
        </ta-button>
      </ta-button-group>
    </div>
  </ta-drawer>
</template>
<script>
import $api from '../api/index'
export default {
  name: 'AddSystem',
  props: ['visible'],
  data () {
    return {
      form: null,
      formItemLayout: {
        labelCol: { span: 7, },
        wrapperCol: { span: 17, },
      },
      isPortal: true,
    }
  },
  methods: {
    // 新增保存
    handleSave () {
      this.form.validateFields((err, values) => {
        if (!err) {
          values.effective = '1'
          values.portalSystem = values.portalSystem ? '1' : '0'
          values.spell = TaUtils.pinyin.getCamelChars(values.sysName)
          $api.addTaAccessSystem(values, (data) => {
            this.$emit('queryTable')
            this.$message.success('新增成功')
            this.closeDrawer()
          })
        }
      })
    },
    closeDrawer () {
      this.$emit('close')
      this.form.resetFields()
    },
  },
}
</script>
<style scoped type="text/less" lang="less">
  .tag-select { .user-select() }
</style>

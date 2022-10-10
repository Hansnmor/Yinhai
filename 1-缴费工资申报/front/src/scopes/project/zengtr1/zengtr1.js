import { Vue, store, taMixins, checkLogin} from 'common/js/public-ant.js'// 引入公共文件
import router from './router/index' // 引入 改模块的路由模块
import psnInsuInfoTable from '@/scopes/project/zengtr1/frontend/psnInsuInfoTable'
Vue.component('psnInsuInfoTable',psnInsuInfoTable)
// 自己引入各种插件
import excelUtil from '@yh/ta404-ui/es/utils/js/excel.util'
// 注册工具到上Base
Vue.prototype.Base = Object.assign(Vue.prototype.Base,{
  ...excelUtil
})

import{
  Radio,
  Descriptions,
  InputNumber,
  BigTable,
  Modal,
  Table,
  TableEdit
} from '@yh/ta404-ui'
Vue.use(Radio)
Vue.use(Descriptions)
Vue.use(InputNumber)
Vue.use(BigTable)
Vue.use(Modal)
Vue.use(Table)
Vue.use(TableEdit)
// 判断登录状态然后确认是否渲染页面

checkLogin(() => {
  new Vue({
    mixins: [taMixins],
    router,
    store,
  }).$mount('#app')
})

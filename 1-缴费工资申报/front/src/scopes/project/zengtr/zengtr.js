import { Vue, store, taMixins, checkLogin} from 'common/js/public-ant.js'// 引入公共文件
import router from './router/index' // 引入 改模块的路由模块
import psnInsuInfoTable from '@/scopes/project/zengtr/frontend/psnInsuInfoTable'
Vue.component('psnInsuInfoTable',psnInsuInfoTable)
// 自己引入各种插件
import{
  Radio,
  Descriptions,
  InputNumber,
  BigTable
} from '@yh/ta404-ui'
Vue.use(Radio)
Vue.use(Descriptions)
Vue.use(InputNumber)
Vue.use(BigTable)
// 判断登录状态然后确认是否渲染页面

checkLogin(() => {
  new Vue({
    mixins: [taMixins],
    router,
    store,
  }).$mount('#app')
})

import { Vue, store, taMixins, checkLogin} from 'common/js/public-ant.js'// 引入公共文件
import router from './router' // 引入 改模块的路由模块
Vue.component('child',child)

// 自己引入各种插件
import TaUtils from '@yh/ta-utils'
import { BigTable } from '@yh/ta404-ui'
import child from '@/scopes/project/zengtr/frontend/child'
Vue.use(BigTable)
Vue.prototype.TaUtils = {
  ...TaUtils,
}
// 判断登录状态然后确认是否渲染页面

checkLogin(() => {
  new Vue({
    mixins: [taMixins],
    router,
    store,
  }).$mount('#app')
})

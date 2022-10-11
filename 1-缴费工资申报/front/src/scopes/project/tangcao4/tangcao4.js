import { Vue, store, taMixins, checkLogin} from 'common/js/public-ant.js'// 引入公共文件
import router from './router/index' // 引入 改模块的路由模块

// 自己引入各种插件
import TaUtils from '@yh/ta-utils'
import { BigTable,AutoComplete ,Table,TableEdit,tableOperate} from '@yh/ta404-ui'
import child from '@/scopes/project/zengtr2/frontend/child'
Vue.use(BigTable)
Vue.use(AutoComplete)
Vue.use(Table)
Vue.use(TableEdit)
Vue.use(tableOperate)
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

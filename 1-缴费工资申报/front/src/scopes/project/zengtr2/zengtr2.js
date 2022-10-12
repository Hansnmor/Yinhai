import { Vue, store, taMixins, checkLogin} from 'common/js/public-ant.js'// 引入公共文件
import router from './router' // 引入 改模块的路由模块
Vue.component('child',child)
Vue.component('child1',child1)
Vue.component('child2',child2)
Vue.component('child3',child3)

// 自己引入各种插件
import TaUtils from '@yh/ta-utils'
import { BigTable,AutoComplete } from '@yh/ta404-ui'
import child from '@/scopes/project/zengtr2/frontend/child'
import child1 from '@/scopes/project/zengtr2/frontend/child1'
import child2 from '@/scopes/project/zengtr2/frontend/child2'
import child3 from '@/scopes/project/zengtr2/frontend/child3'
Vue.use(BigTable)
Vue.use(AutoComplete)
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

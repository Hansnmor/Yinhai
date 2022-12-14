// import { Vue, store, taMixins } from 'common/js/public-ant.js'// 引入公共文件
import { Vue, store, taMixins, checkLogin} from 'common/js/public-ant-modules.js'// 引入模块化公共文件
import router from './router/index' // 引入 改模块的路由模块

import projectSearchTree from '@projectCommon/components/searchTree/index'
import {
    popoverEx,
    userSelect,
    userInput,
    tagSelect,
    tabs,
    cascader,
    checkbox,
    dropdown,
    menu,
    pagination,
    drawer,
    datePicker,
    Select,
    table,
    bigTable,
    tooltip,
    tag,
    divider,
    breadcrumb,
    alert,
    popconfirm,
    eTree,
    calendar,
    Switch,
    autoComplete,
    collapse,
    carefulDelete,
    tableOperate,
    BigTable,
    treeSelect,
} from '@yh/ta404-ui'

Vue.use(treeSelect)
Vue.use(popoverEx)
Vue.use(userSelect)
Vue.use(userInput)
Vue.use(tagSelect)
Vue.use(tabs)
Vue.use(cascader)
Vue.use(checkbox)
Vue.use(dropdown)
Vue.use(menu)
Vue.use(pagination)
Vue.use(drawer)
Vue.use(datePicker)
Vue.use(Select)
Vue.use(table)
Vue.use(tooltip)
Vue.use(tag)
Vue.use(divider)
Vue.use(breadcrumb)
Vue.use(alert)
Vue.use(popconfirm)
Vue.use(eTree)
Vue.use(calendar)
Vue.use(Switch)
Vue.use(autoComplete)
Vue.use(carefulDelete)
Vue.use(tableOperate)
Vue.use(collapse)
Vue.use(projectSearchTree)
Vue.use(BigTable)

// 判断登录状态然后确认是否渲染页面
checkLogin(() => {
    // 把组件化页面挂载到节点app上
    new Vue({
        mixins: [taMixins],
        router,
        store,
    }).$mount('#app')
})

// 导出该模块路由
export default [
  {
    title: '页面还原part 2',
    name: 'rePageDemoPart2',
    path: 'rePageDemoPart2',
    component: () => import(/* webpackChunkName: "routes/functionModules/modulePart2" */ './modulePart2.vue'),
  }
]

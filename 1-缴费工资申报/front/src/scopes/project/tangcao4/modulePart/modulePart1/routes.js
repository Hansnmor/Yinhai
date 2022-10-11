// 导出该模块路由
export default [
  {
    title: '项目模块实例part 1',
    name: 'yearlyPayment',
    path: 'yearlyPayment',
    component: () => import(/* webpackChunkName: "routes/workTablePage/modulePart1" */'./yearlyPayment.vue'),
  }
]

// 导出该模块路由
export default [
  {
    title: '缴费明细补录',
    name: 'paymentDetails',
    path: 'paymentDetails',
    component: () => import(/* webpackChunkName: "routes/workTablePage/modulePart1" */'./paymentDetails'),
  }
]

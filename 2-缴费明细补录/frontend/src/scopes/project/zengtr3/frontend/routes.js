// 导出该模块路由
export default [
  {
    title: '灵活报销管理',
    name: 'flexibleReimbursement',
    path: 'flexibleReimbursement',
    component: () => import(/* webpackChunkName: "routes/workTablePage/modulePart1" */'./flexibleReimbursement'),
  }
]

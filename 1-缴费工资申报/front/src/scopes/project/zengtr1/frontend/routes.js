// 导出该模块路由
export default [
  {
    title: '缴费工资申报',
    name: 'salary',
    path: 'salary',
    component: () => import(/* webpackChunkName: "routes/workTablePage/modulePart1" */'./salary'),
  }
]

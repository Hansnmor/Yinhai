<template>
	<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoList"
			  ref="table1" :haveSn="true"
	>
	</ta-table>
</template>

<script>
export default {
	name: 'psnInsuChild',
	props: {
		psnInsuInfoList: [],//人员参保信息表
	},
	data () {
		return {
			tableColumns1: [
				{
					title: '单位编号',
					dataIndex: 'empNo',
				},
				{
					title: '单位名称',
					dataIndex: 'empName',
				},
				{
					title: '个人编号',
					dataIndex: 'psnNo',
				},
				{
					title: '姓名',
					dataIndex: 'psnName',
				},
				{
					title: '险种类型',
					dataIndex: 'insutype',
					collectionType: 'INSUTYPE'
				},
				{
					title: '参保日期',
					dataIndex: 'crtInsuDate',
				},
			]
		}
	},

}
</script>

<style scoped>

</style>

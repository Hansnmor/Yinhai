<template>
	<ta-table :columns="tableColumns2" :dataSource="salaryBaseInfoList"
			  ref="table2" :haveSn="true"
	>
	</ta-table>
</template>

<script>
const tableColumns2=[
	{ title: '人员编号', dataIndex: 'psnNo' },
	{ title: '姓名', dataIndex: 'psnName', },
	{ title: '证件号码', dataIndex: 'certno', },
	{ title: '性别', dataIndex: 'gend', collectionType: 'GEND' },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '参保状态', dataIndex: 'psnInsuStas', collectionType: 'PSN_INSU_STAS' },
	{ title: '当前年月', dataIndex: 'nowTime', },
	{ title: '基数', dataIndex: 'base', },
	{ title: '工资', dataIndex: 'wag',  },

]
export default {
	name: 'child2',
	props:{
		salaryBaseInfoList:[],//工资基数信息表
	},
	data(){
		return{
			tableColumns2,
		}
	},
}
</script>

<style scoped>

</style>

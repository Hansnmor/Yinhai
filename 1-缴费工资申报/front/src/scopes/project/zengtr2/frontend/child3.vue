<template>
	<ta-table :columns="tableColumns3" :dataSource="recordingDetails"
			  ref="table3" :haveSn="true"
	>
	</ta-table>
</template>

<script>
const tableColumns3=[
	{ title: '人员编号', dataIndex: 'psnNo',  },
	{ title: '贷款所属期', dataIndex: 'accrym', },
	{ title: '险种类型', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '筹资项目', dataIndex: 'finc', },
	{ title: '基准缴费比例', dataIndex: 'psnClctParaval', },
	{ title: '应处理金额', dataIndex: 'sumamt', },
	{ title: '实处理金额', dataIndex: 'realSumamt', },
	{ title: '到账标志', dataIndex: 'clctFlag', },
	{ title: '账户处理标志', dataIndex: 'accFlag', },
	{ title: '收入日期', dataIndex: 'time', },
]
export default {
	name: 'child3',
	props:{
		recordingDetails:[], //补录明细列表
	},
	data(){
		return{
			tableColumns3,
		}
	}
}
</script>

<style scoped>

</style>

<template>
	<ta-table :columns="tableColumns2" :dataSource="validatedList"
			  ref="table2" :haveSn="true"

	>
		<!--						<ta-table-edit slot="action" slot-scope="text, record" :dataSource="validatedList" type="rowEdit"  @rowDelete="fnRowDelete(record)"></ta-table-edit>-->
		<span slot="operate" slot-scope="text, record">
			<ta-table-operate :operate-menu="operateMenu" />
		</span>
	</ta-table>
</template>

<script>
const tableColumns2=[
	{ title: '操作',width: 100, dataIndex: 'operate', scopedSlots: { customRender: 'operate' } },
	{ title: '单位编号', dataIndex: 'empNo',  },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '单位征缴规则', dataIndex: 'clctRuleTypeCodg', collectionType: 'CLCT_RULE_TYPE_CODG' },
	{ title: '开始期号', dataIndex: 'startYM', },
	{ title: '结束期号', dataIndex: 'endYM', },
	{ title: '应缴类型', dataIndex: 'clctType', collectionType: 'CLCT_TYPE' },
	{ title: '缴费基数总额', dataIndex: 'baseSum', },
]
export default {
	name: 'child2',
	props:{
		validatedList:[],//校验成功的列表
	},
	data(){
		return{
			tableColumns2,
			operateMenu: [
				{
					name: '删除',
					icon: 'delete',
					type: 'confirm',
					confirmTitle: '确认删除该信息？',
					onOk: (record, index) => {
						console.log('record:',record)
						console.log('index:',index)
						this.validatedList.splice(index,1)
						console.log('validatedList:',this.validatedList)
						this.$message.success('删除成功')
					},
				},

			],
		}
	}
}
</script>

<style scoped>

</style>

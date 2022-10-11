<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoListByEmpNo"
						  ref="table1" :haveSn="true"
						  :rowSelection="rowSelection"
				>
				</ta-table>
<!--				<ta-big-table :data="psnInsuInfoListByEmpNo"-->
<!--							  ref="xTable1"-->
<!--							  border="default"-->
<!--							  auto-resize-->
<!--							  keep-source-->
<!--							  max-height="500px"-->
<!--				>-->
<!--					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column type="checkbox"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column field="empNo"  width="200" title="单位编号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype"  width="200" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="fstInsuYm" width="300" title="首次参保年月"></ta-big-table-column>-->
<!--					<ta-big-table-column field="maxAcctprd"  width="300" title="最大做账期号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insuOptins" title="参保所属机构" collection-type="OPTINS"></ta-big-table-column>-->
<!--				</ta-big-table>-->
			</ta-tab-pane>

			<ta-tab-pane tab="校验成功信息" key="2">
					<ta-table :columns="tableColumns2" :dataSource="validatedList"
							  ref="table2" :haveSn="true"

					>
						<ta-table-edit slot="action" slot-scope="text, record" :dataSource="validatedList" type="rowEdit"  @rowDelete="fnRowDelete(record)"></ta-table-edit>
					</ta-table>

<!--				<ta-big-table :data="validatedList"-->
<!--							  ref="xTable2"-->
<!--							  border="default"-->
<!--							  auto-resize-->
<!--							  keep-source-->
<!--							  max-height="500px"-->
<!--				>-->
<!--					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column  field="operate" title="操作" width="100">-->
<!--						<span slot-scope="rowInfo">-->
<!--							<ta-table-operate :operate-menu="operateMenu" :rowInfo="rowInfo"/>-->
<!--						</span>-->
<!--					</ta-big-table-column>-->
<!--					<ta-big-table-column field="empNo"  width="150" title="单位编号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype"  width="150" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="clctRuleTypeCodg"  width="350" title="单位征缴规则" collection-type="CLCT_RULE_TYPE_CODG"></ta-big-table-column>-->
<!--					<ta-big-table-column field="startYM" width="200" title="开始期号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="endYM" width="200" title="结束期号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="clctType"  width="200" title="应缴类型" collection-type="CLCT_TYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="baseSum" title="缴费基数总额"></ta-big-table-column>-->
<!--				</ta-big-table>-->
			</ta-tab-pane>

			<ta-tab-pane tab="本次补录明细" key="3">
				<ta-table :columns="tableColumns3" :dataSource="recordingDetails"
						  ref="table3" :haveSn="true"
				>
				</ta-table>
<!--				<ta-big-table :data="recordingDetails"-->
<!--							  ref="xTable3"-->
<!--							  border="default"-->
<!--							  auto-resize-->
<!--							  keep-source-->
<!--							  max-height="500px">-->
<!--					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnNo"  width="150" title="人员编号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="accrym"  width="100" title="贷款所属期"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype"  width="100" title="险种类型"></ta-big-table-column>-->
<!--					<ta-big-table-column field="finc"  width="200" title="筹资项目"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnClctParaval"  width="150" title="基准缴费比例"></ta-big-table-column>-->
<!--					<ta-big-table-column field="sumamt"  width="150" title="应处理金额"></ta-big-table-column>-->
<!--					<ta-big-table-column field="realSumamt"  width="150" title="实处理金额" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="clctFlag" width="100" title="到账标志"></ta-big-table-column>-->
<!--					<ta-big-table-column field="accFlag"  width="150" title="账户处理标志"></ta-big-table-column>-->
<!--					<ta-big-table-column field="time"  width="200" title="收入日期"></ta-big-table-column>-->
<!--				</ta-big-table>-->
			</ta-tab-pane>
		</ta-tabs>
	</div>
</template>

<script>
const tableColumns1=[
	{ title: '单位编号', dataIndex: 'empNo',  },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '首次参保年月', dataIndex: 'fstInsuYm', },
	{ title: '最大做账期号', dataIndex: 'maxAcctprd', },
	{ title: '参保所属机构', dataIndex: 'insuOptins', collectionType: 'OPTINS' },
]
const tableColumns2=[
	{ title: '操作', dataIndex: 'action', width: 150, scopedSlots: { customRender: 'action' } },
	{ title: '单位编号', dataIndex: 'empNo',  },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '单位征缴规则', dataIndex: 'clctRuleTypeCodg', collectionType: 'CLCT_RULE_TYPE_CODG' },
	{ title: '开始期号', dataIndex: 'startYM', },
	{ title: '结束期号', dataIndex: 'endYM', },
	{ title: '应缴类型', dataIndex: 'clctType', collectionType: 'CLCT_TYPE' },
	{ title: '缴费基数总额', dataIndex: 'baseSum', },
]
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
	name: 'child',
	props:{
		psnInsuInfoListByEmpNo:[],//人员参保信息表
		validatedList:[],//校验成功的列表
		recordingDetails:[],//补录明细列表
	},
	data(){
		return{
			tableColumns1,
			tableColumns2,
			tableColumns3,
			selectedRows: [],
			//行选择配置
			rowSelection: {
				//控制选项的属性需要和 onChange 进行配合
				selectedRowKeys: [],
				//行选择改变事件
				onChange: this.onSelectChange,
			},
			checkedInfoInsuList:[],//以选择的行数据
			// operateMenu: [
			// 	// {
			// 	// 	name: '编辑',
			// 	// 	icon: 'edit',
			// 	// 	onClick: (record, index) => {
			// 	// 		message.info(JSON.stringify(record))
			// 	// 		message.info(index)
			// 	// 	},
			// 	// },
			// 	{
			// 		name: '删除',
			// 		icon: 'delete',
			// 		type: 'confirm',
			// 		confirmTitle: '确认删除该信息？',
			// 		onOk: (record, index) => {
			// 			console.log('record:',record)
			// 			console.log('index:',index)
			// 			this.validatedList.splice(index,1)
			// 			console.log('validatedList:',this.validatedList)
			// 			this.$message.success('删除成功')
			// 		},
			// 	},
			//
			// ],
		}
	},
	methods:{
		//点击选项改变触发事件,传入当前选中的所有选项,以及行
		onSelectChange (selectedRowKeys, selectedRows) {
			//设置选中项为点击选中的项
			this.rowSelection.selectedRowKeys = selectedRowKeys
			console.log('selectedRows:',selectedRows)
			this.checkedInfoInsuList=selectedRows
		},
		childMethods(){
			// console.log('我是子组件，执行childmethod')
			// this.$refs.xTable1.loadData(this.psnInsuInfoListByEmpNo, true)
			// this.$refs.xTable2.loadData(this.validatedList, true)
		},
		sendDataToFather(){
			//向父组件传值的函数
			console.log('正在向父组件传值')
			return this.checkedInfoInsuList
		},
		fnRowDelete (record) {
			console.log('record:',record)
			this.validatedList.forEach((value,index,array)=>{
				if(value.startYM === record.startYM&&value.endYM===record.endYM){
					array.splice(index,1)
				}
			})
		},

	}
}
</script>

<style scoped>

</style>

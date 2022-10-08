<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-big-table :data="psnInsuInfoListByEmpNo"
							  ref="xTable1"
							  border="default"
							  auto-resize
							  keep-source
							  max-height="500px"
				>
					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>
					<ta-big-table-column type="checkbox"  width="60"></ta-big-table-column>
					<ta-big-table-column field="empNo"  width="200" title="单位编号"></ta-big-table-column>
					<ta-big-table-column field="insutype"  width="200" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="fstInsuYm" width="300" title="首次参保年月"></ta-big-table-column>
					<ta-big-table-column field="maxAcctprd"  width="300" title="最大做账期号"></ta-big-table-column>
					<ta-big-table-column field="insuOptins" title="参保所属机构" collection-type="OPTINS"></ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>

			<ta-tab-pane tab="校验成功信息" key="2">
				<ta-big-table :data="validatedList"
							  ref="xTable2"
							  border="default"
							  auto-resize
							  keep-source
							  max-height="500px"
				>
					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>
					<ta-big-table-column  field="operate" title="操作" width="100">
						<span slot-scope="rowInfo">
							<ta-table-operate :operate-menu="operateMenu" :rowInfo="rowInfo"/>
						</span>
					</ta-big-table-column>
					<ta-big-table-column field="empNo"  width="150" title="单位编号"></ta-big-table-column>
					<ta-big-table-column field="insutype"  width="150" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="clctRuleTypeCodg"  width="350" title="单位征缴规则" collection-type="CLCT_RULE_TYPE_CODG"></ta-big-table-column>
					<ta-big-table-column field="startYM" width="200" title="开始期号"></ta-big-table-column>
					<ta-big-table-column field="endYM" width="200" title="结束期号"></ta-big-table-column>
					<ta-big-table-column field="clctType"  width="200" title="应缴类型" collection-type="CLCT_TYPE"></ta-big-table-column>
					<ta-big-table-column field="baseSum" title="缴费基数总额"></ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>

			<ta-tab-pane tab="本次补录明细" key="3">
				<ta-big-table :data="recordingDetails"
							  ref="xTable3"
							  border="default"
							  auto-resize
							  keep-source
							  max-height="500px">
					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>
					<ta-big-table-column field="psnNo"  width="150" title="人员编号"></ta-big-table-column>
					<ta-big-table-column field="accrym"  width="100" title="贷款所属期"></ta-big-table-column>
					<ta-big-table-column field="insutype"  width="100" title="险种类型"></ta-big-table-column>
					<ta-big-table-column field="finc"  width="200" title="筹资项目"></ta-big-table-column>
					<ta-big-table-column field="psnClctParaval"  width="150" title="基准缴费比例"></ta-big-table-column>
					<ta-big-table-column field="sumamt"  width="150" title="应处理金额"></ta-big-table-column>
					<ta-big-table-column field="realSumamt"  width="150" title="实处理金额" collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="clctFlag" width="100" title="到账标志"></ta-big-table-column>
					<ta-big-table-column field="accFlag"  width="150" title="账户处理标志"></ta-big-table-column>
					<ta-big-table-column field="time"  width="200" title="收入日期"></ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>
		</ta-tabs>
	</div>
</template>

<script>
export default {
	name: 'child',
	props:{
		psnInsuInfoListByEmpNo:[],//人员参保信息表
		validatedList:[],//校验成功的列表
		recordingDetails:[],//补录明细列表
	},
	data(){
		return{
			operateMenu: [
				// {
				// 	name: '编辑',
				// 	icon: 'edit',
				// 	onClick: (record, index) => {
				// 		message.info(JSON.stringify(record))
				// 		message.info(index)
				// 	},
				// },
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
	},
	methods:{
		childMethods(){
			// console.log('我是子组件，执行childmethod')
			// this.$refs.xTable1.loadData(this.psnInsuInfoListByEmpNo, true)
			// this.$refs.xTable2.loadData(this.validatedList, true)
		},
		sendDataToFather(){
			//向父组件传值的函数
			console.log('正在向父组件传值')
			return this.$refs.xTable1.getCheckboxRecords()
		},
	}
}
</script>

<style scoped>

</style>

<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-big-table :data="psnInsuInfoListByEmpNo"
							  ref="xTable1"
							  border="default"
							  auto-resize
							  keep-source
							  highlight-current-row
							  max-height="500px"
							  :loading="loading"
							  @current-change="handleTableCurrentChange"
				>
					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>
					<ta-big-table-column field="empNo"  width="150" title="单位编号"></ta-big-table-column>
					<ta-big-table-column field="empName"  width="100" title="单位名称"></ta-big-table-column>
					<ta-big-table-column field="psnNo"  width="150" title="人员编号"></ta-big-table-column>
					<ta-big-table-column field="psnName"  width="150" title="姓名"></ta-big-table-column>
					<ta-big-table-column field="insutype"  width="100" title="险种类型" collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="psnType"  width="150" title="人员类别" collection-type="PSN_TYPE"></ta-big-table-column>
					<ta-big-table-column field="psnInsuStas"  width="150" title="人员参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>
					<ta-big-table-column field="fstInsuYm" width="300" title="首次参保年月"></ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>
		</ta-tabs>
	</div>
</template>

<script>
export default {
	name: 'child',
	props:{
		psnInsuInfoListByEmpNo:[],//人员参保信息列表
	},
	data(){
		return{
			loading: false,
			rowData:{},//行数据
		}
	},
	methods:{
		handleTableCurrentChange({ row, rowIndex, $rowIndex, column, columnIndex, $columnIndex, $event, }) {
			// 使用鼠标点击时会传递column相关参数，使用键盘方向键导航则不传递column相关参数
			// console.log('row:',row)
			// console.log('向父组件传递点击的行数据')
			// this.sendClickedDataToFather(row)
			this.rowData=row
			console.log('rowData:',this.rowData)
		},
		sendClickedDataToFather(){
			//向父组件传值的函数
			console.log('正在向父组件传值')
			return this.rowData
		}
	}
}
</script>

<style scoped>

</style>

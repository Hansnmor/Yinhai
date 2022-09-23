<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-big-table
					class="mytable-style"
					ref="xTable1"
					border="default"
					auto-resize
					keep-source
					:data="psnInsuInfoList"
					:cell-style="cellStyle1"
					:edit-config="{trigger: 'click', mode: 'cell', showStatus: true}"
					:sort-config="{trigger: 'cell', defaultSort: {field: 'psnNo', order: 'asc'}}"
					:edit-rules="validRules1"
				>
					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>
					<ta-big-table-column type="checkbox"  width="60"></ta-big-table-column>
					<ta-big-table-column field="psnNo"  width="120" title="人员编号" sortable></ta-big-table-column>
					<ta-big-table-column field="psnName"  width="100" title="姓名"></ta-big-table-column>
					<ta-big-table-column field="certno" width="200" title="证件号码"></ta-big-table-column>
					<ta-big-table-column field="gend"  width="60" title="性别" collection-type="GEND"></ta-big-table-column>
					<ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="psnInsuStas" title="参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>
					<ta-big-table-column field="startYM" title="开始年月" :edit-render="{name: 'input'}">
					</ta-big-table-column>
					<ta-big-table-column field="endYM" title="结束年月" :edit-render="{name: 'input'}">
					</ta-big-table-column>
					<ta-big-table-column field="base" title="基数"></ta-big-table-column>
					<ta-big-table-column field="wag" title="工资" :edit-render="{name: 'input'}">
					</ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>

			<ta-tab-pane tab="工资基数信息" key="2">
				<ta-big-table
					border="default"
					ref="xTable2"
					auto-resize
					keep-source
					:data="salaryBaseInfoList">
					<ta-big-table-column type="seq"  width="60" align="left"></ta-big-table-column>
					<ta-big-table-column field="psnNo" width="150"  title="人员编号" align="left" ></ta-big-table-column>
					<ta-big-table-column field="psnName" width="150" title="姓名" align="left"></ta-big-table-column>
					<ta-big-table-column field="certno" width="250" title="证件号码" align="left"></ta-big-table-column>
					<ta-big-table-column field="gend" width="100"  title="性别" align="center" collection-type="GEND" ></ta-big-table-column>
					<ta-big-table-column field="insutype" width="200" title="参保险种" align="left"  collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="psnInsuStas" width="150" title="参保状态" align="center" collection-type="PSN_INSU_STAS"></ta-big-table-column>
					<ta-big-table-column field="nowTime" width="200" title="当前年月" align="center"></ta-big-table-column>
					<ta-big-table-column field="base" width="150" title="基数" align="right"></ta-big-table-column>
					<ta-big-table-column field="wag" width="150" title="工资" align="right"></ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>
		</ta-tabs>
	</div>
</template>

<script>
import { toString } from '@yh/ta-utils'

export default {
	name: 'psnInsuInfoTable',
	data(){
		const wagValid = ({ cellValue,row }) => {
			//对表1中工资的校验
			console.log('cellValue:',cellValue)
			if (cellValue && (cellValue < 0|| cellValue > 999999999999.9999)) {
				return new Error('工资的格式不正确')
			}else{
				let base
				if(cellValue<=3000){
					base=3000
				}else if(cellValue>=15000){
					base=15000
				}else{
					base=cellValue
				}
				row.base=base
			}
		}
		return{
			validRules1:{
				//表格1的校验规则
				wag:[
					{ required: true, message: '工资必须填' },
					{ validator: wagValid, },
					{ pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '工资格式不正确' }
				]
			}
		}
	},
	props:{
		psnInsuInfoList:[],//人员参保信息表
		salaryBaseInfoList:[],//工资基数信息表

	},
	methods:{
		childMethods(){
			console.log('我是子组件，执行childmethod')
			this.$refs.xTable1.loadData(this.psnInsuInfoList, true)
			this.$refs.xTable2.loadData(this.salaryBaseInfoList, true)
		},
		sendDataToFather(){
			//向父组件传值的函数
			console.log('正在向父组件传值')
			return this.$refs.xTable1.getCheckboxRecords()
		},
		cellStyle1({ row, rowIndex, column, columnIndex }){
			// //将表格中修改过的字体渲染成红色
			// if(column.property==='startYM'||column.property==='endYM'||column.property==='wag'){
			// 	let updateRecords = this.$refs.xTable1.getUpdateRecords()
			// 	let xid
			// 	// console.log('updaterow:',updateRecords.)
			// 	for(let i=0;i<updateRecords.length;i++){
			// 		xid=updateRecords[i]._XID
			// 	}
			// 	let rowid=toString(rowIndex+13)
			// 	rowid='row_'+rowid
			// 	if(rowid===xid) {
			// 		console.log('当前行为',rowIndex)
			// 		return {
			// 			color: '#FF0000'
			// 		}
			// 	}
			// }
		},

	},
}
</script>

<style scoped>
.mytable-style .col-red {
	color: red;
}

</style>

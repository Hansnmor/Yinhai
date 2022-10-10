<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-form :auto-form-create="(form)=>{this.form1 = form}">
					<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoList"
							  ref="table1" :haveSn="true"
							  :rowSelection="rowSelection"
					>
						<!--三个spsn目的是为表头添加编辑图标-->
						<span slot="nameTitle1">开始年月 <ta-icon type="edit" /></span>
						<span slot="nameTitle2">结束年月 <ta-icon type="edit" /></span>
						<span slot="nameTitle3">工资 <ta-icon type="edit" /></span>
						<ta-table-edit slot="wag" slot-scope="text, record" :edit-style="editStyle"  type="inputNumber"  :rules="[{ required: true, message: '工资不能为空'}]" :before-change="fnBeforeChangeWag"></ta-table-edit>
						<ta-table-edit slot="startYM" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1"  type="issuePicker"  :rules="[{ required: true, message: '开始年月不能为空'}]" :before-change="fnBeforeChangeStartYM"></ta-table-edit>
						<ta-table-edit slot="endYM" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="issuePicker" :rules="[{ required: true, message: '结束年月不能为空'}]" :before-change="fnBeforeChangeEndYM" ></ta-table-edit>
					</ta-table>
				</ta-form>
<!--				<ta-big-table-->
<!--					class="mytable-style"-->
<!--					ref="xTable1"-->
<!--					border="default"-->
<!--					auto-resize-->
<!--					keep-source-->
<!--					:data="psnInsuInfoList"-->
<!--					:cell-style="cellStyle1"-->
<!--					:edit-config="{trigger: 'click', mode: 'cell', showStatus: true}"-->
<!--					:sort-config="{trigger: 'cell', defaultSort: {field: 'psnNo', order: 'asc'}}"-->
<!--					:edit-rules="validRules1"-->
<!--				>-->
<!--					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column type="checkbox"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnNo"  width="120" title="人员编号" sortable></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnName"  width="100" title="姓名"></ta-big-table-column>-->
<!--					<ta-big-table-column field="certno" width="200" title="证件号码"></ta-big-table-column>-->
<!--					<ta-big-table-column field="gend"  width="60" title="性别" collection-type="GEND"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnInsuStas" title="参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>-->
<!--					<ta-big-table-column field="startYM" title="开始年月" :edit-render="{name: 'input'}">-->
<!--					</ta-big-table-column>-->
<!--					<ta-big-table-column field="endYM" title="结束年月" :edit-render="{name: 'input'}">-->
<!--					</ta-big-table-column>-->
<!--					<ta-big-table-column field="base" title="基数"></ta-big-table-column>-->
<!--					<ta-big-table-column field="wag" title="工资" :edit-render="{name: 'input'}">-->
<!--					</ta-big-table-column>-->
<!--				</ta-big-table>-->
			</ta-tab-pane>

			<ta-tab-pane tab="工资基数信息" key="2">
				<ta-table :columns="tableColumns2" :dataSource="salaryBaseInfoList"
						  ref="table2" :haveSn="true"
				>
				</ta-table>
<!--				<ta-big-table-->
<!--					border="default"-->
<!--					ref="xTable2"-->
<!--					auto-resize-->
<!--					keep-source-->
<!--					:data="salaryBaseInfoList">-->
<!--					<ta-big-table-column type="seq"  width="60" align="left"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnNo" width="150"  title="人员编号" align="left" ></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnName" width="150" title="姓名" align="left"></ta-big-table-column>-->
<!--					<ta-big-table-column field="certno" width="250" title="证件号码" align="left"></ta-big-table-column>-->
<!--					<ta-big-table-column field="gend" width="100"  title="性别" align="center" collection-type="GEND" ></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype" width="200" title="参保险种" align="left"  collection-type="INSUTYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnInsuStas" width="150" title="参保状态" align="center" collection-type="PSN_INSU_STAS"></ta-big-table-column>-->
<!--					<ta-big-table-column field="nowTime" width="200" title="当前年月" align="center"></ta-big-table-column>-->
<!--					<ta-big-table-column field="base" width="150" title="基数" align="right"></ta-big-table-column>-->
<!--					<ta-big-table-column field="wag" width="150" title="工资" align="right"></ta-big-table-column>-->
<!--				</ta-big-table>-->
			</ta-tab-pane>
		</ta-tabs>
	</div>
</template>

<script>
const tableColumns1 = [
	{ title: '人员编号', dataIndex: 'psnNo' },
	{ title: '姓名', dataIndex: 'psnName', },
	{ title: '证件号码', dataIndex: 'certno', },
	{ title: '性别', dataIndex: 'gend', collectionType: 'GEND' },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '参保状态', dataIndex: 'psnInsuStas', collectionType: 'PSN_INSU_STAS' },
	// { title: '开始年月', dataIndex: 'startYM', scopedSlots: { customRender: 'startYM', }, },
	{ dataIndex: 'startYM', width: 120, slots: { title: 'nameTitle1', }, scopedSlots: { customRender: 'startYM', }, overflowTooltip: true,},
	// { title: '结束年月', dataIndex: 'endYM', scopedSlots: { customRender: 'endYM', }, },
	{ dataIndex: 'endYM', width: 120, slots: { title: 'nameTitle2', }, scopedSlots: { customRender: 'endYM', }, overflowTooltip: true,},
	{ title: '基数', dataIndex: 'base', },
	// { title: '工资', dataIndex: 'wag', scopedSlots: { customRender: 'wag', }, }
	{ dataIndex: 'wag', width: 150, slots: { title: 'nameTitle3', }, scopedSlots: { customRender: 'wag', }, overflowTooltip: true, },
]
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
// const rowSelection = {
// 	//点击每行的checkbox会触发,点击全选也会触发
// 	onChange: (selectedRowKeys, selectedRows) => {
// 		console.log(`selectedRowKeys: ${selectedRowKeys}`, 'selectedRows: ', selectedRows);
// 	}
// };
export default {
	name: 'psnInsuInfoTable',
	data(){
		// const wagValid = ({ cellValue,row }) => {
		// 	//对表1中工资的校验
		// 	console.log('cellValue:',cellValue)
		// 	if (cellValue && (cellValue < 0|| cellValue > 999999999999.9999)) {
		// 		return new Error('工资的格式不正确')
		// 	}else{
		// 		let base
		// 		if(cellValue<=3000){
		// 			base=3000
		// 		}else if(cellValue>=15000){
		// 			base=15000
		// 		}else{
		// 			base=cellValue
		// 		}
		// 		row.base=base
		// 	}
		// }
		return{
			tableColumns1,
			tableColumns2,
			selectedRows: [],
			//行选择配置
			rowSelection: {
				//控制选项的属性需要和 onChange 进行配合
				selectedRowKeys: [],
				//行选择改变事件
				onChange: this.onSelectChange,
			},
			editStyle: 'border',//点击单元格直接编辑
			checkedInfoInsuList:[],//以选择的行数据

			// validRules1:{
			// 	//表格1的校验规则
			// 	wag:[
			// 		{ required: true, message: '工资必须填' },
			// 		{ validator: wagValid, },
			// 		{ pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '工资格式不正确' }
			// 	]
			// }
		}
	},
	props:{
		psnInsuInfoList:[],//人员参保信息表
		salaryBaseInfoList:[],//工资基数信息表

	},
	methods:{
		//点击选项改变触发事件,传入当前选中的所有选项,以及行
		onSelectChange (selectedRowKeys, selectedRows) {
			//设置选中项为点击选中的项
			this.rowSelection.selectedRowKeys = selectedRowKeys
			console.log('selectedRows:',selectedRows)
			this.checkedInfoInsuList=selectedRows
		},
		fnBeforeChangeEndYM ({newData, record, columnKey, }, callback) {
			//对结束日期的验证
			let startYM=record.startYM.toString()
			let endYM=newData
			// console.log('startYM:',startYM)
			// console.log('endYM:',endYM)
			if(startYM>=endYM){
				callback('开始年月不能晚于结束年月!')

			}else{
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				callback()

			}
		},
		fnBeforeChangeStartYM({newData, record, columnKey, }, callback){
			//对开始日期的验证
			let startYM=newData
			let endYM=record.endYM.toString()
			// console.log('startYM:',startYM)
			// console.log('endYM:',endYM)
			if(startYM>=endYM){
				callback('开始年月不能晚于结束年月!')
			}else{
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				callback()
			}
		},
		fnBeforeChangeWag({newData, record, columnKey, }, callback){
			//对工资的验证
			let wag=newData
			console.log('wag:',wag)
			let reg=/^[0-9]+([.][0-9]{1,2})?$/
			if(!reg.test(wag)||wag===undefined){
				callback('工资格式不正确')
			}else if(wag<0||wag>99999999.9999){
				callback('工资金额不正确！')
			}else{
				this.$set(record, columnKey, newData)
				//同时更新基数信息
				let base=record.base
				if(wag<=3000){
					base=3000
				}else if(wag>=15000){
					base=15000
				}else{
					base=wag
				}
				this.$set(record, 'base', base)
				this.$emit('childEvent')
				callback()
			}

		},
		childMethods(){
			console.log('我是子组件，执行childmethod')
			// this.$refs.xTable1.loadData(this.psnInsuInfoList, true)
			// this.$refs.xTable2.loadData(this.salaryBaseInfoList, true)
		},
		sendDataToFather(){
			//向父组件传值的函数
			console.log('正在向父组件传值')
			// return this.$refs.xTable1.getCheckboxRecords()
			// console.log('checked:',this.$refs.table1.getChecked())
			return this.checkedInfoInsuList
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
		changeData ({newData, record, columnKey, }) {
			// 将单元格数据修改为新值（newData：返回改变的值、record：该行的行数据、columnKey：该列的key）
			// 也可当表格编辑状态关闭后，在此处对表格数据进行处理
			this.$set(record, columnKey, newData)
		},


	},
	// watch: {
	// 	//监听行选择行的key,获取到对应的data
	// 	'rowSelection.selectedRowKeys' (now, old) {
	// 		this.selectedRows = now.map((item) => {
	// 			return this.data[item]
	// 		})
	// 		console.log(this.selectedRows)
	// 	}
	// }
}
</script>

<style scoped>
</style>

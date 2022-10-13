<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoListChild"
						  ref="table1" :haveSn="true"
						  :customRow="this.fnCustomRow"
				>
				</ta-table>
<!--				<ta-big-table :data="psnInsuInfoListChild"-->
<!--							  ref="xTable1"-->
<!--							  border="default"-->
<!--							  auto-resize-->
<!--							  keep-source-->
<!--							  highlight-current-row-->
<!--							  max-height="500px"-->
<!--							  :loading="loading"-->
<!--							  @current-change="handleTableCurrentChange"-->
<!--				>-->
<!--					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column field="empNo"  width="150" title="单位编号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="empName"  width="100" title="单位名称"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnNo"  width="150" title="人员编号"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnName"  width="150" title="姓名"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype"  width="100" title="险种类型" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnType"  width="150" title="人员类别" collection-type="PSN_TYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="psnInsuStas"  width="150" title="人员参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>-->
<!--					<ta-big-table-column field="fstInsuYm" width="300" title="首次参保年月"></ta-big-table-column>-->
<!--				</ta-big-table>-->
			</ta-tab-pane>

			<ta-tab-pane tab="报销登记信息Table版" key="2">
				<ta-form :auto-form-create="(form)=>{this.form1 = form}">
					<ta-table :columns="tableColumns2" :dataSource="submitInfoList"
							  ref="table2" :haveSn="true"
							  :scroll="{ x: 2200 }"
					>
<!--						<ta-table-edit slot="action" slot-scope="text, record" :dataSource="submitInfoList" type="rowEdit"  @rowDelete="fnRowDelete(record)"></ta-table-edit>-->
						<span slot="operate" slot-scope="text, record">
							<ta-table-operate :operate-menu="operateMenu" />
						</span>
						<span slot="nameTitle1">险种类型 <ta-icon type="edit" /></span>
						<span slot="nameTitle2">医疗类别 <ta-icon type="edit" /></span>
						<span slot="nameTitle3">就诊开始日期 <ta-icon type="edit" /></span>
						<span slot="nameTitle4">就诊结束日期 <ta-icon type="edit" /></span>
						<span slot="nameTitle5">医疗费总金额 <ta-icon type="edit" /></span>
						<span slot="nameTitle6">符合范围金额 <ta-icon type="edit" /></span>
						<span slot="nameTitle7">本次基金支付金额 <ta-icon type="edit" /></span>
						<span slot="nameTitle8">银行行别代码 <ta-icon type="edit" /></span>
						<span slot="nameTitle9">银行户名 <ta-icon type="edit" /></span>
						<span slot="nameTitle10">银行账号 <ta-icon type="edit" /></span>
						<span slot="nameTitle11">银行申报原因 <ta-icon type="edit" /></span>
						<ta-table-edit slot="insutype" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="select" :option="CollectionData('INSUTYPE')"  :rules="[{ required: true, message: '险种类型不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="medType" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="select" :option="CollectionData('MED_TYPE')"  :rules="[{ required: true, message: '医疗类别不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="begntime" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="datePicker"  :rules="[{ required: true, message: '开始日期不能为空'}]" :before-change="fnBeforeChangeBegntime"></ta-table-edit>
						<ta-table-edit slot="endtime" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="datePicker" :rules="[{ required: true, message: '结束日期不能为空'}]" :before-change="fnBeforeChangeEndtime"></ta-table-edit>
						<ta-table-edit slot="sumfee" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="inputNumber" :rules="[{ required: true, message: '医疗费总金额不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="inscpScpAmt" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="inputNumber" :rules="[{ required: true, message: '符合范围金额不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="fundPaySumamt" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="inputNumber" :rules="[{ required: true, message: '本次基金支付金额不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="bankTypeCode" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="select" :rules="[{ required: true, message: '请选择一个银行行别代码'}]" :option="CollectionData('BANK_TYPE_CODE')" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="acctname" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="input" :rules="[{ required: true, message: '银行户名不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="bankacct" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="input" :rules="[{ required: true, message: '银行账户不能为空'}]" @change="changeData"></ta-table-edit>
						<ta-table-edit slot="dclaRea" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="input" :rules="[{ required: true, message: '申报原因不能为空'}]" @change="changeData"></ta-table-edit>

					</ta-table>
				</ta-form>
			</ta-tab-pane>

<!--			<ta-tab-pane tab="报销登记信息" key="3">-->
<!--				<ta-big-table :data="submitInfoList"-->
<!--							  ref="xTable2"-->
<!--							  border="default"-->
<!--							  auto-resize-->
<!--							  keep-source-->
<!--							  max-height="500px"-->
<!--							  :loading="loading"-->
<!--							  :edit-rules="validRules"-->
<!--							  :edit-config="{trigger: 'click', mode: 'cell', showStatus: true}"-->
<!--				>-->
<!--					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--					<ta-big-table-column  field="operate" title="操作" width="100">-->
<!--						<span slot-scope="rowInfo">-->
<!--							<ta-table-operate :operate-menu="operateMenu" :rowInfo="rowInfo"/>-->
<!--						</span>-->
<!--					</ta-big-table-column>-->
<!--					<ta-big-table-column field="psnType"  width="100" title="人员类别" collection-type="PSN_TYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="insutype"  width="150" title="险种类型"-->
<!--										 collection-type="INSUTYPE"-->
<!--										 :edit-render="{name: '$select'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="medType"  width="100" title="医疗类别"-->
<!--										 :edit-render="{name: '$select'}"-->
<!--										 collection-type="MED_TYPE"></ta-big-table-column>-->
<!--					<ta-big-table-column field="begntime"  width="150" title="就诊开始日期"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="endtime"  width="150" title="就诊结束日期"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="sumfee"  width="100" title="医疗费总金额"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="inscpScpAmt"  width="100" title="符合范围金额"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="fundPaySumamt"  width="100" title="本次基金支付金额"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="bankTypeCode"  width="100" title="银行行别代码"-->
<!--										 :edit-render="{name: '$select'}"-->
<!--										 collection-type="BANK_TYPE_CODE" ></ta-big-table-column>-->
<!--					<ta-big-table-column field="acctname"  width="100" title="银行户名"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="bankacct"  width="150" title="银行账号"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--					<ta-big-table-column field="dclaRea"  width="200" title="申报原因"-->
<!--										 :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--				</ta-big-table>-->
<!--			</ta-tab-pane>-->
		</ta-tabs>
	</div>
</template>

<script>
const tableColumns1=[
	{ title: '单位编号', dataIndex: 'empNo',  },
	{ title: '单位名称', dataIndex: 'empName',  },
	{ title: '人员编号', dataIndex: 'psnNo',  },
	{ title: '姓名', dataIndex: 'psnName',  },
	{ title: '险种类型', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '人员类别', dataIndex: 'psnType', collectionType: 'PSN_TYPE' },
	{ title: '人员参保状态', dataIndex: 'psnInsuStas', collectionType: 'PSN_INSU_STAS' },
	{ title: '首次参保年月', dataIndex: 'fstInsuYm', },
]
const tableColumns2=[
	{ title: '操作',width: 100, dataIndex: 'operate', scopedSlots: { customRender: 'operate' } },
	{ title: '人员类别',width: 150, dataIndex: 'psnType', collectionType: 'PSN_TYPE' },
	// { title: '险种类型', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ dataIndex: 'insutype', width: 200, slots: { title: 'nameTitle1', }, scopedSlots: { customRender: 'insutype', }, overflowTooltip: true,},
	// { title: '医疗类型', dataIndex: 'medType', collectionType: 'MED_TYPE' },
	{ dataIndex: 'medType', width: 200, slots: { title: 'nameTitle2', }, scopedSlots: { customRender: 'medType', }, overflowTooltip: true,},
	{ dataIndex: 'begntime',  width: 150, slots: { title: 'nameTitle3', }, scopedSlots: { customRender: 'begntime', }, overflowTooltip: true,},
	{ dataIndex: 'endtime',   width: 150,slots: { title: 'nameTitle4', }, scopedSlots: { customRender: 'endtime', }, overflowTooltip: true,},
	{ dataIndex: 'sumfee',width: 150,  slots: { title: 'nameTitle5', }, scopedSlots: { customRender: 'sumfee', }, overflowTooltip: true,},
	{ dataIndex: 'inscpScpAmt', width: 150, slots: { title: 'nameTitle6', }, scopedSlots: { customRender: 'inscpScpAmt', }, overflowTooltip: true,},
	{ dataIndex: 'fundPaySumamt',width: 150, slots: { title: 'nameTitle7', }, scopedSlots: { customRender: 'fundPaySumamt', }, overflowTooltip: true,},
	{ dataIndex: 'bankTypeCode',  width: 250,slots: { title: 'nameTitle8', }, scopedSlots: { customRender: 'bankTypeCode', }, overflowTooltip: true,},
	{ dataIndex: 'acctname', width: 200, slots: { title: 'nameTitle9', }, scopedSlots: { customRender: 'acctname', }, overflowTooltip: true,},
	{ dataIndex: 'bankacct', width: 220,  slots: { title: 'nameTitle10', }, scopedSlots: { customRender: 'bankacct', }, overflowTooltip: true,},
	{ dataIndex: 'dclaRea',width: 200, slots: { title: 'nameTitle11', }, scopedSlots: { customRender: 'dclaRea', }, overflowTooltip: true,},
	// { title: '就诊开始日期', dataIndex: 'begntime',  },
	// { title: '就诊结束日期', dataIndex: 'endtime',  },
	// { title: '医疗费总金额', dataIndex: 'sumfee',  },
	// { title: '符合范围金额', dataIndex: 'inscpScpAmt',  },
	// { title: '本次基金支付金额', dataIndex: 'fundPaySumamt',  },
	// { title: '银行行别代码', dataIndex: 'bankTypeCode', collectionType: 'BANK_TYPE_CODE' },
	// { title: '银行户名', dataIndex: 'acctname', },
	// { title: '银行账号', dataIndex: 'bankacct', },
	// { title: '申报原因', dataIndex: 'dclaRea', },
]
export default {
	name: 'child',
	props:{
		psnInsuInfoListChild:[],//人员参保信息列表
		submitInfoList:[],//报销登记列表
	},
	data(){
		// const checkbegntime = ({ cellValue,row }) => {
		// 	// console.log('cellValue:',cellValue)
		// 	if(isNaN(cellValue)&&!isNaN(Date.parse(cellValue))&&cellValue.length===10){
		// 		console.log("data是日期格式！")
		// 		//就诊开始日期不能晚于就诊结束日期
		// 		// console.log('row:',row)
		// 		let start=parseInt(row.begntime.substring(0,4)+row.begntime.substring(5,7)+row.begntime.substring(8))
		// 		let end=parseInt(row.endtime.substring(0,4)+row.endtime.substring(5,7)+row.endtime.substring(8))
		// 		if(start>=end){
		// 			return new Error('就诊开始日期不能晚于就诊结束日期!')
		// 		}
		// 	}else{
		// 		return new Error('日期格式不对')
		// 	}
		// }
		// const checkendtime = ({ cellValue,row}) => {
		// 	// console.log('cellValue:',cellValue)
		// 	if(isNaN(cellValue)&&!isNaN(Date.parse(cellValue))&&cellValue.length===10){
		// 		console.log("data是日期格式！")
		// 		//就诊开始日期不能晚于就诊结束日期
		// 		// console.log('row:',row)
		// 		let start=parseInt(row.begntime.substring(0,4)+row.begntime.substring(5,7)+row.begntime.substring(8))
		// 		let end=parseInt(row.endtime.substring(0,4)+row.endtime.substring(5,7)+row.endtime.substring(8))
		// 		if(start>=end){
		// 			return new Error('就诊开始日期不能晚于就诊结束日期!')
		// 		}
		// 	}else{
		// 		return new Error('日期格式不对')
		// 	}
		//
		// }
		return{
			tableColumns1,
			tableColumns2,
			// loading: false,
			editStyle: 'border',//点击单元格直接编辑
			rowData:{},//行数据
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
						this.submitInfoList.splice(index,1)
						console.log('validatedList:',this.submitInfoList)
						this.$message.success('删除成功')
					},
				},
			],
			// validRules: {
			// 	begntime: [
			// 		{ required: true, message: '就诊开始日期必填', },
			// 		{ validator: checkbegntime, }
			// 	],
			// 	endtime: [
			// 		{ required: true, message: '就诊结束日期必填', },
			// 		{ validator: checkendtime, }
			// 	],
			// 	sumfee:[
			// 		{required:true,message:'医疗费总金额必填'}
			// 	],
			// 	inscpScpAmt:[
			// 		{required:true,message:'符合范围总金额必填'}
			// 	],
			// 	fundPaySumamt:[
			// 		{required:true,message:'本次基金支付金额必填'}
			// 	],
			// 	baseAccount:[
			// 		{required:true,message:'银行账号必填'}
			// 	]
			// },
		}
	},
	methods:{
		// handleTableCurrentChange({ row, rowIndex, $rowIndex, column, columnIndex, $columnIndex, $event, }) {
		// 	// 使用鼠标点击时会传递column相关参数，使用键盘方向键导航则不传递column相关参数
		// 	// console.log('row:',row)
		// 	// console.log('向父组件传递点击的行数据')
		// 	// this.sendClickedDataToFather(row)
		// 	this.rowData=row
		// 	console.log('rowData:',this.rowData)
		// },

		fullValidEvent () {//完整校验
			// 不指定数据，则默认只校验临时变动的数据，例如新增或修改，当某一列校验失败后不会停止校验
			// this.$refs.table2.fullValidate().then(() => {
			// 	// this.$message.success('校验成功！')
			// 	this.$emit('childEvent', undefined)
			// }).catch(errMap => {
			// 	console.log('errMap:',errMap)
			// 	this.$emit('childEvent',errMap)
			// })
			this.$emit('childEvent2',undefined)
		},
		fnCustomRow (record, index) {
			//回传数据给父组件的必要操作
			return {
				props: {},
				on: { // 事件:支持DOM的标准事件,使用箭头表达式写法
					click: (e) => {
						// console.log('点击行record:',record)
						// console.log('点击行index:',index)
						this.rowData=record
						this.$emit('childEvent1',this.rowData)
					}
				}
			}
		},
		fnBeforeChangeBegntime({newData, record, columnKey, }, callback){
			//开始时间的校验
			let begnTime=parseInt(newData.toString().replaceAll('-',''))
			let endTime=parseInt(record.endtime.replaceAll('-',''))
			// console.log('begnTime:',begnTime)
			// console.log('endTime:',endTime)
			if(begnTime>=endTime){
				callback('开始日期不能晚于结束日期!')
			}else{
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				callback()
			}
		},
		fnBeforeChangeEndtime({newData, record, columnKey, }, callback){
			//开始时间的校验
			let endTime=parseInt(newData.toString().replaceAll('-',''))
			let begnTime=parseInt(record.begntime.replaceAll('-',''))
			// console.log('begnTime:',begnTime)
			// console.log('endTime:',endTime)
			if(begnTime>=endTime){
				callback('开始日期不能晚于结束日期!')
			}else{
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				callback()
			}
		},
		changeData ({newData, record, columnKey, }) {
			// 将单元格数据修改为新值（newData：返回改变的值、record：该行的行数据、columnKey：该列的key）
			// 也可当表格编辑状态关闭后，在此处对表格数据进行处理
			this.$set(record, columnKey, newData)
		},
	}
}
</script>

<style scoped>

</style>

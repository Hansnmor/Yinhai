<template>
	<ta-form :auto-form-create="(form)=>{this.form1 = form}">
		<ta-table :columns="tableColumns2" :dataSource="submitInfoList"
				  ref="table2" :haveSn="true"
				  :scroll="{ x: 2200 }"
		>
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
</template>

<script>
const tableColumns2=[
	{ title: '操作',width: 100, dataIndex: 'operate', scopedSlots: { customRender: 'operate' } },
	{ title: '人员类别',width: 150, dataIndex: 'psnType', collectionType: 'PSN_TYPE' },
	{ dataIndex: 'insutype', width: 200, slots: { title: 'nameTitle1', }, scopedSlots: { customRender: 'insutype', }, overflowTooltip: true,},
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
]
export default {
	name: 'child2',
	props:{
		submitInfoList:[],//报销登记列表
	},
	data(){
		return{
			tableColumns2,
			editStyle: 'border',//点击单元格直接编辑
			operateMenu: [
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
		}
	},
	methods:{
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

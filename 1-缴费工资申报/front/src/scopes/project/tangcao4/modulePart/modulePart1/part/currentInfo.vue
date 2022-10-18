<template>
	<ta-form :auto-form-create="(form)=>{this.form1 = form}">
		<ta-table :columns="tableColumns" :dataSource="currTratYearDInfoList"
				  ref="table" :haveSn="true"
		>
			<span slot="nameTitle1">险种类型 <ta-icon type="edit" /></span>
			<span slot="nameTitle2">开始年月 <ta-icon type="edit" /></span>
			<span slot="nameTitle3">结束年月 <ta-icon type="edit" /></span>
			<ta-table-edit slot="insutype" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="select" :option="CollectionData('INSUTYPE')"  :rules="[{ required: true, message: '险种类型不能为空'}]" @change="changeData"></ta-table-edit>
			<ta-table-edit slot="begnYm" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="issuePicker"  :rules="[{ required: true, message: '开始年月不能为空'}]" :before-change="fnBeforeChangeBegnYm"></ta-table-edit>
			<ta-table-edit slot="endYm" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1" type="issuePicker"  :rules="[{ required: true, message: '结束年月不能为空'}]" :before-change="fnBeforeChangeEndYm"></ta-table-edit>

			<span slot="operate" slot-scope="text, record">
				<ta-table-operate :operate-menu="operateMenu" />
			</span>
		</ta-table>
	</ta-form>
<!--    <ta-big-table-->
<!--            class="mytable-style"-->
<!--            ref="xTable1"-->
<!--            border="default"-->
<!--            align="center"-->
<!--            auto-resize-->
<!--            keep-source-->
<!--            :edit-config="{trigger: 'click', mode: 'cell', showStatus: true}"-->
<!--            :data="currTratYearDInfoList"-->
<!--            :edit-rules="validRules1"-->
<!--    >-->
<!--        <ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE" :edit-render="{name: '$select'}" />-->
<!--        <ta-big-table-column field="begnYm" title="开始年月" :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--        <ta-big-table-column field="endYm" title="结束年月" :edit-render="{name: 'input'}"></ta-big-table-column>-->
<!--        <ta-big-table-column field="tratClctMons"  width="15%" title="视同缴费月数"></ta-big-table-column>-->
<!--        <ta-big-table-column  field="operate" title="操作" width="100">-->
<!--						<span slot-scope="rowInfo">-->
<!--							<ta-table-operate :operate-menu="operateMenu" :rowInfo="rowInfo"/>-->
<!--						</span>-->
<!--        </ta-big-table-column>-->
<!--    </ta-big-table>-->
</template>

<script>
const tableColumns=[
	{ dataIndex: 'insutype',  slots: { title: 'nameTitle1', }, scopedSlots: { customRender: 'insutype', }, overflowTooltip: true,},
	{ dataIndex: 'begnYm',   slots: { title: 'nameTitle2', }, scopedSlots: { customRender: 'begnYm', }, overflowTooltip: true,},
	{ dataIndex: 'endYm',   slots: { title: 'nameTitle3', }, scopedSlots: { customRender: 'endYm', }, overflowTooltip: true,},
	{ title: '视同缴费月数', dataIndex: 'tratClctMons',  },
	{ title: '操作',width: 100, dataIndex: 'operate', scopedSlots: { customRender: 'operate' } },
]
export default {
	name: "currentInfo",
	props:{
		currTratYearDInfoList:[],//当前历史认定信息
		psnTratYearDInfoList:[],//个人历史认定信息
	},
	data(){
		// const begnYmValid = ({ cellValue,row }) => {
		// 	//对表1中开始的年月
		// 	console.log('cellValue:',cellValue)
		// 	let tempS = parseInt(cellValue)
		// 	let tempE = parseInt(row.endYm)
		// 	if (cellValue ==null) {
		// 		return new Error('开始年月不能为空')
		// 	}else if(tempS>tempE){
		// 		return new Error('开始年月不能晚于结束年月')
		// 	}else {
		//
		// 		row.tratClctMons=this.reduMonths(cellValue,row.endYm)
		// 	}
		// }
		// const endYmValid = ({ cellValue,row }) => {
		// 	//对表1中开始的年月
		// 	console.log('cellValue:',cellValue)
		// 	let tempS = parseInt(row.begnYm)
		// 	let tempE = parseInt(cellValue)
		// 	if (cellValue ==null) {
		// 		return new Error('结束年月不能为空')
		// 	}else if(tempS>tempE){
		// 		return new Error('开始年月不能晚于结束年月')
		// 	}else {
		// 		row.tratClctMons=this.reduMonths(row.begnYm,cellValue)
		// 	}
		// }
		return{
			tableColumns,
			editStyle: 'border',//点击单元格直接编辑
			// validRules1:{
			// 	//表格1的校验规则
			// 	begnYm:[
			// 		{ required: true, message: '开始年月不能为空' },
			// 		{ validator: begnYmValid, },
			// 	],
			// 	//表格1的校验规则
			// 	endYm:[
			// 		{ required: true, message: '结束年月不能为空' },
			// 		{ validator: endYmValid, },
			// 	],
			// 	//表格1的校验规则
			// 	insutype:[
			// 		{ required: true, message: '结束年月不能为空' },
			// 	],
			// },
			operateMenu: [
				{
					name: '删除',
					icon: 'delete',
					type: 'confirm',
					confirmTitle: '确认删除该信息？',
					onOk: (record, index) => {
						console.log('record:',record)
						console.log('index:',index)
						this.currTratYearDInfoList.splice(index,1)
						// console.log('currTratYearDInfoList:',this.currTratYearDInfoList)
						this.$message.success('删除成功')
					},
				},

			],
		}
	},
	methods: {
		// reduMonths(startMonth,endMonth){
		// 	let startY = startMonth.substring(0,4),
		// 		startM = startMonth.substring(4,6),
		// 		endY = endMonth.substring(0,4),
		// 		endM = endMonth.substring(4,6);
		// 	if(startMonth > endMonth){
		// 		let reduY = startY - endY,
		// 			reduM = startM - endM;
		// 		return reduY*12+reduM
		// 	}else if(startMonth < endMonth){
		// 		let reduY = endY - startY,
		// 			reduM = endM - startM;
		// 		return reduY*12+reduM
		// 	}else{
		// 		return 1
		// 	}
		// },
		fnBeforeChangeBegnYm({newData, record, columnKey, }, callback){
			console.log('校验开始年月')
			let begnYm=newData
			let endYm=record.endYm
			// console.log('begnYm:',begnYm)
			// console.log('endYm:',endYm)
			if(begnYm>=endYm){
				callback('开始日期不能晚于结束日期!')
			}else{
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				//同时更新视同缴费月份
				console.log('record:',record)
				let year=parseInt(endYm.toString().substring(0,4))-parseInt(begnYm.toString().substring(0,4))
				let month=parseInt(endYm.toString().substring(4))-parseInt(begnYm.toString().substring(4))+12*year
				this.$set(record, 'tratClctMons', month)
				callback()
			}
		},
		fnBeforeChangeEndYm({newData, record, columnKey, }, callback){
			console.log('校验结束年月')
			let begnYm=record.begnYm
			let endYm=newData
			// console.log('begnYm:',begnYm)
			// console.log('endYm:',endYm)
			if(begnYm>=endYm){
				callback('开始日期不能晚于结束日期!')
			}else{
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				//同时更新视同缴费月份
				console.log('record:',record)
				let year=parseInt(endYm.toString().substring(0,4))-parseInt(begnYm.toString().substring(0,4))
				let month=parseInt(endYm.toString().substring(4))-parseInt(begnYm.toString().substring(4))+12*year
				this.$set(record, 'tratClctMons', month)
				callback()
			}
		},
		changeData ({newData, record, columnKey, }) {
			// 将单元格数据修改为新值（newData：返回改变的值、record：该行的行数据、columnKey：该列的key）
			// 也可当表格编辑状态关闭后，在此处对表格数据进行处理
			this.$set(record, columnKey, newData)
		},
		// sendDataToFather(){
		// 	//向父组件传值的函数
		// 	console.log('正在向父组件传值')
		// 	// let temp = this.$refs.xTable1.getUpdateRecords()
		// 	// if (temp == null || temp == undefined) {
		// 	//     return null;
		// 	// }else if (temp !== null && temp.length > 0) {
		// 	//     return temp;
		// 	// }
		// },
	}
}
</script>

<style scoped>

</style>

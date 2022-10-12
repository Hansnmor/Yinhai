<template>
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
export default {
	name: 'child1',
	props:{
		psnInsuInfoList:[],//人员参保信息表
	},
	data(){
		return{
			tableColumns1,
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
		sendDataToFather(){
			//向父组件传值的函数
			console.log('正在向父组件传值')
			return this.checkedInfoInsuList
		},
	}
}
</script>

<style scoped>

</style>

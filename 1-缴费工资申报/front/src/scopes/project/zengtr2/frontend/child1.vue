<template>
	<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoListByEmpNo"
			  ref="table1" :haveSn="true"
			  :rowSelection="rowSelection"
	>
	</ta-table>
</template>

<script>
const tableColumns1=[
	{ title: '单位编号', dataIndex: 'empNo',  },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '首次参保年月', dataIndex: 'fstInsuYm', },
	{ title: '最大做账期号', dataIndex: 'maxAcctprd', },
	{ title: '参保所属机构', dataIndex: 'insuOptins', collectionType: 'OPTINS' },
]
export default {
	name: 'child1',
	props:{
		psnInsuInfoListByEmpNo:[],//人员参保信息表
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

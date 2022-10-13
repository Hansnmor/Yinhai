<template>
	<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoListChild"
			  ref="table1" :haveSn="true"
			  :customRow="this.fnCustomRow"
	>
	</ta-table>
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
export default {
	name: 'child1',
	props:{
		psnInsuInfoListChild:[],//人员参保信息列表
	},
	data(){
		return{
			tableColumns1,
			rowData:{},//行数据
		}
	},
	methods:{
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
	}
}
</script>

<style scoped>

</style>

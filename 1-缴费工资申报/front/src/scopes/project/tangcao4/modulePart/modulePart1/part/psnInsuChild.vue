<template>
	<ta-table :columns="tableColumns1" :dataSource="psnInsuInfoList"
			  ref="table1" :haveSn="true"
	>
	</ta-table>
<!--    <ta-big-table-->
<!--            class="mytable-style"-->
<!--            ref="xTable1"-->
<!--            border="default"-->
<!--            align="center"-->
<!--            auto-resize-->
<!--            keep-source-->
<!--            :data="psnInsuInfoList"-->
<!--    >-->
<!--        <ta-big-table-column field="empNo"  width="15%" title="单位编号"></ta-big-table-column>-->
<!--        <ta-big-table-column field="empName"  width="15%" title="单位名称"></ta-big-table-column>-->
<!--        <ta-big-table-column field="psnNo"  width="15%" title="个人编号"></ta-big-table-column>-->
<!--        <ta-big-table-column field="psnName"  width="15%" title="姓名"></ta-big-table-column>-->
<!--        <ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--        <ta-big-table-column field="crtInsuDate"  width="20%" title="参保日期"></ta-big-table-column>-->
<!--    </ta-big-table>-->
</template>

<script>
const tableColumns1=[
	{ title: '单位编号', dataIndex: 'empNo',  },
	{ title: '单位名称', dataIndex: 'empName',  },
	{ title: '个人编号', dataIndex: 'psnNo',  },
	{ title: '姓名', dataIndex: 'psnName',  },
	{ title: '险种类型', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '参保日期', dataIndex: 'crtInsuDate',  },
]
export default {
	name: "psnInsuChild",
	props:{
		psnInsuInfoList:[],//人员参保信息表
	},
	data(){
		return{
			tableColumns1,
		}
	},
	methods:{
		childMethods(){
			// console.log('我是子组件，执行childmethod')
			// this.$refs.xTable1.loadData(this.psnInsuInfoListByEmpNo, true)
			// this.$refs.xTable2.loadData(this.validatedList, true)
		},

	}
}
</script>

<style scoped>

</style>

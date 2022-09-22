<template>
	<div>
		<ta-tabs defaultActiveKey="1">
			<ta-tab-pane tab="人员参保信息" key="1">
				<ta-big-table
					ref="xTable1"
					border="default"
					auto-resize
					keep-source
					:data="psnInsuInfoList"
					:edit-config="{trigger: 'click', mode: 'row',showStatus: true}"
				>
					<ta-big-table-column type="seq"  width="60"></ta-big-table-column>
					<ta-big-table-column type="checkbox"  width="60"></ta-big-table-column>
					<ta-big-table-column field="psnNo"  width="120" title="人员编号"></ta-big-table-column>
					<ta-big-table-column field="psnName"  width="100" title="姓名"></ta-big-table-column>
					<ta-big-table-column field="certno" width="200" title="证件号码"></ta-big-table-column>
					<ta-big-table-column field="gend"  width="60" title="性别" collection-type="GEND"></ta-big-table-column>
					<ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>
					<ta-big-table-column field="psnInsuStas" title="参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>
					<ta-big-table-column field="startYM" title="开始年月" :edit-render="{autofocus: '.custom-input'}">
						<template #edit="{ row }">
							<ta-input v-model="row.name" class="custom-input" />
						</template>
					</ta-big-table-column>
					<ta-big-table-column field="endYM" title="结束年月" :edit-render="{autofocus: '.custom-input'}">
						<template #edit="{ row }">
							<ta-input v-model="row.name" class="custom-input" />
						</template>
					</ta-big-table-column>
					<ta-big-table-column field="base" title="基数"></ta-big-table-column>
					<ta-big-table-column field="wag" title="工资" :edit-render="{autofocus: '.custom-input'}">
						<template #edit="{ row }">
							<ta-input v-model="row.name" class="custom-input" />
						</template>
					</ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>

			<ta-tab-pane tab="工资基数信息" key="2">
				<ta-big-table
					border="default"
					auto-resize
					:data="salaryBaseInfoList">
					<ta-big-table-column type="seq"  width="60" align="left"></ta-big-table-column>
					<ta-big-table-column field="psnNo" title="人员编号" align="left"></ta-big-table-column>
					<ta-big-table-column field="psnName" title="姓名" align="left"></ta-big-table-column>
					<ta-big-table-column field="certno" width="100" title="证件号码" align="left"></ta-big-table-column>
					<ta-big-table-column field="gend"  title="性别" align="center" collection-type="GEND" ></ta-big-table-column>
					<ta-big-table-column field="insuType" title="参保险种" align="left"  collection-type="NATY"></ta-big-table-column>
					<ta-big-table-column field="psnInsuStas" title="参保状态" align="center" collection-type="PSN_INSU_STAS"></ta-big-table-column>
					<ta-big-table-column field="nowMY" title="当前年月" align="center"></ta-big-table-column>
					<ta-big-table-column field="base" title="基数" align="right"></ta-big-table-column>
					<ta-big-table-column field="salary" title="工资" align="right"></ta-big-table-column>
				</ta-big-table>
			</ta-tab-pane>
		</ta-tabs>
	</div>
</template>

<script>
export default {
	name: 'psnInsuInfoTable',
	props:{
		psnInsuInfoList:[],//人员参保信息表
		salaryBaseInfoList:[],//工资基数信息表

	},
	methods:{
		childMethods(){
			this.$refs.xTable1.loadData(this.psnInsuInfoList, true)

		}
	},
}
</script>

<style scoped>

</style>

<template>
	<ta-form :auto-form-create="(form)=>{this.form1 = form}">
		<ta-table :columns="tableColumns" :dataSource="psnTratYearDInfoList"
				  ref="table" :haveSn="true"
		>
			<span slot="nameTitle1">险种类型 <ta-icon type="edit"/></span>
			<span slot="nameTitle2">开始年月 <ta-icon type="edit"/></span>
			<span slot="nameTitle3">结束年月 <ta-icon type="edit"/></span>
			<ta-table-edit slot="insutype" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1"
						   type="select" :option="CollectionData('INSUTYPE')"
						   :rules="[{ required: true, message: '险种类型不能为空'}]" @change="changeData"
			></ta-table-edit>
			<ta-table-edit slot="begnYm" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1"
						   type="issuePicker" :rules="[{ required: true, message: '开始年月不能为空'}]"
						   :before-change="fnBeforeChangeBegnYm"
			></ta-table-edit>
			<ta-table-edit slot="endYm" slot-scope="text, record" :edit-style="editStyle" :edit-form="form1"
						   type="issuePicker" :rules="[{ required: true, message: '结束年月不能为空'}]"
						   :before-change="fnBeforeChangeEndYm"
			></ta-table-edit>
			<span slot="operate" slot-scope="text, record">
				<ta-table-operate :operate-menu="operateMenu"/>
			</span>
		</ta-table>
	</ta-form>
</template>

<script>
const tableColumns = [
	{
		dataIndex: 'insutype',
		slots: { title: 'nameTitle1', },
		scopedSlots: { customRender: 'insutype', },
		overflowTooltip: true,
	},
	{
		dataIndex: 'begnYm',
		slots: { title: 'nameTitle2', },
		scopedSlots: { customRender: 'begnYm', },
		overflowTooltip: true,
	},
	{
		dataIndex: 'endYm',
		slots: { title: 'nameTitle3', },
		scopedSlots: { customRender: 'endYm', },
		overflowTooltip: true,
	},
	{
		title: '视同缴费月数',
		dataIndex: 'tratClctMons',
	},
	{
		title: '操作',
		width: 100,
		dataIndex: 'operate',
		scopedSlots: { customRender: 'operate' }
	},
]
export default {
	name: 'historicalInfo',
	props: {
		currTratYearDInfoList: [],//当前历史认定信息
		psnTratYearDInfoList: [],//个人历史认定信息
	},
	data () {
		return {
			tableColumns,
			editStyle: 'border',//点击单元格直接编辑
			operateMenu: [
				{
					name: '删除',
					icon: 'delete',
					type: 'confirm',
					confirmTitle: '确认删除该信息？',
					onOk: (record, index) => {
						this.Base.submit(null, {
							url: 'yearlyPayment/deletePsnTratYearDInfo',
							data: { psnTratClctId: record.psnTratClctId, },
						}).then(data => {
							message.success('删除成功')
						})
						this.psnTratYearDInfoList.splice(index, 1)
					},
				},
			],
		}
	},
	methods: {
		fnBeforeChangeBegnYm ({
			newData,
			record,
			columnKey,
		}, callback) {
			console.log('校验开始年月')
			let begnYm = newData
			let endYm = record.endYm
			// console.log('begnYm:',begnYm)
			// console.log('endYm:',endYm)
			if (begnYm >= endYm) {
				callback('开始日期不能晚于结束日期!')
			} else {
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				//同时更新视同缴费月份
				console.log('record:', record)
				let year = parseInt(endYm.toString().substring(0, 4))
					- parseInt(begnYm.toString().substring(0, 4))
				let month = parseInt(endYm.toString().substring(4))
					- parseInt(begnYm.toString().substring(4)) + 12 * year
				this.$set(record, 'tratClctMons', month)
				//向父组件行数据
				this.$emit('childEvent', record)
				callback()
			}
		},
		fnBeforeChangeEndYm ({
			newData,
			record,
			columnKey,
		}, callback) {
			console.log('校验结束年月')
			let begnYm = record.begnYm
			let endYm = newData
			// console.log('begnYm:',begnYm)
			// console.log('endYm:',endYm)
			if (begnYm >= endYm) {
				callback('开始日期不能晚于结束日期!')
			} else {
				// 可在此处对表格数据进行处理
				this.$set(record, columnKey, newData)
				//同时更新视同缴费月份
				console.log('record:', record)
				let year = parseInt(endYm.toString().substring(0, 4))
					- parseInt(begnYm.toString().substring(0, 4))
				let month = parseInt(endYm.toString().substring(4))
					- parseInt(begnYm.toString().substring(4)) + 12 * year
				this.$set(record, 'tratClctMons', month)
				this.$emit('childEvent', record)
				callback()
			}
		},
		changeData ({
			newData,
			record,
			columnKey,
		}) {
			// 将单元格数据修改为新值（newData：返回改变的值、record：该行的行数据、columnKey：该列的key）
			// 也可当表格编辑状态关闭后，在此处对表格数据进行处理
			this.$set(record, columnKey, newData)
			this.$emit('childEvent', record)
		},
	}
}
</script>

<style scoped>

</style>

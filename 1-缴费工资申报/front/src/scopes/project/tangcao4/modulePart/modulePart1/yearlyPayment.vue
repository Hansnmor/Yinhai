<template>
	<div>
		<ta-border-layout layout-type="fixTop">
			<!--按键区域-->
			<div slot="header">
				<div style="text-align: center;">
					<ta-button :disabled="ifSave" type="primary" @click="fnSave">
						保存[S]
					</ta-button>

					<ta-button @click="fnReset">
						重置[R]
					</ta-button>
				</div>
			</div>

			<div>
				<ta-card :bordered="false">
					<div slot="title" style="font-size: 20px;font-weight: bold">个人基本信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.psnBaseForm = form}"
					>
						<ta-form-item label="个人编号" :span="6"
									  fieldDecoratorId="psnNo"
									  :disabled="ifPsnNo"
									  :require="{message:'请输入个人编号'}"
						>
							<ta-auto-complete @select="onSelect_Psn" @search="handleSearch_Psn"
											  optionLabelProp="text" :dropdownMatchSelectWidth="false"
											  placeholder="请输入个人编号、姓名、身份证号"
											  style="width: 90%"
							>
								<template slot="dataSource">
									<ta-select-opt-group v-if="this.psnInfoList.length > 0">
										<div slot="label" style="float: left;  width: 130px;margin-left: 10px">
											个人编号
										</div>
										<div slot="label" style="float: left;  width: 100px">
											姓名
										</div>
										<div slot="label" style="float: left;  width: 170px">
											身份证号
										</div>
										<ta-select-option v-for="item in psnInfoList" :key="item.psnNo"
														  :text="item.psnNo"
										>
											<div style="float: left;  width: 130px">
												{{ item.psnNo }}
											</div>
											<div style="float: left;  width: 100px">
												{{ item.psnName }}
											</div>
											<div style="float: left;  width: 170px">
												{{ item.certno }}
											</div>
										</ta-select-option>
									</ta-select-opt-group>
								</template>
							</ta-auto-complete>
						</ta-form-item>

						<ta-form-item label="姓名" :span="6"
									  fieldDecoratorId="psnName"
									  :disabled="true"
						>
							<ta-input style="width: 90%"></ta-input>
						</ta-form-item>

						<ta-form-item label="性别" :span="6"
									  field-decorator-id="gend"
									  :disabled="true"
						>
							<ta-select collection-type="GEND" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="证件号码" :span="6"
									  field-decorator-id="certno"
									  :disabled="true"
						>
							<ta-input style="width: 90%"></ta-input>
						</ta-form-item>

						<ta-form-item label="证件类型" :span="6"
									  field-decorator-id="psnCertType"
									  :disabled="true"
						>
							<ta-select collection-type="CERT_TYPE" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="出生日期" :span="6"
									  field-decorator-id="brdy"
									  :disabled="true"
						>
							<ta-input style="width: 90%"></ta-input>
						</ta-form-item>
					</ta-form>
				</ta-card>

				<ta-card :bordered="false">
					<div slot="title" style="font-size: 20px;font-weight: bold">单位基本信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.empBaseForm = form}"
					>
						<ta-form-item label="单位编号"
									  field-decorator-id="empNo"
									  :span="6"
									  :disabled="ifEmpNo"
									  :require="{message:'请输入单位编号'}"
						>
							<ta-auto-complete @select="onSelect_Emp" @search="handleSearch_Emp"
											  optionLabelProp="text" :dropdownMatchSelectWidth="false"
											  placeholder="请输入单位编号、单位名称"
											  style="width: 90%"
							>
								<template slot="dataSource">
									<ta-select-opt-group v-if="this.empInfoList.length > 0">
										<div slot="label" style="float: left;  width: 130px;margin-left: 10px">
											单位编号
										</div>
										<div slot="label" style="float: left;  width: 170px">
											单位名称
										</div>
										<ta-select-option v-for="item in empInfoList" :key="item.empNo"
														  :text="item.empNo"
										>
											<div style="float: left;  width: 130px">
												{{ item.empNo }}
											</div>
											<div style="float: left;  width: 170px">
												{{ item.empName }}
											</div>
										</ta-select-option>
									</ta-select-opt-group>
								</template>
							</ta-auto-complete>
						</ta-form-item>

						<ta-form-item label="单位名称" :span="12"
									  :disabled="true"
									  :label-col="{span: 3}"
									  :wrapper-col="{span: 21}"
									  field-decorator-id="empName"
						>
							<ta-input style="width: 96%"></ta-input>
						</ta-form-item>
					</ta-form>
				</ta-card>

				<ta-card :bordered="false">
					<div slot="title" style="font-size: 20px;font-weight: bold">工作经历信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.workInfoForm = form}"
					>
						<ta-form-item label="险种类型" :span="6"
									  :disabled="isPayment"
									  :require="{message:'请选择险种类型'}"
									  fieldDecoratorId="insutype"
						>
							<ta-select collection-type="INSUTYPE" placeholder="险种类型"></ta-select>
						</ta-form-item>

						<ta-form-item label="开始年月" :span="6"
									  field-decorator-id="begnYm"
									  :disabled="isPayment"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkbegnYm}]}"
						>
							<ta-month-picker style="width: 100%" format="YYYYMM"></ta-month-picker>
						</ta-form-item>

						<ta-form-item label="结束年月" :span="6"
									  field-decorator-id="endYm"
									  :disabled="isPayment"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkendYm}]}"
						>
							<ta-month-picker style="width: 100%" format="YYYYMM"></ta-month-picker>
						</ta-form-item>

						<ta-form-item label="视同缴费月数" :span="6"
									  :disabled="true"
									  init-value="设置默认值"
									  fieldDecoratorId="tratClctMons"
						>
							<ta-input-number :min="1"/>
						</ta-form-item>
					</ta-form>
				</ta-card>

				<div style="text-align: center;">
					<ta-button @click="fnAdd" :disabled="ifAdd">添加视同信息</ta-button>
				</div>

				<div>
					<ta-tabs defaultActiveKey="1">
						<ta-tab-pane tab="个人参保信息" key="1">
							<psnInsuChild :psnInsuInfoList="this.psnInsuInfoListByEmpNo"></psnInsuChild>
						</ta-tab-pane>
						<ta-tab-pane tab="本次认定信息" key="2">
							<currentInfo :currTratYearDInfoList="this.currTratYearDInfoList"
										 :psnTratYearDInfoList="this.psnTratYearDInfoList"
							></currentInfo>
						</ta-tab-pane>
						<ta-tab-pane tab="历史认定信息" key="3">
							<historicalInfo ref="freshPage"
											@childEvent="getChildData"
											:currTratYearDInfoList="this.currTratYearDInfoList"
											:psnTratYearDInfoList="this.psnTratYearDInfoList"
							></historicalInfo>
						</ta-tab-pane>
					</ta-tabs>
				</div>
			</div>
		</ta-border-layout>
	</div>
</template>

<script>

import psnInsuChild from './part/psnInsuChild'
import historicalInfo from './part/historicalInfo'
import currentInfo from './part/currentInfo'

export default {
	name: 'yearlyPayment',
	components: {
		psnInsuChild,
		historicalInfo,
		currentInfo
	},
	data () {
		return {
			ifSave: true,//保存按钮能否用
			ifEmpNo: false,//决定单位编号的输入框
			ifPsnNo: false,//个人编号可用性
			isPayment: true,//工作经历信息区域的组件可用性
			ifAdd: true,//添加按钮是否开启
			col: {
				//用于设置表单栅格属性的分割
				xs: 1,
				sm: 2,
				md: 3,
				lg: 4,
				xl: 6,
				xxl: 12,
			},
			empInfoList: [],//单位基本信息
			psnNo: '',//个人编号
			psnInfoList: [],//个人信息
			psnInsuInfoListByEmpNo: [],//个人参保信息
			psnTratYearDInfoList: [],//个人历史认定信息
			currTratYearDInfoList: [],//当前认定视同缴费信息
			updateInfoInsuList: [],//修改过的历史认定信息
			empNo: '',//单位编号
		}
	},
	methods: {
		fnSave () {
			//保存操作
			console.log('进行保存操作，首先验证新增数据')
			console.log('已更新的历史认定信息：', this.updateInfoInsuList)
			console.log('本次认定信息表：', this.currTratYearDInfoList)
			if ((this.currTratYearDInfoList.length === 0 && this.updateInfoInsuList.length === 0)) {
				this.$message.warning('请先添加视同缴费信息或者修改历史认定信息后再进行保存！')
				return false
			} else {
				//有新增数据，进行保存操作
				console.log('有新增数据，进行保存操作')

				//空字段验证暂时略过
				console.log('空字段验证完成')
				//进行时间交叉验证
				let flag = 0
				if (this.currTratYearDInfoList.length === 0) {
					//没有新增，就不存在交叉
					console.log('交叉验证完成，不存在交叉')
				} else {
					for (let i = 0; i < this.psnTratYearDInfoList.length; i++) {
						let temp1 = this.psnTratYearDInfoList[i]
						let begnYm1 = parseInt(temp1.begnYm)
						let endYm1 = parseInt(temp1.endYm)
						for (let j = 0; j < this.currTratYearDInfoList.length; j++) {
							let temp2 = this.currTratYearDInfoList[j]
							let begnYm2 = parseInt(temp2.begnYm)
							let endYm2 = parseInt(temp2.endYm)
							if (temp1.insutype === temp2.insutype) {
								console.log('匹配到同一险种：', temp1.insutype)
								if ((begnYm1 <= begnYm2 && endYm1 >= begnYm2) || (begnYm1 <= endYm2 && endYm1 >= endYm2)) {
									console.log('时间存在交叉，不允许保存！')
									flag = 1
									break
								}
							}
						}
						if (flag !== 0) {
							break
						}
					}
				}
				if (flag !== 0) {
					this.$message.warning('【提交的数据中存在时间交叉的数据，请检查!')
					return false
				}
				console.log('所有验证完成，正式进行保存')
				//保存之前，对缺少的值进行赋值
				for (let i = 0; i < this.currTratYearDInfoList.length; i++) {
					let temp = this.currTratYearDInfoList[i]
					temp['psnNo'] = this.psnNo
				}
				this.Base.submit(null, {
					url: 'yearlyPayment/insertUpdatedData',
					data: {
						jsonStr1: JSON.stringify(this.currTratYearDInfoList),
						jsonStr2: JSON.stringify(this.updateInfoInsuList)
					}
				}).then(() => {
					this.$message.success('保存成功！')
					//同时将按钮置灰
					this.ifSave = true
					this.ifPsnNo = true
					this.ifEmpNo = true
					this.ifAdd = true
					this.isPayment = true
				}).catch(() => {
					this.$message.error('保存错误！')
				})
			}

		},
		fnReset () {
			//重置页面
			this.$router.go(0)
		},
		handleSearch_Psn (val) {
			//输入个人编号会自动进行搜索
			this.psnNo = val
			this.Base.submit(null, {
				url: 'yearlyPayment/queryPsnInfo',
				data: {
					queryCondition: val
				},
			}).then((data) => {
				if (data.data.psnInfoList === null) {
					this.$message.warning('人员基本信息不完整，不能办理此业务!')
					this.psnBaseForm.resetFields()
					return false
				}
				this.psnInfoList = data.data.psnInfoList
			})
		},

		onSelect_Psn (val) {
			//选择个人编号进行的操作
			this.psnNo = val
			let flag = 0//进行校验的标识符
			for (let i = 0; i < this.psnInfoList.length; i++) {
				let temp = this.psnInfoList[i]
				if (this.psnNo === temp.psnNo || temp.survStas !== '1') {
					//检查生存状态
					flag = 1
				}
			}
			if (flag !== 0) {
				this.$message.warning('该人员生存状态不正常，不能办理此业务!')
				this.psnBaseForm.resetFields()
				return false
			}
			//数据回显
			for (let i = 0; i < this.psnInfoList.length; i++) {
				let temp = this.psnInfoList[i]
				if (this.psnNo === temp.psnNo) {
					this.psnBaseForm.setFieldsValue({
						'psnName': temp.psnName,
						'psnCertType': temp.psnCertType,
						'certno': temp.certno,
						'gend': temp.gend,
						'brdy': temp.brdy
					})
					this.ifEmpNo = false
				}
			}
		},

		handleSearch_Emp (val) {
			//输入单位编号会自动进行搜索
			this.Base.submit(null, {
				url: 'yearlyPayment/queryEmpInfo',
				data: {
					queryCondition: val
				},
			}).then((data) => {
				if (data.data.empInfoList == null) {
					this.$message.error('未获取到单位基本信息!')
				}
				this.empInfoList = data.data.empInfoList
			})
		},

		onSelect_Emp (val) {
			//选择单位编号进行的操作
			this.empNo = val
			let flag = 0
			for (let i = 0; i < this.empInfoList.length; i++) {
				let temp = this.empInfoList[i]
				if (this.empNo === temp.empNo) {
					//查询单位参保信息
					this.Base.submit(null, {
						url: 'yearlyPayment/queryPsnInsuInfoByEmpNo',
						data: {
							empNo: this.empNo,
							psnNo: this.psnNo
						},
					}).then((data) => {
						console.log('单位参保信息data:', data.data)
						this.psnInsuInfoListByEmpNo = data.data.psnInsuInfoListByEmpNo
						for (let j = 0; j < this.psnInsuInfoListByEmpNo.length; j++) {
							let temp1 = this.psnInsuInfoListByEmpNo[j]
							if (temp1.psnNo === this.psnNo) {
								console.log('查询到该人员参保信息')
								flag = 1
								break
							}
						}
						if (flag !== 1) {
							//没有该人员参保信息
							this.$message.warning('该人员未在该单位下参保，请确认！')
							this.empBaseForm.resetFields()
							return false
						} else {
							//进行赋值
							this.empBaseForm.setFieldsValue({
								'empNo': temp.empNo,
								'empName': temp.empName,
							})
							//查询历史认定信息
							this.Base.submit(null, {
								url: 'yearlyPayment/queryPsnTratYearDInfoByPsnNo',
								data: {
									psnNo: this.psnNo
								},
							}).then((data) => {
								this.psnTratYearDInfoList = data.data.psnTratYearDInfoList
								console.log('历史认定信息：', this.psnTratYearDInfoList)
							})
							//将按钮置为可用
							this.ifSave = false
							this.isPayment = false
							this.ifAdd = false
							//刷新表格数据
							this.psnTratYearDInfoList = [...this.psnTratYearDInfoList]
							this.currTratYearDInfoList = [...this.currTratYearDInfoList]
						}
					})
				}
			}
		},

		checkbegnYm (rule, value, callback) {
			//开始年月的自定义校验
			// console.log('开始value：',value)
			const begnYm = this.workInfoForm.getFieldMomentValue('begnYm')
			const endYm = this.workInfoForm.getFieldMomentValue('endYm')
			if (endYm !== undefined) {
				if (Date.parse(begnYm) >= Date.parse(endYm)) {
					this.$message.error('开始期号不能晚于结束期号，请重新录入！')
					this.workInfoForm.resetFields(['begnYm'])
					callback()
				} else {
					this.workInfoForm.setFieldsValue({
						'tratClctMons': this.reduMonths(begnYm, endYm),
					})
					callback()
				}
			} else {
				callback()
			}
		},

		checkendYm (rule, value, callback) {
			//结束年月的自定义校验
			// console.log('结束value：',value)
			const begnYm = this.workInfoForm.getFieldMomentValue('begnYm')
			const endYm = this.workInfoForm.getFieldMomentValue('endYm')
			if (begnYm !== undefined) {
				if (Date.parse(begnYm) >= Date.parse(endYm)) {
					this.$message.error('结束期号不能早于开始期号，请重新录入！')
					this.workInfoForm.resetFields(['endYm'])
					callback()
				} else {
					this.workInfoForm.setFieldsValue({
						'tratClctMons': this.reduMonths(begnYm, endYm),
					})
					callback()
				}
			} else {
				callback()
			}
		},

		reduMonths (startMonth, endMonth) {
			if (startMonth !== null && endMonth !== null) {
				let startY = startMonth.substring(0, 4),
					startM = startMonth.substring(4, 6),
					endY = endMonth.substring(0, 4),
					endM = endMonth.substring(4, 6)
				return (endY - startY) * 12 + (endM - startM)

			}
		},
		fnAdd () {
			//进行校验
			let flag = 0
			console.log('开始进行校验')
			this.workInfoForm.validateFields(errors => {
				// console.log('错误信息：', errors)
				if (errors !== null) {
					this.$message.error('补录信息录入不完整，请重新录入！')
					flag = 1
					return false
				}
			})
			let tempS1 = parseInt(this.workInfoForm.getFieldMomentValue('begnYm'))
			let tempE1 = parseInt(this.workInfoForm.getFieldMomentValue('endYm'))
			let tempInsu = this.workInfoForm.getFieldMomentValue('insutype')
			//再进行校验是否有交叉时间,前提是校验成功列表有至少一条数据
			if (this.currTratYearDInfoList.length !== 0) {
				//进行交叉时间验证
				console.log('开始进行交叉时间验证')
				for (const element of this.currTratYearDInfoList) {
					if (element.insutype === tempInsu) {
						let tempS2 = parseInt(element.begnYm)
						let tempE2 = parseInt(element.endYm)
						if ((tempS2 <= tempE1 && tempS2 >= tempS1) || (tempE2 >= tempS1 && tempE2 <= tempE1)) {
							//时间有交叉
							this.$message.warning('工作经历信息时间段存在交叉，请重新录入！')
							flag = 1
						}
					}
				}
			}

			if (this.psnTratYearDInfoList.length !== 0) {
				//进行交叉时间验证
				console.log('开始进行交叉时间验证')
				for (const element of this.psnTratYearDInfoList) {
					if (element.insutype === tempInsu) {
						let tempS2 = parseInt(element.begnYm)
						let tempE2 = parseInt(element.endYm)
						if ((tempS2 <= tempE1 && tempS2 >= tempS1) || (tempE2 >= tempS1 && tempE2 <= tempE1)) {
							//时间有交叉
							this.$message.warning('工作经历信息时间段存在交叉，请重新录入！')
							flag = 1
						}
					}
				}
			}
			if (flag !== 0) {
				console.log('校验不通过')
				return false
			}
			let temp = this.workInfoForm.getFieldsValue()
			temp.begnYm = temp.begnYm.format('YYYYMM')
			temp.endYm = temp.endYm.format('YYYYMM')
			this.currTratYearDInfoList.push(temp)
			this.$message.success('添加成功')
			console.log('temp:', temp)
			console.log('this.currTratYearDInfoList:', this.currTratYearDInfoList)
		},

		getChildData (val) {
			console.log('收到子组件的值：', val)
			console.log('当前历史认定信息：', this.psnTratYearDInfoList)
			console.log('当前更新表信息：', this.updateInfoInsuList)
			if (this.updateInfoInsuList.length === 0) {
				this.updateInfoInsuList.push(val)
			} else {
				//判断修改的是哪一行的信息，根据唯一id人员视同缴费id来决定
				for (let i = 0; i < this.psnTratYearDInfoList.length; i++) {
					let temp = this.psnTratYearDInfoList[i]
					let id = temp.psnTratClctId
					// console.log('val的id为：',val.psnTratClctId)
					let flag = 0
					if (id === val.psnTratClctId) {
						// console.log('匹配到第',(i+1),'条数据')
						//判断update表有多少条数据，决定val是新增的数据还是修改的数据
						for (let j = 0; j < this.updateInfoInsuList.length; j++) {
							if (this.updateInfoInsuList[j].psnTratClctId === id) {
								flag = 1
								//说明是修改的数据，直接进行覆盖
								this.updateInfoInsuList[j] = val
							}
						}
						if (flag === 0) {
							//并没有匹配到，说明是新增数据，执行push
							this.updateInfoInsuList.push(val)
						}
					}
				}
			}
			console.log('updateInfoInsuList:', this.updateInfoInsuList)
		},
	}
}
</script>

<style scoped type="text/less">

</style>

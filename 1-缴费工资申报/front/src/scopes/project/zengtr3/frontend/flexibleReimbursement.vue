<template>
	<div>
		<ta-border-layout layout-type="fixTop">
			<div slot="header">
				<div style="text-align: center;">
					<ta-button @click="beforeSave" :disabled="ifSubmit" type="primary">
						保存
					</ta-button>

					<ta-button @click="fnReset">
						重置
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
							<ta-auto-complete @select="onSelect_Psn" @search="handleSearch_Psn" optionLabelProp="text"
											  :dropdownMatchSelectWidth="false"
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

						<ta-form-item label="证件类型" :span="6"
									  field-decorator-id="psnCertType"
									  :disabled="true"
						>
							<ta-select collection-type="CERT_TYPE" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="身份证号" :span="6"
									  field-decorator-id="certno"
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
					<div slot="title" style="font-size: 20px;font-weight: bold">报销登记信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.submitBaseForm = form}"
					>
						<ta-form-item label="险种类型" :span="6"
									  field-decorator-id="insutype"
									  :disabled="ifSubmit"
						>
							<ta-select collection-type="INSUTYPE" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="人员类别" :span="6"
									  field-decorator-id="psnType"
									  :disabled="ifSubmit"
						>
							<ta-select collection-type="PSN_TYPE" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="医疗类别" :span="6"
									  field-decorator-id="medType"
									  :disabled="ifSubmit"
									  :require="{message:'请选择一个医疗类别'}"
						>
							<ta-select collection-type="MED_TYPE" defaultValue="11" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="就诊开始日期" :span="6"
									  field-decorator-id="begntime"
									  :label-col="{span: 7}"
									  :wrapper-col="{span: 17}"
									  :disabled="ifSubmit"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请选择就诊开始日期'},
									  {validator: checkbegntime}]}"
						>
							<ta-date-picker style="width: 90%"></ta-date-picker>
						</ta-form-item>

						<ta-form-item label="就诊结束日期" :span="6"
									  field-decorator-id="endtime"
									  :disabled="ifSubmit"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请选择就诊结束日期'},
									  {validator: checkendtime}]}"
						>
							<ta-date-picker style="width: 90%"></ta-date-picker>
						</ta-form-item>

						<ta-form-item label="医疗费总金额" :span="6"
									  field-decorator-id="sumfee"
									  :disabled="ifSubmit"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入医疗费总金额'},
									  { pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '金额格式不正确' }]}"
						>
							<ta-input-number style="width: 90%" :min="0" :step="0.01"></ta-input-number>
						</ta-form-item>

						<ta-form-item label="符合范围金额" :span="6"
									  field-decorator-id="inscpScpAmt"
									  :disabled="ifSubmit"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入符合范围金额'},
									  { pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '金额格式不正确' }]}"
						>
							<ta-input-number style="width: 90%" :min="0" :step="0.01"></ta-input-number>
						</ta-form-item>

						<ta-form-item label="本次基金支付总额" :span="6"
									  field-decorator-id="fundPaySumamt"
									  :disabled="ifSubmit"
									  :label-col="{span: 7}"
									  :wrapper-col="{span: 17}"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入本次基金支付总额'},
									  { pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '金额格式不正确' }]}"
						>
							<ta-input-number style="width: 90%;" :min="0" :step="0.01"></ta-input-number>
						</ta-form-item>

						<ta-form-item label="银行行别代码" :span="6"
									  field-decorator-id="bankTypeCode"
									  :disabled="ifSubmit"
									  :require="{message:'请选择一个银行行别代码'}"
						>
							<ta-select collection-type="BANK_TYPE_CODE" style="width: 90%"></ta-select>
						</ta-form-item>

						<ta-form-item label="银行户名" :span="6"
									  field-decorator-id="acctname"
									  :disabled="ifSubmit"
									  :require="{message:'请输入银行户名'}"
						>
							<ta-input style="width: 90%"></ta-input>
						</ta-form-item>

						<ta-form-item label="申报原因" :span="12"
									  field-decorator-id="dclaRea"
									  :disabled="ifSubmit"
									  :require="{message:'请输入申报原因'}"
									  :label-col="{span: 3}"
									  :wrapper-col="{span: 21}"
						>
							<ta-input style="width: 96%"></ta-input>
						</ta-form-item>

						<ta-form-item label="银行账号" :span="6"
									  field-decorator-id="bankacct"
									  :disabled="ifSubmit"
									  :require="{message:'请输入银行账号'}"
						>
							<ta-input style="width: 90%"></ta-input>
						</ta-form-item>

						<ta-button @click="fnAdd" :disabled="ifSubmit">添加</ta-button>


					</ta-form>
				</ta-card>

				<!--引入子组件表格-->
				<div>
					<ta-tabs defaultActiveKey="1">
						<ta-tab-pane tab="人员参保信息" key="1">
							<child1 :psnInsuInfoListChild="psnInsuInfoListChild"
									@childEvent1="getClickedRowData"
							>

							</child1>
						</ta-tab-pane>
						<ta-tab-pane tab="报销登记信息" key="2">
							<child2 :submitInfoList="submitInfoList"
									@childEvent2="realSave"
									ref="freshPage"
							>

							</child2>
						</ta-tab-pane>
					</ta-tabs>

				</div>


			</div>
		</ta-border-layout>
	</div>
</template>

<script>
export default {
	name: 'flexibleReimbursement',
	data () {
		return {
			col: {
				//用于设置表单栅格属性的分割
				xs: 1,
				sm: 2,
				md: 3,
				lg: 4,
				xl: 6,
				xxl: 12,
			},
			psnInfoList: [],//个人基本信息列表
			empInfoList: [],//单位基本信息列表
			psnNo: '',//人员编号
			psnInsuInfoList: [],//个人参保信息
			ifEmpNo: true,//单位编号按钮可用性
			empNo: '',//单位编号
			psnInsuInfoListByEmpNo: [],//根据单位编号查询到的人员参保信息
			empInsuInfoList: [],//单位参保信息
			ifSubmit: true,//报销登记区域按钮可用
			submitInfoList: [],//报销登记信息表
			psnInsuInfoListChild: [],//子组件的个人参保信息
			clickedRowData: [],//自组件中已点击的行数据
			ifPsnNo: false,//个人编号输入框可用性

		}
	},
	methods: {
		beforeSave () {
			//保存操作
			console.log('现在进行保存前的校验操作')
			console.log('报销登记表数据：', this.submitInfoList)
			if (this.submitInfoList.length === 0) {
				this.$message.warning('请先添加报销登记信息后再进行保存!')
				return false
			}

			this.$refs.freshPage.fullValidEvent()

		},
		fnReset () {
			//重置页面
			this.$router.go(0)
		},
		handleSearch_Psn (val) {
			//输入个人编号会自动进行搜索
			console.log('开始进行handleSearch')
			console.log('val:', val)
			this.psnNo = val
			this.Base.submit(null, {
				url: 'flexibleReimbursement/queryPsnInfo',
				data: {
					psnNo: this.psnNo
				},
			}).then((data) => {
				console.log('查询后的data:', data)
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
			console.log('开始onSelect')
			console.log('val:', val)
			this.psnNo = val
			let flag = 0//进行校验的标识符
			for (let i = 0; i < this.psnInfoList.length; i++) {
				let temp = this.psnInfoList[i]
				if (this.psnNo === temp.psnNo) {
					//检查生存状态
					if (temp.survStas !== '1') {
						flag = 1

					}
				}
			}
			if (flag !== 0) {
				this.$message.warning('该人员生存状态不正常，不能办理此业务!')
				this.psnBaseForm.resetFields()
				return false
			}
			//继续校验参保信息
			for (let i = 0; i < this.psnInfoList.length; i++) {
				let temp = this.psnInfoList[i]
				if (this.psnNo === temp.psnNo) {
					this.Base.submit(null, {
						url: 'flexibleReimbursement/queryPsnInsuInfoByPsnNo',
						data: {
							psnNo: this.psnNo
						},
					}).then((data) => {
						console.log('data:', data.data)
						this.psnInsuInfoList = data.data.psnInsuInfoList
						for (let j = 0; j < this.psnInsuInfoList.length; j++) {
							let temp = this.psnInsuInfoList[j]
							if (temp.psnInsuStas !== '1') {
								flag = 1
							}
						}
						if (flag !== 0) {
							this.$message.warning('该人员不存在正常参保信息，不能办理此业务!')
							this.psnBaseForm.resetFields()
							return false
						} else {
							console.log('校验通过，回显信息')
							this.psnBaseForm.setFieldsValue({
								'psnName': temp.psnName,
								'psnCertType': temp.psnCertType,
								'certno': temp.certno,
								'gend': temp.gend,
								'brdy': temp.brdy
							})
							this.ifEmpNo = false
						}
					})
				}
			}

		},

		handleSearch_Emp (val) {
			//输入单位编号会自动进行搜索
			console.log('开始进行handleSearch')
			console.log('val:', val)
			this.empNo = val
			this.Base.submit(null, {
				url: 'flexibleReimbursement/queryEmpInfo',
				data: {
					empNo: this.empNo
				},
			}).then((data) => {
				console.log('data:', data.data)
				if (data.data.empInfoList == null) {
					this.$message.error('未获取到单位基本信息!')
				}
				this.empInfoList = data.data.empInfoList
			})
		},

		onSelect_Emp (val) {
			//选择单位编号进行的操作
			console.log('开始onSelect')
			console.log('val:', val)
			this.empNo = val
			let flag = 0
			for (let i = 0; i < this.empInfoList.length; i++) {
				let temp = this.empInfoList[i]
				if (this.empNo === temp.empNo) {
					//查询单位参保信息
					this.Base.submit(null, {
						url: 'flexibleReimbursement/queryPsnInsuInfoByEmpNo',
						data: {
							empNo: this.empNo
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
							//此时flag=1
							//校验单位状态是否正常
							console.log('开始校验单位状态')
							if (temp.orgValiStas !== '1') {
								this.$message.warning('该单位单位状态不正常，请确认！')
								this.empBaseForm.resetFields()
								return false
							}
							//校验单位是否正常参保
							console.log('开始校验参保状态')
							this.Base.submit(null, {
								url: 'flexibleReimbursement/queryEmpInsuInfo',
								data: {
									empNo: this.empNo
								},
							}).then((data) => {
								console.log('单位参保信息data：', data.data)
								this.empInsuInfoList = data.data.empInsuInfoList
								for (let k = 0; k < this.empInsuInfoList.length; k++) {
									if (this.empInsuInfoList[i].empInsuStas !== '2') {
										flag = 2
									}
								}
								if (flag !== 1) {
									this.$message.warning('该单位不存在正常参保的险种，请确认！')
									this.empBaseForm.resetFields()
									return false
								} else {
									//进行赋值
									this.empBaseForm.setFieldsValue({
										'empNo': temp.empNo,
										'empName': temp.empName,
									})
									//将按钮置为可用
									this.ifSubmit = false
									//同时将医疗类型设置为默认
									this.submitBaseForm.setFieldsValue({ medType: '11' })

									//赋值子组件的人员参保信息表
									for (let z = 0; z < this.psnInsuInfoListByEmpNo.length; z++) {
										if (this.psnInsuInfoListByEmpNo[z].psnNo === this.psnNo) {
											this.psnInsuInfoListChild.push(this.psnInsuInfoListByEmpNo[z])
										}
									}
								}

							})

						}

					})
				}
			}
		},
		checkbegntime (rule, value, callback) {
			//就诊开始日期的自定义校验
			console.log('开始进行开始年月的校验')
			console.log('value：', value)
			const endtime = this.submitBaseForm.getFieldMomentValue('endtime')
			const begntime = this.submitBaseForm.getFieldMomentValue('begntime')
			console.log('end:', endtime)
			if (endtime !== undefined) {
				if (Date.parse(begntime) > Date.parse(endtime)) {
					this.$message.error('不能晚于就诊结束年月!')
					this.submitBaseForm.resetFields(['begntime'])
					callback()
				} else {
					callback()
				}
			} else {
				callback()
			}
		},

		checkendtime (rule, value, callback) {
			//就诊结束日期的自定义校验
			console.log('开始进行开始年月的校验')
			console.log('value：', value)
			const begntime = this.submitBaseForm.getFieldMomentValue('begntime')
			const endtime = this.submitBaseForm.getFieldMomentValue('endtime')
			console.log('start:', begntime)
			if (begntime !== undefined) {
				if (Date.parse(begntime) > Date.parse(endtime)) {
					this.$message.error('不能早于就诊开始年月!')
					this.submitBaseForm.resetFields(['endtime'])
					callback()
				} else {
					callback()
				}
			} else {
				callback()
			}
		},

		fnAdd () {
			//将数据添加到报销登记信息表
			console.log('开始添加数据到报销登记信息表')
			//先做校验
			let flag = 0
			this.submitBaseForm.validateFields(errors => {
				console.log('个人错误信息：', errors)
				if (errors !== null) {
					flag = 1
				}
			})
			if (flag !== 0) {
				this.$message.warning('请录入完整的报销登记信息!')
				return false
			}
			//校验时间交叉
			if (this.submitInfoList.length > 0) {
				//进行交叉时间验证
				console.log('开始进行交叉时间验证')
				for (const element of this.submitInfoList) {
					let tempS1 = parseInt(this.submitBaseForm.getFieldMomentValue('begntime').substring(0, 4)
						+ this.submitBaseForm.getFieldMomentValue('begntime').substring(5, 7)
						+ this.submitBaseForm.getFieldMomentValue('begntime').substring(8, 10))
					let tempS2 = parseInt(element.begntime.substring(0, 4) + element.begntime.substring(5, 7)
						+ element.begntime.substring(8))
					let tempE1 = parseInt(this.submitBaseForm.getFieldMomentValue('endtime').substring(0, 4)
						+ this.submitBaseForm.getFieldMomentValue('endtime').substring(5, 7)
						+ this.submitBaseForm.getFieldMomentValue('endtime').substring(8, 10))
					let tempE2 = parseInt(element.endtime.substring(0, 4) + element.endtime.substring(5, 7)
						+ element.endtime.substring(8))
					// console.log('s1:', tempS1)
					// console.log('s2:', tempS2)
					// console.log('e1:', tempE1)
					// console.log('e2:', tempE2)
					if ((tempS2 <= tempE1 && tempS2 >= tempS1) || (tempE2 >= tempS1 && tempE2 <= tempE1)) {
						//时间有交叉
						this.$message.warning('补录时间段存在交叉，请重新录入！')
						flag = 1
					}
				}
			}
			if (flag !== 0) {
				return false
			}
			let tempList = [{}]
			let psnType = this.submitBaseForm.getFieldValue('psnType')
			let insutype = this.submitBaseForm.getFieldValue('insutype')
			let medType = this.submitBaseForm.getFieldValue('medType')
			let begntime = this.submitBaseForm.getFieldMomentValue('begntime')
			let endtime = this.submitBaseForm.getFieldMomentValue('endtime')
			let sumfee = this.submitBaseForm.getFieldValue('sumfee')
			let inscpScpAmt = this.submitBaseForm.getFieldValue('inscpScpAmt')
			let fundPaySumamt = this.submitBaseForm.getFieldValue('fundPaySumamt')
			let bankTypeCode = this.submitBaseForm.getFieldValue('bankTypeCode')
			let acctname = this.submitBaseForm.getFieldValue('acctname')
			let dclaRea = this.submitBaseForm.getFieldValue('dclaRea')
			let bankacct = this.submitBaseForm.getFieldValue('bankacct')
			tempList.forEach(item => {
				Object.assign(item, { psnType: psnType })
				Object.assign(item, { insutype: insutype })
				Object.assign(item, { medType: medType })
				Object.assign(item, { begntime: begntime.substring(0, 10) })
				Object.assign(item, { endtime: endtime.substring(0, 10) })
				Object.assign(item, { sumfee: sumfee })
				Object.assign(item, { inscpScpAmt: inscpScpAmt })
				Object.assign(item, { fundPaySumamt: fundPaySumamt })
				Object.assign(item, { bankTypeCode: bankTypeCode })
				Object.assign(item, { acctname: acctname })
				Object.assign(item, { dclaRea: dclaRea })
				Object.assign(item, { bankacct: bankacct })
			})
			this.submitInfoList.push(tempList[0])
			console.log('submitInfoList:', this.submitInfoList)
			this.$message.success('添加成功！')

		},
		getClickedRowData (val) {
			this.clickedRowData = val
			// console.log('点击行数据：',this.clickedRowData)
			//回显数据
			this.submitBaseForm.setFieldsValue({
				'insutype': this.clickedRowData.insutype,
				'psnType': this.clickedRowData.psnType,
				'acctname': this.clickedRowData.psnName,
			})
		},
		realSave (val) {
			console.log('现在进行真的保存操作')
			console.log('errMap:', val)
			if (val !== undefined) {
				this.$message.warning('提交的报销登记信息中有字段为空的数据，请检查！')
				return false
			} else {
				console.log('校验完毕，开始保存')
				for (let i = 0; i < this.submitInfoList.length; i++) {
					this.submitInfoList[i]['empName'] = this.empBaseForm.getFieldValue('empName')
					this.submitInfoList[i]['psnNo'] = this.psnBaseForm.getFieldValue('psnNo')
					this.submitInfoList[i]['empNo'] = this.empBaseForm.getFieldValue('empNo')
					this.submitInfoList[i]['psnName'] = this.psnBaseForm.getFieldValue('psnName')
					this.submitInfoList[i]['psnCertType'] = this.psnBaseForm.getFieldValue('psnCertType')
					this.submitInfoList[i]['certno'] = this.psnBaseForm.getFieldValue('certno')
				}
				console.log('最终数据：', this.submitInfoList)
				this.Base.submit(null, {
					url: 'flexibleReimbursement/insertSubmitList',
					data: {
						jsonStr: JSON.stringify(this.submitInfoList)
					},
				}).then((data) => {
					this.$message.success('保存成功！')
					//将整个页面置灰
					this.ifPsnNo = true
					this.ifEmpNo = true
					this.ifSubmit = true

				}).catch(() => {
					this.$message.error('保存失败!')
				})
			}
		}

	}
}
</script>

<style scoped>

</style>

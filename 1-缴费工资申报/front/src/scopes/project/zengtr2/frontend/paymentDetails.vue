<template>
	<div>
		<ta-border-layout layout-type="fixTop">
			<div slot="header">
				<div style="text-align: center;">
					<ta-button :disabled="ifSave" type="primary" @click="fnSave">
						保存[S]
					</ta-button>

					<ta-button @click="fnReset" >
						重置[R]
					</ta-button>
				</div>
			</div>

			<!--主体内容-->
			<div>
				<ta-card :bordered="false" >
					<div slot="title" style="font-size: 20px;font-weight: bold">个人基本信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.psnBaseForm = form}"
					>
						<ta-form-item label="个人编号" :span="6"
									  fieldDecoratorId="psnNo"
									  :disabled="ifPsnNo"
									  :require="{message:'请输入个人编号'}">
<!--							<ta-suggest-->
<!--								:data-source="psnInfoList"-->
<!--								dropdownTrigger="enterKeyup"-->
<!--								:table-title-map="titleMap_Psn"-->
<!--								:option-config="optionConfig_Psn"-->
<!--								@select="onSelect_Psn"-->
<!--								@search="handleSearch_Psn"-->
<!--							/>-->
							<ta-auto-complete @select="onSelect_Psn" @search="handleSearch_Psn" optionLabelProp="text"
											  :dropdownMatchSelectWidth="false" placeholder="请输入个人编号或名称">
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
										<ta-select-option v-for="item in psnInfoList" :key="item.psnNo" :text="item.psnNo">
											<div style="float: left;  width: 130px">
												{{item.psnNo}}
											</div>
											<div style="float: left;  width: 100px">
												{{item.psnName}}
											</div>
											<div style="float: left;  width: 170px">
												{{item.certno}}
											</div>
										</ta-select-option>
									</ta-select-opt-group>
								</template>
							</ta-auto-complete>
						</ta-form-item>

						<ta-form-item label="姓名" :span="6"
									  fieldDecoratorId="psnName"
									  :disabled="true">
							<ta-input/>
						</ta-form-item>

						<ta-form-item label="性别" :span="6"
									  field-decorator-id="gend"
									  :disabled="true">
							<ta-select collection-type="GEND"></ta-select>
						</ta-form-item>

						<ta-form-item label="身份证号" :span="6"
									  field-decorator-id="certno"
									  :disabled="true">
							<ta-input></ta-input>
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
									  :disabled="ifNo"
									  :require="{message:'请输入单位编号'}">
<!--							<ta-suggest-->
<!--								:data-source="empInfoList"-->
<!--								dropdownTrigger="enterKeyup"-->
<!--								:table-title-map="titleMap_Emp"-->
<!--								:option-config="optionConfig_Emp"-->
<!--								@select="onSelect_Emp"-->
<!--								@search="handleSearch_Emp"-->
<!--							/>-->
							<ta-auto-complete @select="onSelect_Emp" @search="handleSearch_Emp" optionLabelProp="text"
											  :dropdownMatchSelectWidth="false" placeholder="请输入单位编号或名称">
								<template slot="dataSource">
									<ta-select-opt-group v-if="this.empInfoList.length > 0">
										<div slot="label" style="float: left;  width: 130px;margin-left: 10px">
											单位编号
										</div>
										<div slot="label" style="float: left;  width: 170px">
											单位名称
										</div>
										<ta-select-option v-for="item in empInfoList" :key="item.empNo" :text="item.empNo">
											<div style="float: left;  width: 130px">
												{{item.empNo}}
											</div>
											<div style="float: left;  width: 170px">
												{{item.empName}}
											</div>
										</ta-select-option>
									</ta-select-opt-group>
								</template>
							</ta-auto-complete>
						</ta-form-item>

						<ta-form-item label="单位名称" :span="6"
									  :disabled="true"
									  field-decorator-id="empName"
									  >
							<ta-input></ta-input>
						</ta-form-item>
					</ta-form>
				</ta-card>

				<ta-card :bordered="false">
					<div slot="title" style="font-size: 20px;font-weight: bold">缴费补录信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.paymentBaseForm = form}"
					>
						<ta-form-item label="开始年月" :span="6"
									  field-decorator-id="startYM"
									  :disabled="isPayment"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkStartYM}]}"
						>
							<ta-month-picker style="width: 100%"></ta-month-picker>
						</ta-form-item>

						<ta-form-item label="结束年月" :span="6"
									  field-decorator-id="endYM"
									  :disabled="isPayment"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkEndYM}]}"
						>
							<ta-month-picker style="width: 100%"></ta-month-picker>
						</ta-form-item>

						<ta-form-item label="缴费基数总额" :span="6"
									  :disabled="isPayment"
									  fieldDecoratorId="baseSum"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入缴费基数总额'},
											 { pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '基数格式不正确' }, {validator: checkPaymentBase}]}">
							<ta-input style="text-align: right"></ta-input>
						</ta-form-item>

						<ta-form-item label="应缴类型" :span="6"
									  :disabled="true"
									  fieldDecoratorId="clctType"
									  >
							<ta-select collection-type="CLCT_TYPE" ></ta-select>
						</ta-form-item>
					</ta-form>
				</ta-card>


				<div style="text-align: center;">
					<ta-button @click="fnAdd" :disabled="ifAdd">添加</ta-button>
				</div>

				<!--引入子组件表格-->
				<div>
<!--					<child ref="freshPage"-->
<!--						   :validatedList="validatedList"-->
<!--						   :psnInsuInfoListByEmpNo="psnInsuInfoListByEmpNo"-->
<!--						   :recordingDetails="recordingDetails"-->
<!--					></child>-->
					<ta-tabs defaultActiveKey="1">
						<ta-tab-pane tab="人员参保信息" key="1">
							<child1 :psnInsuInfoListByEmpNo="psnInsuInfoListByEmpNo"
									@childEvent="getCheckedData"
									>

							</child1>
						</ta-tab-pane>

						<ta-tab-pane tab="校验成功信息" key="2">
							<child2 :validatedList="validatedList">

							</child2>
						</ta-tab-pane>

						<ta-tab-pane tab="本次补录明细" key="3">
							<child3 :recordingDetails="recordingDetails">

							</child3>
						</ta-tab-pane>
					</ta-tabs>
				</div>


			</div>
		</ta-border-layout>
	</div>
</template>

<script>
export default {
	name: 'paymentDetails',
	data(){
		return{
			ifSave:true,//保存按钮能否用
			ifPsnNo:false,//个人编号按钮可用性
			col: {
				//用于设置表单栅格属性的分割
				xs: 1,
				sm: 2,
				md: 3,
				lg: 4,
				xl: 6,
				xxl: 12,
			},
			empInfoList:[],//单位基本信息
			// titleMap_Psn: null, //单位编号下拉框列表头
			// titleMap_Emp:null,
			// optionConfig_Psn: { //suggest显示框配置
			// 	value:'psnNo',  // option的value配置
			// 	label: 'psnNo'  //回显给框里的信息
			// },
			// optionConfig_Emp:{
			// 	value:'empNo',
			// 	label:'empNo'
			// },
			psnNo:'',//个人编号
			psnInfoList:[],//个人信息
			psnInsuInfoList:[],//个人参保信息
			empNo:'',//单位编号
			psnInsuInfoListByEmpNo:[],//根据单位编号查询到的人员参保信息
			isPayment:true,//缴费补录区域的组件可用性
			checkedInfoInsuList:[],//勾选的人员参保信息数据
			validatedList:[],//校验成功的列表
			empInsuDList:[],//单位信息
			clctInfoList:[],//缴费记录信息表
			recordingDetails:[],//缴费明细补录表
			ifNo:true,//决定个人编号和单位编号的输入框
			ifAdd:false,//添加按钮是否开启
			insutypeCH:'',//参保险种的文字描述
		}
	},
	methods:{
		fnSave(){
			//保存
			console.log('现在开始进行保存操作')
			//校验单位信息、人员信息的完整性
			let flag=0
			this.psnBaseForm.validateFields(errors => {
				console.log('个人错误信息：', errors)
				if (errors !== null) {
					flag=1
				}
			})
			this.empBaseForm.validateFields(errors => {
				console.log('单位错误信息:',errors)
				if (errors !== null) {
					flag=1
				}
			})
			if(flag!==0){
				this.$message.error('信息录入不完整，请补全！')
				return false
			}

			//基本息完整,校验 校验成功列表是否有数据
			console.log('验证成功列表:',this.validatedList)
			if(this.validatedList.length===0){
				this.$message.error('没有需要保存的数据，请检查！')
				return false
			}

			//验证成功
			//校验存不存在缴费记录
			this.Base.submit(null,{
				url:'paymentDetails/queryClctInfoList',
				data:{
					empNo:this.empNo
				},
			}).then((data)=>{
				// console.log('data:',data.data.clctInfoList)
				this.clctInfoList=data.data.clctInfoList
				console.log('clctInfoList:',this.clctInfoList)
				console.log('开始验证是否存在缴费记录')
				let tempinsutype
				for(let i=0;i<this.validatedList.length;i++){
					let temp1=this.validatedList[i]
					for(let j=0;j<this.clctInfoList.length;j++){
						let temp2=this.clctInfoList[j]
						if(temp2.accrym!==null&& temp1.insutype===temp2.insutype){
							if(temp2.clctFlag===1||(parseInt(temp2.accrym)<parseInt(temp1.endYM)&&parseInt(temp2.accrym)>parseInt(temp1.startYM))){
								//存在记录
								flag=1
								this.Base.asyncGetCodeData('INSUTYPE').then((codeList) => {
									for (const element of codeList) {
										if (element.value === temp2.insutype) {
											tempinsutype = element.label
											return
										}
									}
								})
								setTimeout(()=>{
									this.$message.error(tempinsutype+'险种'+temp2.accrym+'年月已存在缴费记录，不能补录！')
									console.log(tempinsutype+'险种'+temp2.accrym+'年月已存在缴费记录，不能补录！')
								},100)
							}
						}else{
							console.log('未存在缴费记录')
						}
					}
				}
				if(flag!==0){
					return false
				}

				//得到缴费基数
				let clctBase//每月缴费基数
				for(let i=0;i<this.validatedList.length;i++){
					let temp=this.validatedList[i]
					let year=(parseInt((temp.endYM).substring(0,4))-parseInt((temp.startYM).substring(0,4)))*12
					let month=parseInt((temp.endYM).substring(4))-parseInt((temp.startYM).substring(4))
					clctBase=temp.baseSum/(year+month+1)
					console.log('第',(i+1),'个数据的每月缴费基数：',clctBase)
					temp['clctBase']=clctBase
					temp['psnNo']=this.psnNo
				}

				//由于没有表，缴费比例pay_scal，所以这一步暂时省略

				console.log('此时将要写入数据的表：',this.validatedList)
				//写入
				this.Base.submit(null,{
					url:'paymentDetails/insertRecordingData',
					data:{
						jsonStr: JSON.stringify(this.validatedList)
					},
				}).then((data)=>{
					this.$message.success('人员'+this.psnNo+'缴费明细补录成功！')
					console.log('得到的明细数据：',data.data)
					//成功之后查询数据到补录明细表中
					this.recordingDetails=data.data.recordingDetails
					//并置灰输入框和按钮，除了重置
					this.ifNo=true
					this.ifPsnNo=true
					this.isPayment=true
					this.ifSave=true
					this.ifAdd=true
				}).catch(()=>{
					this.$message.error('保存失败!');
				})

			})



		},
		fnReset(){
			//重置页面
			this.$router.go(0)
		},
		handleSearch_Psn(val) {
			//输入个人编号会自动进行搜索
			console.log('开始进行handleSearch')
			console.log('val:',val)
			this.psnNo=val
			this.Base.submit(null,{
				url:'paymentDetails/queryPsnInfo',
				data:{
					psnNo:this.psnNo
				},
			}).then((data)=>{
				console.log('查询后的data:',data)
				if(data.data.psnInfoList===null){
					this.$message.error('没有获取到人员信息，重新录入!');
				}
				this.psnInfoList=data.data.psnInfoList
			})
		},
		onSelect_Psn(val){
			//选择个人编号进行的操作
			console.log('开始onSelect')
			console.log('val:',val)
			this.psnNo=val
			//进行信息回显
			let temp=this.psnInfoList
			for(let i=0;i<temp.length;i++){
				if(val===temp[i].psnNo){
					//检查是否有正常参保记录
					this.Base.submit(null,{
						url:'paymentDetails/queryPsnInsuInfoByPsnNo',
						data:{
							psnNo:this.psnNo
						},
					}).then((data)=>{
						console.log('根据psnNo查询的参保数据：',data.data.psnInsuInfoList)
						let flag=0
						this.psnInsuInfoList=data.data.psnInsuInfoList
						for(let j=0;j<this.psnInsuInfoList.length;j++){
							if(this.psnInsuInfoList[j].psnInsuStas!=='1'){
								flag=1
							}
						}
						if(flag===0){
							//正常参保,回显数据
							this.psnBaseForm.setFieldsValue({
								'psnNo':temp[i].psnNo,
								'psnName':temp[i].psnName,
								'certno':temp[i].certno,
								'gend':temp[i].gend
							})
							this.ifNo=false

						}else{
							this.$message.error('人员不存在正常参保的险种信息，请重新录入！')
							this.psnBaseForm.resetFields()
						}
					})
				}
			}
		},
		handleSearch_Emp(val) {
			//输入单位编号会自动进行搜索
			console.log('开始进行handleSearch')
			console.log('val:', val)
			this.empNo=val
			this.Base.submit(null,{
				url:'paymentDetails/queryEmpInfo',
				data:{
					empNo:this.empNo
				},
			}).then((data)=>{
				console.log('查询后的data:',data)
				if ( data.data.empInfoList == null) {
					this.$message.error('未获取到单位基本信息!');
				}
				this.empInfoList = data.data.empInfoList
			})
		},
		onSelect_Emp(val){
			//选择单位编号进行的操作
			console.log('开始onSelect')
			console.log('val:',val)
			this.empNo=val
			let temp=this.empInfoList
			for(const element of temp) {
				if (element.empNo === this.empNo) {
					//数据回显
					this.empBaseForm.setFieldsValue({
						'empNo': element.empNo,
						'empName': element.empName,
					})
				}
			}

			//查询单位基本信息和单位人员参保信息
			this.Base.submit(null,{
				url:'paymentDetails/queryPsnInsuInfoByEmpNo',
				data:{
					empNo:this.empNo
				},
			}).then((data)=>{
				console.log('查询到的人员参保信息：',data.data.psnInsuInfoListByEmpNo)
				let tempInsuList=data.data.psnInsuInfoListByEmpNo
				for(let j=0;j<tempInsuList.length;j++){
					if (tempInsuList[j].psnNo===this.psnNo){
						this.psnInsuInfoListByEmpNo.push(tempInsuList[j])
					}
				}
				if(this.psnInsuInfoListByEmpNo.length!==0){
					this.isPayment=false
				}else{
					this.$message.error('没有查询到该人员在该单位下的参保信息，请核实！')
				}

			})

		},
		checkStartYM(rule,value,callback){
			//开始年月的自定义校验
			console.log('开始进行开始年月的校验')
			console.log('value：',value)
			const startYM=this.paymentBaseForm.getFieldMomentValue("startYM")
			const endYM=this.paymentBaseForm.getFieldMomentValue("endYM")

			if(endYM!==undefined){
				if(Date.parse(startYM)>=Date.parse(endYM)){
					this.$message.error('开始期号不能晚于结束期号，请重新录入！')
					this.paymentBaseForm.resetFields(['startYM'])
					callback()
				}else{
					callback()
				}
			}else{
				console.log('结束年月为空')
				callback()
			}
		},
		checkEndYM(rule,value,callback){
			//结束年月的自定义校验
			console.log('开始进行结束年月的校验')
			console.log('value：',value)
			const startYM=this.paymentBaseForm.getFieldMomentValue("startYM")
			const endYM=this.paymentBaseForm.getFieldMomentValue("endYM")
			if(startYM!==undefined){
				if(Date.parse(startYM)>=Date.parse(endYM)){
					this.$message.error('结束期号不能早于开始期号，请重新录入！')
					this.paymentBaseForm.resetFields(['endYM'])
					callback()
				}else{
					callback()
				}
			}else{
				console.log('开始年月为空')
				callback()
			}
		},
		checkPaymentBase(rule,value,callback){
			//缴费基数总额的校验
			console.log('现在开始进行缴费基数总额的校验')
			if(value<0||value>99999999.9999){
				callback('缴费基数总额有误，请重新输入')
			}else{
				callback()
			}
		},
		fnAdd(){
			//添加要补录的信息
			console.log('开始添加操作')
			console.log('this.checkedInfoInsuList:',this.checkedInfoInsuList)
			if(this.checkedInfoInsuList.length===0){
				this.$message.warn('请选择需要补录的险种！')
				return false
			}else if(this.checkedInfoInsuList.length>1){
				this.$message.warning('只能一次补录一条数据！')
				return false
			} else{
				//进行校验
				let flag=0
				console.log('开始进行校验')
				this.paymentBaseForm.validateFields(errors => {
					// console.log('错误信息：', errors)
					if (errors !== null) {
						this.$message.warning('补录信息录入不完整，请重新录入！')
						flag=1
						return false
					}
				})

				if(flag!==0){
					console.log('校验不通过')
					return
				}

				//再校验开始日期和首次参保年月
				if(this.checkedInfoInsuList[0].fstInsuYm!==null){
					console.log('校验日期')
					let startYM=this.paymentBaseForm.getFieldMomentValue("startYM").substring(0,4)+this.paymentBaseForm.getFieldMomentValue("startYM").substring(5,7)

					if(startYM<this.checkedInfoInsuList[0].fstInsuYm){
						// console.log('startYM:',startYM)
						// console.log('fstInsuYm:',this.checkedInfoInsuList[0].fstInsuYm)
						this.$message.warning('开始年月早于险种'+this.insutypeCH+'首次参保年月，请检查！')
						this.insutypeCH=''
						flag=1
					}
					console.log('日期校验完成')
				}

				if(flag!==0){
					console.log('校验不通过')
					return
				}

				//再进行校验是否有交叉时间,前提是校验成功列表有至少一条数据
				if(this.validatedList.length!==0){
					//进行交叉时间验证
					console.log('开始进行交叉时间验证')
					for(const element of this.validatedList) {
						let tempS1 = parseInt(this.paymentBaseForm.getFieldMomentValue('startYM').substring(0, 4) + this.paymentBaseForm.getFieldMomentValue('startYM').substring(5, 7))
						let tempS2 = parseInt(element.startYM)
						let tempE1 = parseInt(this.paymentBaseForm.getFieldMomentValue('endYM').substring(0, 4) + this.paymentBaseForm.getFieldMomentValue('endYM').substring(5, 7))
						let tempE2 = parseInt(element.endYM)
						if((tempS2<=tempE1&&tempS2>=tempS1)||(tempE2>=tempS1&&tempE2<=tempE1)){
							//时间有交叉
							this.$message.warning('补录时间段存在交叉，请重新录入！')
							flag=1
						}
					}
				}
				if(flag!==0){
					console.log('校验不通过')
					return
				}

				//存入新数据
				let tempList=this.checkedInfoInsuList[0]
				// let start = performance.now();
				//查询单位征缴规则
				this.Base.submit(null,{
					url:'paymentDetails/queryClctRuleTypeCodg',
					data:{
						empNo:this.empNo
					},
				}).then((data)=>{
					this.empInsuDList=data.data.empInsuDList
					console.log('empInsuDList:',this.empInsuDList)
				})
				// let end = performance.now();
				// console.log('cost is', `${end - start}ms`)

				setTimeout(()=>{
					//赋值给验证成功信息列表
					console.log('即将执行赋值,当前validatedList:',this.validatedList)
					let tempList1=[{}]
					tempList1.forEach(item =>{
						Object.assign( item , {empNo:tempList.empNo})
						Object.assign( item , {insutype:tempList.insutype})
						Object.assign( item , {clctRuleTypeCodg:this.empInsuDList[0].clctRuleTypeCodg})
						Object.assign( item , {startYM:this.paymentBaseForm.getFieldMomentValue("startYM").substring(0,4)+this.paymentBaseForm.getFieldMomentValue("startYM").substring(5,7)})
						Object.assign( item , {endYM:this.paymentBaseForm.getFieldMomentValue("endYM").substring(0,4)+this.paymentBaseForm.getFieldMomentValue("endYM").substring(5,7)})
						Object.assign( item , {clctType:'36'})
						Object.assign( item , {baseSum:this.paymentBaseForm.getFieldValue("baseSum")})
					})
					this.validatedList.push(tempList1[0])
					this.$message.success('添加成功！')
					console.log('this.validatedList:',this.validatedList)
					this.ifSave=false
				},100)

				//校验通过
				console.log('校验通过')

			}
		},
		getCheckedData(val1,val2){
			//获取子组件选中的行
			this.checkedInfoInsuList=val1
			this.insutypeCH=val2
			// console.log('父组件checkedInfoInsuList：',this.checkedInfoInsuList)
			// console.log('父组件insutypeCH：',this.insutypeCH)

		}


	},
	created () {
		// this.titleMap_Emp = new Map()
		// this.titleMap_Emp.set('empNo', '单位编号')
		// this.titleMap_Emp.set('empName', '单位名称')
		//
		// this.titleMap_Psn=new Map()
		// this.titleMap_Psn.set('psnNo','个人编号')
		// this.titleMap_Psn.set('psnName','姓名')
		// this.titleMap_Psn.set('certno','身份证号')
	},
	mounted () {
		this.paymentBaseForm.setFieldsValue({ clctType: '99' })
	}
}
</script>

<style scoped>

</style>

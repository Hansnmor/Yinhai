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
									  :require="{message:'请输入个人编号'}">
							<ta-suggest
								:data-source="psnInfoList"
								dropdownTrigger="enterKeyup"
								:table-title-map="titleMap_Psn"
								:option-config="optionConfig_Psn"
								@select="onSelect_Psn"
								@search="handleSearch_Psn"
							/>
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

				<ta-card>
					<div slot="title" style="font-size: 20px;font-weight: bold">单位基本信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.empBaseForm = form}"
					>
						<ta-form-item label="单位编号"
									  field-decorator-id="empNo"
									  :span="6"
									  :disabled="false"
									  :require="{message:'请输入单位编号'}">
							<ta-suggest
								:data-source="empInfoList"
								dropdownTrigger="enterKeyup"
								:table-title-map="titleMap_Emp"
								:option-config="optionConfig_Emp"
								@select="onSelect_Emp"
								@search="handleSearch_Emp"
							/>
						</ta-form-item>

						<ta-form-item label="单位名称" :span="6"
									  :disabled="true"
									  field-decorator-id="empName"
									  >
							<ta-input></ta-input>
						</ta-form-item>
					</ta-form>
				</ta-card>

				<ta-card>
					<div slot="title" style="font-size: 20px;font-weight: bold">缴费补录信息</div>
					<ta-form :form-layout="true"
							 :col="col"
							 :auto-form-create="(form)=>{this.paymentBaseForm = form}"
					>
						<ta-form-item label="开始年月" :span="6"
									  field-decorator-id="startYM"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkStartMY}]}"
						>
							<ta-month-picker style="width: 100%"></ta-month-picker>
						</ta-form-item>

						<ta-form-item label="结束年月" :span="6"
									  field-decorator-id="endYM"
									  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkEndMY}]}"
						>
							<ta-month-picker style="width: 100%"></ta-month-picker>
						</ta-form-item>

						<ta-form-item label="缴费基数总额" :span="6"
									  fieldDecoratorId="payBase" >
							<ta-input/>
						</ta-form-item>

						<ta-form-item label="应缴类型" :span="6"
									  fieldDecoratorId="payLog" >
							<ta-select></ta-select>
						</ta-form-item>
					</ta-form>
				</ta-card>

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
			titleMap_Psn: null, //单位编号下拉框列表头
			titleMap_Emp:null,
			optionConfig_Psn: { //suggest显示框配置
				value:'psnNo',  // option的value配置
				label: 'psnNo'  //回显给框里的信息
			},
			optionConfig_Emp:{
				value:'empNo',
				label:'empNo'
			},
			psnNo:'',//个人编号
			psnInfoList:[],//个人信息
			psnInsuInfoList:[],//个人参保信息
			empNo:'',//单位编号

		}
	},
	methods:{
		fnSave(){
			//保存
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
								'psnName':temp[i].psnName,
								'certno':temp[i].certno,
								'gend':temp[i].gend
							})

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
			for(let i=0;i<temp.length;i++){
				if(temp[i].empNo===this.empNo){
					//数据回显
					this.empBaseForm.setFieldsValue({
						'empName':temp[i].empName,
					})
				}
			}
		},
		checkStartMY(rule,value,callback){
			//开始年月的自定义校验
		},
		checkEndMY(rule,value,callback){
			//结束年月的自定义校验
		},


	},
	created () {
		this.titleMap_Emp = new Map()
		this.titleMap_Emp.set('empNo', '单位编号')
		this.titleMap_Emp.set('empName', '单位名称')

		this.titleMap_Psn=new Map()
		this.titleMap_Psn.set('psnNo','个人编号')
		this.titleMap_Psn.set('psnName','姓名')
		this.titleMap_Psn.set('certno','身份证号')
	},
}
</script>

<style scoped>

</style>

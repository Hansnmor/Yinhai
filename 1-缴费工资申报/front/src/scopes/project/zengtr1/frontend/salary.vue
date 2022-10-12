<template>
	<div>
		<ta-border-layout layout-type="fixtop" class="noborder">
			<div slot="header">
				<div style="text-align: center">
					<ta-button type="primary" @click="fnSave" :disabled="ifSave" >保存</ta-button>
					<ta-button @click="reSet">重置</ta-button>
				</div>
			</div>

			<div>
				<ta-tabs defaultActiveKey="1">
					<ta-tab-pane tab="手工申报" key="1">
						<ta-radio-group @change="onChange" v-model="value">
							<ta-radio :value="1">按人员申报</ta-radio>
							<ta-radio :value="2">按单位申报</ta-radio>
						</ta-radio-group>

						<!--单位基本信息-->
						<ta-card  :bordered="false" >
							<div slot="title" style="font-size: 20px;font-weight: bold">单位基本信息</div>
							<ta-form :form-layout="true"
									 :col="col"
									 :auto-form-create="(form)=>{this.empBaseForm = form}">
								<ta-form-item label="单位编号"
											  field-decorator-id="empNo"
											  :span="6"
											  :disabled="false"
											  :require="{message:'请输入单位编号'}">
<!--									<ta-suggest-->
<!--										:data-source="empInfoList"-->
<!--										dropdownTrigger="enterKeyup"-->
<!--										:table-title-map="titleMap"-->
<!--										:option-config="optionConfig"-->
<!--										@select="onSelect"-->
<!--										@search="handleSearch"-->
<!--									/>-->
									<ta-auto-complete @select="onSelect" @search="handleSearch" optionLabelProp="text"
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

								<ta-form-item label="单位名称" :span="12"
											  :disabled="true"
											  field-decorator-id="empName"
											  :label-col="{span: 3}"
											  :wrapper-col="{span: 21}">
									<ta-input></ta-input>
								</ta-form-item>
							</ta-form>
						</ta-card>

						<!--人员基本信息-->
						<ta-card :bordered="false" v-show="this.value===1">
							<div slot="title" style="font-size: 20px;font-weight: bold">人员基本信息</div>
							<ta-form :form-layout="true"
									 :col="col"
									 :auto-form-create="(form)=>{this.psnBaseForm = form}">
								<ta-form-item label="个人编号" :span="6"
											  field-decorator-id="psnNo"
											  :disabled="psnStatus"
											  :require="{message:'请输入人员编号'}">
<!--									<ta-suggest-->
<!--										:data-source="psnInfoList"-->
<!--										dropdownTrigger="enterKeyup"-->
<!--										:table-title-map="titleMap_Psn"-->
<!--										:option-config="optionConf_Psn"-->
<!--										@select="onSelect_Psn"-->
<!--										@search="handleSearch_Psn"-->
<!--									/>-->
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


								<ta-form-item label="证件号码" :span="6"
											  field-decorator-id="certno"
											  :disabled="true"
								>
									<ta-input></ta-input>
								</ta-form-item>

								<ta-form-item label="姓名" :span="6"
											  field-decorator-id="psnName"
											  :disabled="true"
								>
									<ta-input></ta-input>
								</ta-form-item>

								<ta-form-item label="性别" :span="6"
											  field-decorator-id="gend"
											  :disabled="true"
											 >
									<ta-select collection-type="GEND"></ta-select>
								</ta-form-item>

								<ta-form-item label="民族" :span="6"
											  field-decorator-id="naty"
											  :disabled="true"
								>
									<ta-select collection-type="NATY"></ta-select>
								</ta-form-item>
							</ta-form>
						</ta-card>

						<!--工资申报信息-->
						<ta-card :bordered="false">
							<div slot="title" style="font-size: 20px;font-weight: bold">工资申报信息</div>
							<ta-form :form-layout="true"
									 :col="col"
									 :auto-form-create="(form)=>{this.salaryBaseForm = form}">
								<ta-form-item label="开始年月" :span="6"
											  field-decorator-id="startYM"
											  :disabled="salaryDec"
											  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkStartYM}]}"
								>
									<ta-month-picker style="width: 100%"></ta-month-picker>
								</ta-form-item>

								<ta-form-item label="结束年月" :span="6"
											  field-decorator-id="endYM"
											  :disabled="salaryDec"
											  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入开始年月'},
											  {validator: checkEndYM}]}"
								>
									<ta-month-picker style="width: 100%"></ta-month-picker>
								</ta-form-item>

								<ta-form-item label="申报工资" :span="6"
											  field-decorator-id="wag"
											  :disabled="salaryDec"
											  :fieldDecoratorOptions="{rules: [{required:true,message:'请输入申报的工资'},
											 { pattern: /^[0-9]+([.][0-9]{1,2})?$/ , message: '工资格式不正确' }, {validator: checkSalary}]}">
									<ta-input-number style="width: 100%" :min="0" :max="999999999999.9999" :step="0.01"></ta-input-number>
								</ta-form-item>

								<ta-form-item :span="6" >
									<ta-button type="primary" style="margin-left: 20px" @click="fnDeclaration">申报</ta-button>
								</ta-form-item>
							</ta-form>
						</ta-card>

						<!--人员参保信息表和工资基数信息表-->
<!--						<div @click="fatherMethod">-->
<!--							<psn-insu-info-table :psnInsuInfoList=this.psnInsuInfoList-->
<!--												 ref="freshPage"-->
<!--												 :salaryBaseInfoList=this.salaryBaseInfoList-->
<!--												 @childEvent="freshData"-->
<!--							></psn-insu-info-table>-->
<!--						</div>-->
						<div @click="fatherMethod">
							<ta-tabs defaultActiveKey="1">
								<ta-tab-pane tab="人员参保信息" key="1">
									<child1 :psnInsuInfoList=this.psnInsuInfoList
											ref="freshPage"
											@childEvent="freshData">
									</child1>
								</ta-tab-pane>

								<ta-tab-pane tab="工资基数信息" key="2">
									<child2 :salaryBaseInfoList=this.salaryBaseInfoList>
									</child2>
								</ta-tab-pane>
							</ta-tabs>
						</div>


					</ta-tab-pane>

					<ta-tab-pane tab="导盘申报" key="2">
						<!--单位基本信息-->
						<ta-card  :bordered="false" >
							<div slot="title" style="font-size: 20px;font-weight: bold">单位基本信息</div>
							<ta-form :form-layout="true"
									 :col="col"
									 :auto-form-create="(form)=>{this.empBaseForm = form}">
								<ta-form-item label="单位编号"
											  field-decorator-id="empNo"
											  :span="6"
											  :disabled="false"
											  :require="{message:'请输入单位编号'}">
<!--									<ta-suggest-->
<!--										:data-source="empInfoList"-->
<!--										dropdownTrigger="enterKeyup"-->
<!--										:table-title-map="titleMap"-->
<!--										:option-config="optionConfig"-->
<!--										@select="onSelect"-->
<!--										@search="handleSearch"-->
<!--									/>-->
									<ta-auto-complete @select="onSelect" @search="handleSearch" optionLabelProp="text"
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

								<ta-form-item label="单位名称" :span="12"
											  :disabled="true"
											  field-decorator-id="empName"
											  :label-col="{span: 3}"
											  :wrapper-col="{span: 21}">
									<ta-input></ta-input>
								</ta-form-item>
							</ta-form>
						</ta-card>

						<div style="text-align: center">
							<ta-button @click="fnExport" icon="export" :disabled="isExport"> 导出</ta-button>

							<ta-button  @click="downTemplate"  >模板下载</ta-button>

							<ta-button @click="fnImport" icon="import" style="margin-left: 30px">批量导入</ta-button>

							<ta-upload
								name="bannerFile"
								:before-upload="beforeUpload"
								:remove="handleRemove"
								style="margin-left: 30px"
							>
								<ta-button type="primary" icon="upload">
									选择文件
								</ta-button>
							</ta-upload>
						</div>

						<ta-modal  title="导出选项"
								   :visible="chooseExport"
								   @ok="exportSuccess"
								   :confirmLoading="confirmLoading"
								   @cancel="exportError"
								   okText="成功信息"
								   cancelText="失败信息">
							请选择导出成功信息还是失败信息
						</ta-modal>


						<div slot="title" style="font-size: 20px;font-weight: bold">导盘信息</div>
						<ta-tabs defaultActiveKey="1">
							<ta-tab-pane tab="导入成功信息" key="1">
								<ta-table :columns="tableColumns1" :dataSource="tableDataSuccess"
										  ref="table1" :haveSn="true"
								>
								</ta-table>
<!--								<ta-big-table-->
<!--									border-->
<!--									auto-resize-->
<!--									:data="tableDataSuccess">-->
<!--									<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnNo" title="人员编号"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnName" title="姓名"></ta-big-table-column>-->
<!--									<ta-big-table-column field="certno" title="证件号码"></ta-big-table-column>-->
<!--									<ta-big-table-column field="gend" title="性别" collection-type="GEND"></ta-big-table-column>-->
<!--									<ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnInsuStas" title="参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>-->
<!--									<ta-big-table-column field="startYM" title="开始年月"></ta-big-table-column>-->
<!--									<ta-big-table-column field="endYM" title="结束年月"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnClctstd" title="基数"></ta-big-table-column>-->
<!--									<ta-big-table-column field="wag" title="工资"></ta-big-table-column>-->
<!--								</ta-big-table>-->
							</ta-tab-pane>

							<ta-tab-pane tab="导入失败信息" key="2" forceRender>
								<ta-table :columns="tableColumns2" :dataSource="tableDataError"
										  ref="table2" :haveSn="true"
								>
								</ta-table>
<!--								<ta-big-table-->
<!--									border-->
<!--									auto-resize-->
<!--									:data="tableDataError">-->
<!--									<ta-big-table-column type="seq"  width="60"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnNo" title="人员编号"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnName" title="姓名"></ta-big-table-column>-->
<!--									<ta-big-table-column field="certno" title="证件号码"></ta-big-table-column>-->
<!--									<ta-big-table-column field="gend" title="性别" collection-type="GEND"></ta-big-table-column>-->
<!--									<ta-big-table-column field="insutype" title="参保险种" collection-type="INSUTYPE"></ta-big-table-column>-->
<!--									<ta-big-table-column field="psnInsuStas" title="参保状态" collection-type="PSN_INSU_STAS"></ta-big-table-column>-->
<!--									<ta-big-table-column field="rowTips" title="失败原因"></ta-big-table-column>-->

<!--								</ta-big-table>-->
							</ta-tab-pane>
						</ta-tabs>
					</ta-tab-pane>
				</ta-tabs>
			</div>

		</ta-border-layout>
	</div>
</template>

<script>
const tableColumns1=[
	{ title: '人员编号', dataIndex: 'psnNo' },
	{ title: '姓名', dataIndex: 'psnName', },
	{ title: '证件号码', dataIndex: 'certno', },
	{ title: '性别', dataIndex: 'gend', collectionType: 'GEND' },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '参保状态', dataIndex: 'psnInsuStas', collectionType: 'PSN_INSU_STAS' },
	{ title: '开始年月', dataIndex: 'startYM', },
	{ title: '结束年月', dataIndex: 'endYM', },
	{ title: '基数', dataIndex: 'psnClctstd', },
	{ title: '工资', dataIndex: 'wag',  },
]
const tableColumns2=[
	{ title: '人员编号', dataIndex: 'psnNo' },
	{ title: '姓名', dataIndex: 'psnName', },
	{ title: '证件号码', dataIndex: 'certno', },
	{ title: '性别', dataIndex: 'gend', collectionType: 'GEND' },
	{ title: '参保险种', dataIndex: 'insutype', collectionType: 'INSUTYPE' },
	{ title: '参保状态', dataIndex: 'psnInsuStas', collectionType: 'PSN_INSU_STAS' },
	{ title: '失败原因', dataIndex: 'rowTips',  },
]
export default {
	name: 'salary',
	data(){
		return{
			value:'1',//单选框的value
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
			psnInfoList:[],//人员基本信息
			// titleMap: null, //单位编号下拉框列表头
			// titleMap_Psn:null,//人员编号下拉框列表头
			// optionConfig: { //suggest显示框配置
			// 	value:'empNo',  // option的value配置
			// 	label: 'empNo'  //回显给框里的信息
			// },
			// optionConf_Psn:{
			// 	value:'psnNo',
			// 	label:'psnNo'
			// },
			empNo:'',//单位编号
			empInsuInfoList:[],//公司参保信息
			salaryStatus:true,//工资申报部分的按钮可用状态
			psnStatus:true,//决定人员信息区域的按钮可用
			salaryDec:true,//工资申报部分的按钮状态
			psnInsuInfoList:[],//人员参保信息列表，查询出来后放入子组件中
			salaryBaseInfoList:[],//工资基数信息列表，放入子组件
			psnInfoInsuListByPsnNo:[],//根据psnNo查询得到的人员参保信息列表
			ifSave:true,//保存按钮
			ifFreshChild:0,//决定是否刷新子组件
			checkedInfoInsuList:[],//父组件收到的从子组件传过来的值
			wagInfoFile:[],//批量保存的信息
			wagImportData:[],//导入的wag信息表
			tableDataSuccess:[],//导入成功信息
			tableDataError:[],//导入失败信息
			chooseExport:false,//是否打开导出模态框
			confirmLoading: false,
			isExport:true,//决定导出按钮的可用
			tableColumns1,
			tableColumns2
		}
	},
	methods:{
		reSet(){
			//重置页面
			this.$router.go(0)
		},
		onChange(e){
			let temp=e.target.value
			console.log('temp:',temp)
			if(temp===1){
				//按人员申报
				if(this.empNo!==''){
					this.psnStatus=false
				}else{
					this.salaryDec=true
				}
			}
			if(temp===2){
				//按单位申报
				this.psnStatus=true
				this.salaryDec=false

				console.log('当前empNo的值：',this.empNo)
				if(this.empNo!==''){
					this.queryInfoInsuList(this.empNo)
					this.salaryDec=false
				}else{
					this.salaryDec=true
				}
			}
		},
		handleSearch(val){
			//输入单位编号会自动进行搜索
			console.log('开始进行handleSearch')
			console.log('val:',val)
			this.empNo=val
			this.Base.submit(null,{
				url:'salaryDeclaration/queryEmpInfo',
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
		onSelect(val){
			//选择单位编号进行的操作
			console.log('开始onSelect')
			console.log('val:',val)
			this.empNo=val
			let temp=this.empInfoList
			for(let i=0;i<temp.length;i++){
				if(temp[i].empNo===val){
					if(temp[i].orgValiStas==='1'){
						console.log('单位状态正常')
						//单位状态正常,则查询公司参保数据
						this.Base.submit(null,{
							url:'salaryDeclaration/queryEmpInsuInfo',
							data: { empNo: val, },
						}).then((data)=>{
							console.log('查询到数据：',data)
							//循环判断是否参保正常
							let temp1=data.data.empInsuInfoList
							let count=0
							for(let j=0;j<temp1.length;j++){
								if(temp1[j].empInsuStas==='2' ){
									//参保不正常
									count++
								}
							}
							if(count===0){
								//全部参保不正常
								this.$message.error('该单位参保状态不正常，不允许办理此业务！');
								this.empBaseForm.resetFields()
								return
							}else{
								//有参保正常的
								console.log('单位参保正常')
								//回显相关信息
								let temp2=this.empInfoList
								for(let k=0;k<temp2.length;k++){
									if(temp2[k].empNo===val){
										this.empBaseForm.setFieldsValue({
											'empName':temp2[k].empName
										})
									}
								}
								console.log('单位参保还是个人参保：',this.value)
								if(this.value===2){
									this.salaryDec=false
									this.queryInfoInsuList(this.empNo)
								}
								if(this.value===1){
									this.psnStatus=false
								}

							}
						})



					}
				}else if(temp.orgValiStas==='2'){
					this.$message.error('该单位状态不正常，请确认！');
					this.empBaseForm.resetFields()
					return
				}
			}
		},
		queryInfoInsuList(val){
			//查询正常的人员参保信息
			this.Base.submit(null,{
				url:'salaryDeclaration/queryPsnInsuInfo',
				data: { empNo: val, },

			}).then((data)=>{
				this.psnInsuInfoList=data.data.psnInsuInfolist
				console.log('人员参保信息列表：',this.psnInsuInfoList)
				//同时赋值工资基数信息列表
				this.salaryBaseInfoList=this.psnInsuInfoList
				console.log('工资基数信息列表：',this.salaryBaseInfoList)
				this.ifFreshChild++//刷新子组件

			})
		},
		handleSearch_Psn(val){
			//根据人员编号查询人员信息
			console.log('开始进行handleSearch_Psn')
			console.log('val:',val)
			this.psnNo=val
			this.Base.submit(null,{
				url:'salaryDeclaration/queryPsnInfo',
				data:{
					psnNo:this.psnNo
				},
			}).then((data)=>{
				console.log('查询后的data:',data)
				// if ( data.data.empInfoList == null) {
				// 	this.$message.error('未获取到单位基本信息!');
				// }
				// this.empInfoList = data.data.empInfoList
				if(data.data.psnInfoList===null){
					this.$message.error('没有获取到人员信息，重新录入!');
				}
				this.psnInfoList=data.data.psnInfoList
			})

		},
		onSelect_Psn(val){
			//选择人员编号后回显信息
			console.log('开始进行onSelect_Psn')
			console.log('val:',val)
			this.psnNo=val
			//进行信息回显
			let temp=this.psnInfoList
			for(let i=0;i<temp.length;i++){
				if(temp[i].psnNo===val){
					//检查生存状态是否正常
					if(temp[i].survStas!=='1' ){
						this.psnBaseForm.resetFields()
						this.$message.error('该人员生存状态不正常，不允许办理此业务！');
						return
					}else{
						//检查是否正常参保
						this.Base.submit(null,{
							url:'salaryDeclaration/queryPsnInsuInfoByPsnNo',
							data:{
								psnNo:this.psnNo
							},
						}).then((data)=>{
							console.log('查询出的data：',data)
							this.psnInfoInsuListByPsnNo=data.data.psnInfoInsuListByPsnNo
							let flag1=0
							let flag2=0
							for(let i=0;i<this.psnInfoInsuListByPsnNo.length;i++){
								if(this.psnInfoInsuListByPsnNo[i].psnInsuStas!=='1'){
									flag1=1
								}
							}
							if(flag1===0){
								//正常参保
								console.log('参保正常')
								for(let j=0;j<this.psnInfoInsuListByPsnNo.length;j++){
									if(this.psnInfoInsuListByPsnNo[j].pausInsuDate!==null){
										flag2=1
									}
								}
								if(flag2===0){
									//缴费正常
									console.log('缴费正常')
									//一切正常开始赋值
									this.psnBaseForm.setFieldsValue({
										'psnName':temp[i].psnName,
										'certno':temp[i].certno,
										'naty':temp[i].naty,
										'gend':temp[i].gend
									})
									//清空现有的人员参保信息列表，将查询出的结果赋值

									this.psnInsuInfoList=[{}]
									this.psnInsuInfoList.forEach(item =>{
										Object.assign( item , {psnNo:val})
										Object.assign( item , {psnName:temp[i].psnName})
										Object.assign( item , {certno:temp[i].certno})
										Object.assign( item , {naty:temp[i].naty})
										Object.assign( item , {gend:temp[i].gend})
										Object.assign( item , {empNo:this.empNo})
										Object.assign( item , {insutype:this.psnInfoInsuListByPsnNo[i].insutype})
										Object.assign( item , {psnInsuStas:this.psnInfoInsuListByPsnNo[i].psnInsuStas})
									})
									// console.log('单人申报：当前psnInsuInfoList:',this.psnInsuInfoList)
									// console.log('参保状态：',this.psnInfoInsuListByPsnNo)
									this.salaryBaseInfoList=this.psnInsuInfoList
									this.ifFreshChild++//刷新子组件

									if(this.value===1){
										this.salaryDec=false
									}

								}else{
									this.$message.error('该人员缴费状态不正常，不允许办理此业务！')
									return
								}
							}else{
								this.$message.error('该人员未在该单位下正常参保，请重新录入人员信息！')
								return
							}
						})
					}
				}
			}


		},
		checkStartYM(rule,value,callback){
			//开始年月的校验
			console.log('value：',value)
			const startYM=this.salaryBaseForm.getFieldMomentValue("startYM")
			const endYM=this.salaryBaseForm.getFieldMomentValue("endYM")

			if(endYM!==undefined){
				if(Date.parse(startYM)>=Date.parse(endYM)){
					this.$message.error('申报开始年月不能晚于结束年月，请重新录入！')
					this.salaryBaseForm.resetFields(['startYM'])
					callback()
				}else{
					callback()
				}
			}else{
				console.log('结束年月为空')
				callback()
			}

			console.log('进行参保日期校验')
			//校验开始日期不能早于首次参保日期，分为个人参保和单位参保
			let tempInsulist
			if(this.value===1){
				//个人参保
				tempInsulist=this.psnInfoInsuListByPsnNo
			}else if(this.value===2){
				//单位参保
				tempInsulist=this.psnInsuInfoList
			}
			console.log('参保信息：',tempInsulist)
			// const fstInsuYM=this.psnInfoInsuListByPsnNo[0].psnInsuDate
			let earlist=tempInsulist[0].psnInsuDate
			for(let i=0;i<tempInsulist.length;i++){
				if(earlist===null&&tempInsulist[i].psnInsuDate!==null){
					earlist=tempInsulist[i].psnInsuDate
				}
				if(i>0&&Date.parse(tempInsulist[i].psnInsuDate)<Date.parse(earlist)){
					console.log('进入if')
					earlist=tempInsulist[i].psnInsuDate
				}
			}
			console.log('最早的参保日期：',earlist)
			if(Date.parse(value)<Date.parse(earlist)){
				this.$message.error('补录开始期号不能早于在本单位的参保日期，请重新录入！')
				this.salaryBaseForm.resetFields(['startYM'])
				callback()
			}


		},
		checkEndYM(rule, value, callback){
			//结束年月的校验
			console.log('value：',value)
			const startYM=this.salaryBaseForm.getFieldMomentValue("startYM")
			const endYM=this.salaryBaseForm.getFieldMomentValue("endYM")
			if(startYM!==undefined){
				if(Date.parse(startYM)>=Date.parse(endYM)){
					this.$message.error('申报结束年月不能早于开始年月，请重新录入！')
					this.salaryBaseForm.resetFields(['endYM'])
					callback()
				}else{
					callback()
				}
			}else{
				console.log('开始年月为空')
				callback()
			}

		},
		checkSalary(rule, value, callback){
			//对工资的校验
			console.log('现在开始进行工资校验')
			if(value<0||value>99999999.9999){
				callback('工资金额有误，请重新输入')
			}else{
				callback()
			}
		},
		fnDeclaration(){
			//对工资部分进行申报
			let flag=0
			console.log('现在进行工资申报')
			let startYM=this.salaryBaseForm.getFieldMomentValue("startYM")
			let endYM=this.salaryBaseForm.getFieldMomentValue("endYM")
			let salary=this.salaryBaseForm.getFieldValue('wag')
			console.log('startYM:',startYM)
			console.log('endYM:',endYM)
			console.log('salary:',salary)
			if(startYM===undefined||endYM===undefined||salary===undefined){
				this.$message.error('工资申报信息录入不完整，请先将信息录入完整！')
				flag=1
			}
			this.salaryBaseForm.validateFields(errors => {
				console.log('错误信息：',errors)
				if(errors!==null){
					this.$message.error('工资申报信息录入有误，请确认！')
					flag=1
				}
			})
			if(flag!==0){
				//终止申报
				return
			}
			console.log('一切正常，开始申报')
			let baseNum//基数工资
			for(let i=0;i<this.psnInsuInfoList.length;i++){
				if(salary<=3000){
					baseNum=3000
				}else if(salary>=15000){
					baseNum=15000
				}else{
					baseNum=salary
				}
				//时间格式转换
				startYM=startYM.substring(0,7).replaceAll('-','')
				endYM=endYM.substring(0,7).replaceAll('-','')
				//填入数据
				this.psnInsuInfoList.forEach(item =>{
					Object.assign( item , {startYM:startYM})
					Object.assign( item , {endYM:endYM})
					Object.assign( item , {wag:salary})
					Object.assign( item , {base:baseNum})
					Object.assign( item , {empNo:this.empNo})
				})
				// for(let j=0;j<this.psnInsuInfoList.length;j++){
				// 	let temp=this.psnInsuInfoList[j]
				// 	temp['startYM']=startYM
				// 	temp['endYM']=endYM
				// 	temp['wag']=salary
				// 	temp['base']=baseNum
				// 	temp['empNo']=this.empNo
				// }

				//向工资基数列表填入数据
				let month=new Date().getMonth()<10?'0'+String(new Date().getMonth()):String(new Date().getMonth())
				let nowTime=String(new Date().getFullYear())+month
				this.salaryBaseInfoList.forEach(item=>{
					Object.assign( item , {nowTime:nowTime})
					Object.assign( item , {wag:salary})
					Object.assign( item , {base:baseNum})
					Object.assign( item , {empNo:this.empNo})
				})
			}
			console.log('此时人员参保信息列表:',this.psnInsuInfoList)
			console.log('此时工资基数列表列表:',this.salaryBaseInfoList)
			this.ifSave=false
			this.psnInsuInfoList=[...this.psnInsuInfoList]//让子组件重新刷新数据
			this.salaryBaseInfoList=[...this.salaryBaseInfoList]

			this.ifFreshChild++//刷新子组件
		},
		fatherMethod(){
			//父组件中调用子组件方法
			console.log('我是父组件，调用子组件childmethod方法')
			this.checkedInfoInsuList=this.$refs.freshPage.sendDataToFather()
			console.log('父组件收到的值：',this.checkedInfoInsuList)

		},
		changeStatus(){
			//改变按钮的可用状态
			this.salaryStatus=false
		},
		fnSave(){
			this.ifFreshChild++
			setTimeout(()=>{
				console.log('现在开始进行保存操作')
				console.log('已经选择的人员参保信息：',this.checkedInfoInsuList)
				if(this.checkedInfoInsuList.length===0){
					this.$message.error('没有获取到要保存的数据，请勾选！')
					return
				}
				//已经有数据，进行校验是否存在老数据,并进行保存操作
				this.Base.submit(null,{
					url:'salaryDeclaration/ifExistSalary',
					data: {jsonStr: JSON.stringify(this.checkedInfoInsuList),}
				}).then((data)=>{
					console.log('data:',data)
					this.$message.success('保存成功!');
				}).catch((data)=>{
					this.$message.error('保存失败!');
				})
			},300)

		},
		downTemplate(){
			//模板下载
			//模板下载的实现
			console.log('开始下载模板')
			Base.downloadFile({
				url: 'salaryDeclaration/downloadTemplate',
				fileName: "模板文件.xlsx",
				type: 'application/octet-stream',
			}).then((data) => {
				console.log('data：',data)
				this.$message.success('下载成功!');
			}).catch((data) => {
				this.$message.error('下载失败!');
			})
		},
		beforeUpload(file){
			//文件上传之前的操作
			console.log('开始进行文件上传前操作')
			//批量参保文件导入之前的操作
			this.wagInfoFile=[...this.wagInfoFile,file]
			return false
		},
		handleRemove(){
			//删除待上传的文件
			this.wagInfoFile=[]
		},
		fnImport(){
			//文件导入实现
			console.log('开始进行文件导入')
			//判断文件是否存在
			if (this.wagInfoFile === null || this.wagInfoFile === undefined || this.wagInfoFile === ''||this.wagInfoFile.length<=0) {
				this.$message.error('请先选择导入文件！！');
				return
			}
			console.log('wagInfoFiles：',this.wagInfoFile)
			this.Base.submit(null, {
				url: 'salaryDeclaration/uploadFile',
				data: {
					file: this.wagInfoFile, //文件参数，可以是文件数组
				},
				//文件提交时，采用FormData方式提交参数
				isFormData: true,
			}).then((res) => {
				this.wagImportData=res.data.wagInfoFiles
				this.tableDataSuccess=res.data.successFile
				this.tableDataError=res.data.errorFile
				console.log('this.wagInfoFiles:',this.wagImportData)
				console.log('successFiles:',this.tableDataSuccess)
				console.log('errorFiles:',this.tableDataError)
				this.isExport=false
				if(this.tableDataError!==[]){
					this.$message.error('存在校验不通过的数据，请检查！')
				}else{
					this.ifSave=false
					//赋值人员参保信息
					this.checkedInfoInsuList=this.tableDataSuccess
					this.fnSave()
					this.$message.success('导盘申报工资基数成功！')
				}
				// //对导入的所有进行进行校验，分别放入成功表和失败表
				// for(let i=0;i<this.wagImportData.length;i++){
				// 	let temp=this.wagImportData[i]
				// 	let flag=0//判断校验结果
				// 	//校验工资
				// 	if(temp.wag<0||temp.wag>999999999999.9999){
				// 		flag=1
				// 	}
				// 	let start=temp.startYM
				// 	let end=temp.endYM
				// 	//校验月份
				// 	if(start.length===6||end.length===6){
				//
				// 	}else if((start.split(4,5)===0||start.split(4,5)===1)&&(end.split(4,5)===0||end.split(4,5)===1)){
				//
				// 	}else if(start.toNumber<=12||end.toNumber<=12){
				//
				// 	}else{
				// 		flag=1
				// 	}
				//
				// 	//校验
				// }
			}).catch(() => {
				this.$message.error('导入失败！！');
			})
		},
		fnExport(){
			//导出选项，会提示选择导出成功还是失败信息
			this.chooseExport=true
		},
		exportSuccess(){
			//导出成功信息
			this.chooseExport=false
			console.log('现在开始导出成功信息')
			const successData = {
				fileName: '成功信息',   // 文件名
				// 工作表List
				sheets: [{
					// 工作表名字，默认为Sheet加上该工作表在List中的index
					name: 'worksheet1',
					column: {
						// 简单表头设置如下
						complex: false,
						// 简单表头的列索引
						columns: [
							{header: '人员编号', key: 'psnNo', width: 32 },
							{header: '姓名', key: 'psnName', width: 20 },
							{header: '证件号码', key: 'certno', width: 30 },
							{header: '性别', key: 'gend', width: 20 },
							{header: '参保险种', key: 'insutype', width: 20 },
							{header: '参保状态', key: 'psnInsuStas', width: 20 },
							{header: '开始年月', key: 'startYM', width: 20 },
							{header: '结束年月', key: 'endYM', width: 20 },
							{header: '基数', key: 'psnClctstd', width: 20 },
							{header: '工资', key: 'wag', width: 15 }],
					},
					// 表格数据
					rows: this.tableDataSuccess,
					codeList: [
						{codeType:'INSUTYPE',columnKey: 'insutype' },
						{codeType: 'PSN_INSU_STAS',columnKey:'psnInsuStas'},
						{codeType: 'GEND',columnKey: 'gend'},
					],
				}],
			}
			this.Base.generateExcel(successData)
		},
		exportError(){
			//导出失败信息
			this.chooseExport=false
			console.log('现在开始导出失败信息')
			const errorData = {
				fileName: '失败信息',   // 文件名
				// 工作表List
				sheets: [{
					// 工作表名字，默认为Sheet加上该工作表在List中的index
					name: 'worksheet1',
					column: {
						// 简单表头设置如下
						complex: false,
						// 简单表头的列索引
						columns: [
							{header: '人员编号', key: 'psnNo', width: 32 },
							{header: '姓名', key: 'psnName', width: 20 },
							{header: '证件号码', key: 'certno', width: 30 },
							{header: '性别', key: 'gend', width: 20 },
							{header: '参保险种', key: 'insutype', width: 20 },
							{header: '参保状态', key: 'psnInsuStas', width: 20 },
							{header: '失败原因', key: 'rowTips', width: 30 }],
					},
					// 表格数据
					rows: this.tableDataError,
					codeList: [
						{codeType:'INSUTYPE',columnKey: 'insutype' },
						{codeType: 'PSN_INSU_STAS',columnKey:'psnInsuStas'},
						{codeType: 'GEND',columnKey: 'gend'},
					],
				}],
			}
			this.Base.generateExcel(errorData)
		},
		freshData(){
			//刷新子组件列表数据，更新最新状态
			this.psnInsuInfoList=[...this.psnInsuInfoList]
		}
	},
	watch: {
		//message必须和监测的data名字一样
		ifFreshChild: function() {
			console.log('watch:', '我是父组件，psnInsuInfoList 变了,所以调用子组件方法')
			setTimeout(()=>{
				this.fatherMethod()
			},100)
		}
	},
	// updated () {
	// 	setTimeout(()=>{
	// 		this.fatherMethod()
	// 	},300)
	//
	// },

	created() {
		// this.titleMap = new Map()
		// this.titleMap.set('empNo', '单位编号')
		// this.titleMap.set('empName', '单位名称')
		// this.titleMap_Psn=new Map()
		// this.titleMap_Psn.set('psnNo','人员编号')
		// this.titleMap_Psn.set('psnName','姓名')
		// this.titleMap_Psn.set('certno','证件号码')
	},

}
</script>

<style scoped>

</style>

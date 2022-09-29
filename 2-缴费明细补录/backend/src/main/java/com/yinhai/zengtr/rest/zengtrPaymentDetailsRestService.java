package com.yinhai.zengtr.rest;

import com.alibaba.fastjson.JSON;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.ta404.core.validate.annotation.V;
import com.yinhai.zengtr.service.read.zengtrPaymentDetailsReadService;
import com.yinhai.zengtr.service.write.zengtrPaymentDetailsWriteService;
import com.yinhai.zengtr.vo.*;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import java.util.List;

@RestService("paymentDetails")
public class zengtrPaymentDetailsRestService extends BaseRestService {

	@Resource
	private zengtrPaymentDetailsReadService zengtrPaymentDetailsReadService;

	@Resource
	private zengtrPaymentDetailsWriteService zengtrPaymentDetailsWriteService;

	@PostMapping("queryPsnInfo")
	public void queryPsnInfo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInfoBQueryVo> psnInfoBQueryVoList=zengtrPaymentDetailsReadService.queryPsnInfo(psnNo);
			setData("psnInfoList",psnInfoBQueryVoList);
		}
	}
	@PostMapping("queryPsnInsuInfoByPsnNo")
	public void queryPsnInsuInfoByPsnNo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrPaymentDetailsReadService.queryPsnInsuInfoByPsnNo(psnNo);
			setData("psnInsuInfoList",psnInsuDQueryVoList);
		}

	}

	@PostMapping("queryEmpInfo")
	public void queryEmpInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<InsuEmpInfoBQueryVo> insuEmpInfoBQueryVoList=zengtrPaymentDetailsReadService.queryEmpInfo(empNo);
			setData("empInfoList",insuEmpInfoBQueryVoList);
		}
	}

	@PostMapping("queryPsnInsuInfoByEmpNo")
	public void queryPsnInsuInfoByEmpNo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrPaymentDetailsReadService.queryPsnInsuInfoByEmpNo(empNo);
			setData("psnInsuInfoListByEmpNo",psnInsuDQueryVoList);
		}
	}
	//查询单位征缴规则
	@PostMapping("queryClctRuleTypeCodg")
	public void queryClctRuleTypeCodg(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<EmpInsuDQueryVo> empInsuDQueryVoList=zengtrPaymentDetailsReadService.queryClctRuleTypeCodg(empNo);
			setData("empInsuDList",empInsuDQueryVoList);
		}
	}

	@PostMapping("queryClctInfoList")
	public void queryClctInfoList(String empNo){
		if (!ValidateUtil.isEmpty(empNo)) {
			List<UebmiClctDetlDQueryVo> uebmiClctDetlDQueryVoList=zengtrPaymentDetailsReadService.queryClctInfoList(empNo);
			setData("clctInfoList",uebmiClctDetlDQueryVoList);
		}

	}

	//进行数据的补录
	@PostMapping("insertRecordingData")
	public void insertRecordingData(String jsonStr){
		if(!ValidateUtil.isEmpty(jsonStr)){
			List<ValidatedListVo> validatedListVoList=JSON.parseArray(jsonStr, ValidatedListVo.class);
			List<UebmiCrtfRcdCAddVo> uebmiCrtfRcdCAddVoList=JSON.parseArray(jsonStr, UebmiCrtfRcdCAddVo.class);
			List<UebmiClctDetlDAddVo> uebmiClctDetlDAddVoList=JSON.parseArray(jsonStr, UebmiClctDetlDAddVo.class);
			List<UebmiClctDetlExtDAddVo> uebmiClctDetlExtDAddVoList=JSON.parseArray(jsonStr,UebmiClctDetlExtDAddVo.class);
			System.out.println("收到的数据："+validatedListVoList);
			//开始进行写入
			List<RecordingDetailsVo> recordingDetailsVoList =zengtrPaymentDetailsWriteService.insertRecordingData(uebmiCrtfRcdCAddVoList,uebmiClctDetlDAddVoList,uebmiClctDetlExtDAddVoList);
			System.out.println("将要返回的数据："+recordingDetailsVoList);
			//返回数据
			setData("recordingDetails",recordingDetailsVoList);

		}

	}

}

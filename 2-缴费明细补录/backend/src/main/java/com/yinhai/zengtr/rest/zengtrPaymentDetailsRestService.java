package com.yinhai.zengtr.rest;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.ta404.core.validate.annotation.V;
import com.yinhai.zengtr.service.read.zengtrPaymentDetailsReadService;
import com.yinhai.zengtr.service.write.zengtrPaymentDetailsWriteService;
import com.yinhai.zengtr.vo.EmpInsuDQueryVo;
import com.yinhai.zengtr.vo.InsuEmpInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInsuDQueryVo;
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

}

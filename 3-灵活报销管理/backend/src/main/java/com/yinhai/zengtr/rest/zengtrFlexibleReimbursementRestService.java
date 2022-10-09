package com.yinhai.zengtr.rest;

import com.alibaba.fastjson.JSON;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.zengtr.service.read.zengtrFlexibleReimbursementReadService;
import com.yinhai.zengtr.service.write.zengtrFlexibleReimbursementWriteService;
import com.yinhai.zengtr.vo.*;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import java.util.List;

@RestService("flexibleReimbursement")
public class zengtrFlexibleReimbursementRestService extends BaseRestService {

	@Resource
	private zengtrFlexibleReimbursementReadService zengtrFlexibleReimbursementReadService;

	@Resource
	private zengtrFlexibleReimbursementWriteService zengtrFlexibleReimbursementWriteService;

	@PostMapping("queryPsnInfo")
	public void queryPsnInfo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInfoBQueryVo> psnInfoBQueryVoList=zengtrFlexibleReimbursementReadService.queryPsnInfo(psnNo);
			setData("psnInfoList",psnInfoBQueryVoList);
		}
	}

	@PostMapping("queryPsnInsuInfoByPsnNo")
	public void queryPsnInsuInfoByPsnNo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrFlexibleReimbursementReadService.queryPsnInsuInfoByPsnNo(psnNo);
			setData("psnInsuInfoList",psnInsuDQueryVoList);
		}
	}

	@PostMapping("queryEmpInfo")
	public void queryEmpInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<InsuEmpInfoBQueryVo> insuEmpInfoBQueryVoList=zengtrFlexibleReimbursementReadService.queryEmpInfo(empNo);
			setData("empInfoList",insuEmpInfoBQueryVoList);
		}
	}

	@PostMapping("queryPsnInsuInfoByEmpNo")
	public void queryPsnInsuInfoByEmpNo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrFlexibleReimbursementReadService.queryPsnInsuInfoByEmpNo(empNo);
			setData("psnInsuInfoListByEmpNo",psnInsuDQueryVoList);
		}
	}

	@PostMapping("queryEmpInsuInfo")
	public void queryEmpInsuInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<EmpInsuDQueryVo> empInsuDQueryVoList=zengtrFlexibleReimbursementReadService.queryEmpInsuInfo(empNo);
			setData("empInsuInfoList",empInsuDQueryVoList);
		}
	}

	@PostMapping("insertSubmitList")
	public void insertSubmitList(String jsonStr) throws Exception {
		if(!ValidateUtil.isEmpty(jsonStr)){
			List<FlxReimRegInfoDAddVo> flxReimRegInfoDAddVos= JSON.parseArray(jsonStr, FlxReimRegInfoDAddVo.class);
			System.out.println("收到的数据："+flxReimRegInfoDAddVos);
			zengtrFlexibleReimbursementWriteService.insertSubmitList(flxReimRegInfoDAddVos);
		}

	}

}

package com.yinhai.zengtr.rest;

import com.alibaba.fastjson.JSON;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.zengtr.service.read.zengtrSalaryDeclarationReadService;
import com.yinhai.zengtr.service.write.zengtrSalaryDeclarationWriteService;
import com.yinhai.zengtr.vo.*;

import net.sf.json.JSONArray;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import java.util.List;

@RestService("salaryDeclaration")
public class zengtrSalaryDeclarationRestService extends BaseRestService {
	@Resource
	private zengtrSalaryDeclarationReadService zengtrSalaryDeclarationReadService;

	@Resource
	private zengtrSalaryDeclarationWriteService zengtrSalaryDeclarationWriteService;

	@PostMapping("queryEmpInfo")
	public void queryEmpInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<InsuEmpInfoBQueryVo> insuEmpInfoBQueryVoList=zengtrSalaryDeclarationReadService.queryEmpInfo(empNo);
			setData("empInfoList",insuEmpInfoBQueryVoList);
		}
	}

	@PostMapping("queryEmpInsuInfo")
	public void queryEmpInsuInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<EmpInsuDQueryVo> empInsuDQueryVoList=zengtrSalaryDeclarationReadService.queryEmpInsuInfo(empNo);
			setData("empInsuInfoList",empInsuDQueryVoList);
		}
	}

	//查询正常参保的人员信息
	@PostMapping("queryPsnInsuInfo")
	public void queryPsnInsuInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<PsnNormalInfoQueryVo> psnNormalInfoQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInsuInfo(empNo);
//			System.out.println("最终返回的结果："+psnNormalInfoQueryVoList);
			setData("psnInsuInfolist",psnNormalInfoQueryVoList);
		}
	}

	//根据人员编号查询人员信息
	@PostMapping("queryPsnInfo")
	public void queryPsnInfo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInfoBQueryVo> psnInfoBQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInfo(psnNo);
			setData("psnInfoList",psnInfoBQueryVoList);
		}
	}

	//根据psnNo查询参保信息
	@PostMapping("queryPsnInsuInfoByPsnNo")
	public void queryPsnInsuInfoByPsnNo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInsuInfoByPsnNo(psnNo);
			System.out.println("查询出的结果："+psnInsuDQueryVoList);
			setData("psnInfoInsuListByPsnNo",psnInsuDQueryVoList);
		}
	}

	//检查是否已经存入工资，有则更新数据
	@PostMapping("ifExistSalary")
	public void ifExistSalary(String jsonStr){
		if (!ValidateUtil.isEmpty(jsonStr)) {
			List<Object> objectsList = JSON.parseArray(jsonStr);
			JSONArray array = JSONArray.fromObject(jsonStr);
			System.out.println("收到的数据为："+array);
			zengtrSalaryDeclarationWriteService.ifExistSalary(array);
		}

	}
}

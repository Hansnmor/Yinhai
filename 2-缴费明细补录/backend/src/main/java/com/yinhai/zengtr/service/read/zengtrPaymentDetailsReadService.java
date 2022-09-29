package com.yinhai.zengtr.service.read;

import com.yinhai.zengtr.vo.*;

import java.util.List;

public interface zengtrPaymentDetailsReadService {
	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNo(String empNo);

	List<EmpInsuDQueryVo> queryClctRuleTypeCodg(String empNo);

	List<UebmiClctDetlDQueryVo> queryClctInfoList(String empNo);
}

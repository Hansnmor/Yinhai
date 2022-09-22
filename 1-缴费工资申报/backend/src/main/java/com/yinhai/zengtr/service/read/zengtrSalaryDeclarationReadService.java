package com.yinhai.zengtr.service.read;

import com.yinhai.zengtr.vo.*;

import java.util.List;

public interface zengtrSalaryDeclarationReadService {
	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);

	List<EmpInsuDQueryVo> queryEmpInsuInfo(String empNo);

	List<PsnNormalInfoQueryVo> queryPsnInsuInfo(String empNo);

	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);


//	List<PsnInfoBQueryVo> queryPsnInsuInfo(String empNo);
}

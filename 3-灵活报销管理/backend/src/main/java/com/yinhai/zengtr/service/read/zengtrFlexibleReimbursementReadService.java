package com.yinhai.zengtr.service.read;

import com.yinhai.zengtr.vo.EmpInsuDQueryVo;
import com.yinhai.zengtr.vo.InsuEmpInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInsuDQueryVo;

import java.util.List;

public interface zengtrFlexibleReimbursementReadService {
	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNo(String empNo);

	List<EmpInsuDQueryVo> queryEmpInsuInfo(String empNo);
}

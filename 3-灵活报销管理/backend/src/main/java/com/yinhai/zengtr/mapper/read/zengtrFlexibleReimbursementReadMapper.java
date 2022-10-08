package com.yinhai.zengtr.mapper.read;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.zengtr.vo.EmpInsuDQueryVo;
import com.yinhai.zengtr.vo.InsuEmpInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInsuDQueryVo;

import java.util.List;

public interface zengtrFlexibleReimbursementReadMapper extends Ta404SupportMapper {
	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNo(String empNo);

	List<EmpInsuDQueryVo> queryEmpInsuInfo(String empNo);
}

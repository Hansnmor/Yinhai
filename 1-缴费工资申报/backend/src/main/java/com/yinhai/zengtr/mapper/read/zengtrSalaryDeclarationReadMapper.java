package com.yinhai.zengtr.mapper.read;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.zengtr.vo.*;

import java.util.List;

public interface zengtrSalaryDeclarationReadMapper extends Ta404SupportMapper {
	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);

	List<EmpInsuDQueryVo> queryEmpInsuInfo(String empNo);

	List<PsnNormalInfoQueryVo> queryPsnInsuInfo(String empNo);

	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);
}

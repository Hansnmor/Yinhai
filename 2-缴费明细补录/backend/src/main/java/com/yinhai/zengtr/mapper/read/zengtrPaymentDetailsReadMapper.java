package com.yinhai.zengtr.mapper.read;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.zengtr.vo.*;

import java.util.List;

public interface zengtrPaymentDetailsReadMapper extends Ta404SupportMapper {
	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNo(String empNo);

	List<EmpInsuDQueryVo> queryClctRuleTypeCodg(String empNo);

	List<UebmiClctDetlDQueryVo> queryClctInfoList(String empNo);
}

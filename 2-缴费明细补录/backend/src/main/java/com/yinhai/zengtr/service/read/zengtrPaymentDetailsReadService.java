package com.yinhai.zengtr.service.read;

import com.yinhai.zengtr.vo.InsuEmpInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInfoBQueryVo;
import com.yinhai.zengtr.vo.PsnInsuDQueryVo;

import java.util.List;

public interface zengtrPaymentDetailsReadService {
	List<PsnInfoBQueryVo> queryPsnInfo(String psnNo);

	List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

	List<InsuEmpInfoBQueryVo> queryEmpInfo(String empNo);
}

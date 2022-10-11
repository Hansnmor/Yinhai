package com.yinhai.tangcao.service.read;

import com.yinhai.tangcao.vo.InsuEmpInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInsuDQueryVo;
import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;

import java.util.List;

public interface tangcaoYearlyPaymentReadService {
    List<PsnInfoBQueryVo> queryPsnInfo(String queryCondition);

    List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

    List<InsuEmpInfoBQueryVo> queryEmpInfo(String queryCondition);

    List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNoAndPsnNo(String empNo,String psnNo);

    List<PsnTratYearDInfoVo> queryPsnTratYearDInfoByPsnNo(String psnNo);
}

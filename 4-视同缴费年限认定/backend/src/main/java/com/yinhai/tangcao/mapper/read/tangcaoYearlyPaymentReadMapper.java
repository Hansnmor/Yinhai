package com.yinhai.tangcao.mapper.read;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.tangcao.vo.InsuEmpInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInsuDQueryVo;
import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface tangcaoYearlyPaymentReadMapper extends Ta404SupportMapper {
    List<PsnInfoBQueryVo> queryPsnInfo(String queryCondition);

    List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo);

    List<InsuEmpInfoBQueryVo> queryEmpInfo(String queryCondition);

    List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNoAndPsnNo(@Param("empNo") String empNo,@Param("psnNo") String psnNo);

    List<PsnTratYearDInfoVo> queryPsnTratYearDInfoByPsnNo(String psnNo);
}

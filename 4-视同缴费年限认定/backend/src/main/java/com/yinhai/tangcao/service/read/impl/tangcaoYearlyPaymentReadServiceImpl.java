package com.yinhai.tangcao.service.read.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.tangcao.mapper.read.tangcaoYearlyPaymentReadMapper;
import com.yinhai.tangcao.mapper.write.tangcaoYearlyPaymentWriteMapper;
import com.yinhai.tangcao.service.read.tangcaoYearlyPaymentReadService;
import com.yinhai.tangcao.vo.InsuEmpInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInsuDQueryVo;
import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: backend
 * @description:
 * @author: 唐曹
 * @create: 2022-10-09 14:48
 **/
@Service
@NoTransactional
public class tangcaoYearlyPaymentReadServiceImpl extends BaseRestService implements tangcaoYearlyPaymentReadService {
    @Resource
    tangcaoYearlyPaymentReadMapper tangcaoYearlyPaymentReadMapper;


    @Override
    public List<PsnInfoBQueryVo> queryPsnInfo(String queryCondition) {
        return tangcaoYearlyPaymentReadMapper.queryPsnInfo(queryCondition);
    }

    @Override
    public List<PsnInsuDQueryVo> queryPsnInsuInfoByPsnNo(String psnNo) {
        return tangcaoYearlyPaymentReadMapper.queryPsnInsuInfoByPsnNo(psnNo);
    }

    @Override
    public List<InsuEmpInfoBQueryVo> queryEmpInfo(String queryCondition) {
        return tangcaoYearlyPaymentReadMapper.queryEmpInfo(queryCondition);
    }

    @Override
    public List<PsnInsuDQueryVo> queryPsnInsuInfoByEmpNoAndPsnNo(String empNo, String psnNo) {
        return tangcaoYearlyPaymentReadMapper.queryPsnInsuInfoByEmpNoAndPsnNo(empNo,psnNo);
    }

    @Override
    public List<PsnTratYearDInfoVo> queryPsnTratYearDInfoByPsnNo(String psnNo) {
        return tangcaoYearlyPaymentReadMapper.queryPsnTratYearDInfoByPsnNo(psnNo);
    }
}

package com.yinhai.tangcao.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.tangcao.mapper.write.tangcaoYearlyPaymentWriteMapper;
import com.yinhai.tangcao.service.write.tangcaoYearlyPaymentWriteService;
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
public class tangcaoYearlyPaymentWriteServiceImpl extends BaseRestService implements tangcaoYearlyPaymentWriteService {
    @Resource
    tangcaoYearlyPaymentWriteMapper tangcaoYearlyPaymentWriteMapper;
    @Override
    public void deletePsnTratYearDInfo(String psnTratClctId) {
        tangcaoYearlyPaymentWriteMapper.deletePsnTratYearDInfo(psnTratClctId);
    }

    @Override
    public void updatePsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList) {
        tangcaoYearlyPaymentWriteMapper.updatePsnTratYearDInfo(validatedListVoList);
    }

    @Override
    public void insertPsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList) {
        tangcaoYearlyPaymentWriteMapper.insertPsnTratYearDInfo(validatedListVoList);
    }
}

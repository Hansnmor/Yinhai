package com.yinhai.tangcao.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.tangcao.mapper.write.tangcaoYearlyPaymentWriteMapper;
import com.yinhai.tangcao.service.write.tangcaoYearlyPaymentWriteService;
import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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
//        tangcaoYearlyPaymentWriteMapper.updatePsnTratYearDInfo(validatedListVoList);
    }

    @Override
    public void insertPsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList) {
//        tangcaoYearlyPaymentWriteMapper.insertPsnTratYearDInfo(validatedListVoList);
    }

    @Override
    public void insertUpdatedData(List<PsnTratYearDInfoVo> psnTratYearDInfoVoList1, List<PsnTratYearDInfoVo> psnTratYearDInfoVoList2) {
        if(!psnTratYearDInfoVoList1.isEmpty()){
            //填充空缺的值
            for (PsnTratYearDInfoVo vo : psnTratYearDInfoVoList1) {
                vo.setPsnTratClctId(tangcaoYearlyPaymentWriteMapper.executeForSequence("SEQ_PSN_TRAT_CLCT_ID"));
                vo.setTratClctType("10");
                vo.setValiFlag("1");
                vo.setInsuOrg("2100");
                vo.setOpter("developer");
                vo.setOptins("developer");
                vo.setCrteTime(new Date());
                vo.setOptTime(new Date());
                vo.setUpdtTime(new Date());
                vo.setPsnInsuRltsId(tangcaoYearlyPaymentWriteMapper.executeForSequence("PSN_INSU_RLTS_ID"));

            }
            tangcaoYearlyPaymentWriteMapper.insertPsnTratYearDInfo(psnTratYearDInfoVoList1);
        }
        if(!psnTratYearDInfoVoList2.isEmpty()){
            tangcaoYearlyPaymentWriteMapper.updatePsnTratYearDInfo(psnTratYearDInfoVoList2);
        }
    }
}

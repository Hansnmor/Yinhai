package com.yinhai.tangcao.mapper.write;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;

import java.util.List;

public interface tangcaoYearlyPaymentWriteMapper extends Ta404SupportMapper {
    void deletePsnTratYearDInfo(String psnTratClctId);

    void updatePsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList);

    void insertPsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList);
}

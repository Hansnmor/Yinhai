package com.yinhai.tangcao.service.write;

import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;

import java.util.List;

public interface tangcaoYearlyPaymentWriteService {
    void deletePsnTratYearDInfo(String psnTratClctId);

//    void updatePsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList);
//
//    void insertPsnTratYearDInfo(List<PsnTratYearDInfoVo> validatedListVoList);

	void insertUpdatedData(List<PsnTratYearDInfoVo> psnTratYearDInfoVoList1, List<PsnTratYearDInfoVo> psnTratYearDInfoVoList2);
}

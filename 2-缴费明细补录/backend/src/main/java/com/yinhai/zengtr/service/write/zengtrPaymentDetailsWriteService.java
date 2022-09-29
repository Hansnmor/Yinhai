package com.yinhai.zengtr.service.write;

import com.yinhai.zengtr.vo.RecordingDetailsVo;
import com.yinhai.zengtr.vo.UebmiClctDetlDAddVo;
import com.yinhai.zengtr.vo.UebmiClctDetlExtDAddVo;
import com.yinhai.zengtr.vo.UebmiCrtfRcdCAddVo;

import java.util.List;

public interface zengtrPaymentDetailsWriteService {

	List<RecordingDetailsVo> insertRecordingData(List<UebmiCrtfRcdCAddVo> uebmiCrtfRcdCAddVoList, List<UebmiClctDetlDAddVo> uebmiClctDetlDAddVoList, List<UebmiClctDetlExtDAddVo> uebmiClctDetlExtDAddVoList);
}

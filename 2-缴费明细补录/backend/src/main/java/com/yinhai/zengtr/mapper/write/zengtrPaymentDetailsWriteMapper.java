package com.yinhai.zengtr.mapper.write;

import com.yinhai.ta404.module.mybatis.mapper.Ta404SupportMapper;
import com.yinhai.zengtr.vo.UebmiClctDetlDAddVo;
import com.yinhai.zengtr.vo.UebmiClctDetlExtDAddVo;
import com.yinhai.zengtr.vo.UebmiCrtfRcdCAddVo;

import java.util.List;

public interface zengtrPaymentDetailsWriteMapper extends Ta404SupportMapper {
	void insertRecordingData1(List<UebmiCrtfRcdCAddVo> uebmiCrtfRcdCAddVoList);

	void insertRecordingData2(List<UebmiClctDetlDAddVo> uebmiClctDetlDAddVoList);

	void insertRecordingData3(List<UebmiClctDetlExtDAddVo> uebmiClctDetlExtDAddVoList);
}

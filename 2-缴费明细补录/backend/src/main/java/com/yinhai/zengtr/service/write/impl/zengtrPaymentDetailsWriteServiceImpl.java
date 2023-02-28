package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.write.zengtrPaymentDetailsWriteMapper;
import com.yinhai.zengtr.service.write.zengtrPaymentDetailsWriteService;
import com.yinhai.zengtr.vo.RecordingDetailsVo;
import com.yinhai.zengtr.vo.UebmiClctDetlDAddVo;
import com.yinhai.zengtr.vo.UebmiClctDetlExtDAddVo;
import com.yinhai.zengtr.vo.UebmiCrtfRcdCAddVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service
@NoTransactional
public class zengtrPaymentDetailsWriteServiceImpl extends BaseRestService implements zengtrPaymentDetailsWriteService {

	@Resource
	private zengtrPaymentDetailsWriteMapper zengtrPaymentDetailsWriteMapper;


	//需要将数据写入三张表
	//分别是uebmi_crtf_rcd_c(职工基本医疗保险核定记录表),uebmi_clct_detl_d(职工基本医疗保险缴费明细),
	//uebmi_clct_detl_ext_d（职工基本医疗保险缴费补收扩展明细）
	@Override
	public List<RecordingDetailsVo> insertRecordingData(List<UebmiCrtfRcdCAddVo> uebmiCrtfRcdCAddVoList, List<UebmiClctDetlDAddVo> uebmiClctDetlDAddVoList, List<UebmiClctDetlExtDAddVo> uebmiClctDetlExtDAddVoList) {
		//给第一个list补全数据
		for (UebmiCrtfRcdCAddVo addVo : uebmiCrtfRcdCAddVoList) {
			addVo.setSumamt(addVo.getBaseSum());//补缴总额
			addVo.setAmt(addVo.getClctBase());//每月金额
			addVo.setAccrym(addVo.getStartYM());//对应费款所属期
			addVo.setCashymBegn(addVo.getStartYM());//起始费款所属期
			addVo.setCashymEnd(addVo.getEndYM());//截止费款所属期
			String rcdid=zengtrPaymentDetailsWriteMapper.executeForSequence("PSN_INSU_RLTS_ID");
			addVo.setUebmiCrtfRcdId(rcdid);//核定id
			addVo.setServMattInstId("1212121");//服务事项id
			addVo.setCrtfType(addVo.getClctType());//核定类型
			addVo.setPsnClctDetlId("20202020");//个人缴费明细id
			addVo.setMemo("这不是备注");
			addVo.setOptTime(new Date());//经办时间
			addVo.setOpterName("Hansnmor");//经办人名
			addVo.setOpter("1");//经办人
			String rid=zengtrPaymentDetailsWriteMapper.executeForSequence("SEQ_RID");
			addVo.setRid(rid);//rid
			addVo.setCrteTime(new Date());
			addVo.setUpdtTime(new Date());
			addVo.setRchkTime(new Date());
			addVo.setRchkFlag("1");
			addVo.setRchkOptins("1001");
		}
		System.out.println("最终数据1："+uebmiCrtfRcdCAddVoList);
		//给第二个list补全数据
		for (UebmiClctDetlDAddVo addVo : uebmiClctDetlDAddVoList) {
			//找不到所以借用其他的序列号id
			String psnclctdetlid=zengtrPaymentDetailsWriteMapper.executeForSequence("PSN_INSU_MGT_EID");
			addVo.setPsnClctDetlId(psnclctdetlid);
			String empClctDetId=zengtrPaymentDetailsWriteMapper.executeForSequence("PSN_INSU_MGT_EID");
			addVo.setEmpClctDetId(empClctDetId);
			addVo.setEmpArrIntoAcctAmt(0.0);
			addVo.setPsnClctIntoAcctAmt(0.0);
			addVo.setOthClctTrafAmt(0.0);
			addVo.setOthClctAmt(0.0);
			addVo.setFinsubsAmt(0.0);
			addVo.setFinsubsTrafAmt(0.0);
			addVo.setClctTime(new Date());
			addVo.setEmpClctParaval(0.012);
			addVo.setEmpIntoParaval(1.0);
			addVo.setEmpClctBasstd(0.0);
			addVo.setEmpArrAmt(5600.0);
			addVo.setAccrym(addVo.getStartYM());
			addVo.setClctSumamt(addVo.getBaseSum());
			addVo.setCashymEnd(addVo.getEndYM());
			addVo.setCashymBegn(addVo.getStartYM());
			addVo.setClctTime(new Date());
			addVo.setCrteTime(new Date());
			addVo.setPsnWag(6000.0);
			addVo.setPsnClctBasstd(addVo.getPsnWag());
			addVo.setPsnType("11");
			String rid=zengtrPaymentDetailsWriteMapper.executeForSequence("SEQ_RID");
			addVo.setRid(rid);
			addVo.setLatefee(0.0);
			addVo.setPsnClctParaval(0.012);

		}
		System.out.println("最终数据2："+uebmiClctDetlDAddVoList);
		//给第三个list补全数据
		for (UebmiClctDetlExtDAddVo addVo : uebmiClctDetlExtDAddVoList) {
			String psnclctdetlid=zengtrPaymentDetailsWriteMapper.executeForSequence("PSN_INSU_MGT_EID");
			addVo.setPsnClctExtId(psnclctdetlid);
			String empClctDetId=zengtrPaymentDetailsWriteMapper.executeForSequence("PSN_INSU_MGT_EID");
			addVo.setEmpClctDetId(empClctDetId);
			addVo.setPsnClctDetlId(zengtrPaymentDetailsWriteMapper.executeForSequence("PSN_INSU_MGT_EID"));
			addVo.setFinc("empArrIntoPoolareaAmt");
			addVo.setPoolarea("2100");
			addVo.setCrteTime(new Date());
			addVo.setAccrym(addVo.getStartYM());
			addVo.setCashymEnd(addVo.getEndYM());
			addVo.setCashymBegn(addVo.getStartYM());
			addVo.setRevsFlag("Z");
			addVo.setClctFlag("0");
			addVo.setClctstd(addVo.getBaseSum());
			addVo.setOptTime(new Date());
			addVo.setInte(0.0);
			addVo.setPsnWag(6000.0);
			addVo.setPsnType("11");
			addVo.setArrAmt(520.0);
			String rid=zengtrPaymentDetailsWriteMapper.executeForSequence("SEQ_RID");
			addVo.setRid(rid);
			addVo.setLatefee(0.0);
		}
		System.out.println("最终数据3："+uebmiClctDetlDAddVoList);
		zengtrPaymentDetailsWriteMapper.insertRecordingData1(uebmiCrtfRcdCAddVoList);
		zengtrPaymentDetailsWriteMapper.insertRecordingData2(uebmiClctDetlDAddVoList);
		zengtrPaymentDetailsWriteMapper.insertRecordingData3(uebmiClctDetlExtDAddVoList);
		List<RecordingDetailsVo> list=new ArrayList<>();
		for(int i=0;i<uebmiClctDetlDAddVoList.size();i++){
			RecordingDetailsVo recordingDetailsVo=new RecordingDetailsVo();
			recordingDetailsVo.setPsnNo(uebmiCrtfRcdCAddVoList.get(i).getPsnNo());
			recordingDetailsVo.setAccrym(uebmiCrtfRcdCAddVoList.get(i).getAccrym());
			recordingDetailsVo.setInsutype(uebmiCrtfRcdCAddVoList.get(i).getInsutype());
			recordingDetailsVo.setFinc(uebmiClctDetlExtDAddVoList.get(i).getFinc());
			recordingDetailsVo.setSumamt(uebmiCrtfRcdCAddVoList.get(i).getSumamt());
			recordingDetailsVo.setRealSumamt(uebmiCrtfRcdCAddVoList.get(i).getSumamt());
			recordingDetailsVo.setAccFlag(uebmiClctDetlExtDAddVoList.get(i).getClctFlag());
			recordingDetailsVo.setClctFlag(uebmiClctDetlExtDAddVoList.get(i).getClctFlag());
			recordingDetailsVo.setTime(uebmiCrtfRcdCAddVoList.get(i).getUpdtTime());
			recordingDetailsVo.setPsnClctParaval(uebmiClctDetlDAddVoList.get(i).getPsnClctParaval());
			list.add(i,recordingDetailsVo);
		}
		return list;
	}

}

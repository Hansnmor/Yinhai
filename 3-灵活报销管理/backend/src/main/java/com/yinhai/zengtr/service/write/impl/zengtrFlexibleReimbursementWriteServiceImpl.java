package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.zengtr.mapper.write.zengtrFlexibleReimbursementWriteMapper;
import com.yinhai.zengtr.service.write.zengtrFlexibleReimbursementWriteService;
import com.yinhai.zengtr.vo.FlxReimRegInfoDAddVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@NoTransactional
public class zengtrFlexibleReimbursementWriteServiceImpl extends BaseRestService implements zengtrFlexibleReimbursementWriteService {

	@Resource
	private zengtrFlexibleReimbursementWriteMapper zengtrFlexibleReimbursementWriteMapper;

	@Override
	public void insertSubmitList(List<FlxReimRegInfoDAddVo> flxReimRegInfoDAddVos) throws Exception {
		//添加没有的字段
		for (FlxReimRegInfoDAddVo addVo : flxReimRegInfoDAddVos) {
			String mdtrtEvtId=zengtrFlexibleReimbursementWriteMapper.executeForSequence("SEQ_PSID");
			addVo.setMdtrtEvtId(mdtrtEvtId);//借用其他序列号
			addVo.setSetlId(String.valueOf((Integer.parseInt(mdtrtEvtId)+1000)));
			addVo.setValiFlag("1");
			addVo.setUpdtTime(new Date());
			addVo.setCrteTime(new Date());
			addVo.setRid(zengtrFlexibleReimbursementWriteMapper.executeForSequence("SEQ_RID"));
		}
		//在这里进行数据校验
		if(flxReimRegInfoDAddVos.size()>1){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			int flag=0;
			for(int i=0;i<flxReimRegInfoDAddVos.size();i++){
				FlxReimRegInfoDAddVo vo1=flxReimRegInfoDAddVos.get(i);
				for(int j=1;j<flxReimRegInfoDAddVos.size();j++){
					FlxReimRegInfoDAddVo vo2=flxReimRegInfoDAddVos.get(j);
					int begnTime1= Integer.parseInt(sdf.format(vo1.getBegntime()).replaceAll("-",""));
					int endTime1= Integer.parseInt(sdf.format(vo1.getEndtime()).replaceAll("-",""));
					int begnTime2= Integer.parseInt(sdf.format(vo2.getBegntime()).replaceAll("-",""));
					int endTime2= Integer.parseInt(sdf.format(vo2.getEndtime()).replaceAll("-",""));
//					System.out.println("四种时间："+begnTime1+"  "+endTime1+"  "+begnTime2+"  "+endTime2);
					if(vo1.getMedType().equals(vo2.getMedType())&&vo1.getPsnType().equals(vo2.getPsnType())){
						if((begnTime1<endTime2&&begnTime1>begnTime2)||(endTime1>begnTime2&&endTime1<endTime2)){
							flag=1;
							throw new Exception("提交的数据中有同一险种、同一医疗类别时间交叉的数据，请检查！");
						}
					}

				}
			}
			if(flag==0){
				zengtrFlexibleReimbursementWriteMapper.insertSubmitList(flxReimRegInfoDAddVos);
			}
		}else{
			//只有单条数据直接进行插入
			zengtrFlexibleReimbursementWriteMapper.insertSubmitList(flxReimRegInfoDAddVos);
		}
	}
}

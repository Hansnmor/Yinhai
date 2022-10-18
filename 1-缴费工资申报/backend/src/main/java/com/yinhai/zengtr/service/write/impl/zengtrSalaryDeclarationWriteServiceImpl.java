package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.zengtr.service.write.zengtrSalaryDeclarationWriteService;
import com.yinhai.zengtr.vo.PsnWagDclaDQueryVo;
import com.yinhai.zengtr.vo.SaveWagInfoListVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@NoTransactional
public class zengtrSalaryDeclarationWriteServiceImpl  extends BaseRestService implements zengtrSalaryDeclarationWriteService {
	@Resource
	private com.yinhai.zengtr.mapper.write.zengtrSalaryDeclarationWriteMapper zengtrSalaryDeclarationWriteMapper;

	@Resource
	private com.yinhai.zengtr.mapper.read.zengtrSalaryDeclarationReadMapper zengtrSalaryDeclarationReadMapper;

	//判断是否存在旧数据
	@Override
	public void ifExistSalary(JSONArray array) {
		//首先，要判断是否存在相同的psnNo，没有的话就直接存入数据，有的话再进行判断
		for(int i=0;i<array.size();i++){
			System.out.println("第"+(i+1)+"层循环!");
			JSONObject job = array.getJSONObject(i);
			System.out.println("当前数据："+job);

			String psnNo=(String)job.get("psnNo");
			String startYM = (String) job.get("startYM");
			String endYM = (String) job.get("endYM");
			double wag= Double.parseDouble(job.get("wag").toString());

			List<PsnWagDclaDQueryVo> psnWagDclaDQueryVoList=zengtrSalaryDeclarationReadMapper.queryPsnWagInfoByPsnNo(psnNo);
			System.out.println("根据psnNo查出来的数据："+psnWagDclaDQueryVoList);
			if(!ValidateUtil.isEmpty(psnWagDclaDQueryVoList)){
				System.out.println("不为空");
				//不为空则去判断是否已经有工资了
				for (PsnWagDclaDQueryVo psnWagDclaDQueryVo : psnWagDclaDQueryVoList) {
					System.out.println("ppsnWagDclaDQueryVosn:"+psnWagDclaDQueryVo);
					String ym = psnWagDclaDQueryVo.getYm();
					if(psnWagDclaDQueryVo.getPsnNo().equals(psnNo)){
						//判断列表中的年月是否在startYM和endYM之间
						if(Integer.parseInt(ym)>Integer.parseInt(startYM)&&Integer.parseInt(ym)<Integer.parseInt(endYM)){
							System.out.println("存在之间的年月");
							if(wag!=psnWagDclaDQueryVo.getWag()){
								System.out.println("比较工资");
//								删除原本的数据
								System.out.println("删除原本的数据");
//								zengtrSalaryDeclarationWriteMapper.deleteOldWag(psnNo);
							}
						}
					}
				}
				//删除完毕，接着进行按月份增加数据的操作
				//首先要计算有几个月
				int tempyear=Integer.parseInt(endYM.substring(0,4))-Integer.parseInt(startYM.substring(0,4));
				int tempMonth=Integer.parseInt(endYM.substring(4))-Integer.parseInt(startYM.substring(4));
				int between=tempyear*12+tempMonth;//一共差这么多月
				System.out.println("月份差值为："+between);
				//写入数据
				int nowMonth=(Integer.parseInt(((String) job.get("startYM")).substring(4)));
				String insertYM=startYM.substring(0,4)+ (Integer.parseInt(startYM.substring(4)) < 10 ? ("0" + Integer.parseInt(startYM.substring(4))) : startYM.substring(4));
				for(int j=0;j<between+1;j++){
					System.out.println("当前月份："+nowMonth);
					job.put("nowYM",insertYM);//将当前月份放进去
					//插入其他非空数据
					String psnWagId=zengtrSalaryDeclarationWriteMapper.executeForSequence("");
					job.put("psnWagId","11344");
					job.put("insutypeRetrFlag","1");
					job.put("insuOrg","2100");
					String psnInsuRltsId=zengtrSalaryDeclarationWriteMapper.executeForSequence("PSN_INSU_RLTS_ID");
					job.put("psnInsuRltsId",psnInsuRltsId);
					job.put("optins","1001");
					job.put("opter","1");
					Date date=new Date();
					SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					job.put("optTime",sdf.format(date));
					job.put("crteTime",sdf.format(date));
					job.put("updtTime",sdf.format(date));
					job.put("wagDclaMgtEid","431000");
					job.put("wagDclaHisEid","431000");
//					String js= JSON.toJSONString(job, SerializerFeature.WriteClassName);

					System.out.println("将要存放的数据："+job);
//					List<Map<Object, Object>> list=Transfer(job);
//					zengtrSalaryDeclarationWriteMapper.insertNewWagInfo(job);

					//存放完数据之后更新月份和年份
					if(++nowMonth>12){
						nowMonth=1;
						insertYM= String.valueOf(Integer.parseInt(startYM.substring(0,4))+1)+(nowMonth<10?"0"+nowMonth:String.valueOf(nowMonth));
					}
					System.out.println("添加完"+(i+1)+"条数据,此时月份为："+nowMonth);

				}
			}


		}

	}

	@Override
	public void ifExistSalary(List<SaveWagInfoListVo> saveWagInfoListVoList) {
		for (SaveWagInfoListVo vo : saveWagInfoListVoList) {
			System.out.println("当前数据："+vo);
			String psnNo = vo.getPsnNo();
			String startYM = vo.getStartYM();
			String endYM = vo.getEndYM();
			String insutype=vo.getInsutype();
			double wag= vo.getWag();

			boolean flag=false;//判断是否执行更新

			List<PsnWagDclaDQueryVo> psnWagDclaDQueryVoList=zengtrSalaryDeclarationReadMapper.queryPsnWagInfoByPsnNo(psnNo);
			System.out.println("根据psnNo查出来的数据："+psnWagDclaDQueryVoList);
			if(!ValidateUtil.isEmpty(psnWagDclaDQueryVoList)){
				System.out.println("不为空");
				//不为空则去判断是否已经有工资了
				for (PsnWagDclaDQueryVo psnWagDclaDQueryVo : psnWagDclaDQueryVoList) {
					System.out.println("ppsnWagDclaDQueryVosn:"+psnWagDclaDQueryVo);
					String ym = psnWagDclaDQueryVo.getYm();
					if(psnWagDclaDQueryVo.getPsnNo().equals(psnNo)){
						//判断列表中的年月是否在startYM和endYM之间,且险种能对应上
						if(Integer.parseInt(ym)>Integer.parseInt(startYM)&&Integer.parseInt(ym)<Integer.parseInt(endYM)&&insutype.equals(psnWagDclaDQueryVo.getInsutype())){
							System.out.println("存在之间的年月");
							if(wag!=psnWagDclaDQueryVo.getWag()){
								System.out.println("比较工资");
//								删除原本的数据
								System.out.println("删除原本的数据");
								zengtrSalaryDeclarationWriteMapper.deleteOldWag(psnNo,ym);
								//如果删除，才能执行更新
								flag=true;

							}
						}
					}
				}
				if(flag){
					//删除完毕，接着进行按月份增加数据的操作
					//首先要计算有几个月
					int tempyear=Integer.parseInt(endYM.substring(0,4))-Integer.parseInt(startYM.substring(0,4));
					int tempMonth=Integer.parseInt(endYM.substring(4))-Integer.parseInt(startYM.substring(4));
					int between=tempyear*12+tempMonth;//一共差这么多月
					System.out.println("月份差值为："+between);
					//写入数据
					int nowMonth=(Integer.parseInt((vo.getStartYM()).substring(4)));
					String insertYM=startYM.substring(0,4)+ (Integer.parseInt(startYM.substring(4)) < 10 ? ("0" + Integer.parseInt(startYM.substring(4))) : startYM.substring(4));
					for(int j=0;j<between+1;j++){
						System.out.println("当前月份："+nowMonth);

						vo.setYm(insertYM);//将当前月份放进去
						//插入其他非空数据
//					String psnWagId=zengtrSalaryDeclarationWriteMapper.executeForSequence("");
						vo.setPsnWagId("11344");
						vo.setInsutypeRetrFlag("1");
						vo.setInsuOrg("2100");
						String psnInsuRltsId=zengtrSalaryDeclarationWriteMapper.executeForSequence("PSN_INSU_RLTS_ID");
						vo.setPsnInsuRltsId(psnInsuRltsId);
						vo.setOptins("1001");
						vo.setOpter("1");
						Date date=new Date();
//					SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						vo.setOptTime(date);
						vo.setCrteTime(date);
						vo.setUpdtTime(date);
						vo.setWagDclaMgtEid("431000");
						vo.setWagDclaHisEid("431000");
						vo.setPsnClctstd(vo.getBase());

						System.out.println("将要存放的数据："+vo);
						zengtrSalaryDeclarationWriteMapper.insertNewWagInfo(vo);

						//存放完数据之后更新月份和年份
						if(nowMonth==12){
							nowMonth=1;
							insertYM= Integer.parseInt(startYM.substring(0, 4)) + 1 +(nowMonth<10?"0"+nowMonth:String.valueOf(nowMonth));
						}else{
							nowMonth++;
							insertYM=Integer.parseInt(startYM.substring(0, 4))  +(nowMonth<10?"0"+(nowMonth):String.valueOf(nowMonth));
						}
						System.out.println("添加完1条数据,此时月份为："+nowMonth);

					}
				}
			}
		}

	}

}

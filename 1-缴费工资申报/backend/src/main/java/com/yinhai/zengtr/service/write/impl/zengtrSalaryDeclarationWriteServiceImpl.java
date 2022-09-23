package com.yinhai.zengtr.service.write.impl;

import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.zengtr.mapper.read.zengtrSalaryDeclarationReadMapper;
import com.yinhai.zengtr.mapper.write.zengtrSalaryDeclarationWriteMapper;
import com.yinhai.zengtr.service.write.zengtrSalaryDeclarationWriteService;
import com.yinhai.zengtr.vo.PsnWagDclaDQueryVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
			JSONObject job = array.getJSONObject(i);
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
								//按月份增加数据
								//首先要计算有几个月
								int tempyear=Integer.parseInt(endYM.substring(0,4))-Integer.parseInt(startYM.substring(0,4));
								int tempMonth=Integer.parseInt(endYM.substring(4))-Integer.parseInt(startYM.substring(4));
								int between=tempyear*12+tempMonth;//一共差这么多月
								//写入数据
								for(int j=0;j<between;j++){
									int nowMonth=(Integer.parseInt(((String) job.get("startYM")).substring(4)));
									System.out.println("当前月份："+nowMonth);
//									zengtrSalaryDeclarationWriteMapper.insertNewWagInfo();

								}

							}
						}
					}
				}
			}


		}

	}

}

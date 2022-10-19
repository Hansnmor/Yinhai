package com.yinhai.zengtr.service.write;

import com.yinhai.zengtr.vo.SaveWagInfoListVo;
import net.sf.json.JSONArray;

import java.util.List;

public interface zengtrSalaryDeclarationWriteService {


	void ifExistSalary(List<SaveWagInfoListVo> saveWagInfoListVoList);
}

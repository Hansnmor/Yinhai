package com.yinhai.zengtr.vo;

import com.yinhai.zengtr.utils.excel.ExcelExport;
import com.yinhai.zengtr.utils.excel.ExcelExport;

import java.io.Serializable;
import java.util.Date;

public class TemplateVo implements Serializable {
	@ExcelExport(value = "人员编号")
	private String psnNo;

	@ExcelExport(value = "姓名")
	private String psnName;

	@ExcelExport(value = "证件号码" )
	private String certno;

	@ExcelExport(value = "性别",kv = "1-男;2-女")
	private String gend;

	@ExcelExport(value = "参保险种", kv="320-公务员医疗补助;310-职工基本医疗保险;391-城镇居民基本医疗保险;" +
			"340-离休人员医疗保障;330-大额医疗费用补助;380-新型农村合作医疗;360-老红军医疗保障;392-城乡居民大病医疗保险;" +
			"510-生育保险;390-城乡居民基本医疗保险;350-一至六级残废军人医疗补助")
	private String insutype;

	@ExcelExport(value = "参保状态",kv="0-未参保;1-正常参保;2-暂停参保;3-终止参保")
	private String  psnInsuStas;


	@ExcelExport(value = "开始年月")
	private String  startYM;

	@ExcelExport(value = "结束年月")
	private String  endYM;

	@ExcelExport(value = "工资")
	private Double wag;

	@ExcelExport(value = "基数")
	private Double psnClctstd;

}

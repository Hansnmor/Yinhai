package com.yinhai.zengtr.vo;

import java.io.Serializable;

//验证成功列表的vo
public class ValidatedListVo implements Serializable {
	//单位编号
	private String empNo;
	//参保险种
	private String insutype;
	//征缴规则编码
	private String clctRuleTypeCodg;
	//开始年月
	private String startYM;
	//结束年月
	private String endYM;
	//缴费类型
	private String clctType;
	//缴费基数总额
	private Double baseSum;

	//每月缴费基数
	private Double clctBase;

	@Override
	public String toString() {
		return "ValidatedListVo{" +
				"empNo='" + empNo + '\'' +
				", insutype='" + insutype + '\'' +
				", clctRuleTypeCodg='" + clctRuleTypeCodg + '\'' +
				", startYM='" + startYM + '\'' +
				", endYM='" + endYM + '\'' +
				", clctType='" + clctType + '\'' +
				", baseSum=" + baseSum +
				", clctBase=" + clctBase +
				'}';
	}

	public Double getClctBase() {
		return clctBase;
	}

	public void setClctBase(Double clctBase) {
		this.clctBase = clctBase;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getInsutype() {
		return insutype;
	}

	public void setInsutype(String insutype) {
		this.insutype = insutype;
	}

	public String getClctRuleTypeCodg() {
		return clctRuleTypeCodg;
	}

	public void setClctRuleTypeCodg(String clctRuleTypeCodg) {
		this.clctRuleTypeCodg = clctRuleTypeCodg;
	}

	public String getStartYM() {
		return startYM;
	}

	public void setStartYM(String startYM) {
		this.startYM = startYM;
	}

	public String getEndYM() {
		return endYM;
	}

	public void setEndYM(String endYM) {
		this.endYM = endYM;
	}

	public String getClctType() {
		return clctType;
	}

	public void setClctType(String clctType) {
		this.clctType = clctType;
	}

	public Double getBaseSum() {
		return baseSum;
	}

	public void setBaseSum(Double baseSum) {
		this.baseSum = baseSum;
	}
}

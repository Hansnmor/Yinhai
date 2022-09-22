package com.yinhai.zengtr.vo;

import java.io.Serializable;
import java.util.Date;

public class PsnNormalInfoQueryVo implements Serializable {
	//人员编号
	private String psnNo;

	//人员姓名
	private String psnName;
	//证件号码
	private String certno;
	//性别
	private String gend;
	//险种类型
	private String insutype;
	//人员参保状态
	private String psnInsuStas;
	//本系统首次参保日期
	private Date psnInsuDate;

	@Override
	public String toString() {
		return "PsnNormalInfoQueryVo{" +
				"psnNo='" + psnNo + '\'' +
				", psnName='" + psnName + '\'' +
				", certno='" + certno + '\'' +
				", gend='" + gend + '\'' +
				", insutype='" + insutype + '\'' +
				", psnInsuStas='" + psnInsuStas + '\'' +
				", psnInsuDate=" + psnInsuDate +
				'}';
	}

	public Date getPsnInsuDate() {
		return psnInsuDate;
	}

	public void setPsnInsuDate(Date psnInsuDate) {
		this.psnInsuDate = psnInsuDate;
	}

	public String getPsnNo() {
		return psnNo;
	}

	public void setPsnNo(String psnNo) {
		this.psnNo = psnNo;
	}

	public String getPsnName() {
		return psnName;
	}

	public void setPsnName(String psnName) {
		this.psnName = psnName;
	}

	public String getCertno() {
		return certno;
	}

	public void setCertno(String certno) {
		this.certno = certno;
	}

	public String getGend() {
		return gend;
	}

	public void setGend(String gend) {
		this.gend = gend;
	}

	public String getInsutype() {
		return insutype;
	}

	public void setInsutype(String insutype) {
		this.insutype = insutype;
	}

	public String getPsnInsuStas() {
		return psnInsuStas;
	}

	public void setPsnInsuStas(String psnInsuStas) {
		this.psnInsuStas = psnInsuStas;
	}
}

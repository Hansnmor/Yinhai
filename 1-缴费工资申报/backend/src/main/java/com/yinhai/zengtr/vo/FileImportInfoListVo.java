package com.yinhai.zengtr.vo;

import com.yinhai.zengtr.utils.excel.ExcelImport;

import java.io.Serializable;
import java.util.Date;

public class FileImportInfoListVo implements Serializable {
	//行号
	private int rowNum;
	//表格原始数据
	private String rowData;
	//错误提示
	private String rowTips;

	@ExcelImport(value = "人员编号",required = true)
	private String psnNo;

	@ExcelImport(value = "姓名",required = true)
	private String psnName;

	@ExcelImport(value = "证件号码",maxLength = 18, required = true )
	private String certno;

	@ExcelImport(value = "性别",kv = "1-男;2-女", required = true)
	private String gend;

	@ExcelImport(value = "险种类型",required = true)
	private String insutype;

	@ExcelImport(value = "参保状态",required = true)
	private String  psnInsuStas;


	@ExcelImport(value = "开始年月",required = true)
	private String  startYM;

	@ExcelImport(value = "结束年月",required = true)
	private String  endYM;

	@ExcelImport(value = "工资",required = true)
	private Double wag;

	@ExcelImport(value = "基数", required = true)
	private Double psnClctstd;

	@Override
	public String toString() {
		return "FileImportInfoListVo{" +
				"rowNum=" + rowNum +
				", rowData='" + rowData + '\'' +
				", rowTips='" + rowTips + '\'' +
				", psnNo='" + psnNo + '\'' +
				", psnName='" + psnName + '\'' +
				", certno='" + certno + '\'' +
				", gend='" + gend + '\'' +
				", insutype='" + insutype + '\'' +
				", psnInsuStas='" + psnInsuStas + '\'' +
				", startYM='" + startYM + '\'' +
				", endYM='" + endYM + '\'' +
				", wag=" + wag +
				", psnClctstd=" + psnClctstd +
				'}';
	}

	public Double getPsnClctstd() {
		return psnClctstd;
	}

	public void setPsnClctstd(Double psnClctstd) {
		this.psnClctstd = psnClctstd;
	}


	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getRowData() {
		return rowData;
	}

	public void setRowData(String rowData) {
		this.rowData = rowData;
	}

	public String getRowTips() {
		return rowTips;
	}

	public void setRowTips(String rowTips) {
		this.rowTips = rowTips;
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

	public Double getWag() {
		return wag;
	}

	public void setWag(Double wag) {
		this.wag = wag;
	}
}

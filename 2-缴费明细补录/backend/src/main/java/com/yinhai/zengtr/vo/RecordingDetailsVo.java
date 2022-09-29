package com.yinhai.zengtr.vo;

import java.io.Serializable;
import java.util.Date;

//用于产给前端的补录明细vo
public class RecordingDetailsVo implements Serializable {
	private String psnNo;

	//贷款所属期
	private String accrym;

	private String insutype;

	//筹资项目
	private String finc;

	//基准缴费比例
	private Double psnClctParaval;

	//应处理金额
	private Double sumamt;

	//实处理金额
	private Double realSumamt;

	//到账标志
	private String clctFlag;

	//账户处理标志
	private String accFlag;

	//收入日期
	private Date time;

	@Override
	public String toString() {
		return "RecordingDetailsVo{" +
				"psnNo='" + psnNo + '\'' +
				", accrym='" + accrym + '\'' +
				", insutype='" + insutype + '\'' +
				", finc='" + finc + '\'' +
				", psnClctParaval='" + psnClctParaval + '\'' +
				", sumamt='" + sumamt + '\'' +
				", realSumamt='" + realSumamt + '\'' +
				", clctFlag='" + clctFlag + '\'' +
				", accFlag='" + accFlag + '\'' +
				", time='" + time + '\'' +
				'}';
	}

	public String getPsnNo() {
		return psnNo;
	}

	public void setPsnNo(String psnNo) {
		this.psnNo = psnNo;
	}

	public String getAccrym() {
		return accrym;
	}

	public void setAccrym(String accrym) {
		this.accrym = accrym;
	}

	public String getInsutype() {
		return insutype;
	}

	public void setInsutype(String insutype) {
		this.insutype = insutype;
	}

	public String getFinc() {
		return finc;
	}

	public void setFinc(String finc) {
		this.finc = finc;
	}

	public Double getPsnClctParaval() {
		return psnClctParaval;
	}

	public void setPsnClctParaval(Double psnClctParaval) {
		this.psnClctParaval = psnClctParaval;
	}

	public Double getSumamt() {
		return sumamt;
	}

	public void setSumamt(Double sumamt) {
		this.sumamt = sumamt;
	}

	public Double getRealSumamt() {
		return realSumamt;
	}

	public void setRealSumamt(Double realSumamt) {
		this.realSumamt = realSumamt;
	}

	public String getClctFlag() {
		return clctFlag;
	}

	public void setClctFlag(String clctFlag) {
		this.clctFlag = clctFlag;
	}

	public String getAccFlag() {
		return accFlag;
	}

	public void setAccFlag(String accFlag) {
		this.accFlag = accFlag;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}

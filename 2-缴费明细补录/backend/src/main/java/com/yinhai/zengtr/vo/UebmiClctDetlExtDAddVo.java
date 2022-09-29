package com.yinhai.zengtr.vo;

import java.io.Serializable;
import java.util.Date;

/**
* (UebmiClctDetlExtD)实体类
*
* @author default
* @since 2022-09-29 15:45:03
*/
public class UebmiClctDetlExtDAddVo implements Serializable {

    private static final long serialVersionUID = -94680926220865161L;




    //征缴规则编码
    private String clctRuleTypeCodg;
    //开始年月
    private String startYM;
    //结束年月
    private String endYM;

    //缴费基数总额
    private Double baseSum;

    //每月缴费基数
    private Double clctBase;

    private String rid;
            //个人缴费扩展ID
    private String psnClctExtId;
            //单位缴费明细ID
    private String empClctDetId;

    private String insutype;
            //个人缴费明细ID
    private String psnClctDetlId;
            //农民工标识
    private String peawkrLogo;
            //创建经办机构
    private String crteOptins;
            //参保身份
    private String insuIdet;
            //筹资项目
    private String finc;
            //创建人
    private String crter;
            //创建人姓名
    private String crterName;
            //创建时间
    private Date crteTime;
            //单位编号
    private String empNo;
            //到账人经办人
    private String arvler;
            //电子税票号码
    private String elecTaxrptNo;
            //定额征缴标志
    private String quotClctFlag;
            //对应费款所属期
    private String accrym;
            //核销标志
    private String revsFlag;
            //划拨经办人
    private String trafer;
            //划拨时间
    private Date trafTime;
            //划入个人账户金额
    private Double intoAcctAmt;
            //建账人经办人
    private String accter;
            //缴费标识
    private String clctFlag;
            //缴费参数值
    private String clctParaval;
            //缴费基数
    private Double clctstd;
            //缴费类型
    private String clctType;
            //缴费时间
    private Date clctTime;
            //截止费款所属期
    private String cashymEnd;
            //经办机构
    private String optins;
            //经办人
    private String opter;
            //经办人姓名
    private String opterName;
            //经办时间
    private Date optTime;
            //利息
    private Double inte;
            //起始费款所属期
    private String cashymBegn;

    private String psnNo;
            //人员工资
    private Double psnWag;
            //人员类别
    private String psnType;
            //人员身份
    private String psnIdet;
            //入国库时间
    private Date intsuryTime;
            //上解时间
    private Date sbmtTime;
            //申报周期
    private String dclaPrd;
            //实缴金额
    private Double arrAmt;
            //统筹区
    private String poolarea;
            //险种离退休标识
    private String retrFlag;
            //征集通知单编号
    private String clctBillId;
            //滞纳金
    private Double latefee;
            //主管税务部门代码
    private String taxdeptCode;
            //经办机构编号
    private String optinsNo;
            //更新时间
    private Date updtTime;

    @Override
    public String toString() {
        return "UebmiClctDetlExtDAddVo{" +
                "clctRuleTypeCodg='" + clctRuleTypeCodg + '\'' +
                ", startYM='" + startYM + '\'' +
                ", endYM='" + endYM + '\'' +
                ", baseSum=" + baseSum +
                ", clctBase=" + clctBase +
                ", rid='" + rid + '\'' +
                ", psnClctExtId='" + psnClctExtId + '\'' +
                ", empClctDetId='" + empClctDetId + '\'' +
                ", insutype='" + insutype + '\'' +
                ", psnClctDetlId='" + psnClctDetlId + '\'' +
                ", peawkrLogo='" + peawkrLogo + '\'' +
                ", crteOptins='" + crteOptins + '\'' +
                ", insuIdet='" + insuIdet + '\'' +
                ", finc='" + finc + '\'' +
                ", crter='" + crter + '\'' +
                ", crterName='" + crterName + '\'' +
                ", crteTime=" + crteTime +
                ", empNo='" + empNo + '\'' +
                ", arvler='" + arvler + '\'' +
                ", elecTaxrptNo='" + elecTaxrptNo + '\'' +
                ", quotClctFlag='" + quotClctFlag + '\'' +
                ", accrym='" + accrym + '\'' +
                ", revsFlag='" + revsFlag + '\'' +
                ", trafer='" + trafer + '\'' +
                ", trafTime=" + trafTime +
                ", intoAcctAmt=" + intoAcctAmt +
                ", accter='" + accter + '\'' +
                ", clctFlag='" + clctFlag + '\'' +
                ", clctParaval='" + clctParaval + '\'' +
                ", clctstd=" + clctstd +
                ", clctType='" + clctType + '\'' +
                ", clctTime=" + clctTime +
                ", cashymEnd='" + cashymEnd + '\'' +
                ", optins='" + optins + '\'' +
                ", opter='" + opter + '\'' +
                ", opterName='" + opterName + '\'' +
                ", optTime=" + optTime +
                ", inte=" + inte +
                ", cashymBegn='" + cashymBegn + '\'' +
                ", psnNo='" + psnNo + '\'' +
                ", psnWag=" + psnWag +
                ", psnType='" + psnType + '\'' +
                ", psnIdet='" + psnIdet + '\'' +
                ", intsuryTime=" + intsuryTime +
                ", sbmtTime=" + sbmtTime +
                ", dclaPrd='" + dclaPrd + '\'' +
                ", arrAmt=" + arrAmt +
                ", poolarea='" + poolarea + '\'' +
                ", retrFlag='" + retrFlag + '\'' +
                ", clctBillId='" + clctBillId + '\'' +
                ", latefee=" + latefee +
                ", taxdeptCode='" + taxdeptCode + '\'' +
                ", optinsNo='" + optinsNo + '\'' +
                ", updtTime=" + updtTime +
                '}';
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

    public Double getBaseSum() {
        return baseSum;
    }

    public void setBaseSum(Double baseSum) {
        this.baseSum = baseSum;
    }

    public Double getClctBase() {
        return clctBase;
    }

    public void setClctBase(Double clctBase) {
        this.clctBase = clctBase;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getPsnClctExtId() {
return psnClctExtId;
}

public void setPsnClctExtId(String psnClctExtId) {
this.psnClctExtId = psnClctExtId;
}

public String getEmpClctDetId() {
return empClctDetId;
}

public void setEmpClctDetId(String empClctDetId) {
this.empClctDetId = empClctDetId;
}

public String getInsutype() {
return insutype;
}

public void setInsutype(String insutype) {
this.insutype = insutype;
}

public String getPsnClctDetlId() {
return psnClctDetlId;
}

public void setPsnClctDetlId(String psnClctDetlId) {
this.psnClctDetlId = psnClctDetlId;
}

public String getPeawkrLogo() {
return peawkrLogo;
}

public void setPeawkrLogo(String peawkrLogo) {
this.peawkrLogo = peawkrLogo;
}

public String getCrteOptins() {
return crteOptins;
}

public void setCrteOptins(String crteOptins) {
this.crteOptins = crteOptins;
}

public String getInsuIdet() {
return insuIdet;
}

public void setInsuIdet(String insuIdet) {
this.insuIdet = insuIdet;
}

public String getFinc() {
return finc;
}

public void setFinc(String finc) {
this.finc = finc;
}

public String getCrter() {
return crter;
}

public void setCrter(String crter) {
this.crter = crter;
}

public String getCrterName() {
return crterName;
}

public void setCrterName(String crterName) {
this.crterName = crterName;
}

public Date getCrteTime() {
return crteTime;
}

public void setCrteTime(Date crteTime) {
this.crteTime = crteTime;
}

public String getEmpNo() {
return empNo;
}

public void setEmpNo(String empNo) {
this.empNo = empNo;
}

public String getArvler() {
return arvler;
}

public void setArvler(String arvler) {
this.arvler = arvler;
}

public String getElecTaxrptNo() {
return elecTaxrptNo;
}

public void setElecTaxrptNo(String elecTaxrptNo) {
this.elecTaxrptNo = elecTaxrptNo;
}

public String getQuotClctFlag() {
return quotClctFlag;
}

public void setQuotClctFlag(String quotClctFlag) {
this.quotClctFlag = quotClctFlag;
}

public String getAccrym() {
return accrym;
}

public void setAccrym(String accrym) {
this.accrym = accrym;
}

public String getRevsFlag() {
return revsFlag;
}

public void setRevsFlag(String revsFlag) {
this.revsFlag = revsFlag;
}

public String getTrafer() {
return trafer;
}

public void setTrafer(String trafer) {
this.trafer = trafer;
}

public Date getTrafTime() {
return trafTime;
}

public void setTrafTime(Date trafTime) {
this.trafTime = trafTime;
}

public Double getIntoAcctAmt() {
return intoAcctAmt;
}

public void setIntoAcctAmt(Double intoAcctAmt) {
this.intoAcctAmt = intoAcctAmt;
}

public String getAccter() {
return accter;
}

public void setAccter(String accter) {
this.accter = accter;
}

public String getClctFlag() {
return clctFlag;
}

public void setClctFlag(String clctFlag) {
this.clctFlag = clctFlag;
}

public String getClctParaval() {
return clctParaval;
}

public void setClctParaval(String clctParaval) {
this.clctParaval = clctParaval;
}

public Double getClctstd() {
return clctstd;
}

public void setClctstd(Double clctstd) {
this.clctstd = clctstd;
}

public String getClctType() {
return clctType;
}

public void setClctType(String clctType) {
this.clctType = clctType;
}

public Date getClctTime() {
return clctTime;
}

public void setClctTime(Date clctTime) {
this.clctTime = clctTime;
}

public String getCashymEnd() {
return cashymEnd;
}

public void setCashymEnd(String cashymEnd) {
this.cashymEnd = cashymEnd;
}

public String getOptins() {
return optins;
}

public void setOptins(String optins) {
this.optins = optins;
}

public String getOpter() {
return opter;
}

public void setOpter(String opter) {
this.opter = opter;
}

public String getOpterName() {
return opterName;
}

public void setOpterName(String opterName) {
this.opterName = opterName;
}

public Date getOptTime() {
return optTime;
}

public void setOptTime(Date optTime) {
this.optTime = optTime;
}

public Double getInte() {
return inte;
}

public void setInte(Double inte) {
this.inte = inte;
}

public String getCashymBegn() {
return cashymBegn;
}

public void setCashymBegn(String cashymBegn) {
this.cashymBegn = cashymBegn;
}

public String getPsnNo() {
return psnNo;
}

public void setPsnNo(String psnNo) {
this.psnNo = psnNo;
}

public Double getPsnWag() {
return psnWag;
}

public void setPsnWag(Double psnWag) {
this.psnWag = psnWag;
}

public String getPsnType() {
return psnType;
}

public void setPsnType(String psnType) {
this.psnType = psnType;
}

public String getPsnIdet() {
return psnIdet;
}

public void setPsnIdet(String psnIdet) {
this.psnIdet = psnIdet;
}

public Date getIntsuryTime() {
return intsuryTime;
}

public void setIntsuryTime(Date intsuryTime) {
this.intsuryTime = intsuryTime;
}

public Date getSbmtTime() {
return sbmtTime;
}

public void setSbmtTime(Date sbmtTime) {
this.sbmtTime = sbmtTime;
}

public String getDclaPrd() {
return dclaPrd;
}

public void setDclaPrd(String dclaPrd) {
this.dclaPrd = dclaPrd;
}

public Double getArrAmt() {
return arrAmt;
}

public void setArrAmt(Double arrAmt) {
this.arrAmt = arrAmt;
}

public String getPoolarea() {
return poolarea;
}

public void setPoolarea(String poolarea) {
this.poolarea = poolarea;
}

public String getRetrFlag() {
return retrFlag;
}

public void setRetrFlag(String retrFlag) {
this.retrFlag = retrFlag;
}

public String getClctBillId() {
return clctBillId;
}

public void setClctBillId(String clctBillId) {
this.clctBillId = clctBillId;
}

public Double getLatefee() {
return latefee;
}

public void setLatefee(Double latefee) {
this.latefee = latefee;
}

public String getTaxdeptCode() {
return taxdeptCode;
}

public void setTaxdeptCode(String taxdeptCode) {
this.taxdeptCode = taxdeptCode;
}

public String getOptinsNo() {
return optinsNo;
}

public void setOptinsNo(String optinsNo) {
this.optinsNo = optinsNo;
}

public Date getUpdtTime() {
return updtTime;
}

public void setUpdtTime(Date updtTime) {
this.updtTime = updtTime;
}

}

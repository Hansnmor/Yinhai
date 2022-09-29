package com.yinhai.zengtr.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (UebmiClctDetlD)实体类
*
* @author default
* @since 2022-09-29 09:41:46
*/
public class UebmiClctDetlDQueryVo implements Serializable {

    private static final long serialVersionUID = -23255195595911278L;
            //个人缴费明细ID
    private String psnClctDetlId;
            //单位缴费明细ID
    private String empClctDetId;
            //单位实缴划入个人账户金额
    private Double empArrIntoAcctAmt;
            //个人缴费划入个人账户金额
    private Double psnClctIntoAcctAmt;
            //其它缴费划拨金额
    private Double othClctTrafAmt;
            //其它缴费金额
    private Double othClctAmt;
            //创建经办机构
    private String crteOptins;
            //财政补助划拨金额
    private Double finsubsTrafAmt;
            //财政补助金额
    private Double finsubsAmt;

    private String insutype;
            //参保身份
    private String insuIdet;
            //创建人
    private String crter;
            //创建人姓名
    private String crterName;
            //创建时间
    private Date crteTime;
            //单位编号
    private String empNo;
            //单位缴费比例或定额标准
    private Double empClctParaval;
            //单位缴费划入个人账户比例或定额标准
    private Double empIntoParaval;
            //单位缴费基数
    private Double empClctBasstd;
            //单位实缴金额
    private Double empArrAmt;
            //到账人经办人
    private String arvler;
            //电子税票号码
    private String elecTaxrptNo;
            //定额征缴标志
    private String quotClctFlag;
            //对应费款所属期
    private String accrym;
            //个人缴费比例或定额标准
    private Double psnClctParaval;
            //个人缴费划入个人账户比例或定额标准
    private Double psnIntoParaval;
            //个人实缴金额
    private Double psnArrAmt;
            //核销标志
    private String revsFlag;
            //划拨经办人
    private String trafer;
            //划拨时间
    private Date trafTime;
            //划拨总金额
    private Double trafSumamt;
            //建账人经办人
    private String accter;
            //缴费标识
    private String clctFlag;
            //缴费类型
    private String clctType;
            //缴费时间
    private Date clctTime;
            //缴费总金额
    private Double clctSumamt;
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
            //农民工标志
    private String peawkrFlag;
            //起始费款所属期
    private String cashymBegn;

    private String psnNo;
            //人员工资
    private Double psnWag;
            //人员缴费基数
    private Double psnClctBasstd;
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
            //统筹区
    private String poolarea;
            //唯一记录号
    private String rid;
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
            //原缴费明细ID
    private String psnClctDetlIdCge;
            //征缴规则类型编码
    private String clctRuleTypeCodg;
            //基数核定规则类型编码
    private String clctstdCrtfRuleCodg;
            //人员参保关系ID
    private String psnInsuRltsId;
            //更新时间
    private String updtTime;
            //计划执行批次号
    private String planBchno;
            //原个人编号
    private String initPsnNo;
            //缴费月数
    private String insuClctMons;

    @Override
    public String toString() {
        return "UebmiClctDetlDQueryVo{" +
                "psnClctDetlId='" + psnClctDetlId + '\'' +
                ", empClctDetId='" + empClctDetId + '\'' +
                ", empArrIntoAcctAmt=" + empArrIntoAcctAmt +
                ", psnClctIntoAcctAmt=" + psnClctIntoAcctAmt +
                ", othClctTrafAmt=" + othClctTrafAmt +
                ", othClctAmt=" + othClctAmt +
                ", crteOptins='" + crteOptins + '\'' +
                ", finsubsTrafAmt=" + finsubsTrafAmt +
                ", finsubsAmt=" + finsubsAmt +
                ", insutype='" + insutype + '\'' +
                ", insuIdet='" + insuIdet + '\'' +
                ", crter='" + crter + '\'' +
                ", crterName='" + crterName + '\'' +
                ", crteTime=" + crteTime +
                ", empNo='" + empNo + '\'' +
                ", empClctParaval=" + empClctParaval +
                ", empIntoParaval=" + empIntoParaval +
                ", empClctBasstd=" + empClctBasstd +
                ", empArrAmt=" + empArrAmt +
                ", arvler='" + arvler + '\'' +
                ", elecTaxrptNo='" + elecTaxrptNo + '\'' +
                ", quotClctFlag='" + quotClctFlag + '\'' +
                ", accrym='" + accrym + '\'' +
                ", psnClctParaval=" + psnClctParaval +
                ", psnIntoParaval=" + psnIntoParaval +
                ", psnArrAmt=" + psnArrAmt +
                ", revsFlag='" + revsFlag + '\'' +
                ", trafer='" + trafer + '\'' +
                ", trafTime=" + trafTime +
                ", trafSumamt=" + trafSumamt +
                ", accter='" + accter + '\'' +
                ", clctFlag='" + clctFlag + '\'' +
                ", clctType='" + clctType + '\'' +
                ", clctTime=" + clctTime +
                ", clctSumamt=" + clctSumamt +
                ", cashymEnd='" + cashymEnd + '\'' +
                ", optins='" + optins + '\'' +
                ", opter='" + opter + '\'' +
                ", opterName='" + opterName + '\'' +
                ", optTime=" + optTime +
                ", inte=" + inte +
                ", peawkrFlag='" + peawkrFlag + '\'' +
                ", cashymBegn='" + cashymBegn + '\'' +
                ", psnNo='" + psnNo + '\'' +
                ", psnWag=" + psnWag +
                ", psnClctBasstd=" + psnClctBasstd +
                ", psnType='" + psnType + '\'' +
                ", psnIdet='" + psnIdet + '\'' +
                ", intsuryTime=" + intsuryTime +
                ", sbmtTime=" + sbmtTime +
                ", dclaPrd='" + dclaPrd + '\'' +
                ", poolarea='" + poolarea + '\'' +
                ", rid='" + rid + '\'' +
                ", retrFlag='" + retrFlag + '\'' +
                ", clctBillId='" + clctBillId + '\'' +
                ", latefee=" + latefee +
                ", taxdeptCode='" + taxdeptCode + '\'' +
                ", optinsNo='" + optinsNo + '\'' +
                ", psnClctDetlIdCge='" + psnClctDetlIdCge + '\'' +
                ", clctRuleTypeCodg='" + clctRuleTypeCodg + '\'' +
                ", clctstdCrtfRuleCodg='" + clctstdCrtfRuleCodg + '\'' +
                ", psnInsuRltsId='" + psnInsuRltsId + '\'' +
                ", updtTime='" + updtTime + '\'' +
                ", planBchno='" + planBchno + '\'' +
                ", initPsnNo='" + initPsnNo + '\'' +
                ", insuClctMons='" + insuClctMons + '\'' +
                '}';
    }

    public String getPsnClctDetlId() {
return psnClctDetlId;
}

public void setPsnClctDetlId(String psnClctDetlId) {
this.psnClctDetlId = psnClctDetlId;
}

public String getEmpClctDetId() {
return empClctDetId;
}

public void setEmpClctDetId(String empClctDetId) {
this.empClctDetId = empClctDetId;
}

public Double getEmpArrIntoAcctAmt() {
return empArrIntoAcctAmt;
}

public void setEmpArrIntoAcctAmt(Double empArrIntoAcctAmt) {
this.empArrIntoAcctAmt = empArrIntoAcctAmt;
}

public Double getPsnClctIntoAcctAmt() {
return psnClctIntoAcctAmt;
}

public void setPsnClctIntoAcctAmt(Double psnClctIntoAcctAmt) {
this.psnClctIntoAcctAmt = psnClctIntoAcctAmt;
}

public Double getOthClctTrafAmt() {
return othClctTrafAmt;
}

public void setOthClctTrafAmt(Double othClctTrafAmt) {
this.othClctTrafAmt = othClctTrafAmt;
}

public Double getOthClctAmt() {
return othClctAmt;
}

public void setOthClctAmt(Double othClctAmt) {
this.othClctAmt = othClctAmt;
}

public String getCrteOptins() {
return crteOptins;
}

public void setCrteOptins(String crteOptins) {
this.crteOptins = crteOptins;
}

public Double getFinsubsTrafAmt() {
return finsubsTrafAmt;
}

public void setFinsubsTrafAmt(Double finsubsTrafAmt) {
this.finsubsTrafAmt = finsubsTrafAmt;
}

public Double getFinsubsAmt() {
return finsubsAmt;
}

public void setFinsubsAmt(Double finsubsAmt) {
this.finsubsAmt = finsubsAmt;
}

public String getInsutype() {
return insutype;
}

public void setInsutype(String insutype) {
this.insutype = insutype;
}

public String getInsuIdet() {
return insuIdet;
}

public void setInsuIdet(String insuIdet) {
this.insuIdet = insuIdet;
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

public Double getEmpClctParaval() {
return empClctParaval;
}

public void setEmpClctParaval(Double empClctParaval) {
this.empClctParaval = empClctParaval;
}

public Double getEmpIntoParaval() {
return empIntoParaval;
}

public void setEmpIntoParaval(Double empIntoParaval) {
this.empIntoParaval = empIntoParaval;
}

public Double getEmpClctBasstd() {
return empClctBasstd;
}

public void setEmpClctBasstd(Double empClctBasstd) {
this.empClctBasstd = empClctBasstd;
}

public Double getEmpArrAmt() {
return empArrAmt;
}

public void setEmpArrAmt(Double empArrAmt) {
this.empArrAmt = empArrAmt;
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

public Double getPsnClctParaval() {
return psnClctParaval;
}

public void setPsnClctParaval(Double psnClctParaval) {
this.psnClctParaval = psnClctParaval;
}

public Double getPsnIntoParaval() {
return psnIntoParaval;
}

public void setPsnIntoParaval(Double psnIntoParaval) {
this.psnIntoParaval = psnIntoParaval;
}

public Double getPsnArrAmt() {
return psnArrAmt;
}

public void setPsnArrAmt(Double psnArrAmt) {
this.psnArrAmt = psnArrAmt;
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

public Double getTrafSumamt() {
return trafSumamt;
}

public void setTrafSumamt(Double trafSumamt) {
this.trafSumamt = trafSumamt;
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

public Double getClctSumamt() {
return clctSumamt;
}

public void setClctSumamt(Double clctSumamt) {
this.clctSumamt = clctSumamt;
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

public String getPeawkrFlag() {
return peawkrFlag;
}

public void setPeawkrFlag(String peawkrFlag) {
this.peawkrFlag = peawkrFlag;
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

public Double getPsnClctBasstd() {
return psnClctBasstd;
}

public void setPsnClctBasstd(Double psnClctBasstd) {
this.psnClctBasstd = psnClctBasstd;
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

public String getPoolarea() {
return poolarea;
}

public void setPoolarea(String poolarea) {
this.poolarea = poolarea;
}

public String getRid() {
return rid;
}

public void setRid(String rid) {
this.rid = rid;
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

public String getPsnClctDetlIdCge() {
return psnClctDetlIdCge;
}

public void setPsnClctDetlIdCge(String psnClctDetlIdCge) {
this.psnClctDetlIdCge = psnClctDetlIdCge;
}

public String getClctRuleTypeCodg() {
return clctRuleTypeCodg;
}

public void setClctRuleTypeCodg(String clctRuleTypeCodg) {
this.clctRuleTypeCodg = clctRuleTypeCodg;
}

public String getClctstdCrtfRuleCodg() {
return clctstdCrtfRuleCodg;
}

public void setClctstdCrtfRuleCodg(String clctstdCrtfRuleCodg) {
this.clctstdCrtfRuleCodg = clctstdCrtfRuleCodg;
}

public String getPsnInsuRltsId() {
return psnInsuRltsId;
}

public void setPsnInsuRltsId(String psnInsuRltsId) {
this.psnInsuRltsId = psnInsuRltsId;
}

public String getUpdtTime() {
return updtTime;
}

public void setUpdtTime(String updtTime) {
this.updtTime = updtTime;
}

public String getPlanBchno() {
return planBchno;
}

public void setPlanBchno(String planBchno) {
this.planBchno = planBchno;
}

public String getInitPsnNo() {
return initPsnNo;
}

public void setInitPsnNo(String initPsnNo) {
this.initPsnNo = initPsnNo;
}

public String getInsuClctMons() {
return insuClctMons;
}

public void setInsuClctMons(String insuClctMons) {
this.insuClctMons = insuClctMons;
}

}

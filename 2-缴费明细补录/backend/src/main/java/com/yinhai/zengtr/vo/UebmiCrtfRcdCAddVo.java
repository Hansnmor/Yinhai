package com.yinhai.zengtr.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (UebmiCrtfRcdC)实体类
*
* @author default
* @since 2022-09-29 14:32:18
*/
public class UebmiCrtfRcdCAddVo implements Serializable {

    private static final long serialVersionUID = 648462784075038588L;

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
    //核定记录id
    private String uebmiCrtfRcdId;
            //服务事项实例ID
    private String servMattInstId;
            //单位编号
    private String empNo;
            //人员编号
    private String psnNo;
            //核定类型
    private String crtfType;
            //险种类型
    private String insutype;
            //对应费款所属期
    private String accrym;
            //截止费款所属期
    private String cashymEnd;
            //起始费款所属期
    private String cashymBegn;
            //个人缴费明细ID
    private String psnClctDetlId;
            //备注
    private String memo;
            //经办机构
    private String optins;
            //经办时间
    private Date optTime;
            //经办人姓名
    private String opterName;
            //经办人
    private String opter;
            //唯一记录号
    private String rid;
            //创建时间
    private Date crteTime;
            //更新时间
    private Date updtTime;
            //复核时间
    private Date rchkTime;
            //复核标志
    private String rchkFlag;
            //复核经办机构
    private String rchkOptins;
            //复核人姓名
    private String rechkerName;
            //复核人姓名
    private String rechker;
            //视同缴费月数
    private Integer tratClctMons;
            //累计缴费月数
    private Integer cumClctMons;
            //异地缴费月数
    private Integer outClctMons;
            //补缴总金额
    private Double sumamt;
            //补缴月金额
    private Double amt;
            //离退休时间
    private Date retrDate;
            //工作流流程ID
    private String wflwPrcsId;
            //工作流任务ID
    private String wflwTaskId;

    @Override
    public String toString() {
        return "UebmiCrtfRcdCAddVo{" +
                "clctRuleTypeCodg='" + clctRuleTypeCodg + '\'' +
                ", startYM='" + startYM + '\'' +
                ", endYM='" + endYM + '\'' +
                ", clctType='" + clctType + '\'' +
                ", baseSum=" + baseSum +
                ", clctBase=" + clctBase +
                ", uebmiCrtfRcdId='" + uebmiCrtfRcdId + '\'' +
                ", servMattInstId='" + servMattInstId + '\'' +
                ", empNo='" + empNo + '\'' +
                ", psnNo='" + psnNo + '\'' +
                ", crtfType='" + crtfType + '\'' +
                ", insutype='" + insutype + '\'' +
                ", accrym='" + accrym + '\'' +
                ", cashymEnd='" + cashymEnd + '\'' +
                ", cashymBegn='" + cashymBegn + '\'' +
                ", psnClctDetlId='" + psnClctDetlId + '\'' +
                ", memo='" + memo + '\'' +
                ", optins='" + optins + '\'' +
                ", optTime=" + optTime +
                ", opterName='" + opterName + '\'' +
                ", opter='" + opter + '\'' +
                ", rid='" + rid + '\'' +
                ", crteTime=" + crteTime +
                ", updtTime=" + updtTime +
                ", rchkTime=" + rchkTime +
                ", rchkFlag='" + rchkFlag + '\'' +
                ", rchkOptins='" + rchkOptins + '\'' +
                ", rechkerName='" + rechkerName + '\'' +
                ", rechker='" + rechker + '\'' +
                ", tratClctMons=" + tratClctMons +
                ", cumClctMons=" + cumClctMons +
                ", outClctMons=" + outClctMons +
                ", sumamt=" + sumamt +
                ", amt=" + amt +
                ", retrDate=" + retrDate +
                ", wflwPrcsId='" + wflwPrcsId + '\'' +
                ", wflwTaskId='" + wflwTaskId + '\'' +
                '}';
    }

    public String getUebmiCrtfRcdId() {
        return uebmiCrtfRcdId;
    }

    public void setUebmiCrtfRcdId(String uebmiCrtfRcdId) {
        this.uebmiCrtfRcdId = uebmiCrtfRcdId;
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

    public Double getClctBase() {
        return clctBase;
    }

    public void setClctBase(Double clctBase) {
        this.clctBase = clctBase;
    }

    public String getServMattInstId() {
return servMattInstId;
}

public void setServMattInstId(String servMattInstId) {
this.servMattInstId = servMattInstId;
}

public String getEmpNo() {
return empNo;
}

public void setEmpNo(String empNo) {
this.empNo = empNo;
}

public String getPsnNo() {
return psnNo;
}

public void setPsnNo(String psnNo) {
this.psnNo = psnNo;
}

public String getCrtfType() {
return crtfType;
}

public void setCrtfType(String crtfType) {
this.crtfType = crtfType;
}

public String getInsutype() {
return insutype;
}

public void setInsutype(String insutype) {
this.insutype = insutype;
}

public String getAccrym() {
return accrym;
}

public void setAccrym(String accrym) {
this.accrym = accrym;
}

public String getCashymEnd() {
return cashymEnd;
}

public void setCashymEnd(String cashymEnd) {
this.cashymEnd = cashymEnd;
}

public String getCashymBegn() {
return cashymBegn;
}

public void setCashymBegn(String cashymBegn) {
this.cashymBegn = cashymBegn;
}

public String getPsnClctDetlId() {
return psnClctDetlId;
}

public void setPsnClctDetlId(String psnClctDetlId) {
this.psnClctDetlId = psnClctDetlId;
}

public String getMemo() {
return memo;
}

public void setMemo(String memo) {
this.memo = memo;
}

public String getOptins() {
return optins;
}

public void setOptins(String optins) {
this.optins = optins;
}

public Date getOptTime() {
return optTime;
}

public void setOptTime(Date optTime) {
this.optTime = optTime;
}

public String getOpterName() {
return opterName;
}

public void setOpterName(String opterName) {
this.opterName = opterName;
}

public String getOpter() {
return opter;
}

public void setOpter(String opter) {
this.opter = opter;
}

public String getRid() {
return rid;
}

public void setRid(String rid) {
this.rid = rid;
}

public Date getCrteTime() {
return crteTime;
}

public void setCrteTime(Date crteTime) {
this.crteTime = crteTime;
}

public Date getUpdtTime() {
return updtTime;
}

public void setUpdtTime(Date updtTime) {
this.updtTime = updtTime;
}

public Date getRchkTime() {
return rchkTime;
}

public void setRchkTime(Date rchkTime) {
this.rchkTime = rchkTime;
}

public String getRchkFlag() {
return rchkFlag;
}

public void setRchkFlag(String rchkFlag) {
this.rchkFlag = rchkFlag;
}

public String getRchkOptins() {
return rchkOptins;
}

public void setRchkOptins(String rchkOptins) {
this.rchkOptins = rchkOptins;
}

public String getRechkerName() {
return rechkerName;
}

public void setRechkerName(String rechkerName) {
this.rechkerName = rechkerName;
}

public String getRechker() {
return rechker;
}

public void setRechker(String rechker) {
this.rechker = rechker;
}

public Integer getTratClctMons() {
return tratClctMons;
}

public void setTratClctMons(Integer tratClctMons) {
this.tratClctMons = tratClctMons;
}

public Integer getCumClctMons() {
return cumClctMons;
}

public void setCumClctMons(Integer cumClctMons) {
this.cumClctMons = cumClctMons;
}

public Integer getOutClctMons() {
return outClctMons;
}

public void setOutClctMons(Integer outClctMons) {
this.outClctMons = outClctMons;
}

public Double getSumamt() {
return sumamt;
}

public void setSumamt(Double sumamt) {
this.sumamt = sumamt;
}

public Double getAmt() {
return amt;
}

public void setAmt(Double amt) {
this.amt = amt;
}

public Date getRetrDate() {
return retrDate;
}

public void setRetrDate(Date retrDate) {
this.retrDate = retrDate;
}

public String getWflwPrcsId() {
return wflwPrcsId;
}

public void setWflwPrcsId(String wflwPrcsId) {
this.wflwPrcsId = wflwPrcsId;
}

public String getWflwTaskId() {
return wflwTaskId;
}

public void setWflwTaskId(String wflwTaskId) {
this.wflwTaskId = wflwTaskId;
}

}

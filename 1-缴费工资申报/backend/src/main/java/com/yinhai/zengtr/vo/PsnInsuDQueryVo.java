package com.yinhai.zengtr.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (PsnInsuD)实体类
*
* @author default
* @since 2022-09-21 16:21:38
*/
public class PsnInsuDQueryVo implements Serializable {

    private static final long serialVersionUID = -51526817213086433L;
            //人员参保关系ID
    private String psnInsuRltsId;
            //单位编号
    private String empNo;
            //人员编号
    private String psnNo;
            //险种类型
    private String insutype;
            //本次参保日期
    private Date crtInsuDate;
            //暂停参保日期
    private Date pausInsuDate;
            //人员参保状态
    private String psnInsuStas;
            //险种离退休标志
    private String insutypeRetrFlag;
            //人员类别
    private String psnType;
            //征收方式
    private String clctWay;
            //用工形式
    private String empFom;
            //编制类型
    private String qutsType;
            //最大做账期号
    private String maxAcctprd;
            //账户建立年月
    private String acctCrtnYm;
            //首次参保年月
    private String fstInsuYm;
            //本系统首次参保日期
    private Date psnInsuDate;
            //征缴规则类型编码
    private String clctRuleTypeCodg;
            //基数核定规则编码
    private String clctstdCrtfRuleCodg;
            //医疗保险类别
    private String hiType;
            //医保区划
    private String insuOrg;
            //统筹区
    private String poolarea;
            //经办渠道
    private String optChnl;
            //经办机构
    private String optins;
            //经办人
    private String opter;
            //经办人姓名
    private String opterName;
            //经办时间
    private Date optTime;
            //创建机构
    private String crteOptins;
            //创建人
    private String crter;
            //创建人姓名
    private String crterName;
            //创建时间
    private Date crteTime;
            //更新时间
    private Date updtTime;
            //唯一记录号
    private String rid;
            //参保人员管理事件ID
    private String psnInsuMgtEid;

    @Override
    public String toString() {
        return "PsnInsuDQueryVo{" +
                "psnInsuRltsId='" + psnInsuRltsId + '\'' +
                ", empNo='" + empNo + '\'' +
                ", psnNo='" + psnNo + '\'' +
                ", insutype='" + insutype + '\'' +
                ", crtInsuDate=" + crtInsuDate +
                ", pausInsuDate=" + pausInsuDate +
                ", psnInsuStas='" + psnInsuStas + '\'' +
                ", insutypeRetrFlag='" + insutypeRetrFlag + '\'' +
                ", psnType='" + psnType + '\'' +
                ", clctWay='" + clctWay + '\'' +
                ", empFom='" + empFom + '\'' +
                ", qutsType='" + qutsType + '\'' +
                ", maxAcctprd='" + maxAcctprd + '\'' +
                ", acctCrtnYm='" + acctCrtnYm + '\'' +
                ", fstInsuYm='" + fstInsuYm + '\'' +
                ", psnInsuDate=" + psnInsuDate +
                ", clctRuleTypeCodg='" + clctRuleTypeCodg + '\'' +
                ", clctstdCrtfRuleCodg='" + clctstdCrtfRuleCodg + '\'' +
                ", hiType='" + hiType + '\'' +
                ", insuOrg='" + insuOrg + '\'' +
                ", poolarea='" + poolarea + '\'' +
                ", optChnl='" + optChnl + '\'' +
                ", optins='" + optins + '\'' +
                ", opter='" + opter + '\'' +
                ", opterName='" + opterName + '\'' +
                ", optTime=" + optTime +
                ", crteOptins='" + crteOptins + '\'' +
                ", crter='" + crter + '\'' +
                ", crterName='" + crterName + '\'' +
                ", crteTime=" + crteTime +
                ", updtTime=" + updtTime +
                ", rid='" + rid + '\'' +
                ", psnInsuMgtEid='" + psnInsuMgtEid + '\'' +
                '}';
    }

    public String getPsnInsuRltsId() {
return psnInsuRltsId;
}

public void setPsnInsuRltsId(String psnInsuRltsId) {
this.psnInsuRltsId = psnInsuRltsId;
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

public String getInsutype() {
return insutype;
}

public void setInsutype(String insutype) {
this.insutype = insutype;
}

public Date getCrtInsuDate() {
return crtInsuDate;
}

public void setCrtInsuDate(Date crtInsuDate) {
this.crtInsuDate = crtInsuDate;
}

public Date getPausInsuDate() {
return pausInsuDate;
}

public void setPausInsuDate(Date pausInsuDate) {
this.pausInsuDate = pausInsuDate;
}

public String getPsnInsuStas() {
return psnInsuStas;
}

public void setPsnInsuStas(String psnInsuStas) {
this.psnInsuStas = psnInsuStas;
}

public String getInsutypeRetrFlag() {
return insutypeRetrFlag;
}

public void setInsutypeRetrFlag(String insutypeRetrFlag) {
this.insutypeRetrFlag = insutypeRetrFlag;
}

public String getPsnType() {
return psnType;
}

public void setPsnType(String psnType) {
this.psnType = psnType;
}

public String getClctWay() {
return clctWay;
}

public void setClctWay(String clctWay) {
this.clctWay = clctWay;
}

public String getEmpFom() {
return empFom;
}

public void setEmpFom(String empFom) {
this.empFom = empFom;
}

public String getQutsType() {
return qutsType;
}

public void setQutsType(String qutsType) {
this.qutsType = qutsType;
}

public String getMaxAcctprd() {
return maxAcctprd;
}

public void setMaxAcctprd(String maxAcctprd) {
this.maxAcctprd = maxAcctprd;
}

public String getAcctCrtnYm() {
return acctCrtnYm;
}

public void setAcctCrtnYm(String acctCrtnYm) {
this.acctCrtnYm = acctCrtnYm;
}

public String getFstInsuYm() {
return fstInsuYm;
}

public void setFstInsuYm(String fstInsuYm) {
this.fstInsuYm = fstInsuYm;
}

public Date getPsnInsuDate() {
return psnInsuDate;
}

public void setPsnInsuDate(Date psnInsuDate) {
this.psnInsuDate = psnInsuDate;
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

public String getHiType() {
return hiType;
}

public void setHiType(String hiType) {
this.hiType = hiType;
}

public String getInsuOrg() {
return insuOrg;
}

public void setInsuOrg(String insuOrg) {
this.insuOrg = insuOrg;
}

public String getPoolarea() {
return poolarea;
}

public void setPoolarea(String poolarea) {
this.poolarea = poolarea;
}

public String getOptChnl() {
return optChnl;
}

public void setOptChnl(String optChnl) {
this.optChnl = optChnl;
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

public String getCrteOptins() {
return crteOptins;
}

public void setCrteOptins(String crteOptins) {
this.crteOptins = crteOptins;
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

public Date getUpdtTime() {
return updtTime;
}

public void setUpdtTime(Date updtTime) {
this.updtTime = updtTime;
}

public String getRid() {
return rid;
}

public void setRid(String rid) {
this.rid = rid;
}

public String getPsnInsuMgtEid() {
return psnInsuMgtEid;
}

public void setPsnInsuMgtEid(String psnInsuMgtEid) {
this.psnInsuMgtEid = psnInsuMgtEid;
}

}

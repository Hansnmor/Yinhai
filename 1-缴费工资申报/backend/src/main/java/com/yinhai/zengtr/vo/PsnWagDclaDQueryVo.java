package com.yinhai.zengtr.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (PsnWagDclaD)实体类
*
* @author default
* @since 2022-09-23 15:13:14
*/
public class PsnWagDclaDQueryVo implements Serializable {

    private static final long serialVersionUID = -61756551704000105L;
            //人员工资ID
    private String psnWagId;
            //人员编号
    private String psnNo;
            //单位编号
    private String empNo;
            //险种类型
    private String insutype;
            //工资
    private Double wag;
            //年月
    private String ym;
            //险种离退休标志
    private String insutypeRetrFlag;
            //社平工资启用模式
    private String socaAvesalEnabMode;
            //基数核定规则类型编码
    private String clctstdCrtfRuleCodg;
            //医保区划
    private String insuOrg;
            //统筹区
    private String poolarea;
            //人员参保关系ID
    private String psnInsuRltsId;
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
            //工资申报管理事件ID
    private String wagDclaMgtEid;
            //工资申报历史事件ID
    private String wagDclaHisEid;
            //人员缴费基数
    private Double psnClctstd;

    @Override
    public String toString() {
        return "PsnWagDclaDQueryVo{" +
                "psnWagId='" + psnWagId + '\'' +
                ", psnNo='" + psnNo + '\'' +
                ", empNo='" + empNo + '\'' +
                ", insutype='" + insutype + '\'' +
                ", wag=" + wag +
                ", ym='" + ym + '\'' +
                ", insutypeRetrFlag='" + insutypeRetrFlag + '\'' +
                ", socaAvesalEnabMode='" + socaAvesalEnabMode + '\'' +
                ", clctstdCrtfRuleCodg='" + clctstdCrtfRuleCodg + '\'' +
                ", insuOrg='" + insuOrg + '\'' +
                ", poolarea='" + poolarea + '\'' +
                ", psnInsuRltsId='" + psnInsuRltsId + '\'' +
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
                ", wagDclaMgtEid='" + wagDclaMgtEid + '\'' +
                ", wagDclaHisEid='" + wagDclaHisEid + '\'' +
                ", psnClctstd=" + psnClctstd +
                '}';
    }

    public String getPsnWagId() {
return psnWagId;
}

public void setPsnWagId(String psnWagId) {
this.psnWagId = psnWagId;
}

public String getPsnNo() {
return psnNo;
}

public void setPsnNo(String psnNo) {
this.psnNo = psnNo;
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

public Double getWag() {
return wag;
}

public void setWag(Double wag) {
this.wag = wag;
}

public String getYm() {
return ym;
}

public void setYm(String ym) {
this.ym = ym;
}

public String getInsutypeRetrFlag() {
return insutypeRetrFlag;
}

public void setInsutypeRetrFlag(String insutypeRetrFlag) {
this.insutypeRetrFlag = insutypeRetrFlag;
}

public String getSocaAvesalEnabMode() {
return socaAvesalEnabMode;
}

public void setSocaAvesalEnabMode(String socaAvesalEnabMode) {
this.socaAvesalEnabMode = socaAvesalEnabMode;
}

public String getClctstdCrtfRuleCodg() {
return clctstdCrtfRuleCodg;
}

public void setClctstdCrtfRuleCodg(String clctstdCrtfRuleCodg) {
this.clctstdCrtfRuleCodg = clctstdCrtfRuleCodg;
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

public String getPsnInsuRltsId() {
return psnInsuRltsId;
}

public void setPsnInsuRltsId(String psnInsuRltsId) {
this.psnInsuRltsId = psnInsuRltsId;
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

public String getWagDclaMgtEid() {
return wagDclaMgtEid;
}

public void setWagDclaMgtEid(String wagDclaMgtEid) {
this.wagDclaMgtEid = wagDclaMgtEid;
}

public String getWagDclaHisEid() {
return wagDclaHisEid;
}

public void setWagDclaHisEid(String wagDclaHisEid) {
this.wagDclaHisEid = wagDclaHisEid;
}

public Double getPsnClctstd() {
return psnClctstd;
}

public void setPsnClctstd(Double psnClctstd) {
this.psnClctstd = psnClctstd;
}

}

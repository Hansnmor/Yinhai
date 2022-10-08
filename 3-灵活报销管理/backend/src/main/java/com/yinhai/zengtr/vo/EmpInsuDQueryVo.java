package com.yinhai.zengtr.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (EmpInsuD)实体类
*
* @author default
* @since 2022-10-08 14:24:47
*/
public class EmpInsuDQueryVo implements Serializable {

    private static final long serialVersionUID = -46319703472897275L;
            //单位参保关系ID
    private String empInsuRltsId;
            //单位编号
    private String empNo;
            //险种类型
    private String insutype;
            //单位参保状态
    private String empInsuStas;
            //单位参保日期
    private Date empInsuDate;
            //最大做账期号
    private String maxAcctprd;
            //征收方式
    private String clctWay;
            //税务起征年月
    private String taxBegnClctYm;
            //医疗保险类别
    private String hiType;
            //征缴规则类型编码
    private String clctRuleTypeCodg;
            //基数核定规则类型编码
    private String clctstdCrtfRuleCodg;
            //备注
    private String memo;
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
            //参保单位管理事件ID
    private String insuEmpMgtEid;
    
                
public String getEmpInsuRltsId() {
return empInsuRltsId;
}

public void setEmpInsuRltsId(String empInsuRltsId) {
this.empInsuRltsId = empInsuRltsId;
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
                
public String getEmpInsuStas() {
return empInsuStas;
}

public void setEmpInsuStas(String empInsuStas) {
this.empInsuStas = empInsuStas;
}
                
public Date getEmpInsuDate() {
return empInsuDate;
}

public void setEmpInsuDate(Date empInsuDate) {
this.empInsuDate = empInsuDate;
}
                
public String getMaxAcctprd() {
return maxAcctprd;
}

public void setMaxAcctprd(String maxAcctprd) {
this.maxAcctprd = maxAcctprd;
}
                
public String getClctWay() {
return clctWay;
}

public void setClctWay(String clctWay) {
this.clctWay = clctWay;
}
                
public String getTaxBegnClctYm() {
return taxBegnClctYm;
}

public void setTaxBegnClctYm(String taxBegnClctYm) {
this.taxBegnClctYm = taxBegnClctYm;
}
                
public String getHiType() {
return hiType;
}

public void setHiType(String hiType) {
this.hiType = hiType;
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
                
public String getMemo() {
return memo;
}

public void setMemo(String memo) {
this.memo = memo;
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
                
public String getInsuEmpMgtEid() {
return insuEmpMgtEid;
}

public void setInsuEmpMgtEid(String insuEmpMgtEid) {
this.insuEmpMgtEid = insuEmpMgtEid;
}
    
}
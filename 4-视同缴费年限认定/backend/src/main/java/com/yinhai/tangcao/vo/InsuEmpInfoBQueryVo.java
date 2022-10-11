package com.yinhai.tangcao.vo;

import java.io.Serializable;
import java.util.Date;

/**
* (InsuEmpInfoB)实体类
*
* @author default
* @since 2022-09-27 17:20:26
*/
public class InsuEmpInfoBQueryVo implements Serializable {

    private static final long serialVersionUID = -61382215413248404L;
            //单位编号
    private String empNo;
            //单位实体编码
    private String empEnttCodg;
            //单位管理类型
    private String empMgtType;
            //上级单位编号
    private String prntEmpNo;
            //关联法人标志
    private String asocLegentFlag;
            //单位类型
    private String empType;
            //单位名称
    private String empName;
            //注册名称
    private String regName;
            //所属行政区
    private String locAdmdvs;
            //联系人姓名
    private String conerName;
            //联系人电子邮箱
    private String conerEmail;
            //联系电话
    private String tel;
            //传真号码
    private String faxNo;
            //税号
    private String taxNo;
            //组织机构代码
    private String orgcode;
            //注册号
    private String regno;
            //注册号证件类型
    private String regnoCertType;
            //单位地址
    private String empAddr;
            //邮政编码
    private String poscode;
            //批准成立部门
    private String aprvEstaDept;
            //批准成立日期
    private Date aprvEstaDate;
            //批准成立文号
    private String aprvEstaDocno;
            //上级行政区划
    private String prntAdmdvs;
            //参保所属机构
    private String insuOptins;
            //组织有效状态
    private String orgValiStas;
            //法定代表人电话号码
    private String legrepTel;
            //法定代表人姓名
    private String legrepName;
            //法定代表人证件类型
    private String legrepCertType;
            //法定代表人证件号码
    private String legrepCertno;
            //组织机构代码证颁发单位
    private String orgcodeIssuEmp;
            //有效标志
    private String valiFlag;
            //唯一记录号
    private String rid;
            //数据创建时间
    private Date crteTime;
            //数据更新时间
    private Date updtTime;
            //创建人
    private String crter;
            //创建人姓名
    private String crterName;
            //创建经办机构
    private String crteOptins;
            //经办人
    private String opter;
            //经办人姓名
    private String opterName;
            //经办时间
    private Date optTime;
            //经办机构
    private String optins;
            //统筹区
    private String poolarea;
            //版本号
    private String ver;

    @Override
    public String toString() {
        return "InsuEmpInfoBQueryVo{" +
                "empNo='" + empNo + '\'' +
                ", empEnttCodg='" + empEnttCodg + '\'' +
                ", empMgtType='" + empMgtType + '\'' +
                ", prntEmpNo='" + prntEmpNo + '\'' +
                ", asocLegentFlag='" + asocLegentFlag + '\'' +
                ", empType='" + empType + '\'' +
                ", empName='" + empName + '\'' +
                ", regName='" + regName + '\'' +
                ", locAdmdvs='" + locAdmdvs + '\'' +
                ", conerName='" + conerName + '\'' +
                ", conerEmail='" + conerEmail + '\'' +
                ", tel='" + tel + '\'' +
                ", faxNo='" + faxNo + '\'' +
                ", taxNo='" + taxNo + '\'' +
                ", orgcode='" + orgcode + '\'' +
                ", regno='" + regno + '\'' +
                ", regnoCertType='" + regnoCertType + '\'' +
                ", empAddr='" + empAddr + '\'' +
                ", poscode='" + poscode + '\'' +
                ", aprvEstaDept='" + aprvEstaDept + '\'' +
                ", aprvEstaDate=" + aprvEstaDate +
                ", aprvEstaDocno='" + aprvEstaDocno + '\'' +
                ", prntAdmdvs='" + prntAdmdvs + '\'' +
                ", insuOptins='" + insuOptins + '\'' +
                ", orgValiStas='" + orgValiStas + '\'' +
                ", legrepTel='" + legrepTel + '\'' +
                ", legrepName='" + legrepName + '\'' +
                ", legrepCertType='" + legrepCertType + '\'' +
                ", legrepCertno='" + legrepCertno + '\'' +
                ", orgcodeIssuEmp='" + orgcodeIssuEmp + '\'' +
                ", valiFlag='" + valiFlag + '\'' +
                ", rid='" + rid + '\'' +
                ", crteTime=" + crteTime +
                ", updtTime=" + updtTime +
                ", crter='" + crter + '\'' +
                ", crterName='" + crterName + '\'' +
                ", crteOptins='" + crteOptins + '\'' +
                ", opter='" + opter + '\'' +
                ", opterName='" + opterName + '\'' +
                ", optTime=" + optTime +
                ", optins='" + optins + '\'' +
                ", poolarea='" + poolarea + '\'' +
                ", ver='" + ver + '\'' +
                '}';
    }

    public String getEmpNo() {
return empNo;
}

public void setEmpNo(String empNo) {
this.empNo = empNo;
}

public String getEmpEnttCodg() {
return empEnttCodg;
}

public void setEmpEnttCodg(String empEnttCodg) {
this.empEnttCodg = empEnttCodg;
}

public String getEmpMgtType() {
return empMgtType;
}

public void setEmpMgtType(String empMgtType) {
this.empMgtType = empMgtType;
}

public String getPrntEmpNo() {
return prntEmpNo;
}

public void setPrntEmpNo(String prntEmpNo) {
this.prntEmpNo = prntEmpNo;
}

public String getAsocLegentFlag() {
return asocLegentFlag;
}

public void setAsocLegentFlag(String asocLegentFlag) {
this.asocLegentFlag = asocLegentFlag;
}

public String getEmpType() {
return empType;
}

public void setEmpType(String empType) {
this.empType = empType;
}

public String getEmpName() {
return empName;
}

public void setEmpName(String empName) {
this.empName = empName;
}

public String getRegName() {
return regName;
}

public void setRegName(String regName) {
this.regName = regName;
}

public String getLocAdmdvs() {
return locAdmdvs;
}

public void setLocAdmdvs(String locAdmdvs) {
this.locAdmdvs = locAdmdvs;
}

public String getConerName() {
return conerName;
}

public void setConerName(String conerName) {
this.conerName = conerName;
}

public String getConerEmail() {
return conerEmail;
}

public void setConerEmail(String conerEmail) {
this.conerEmail = conerEmail;
}

public String getTel() {
return tel;
}

public void setTel(String tel) {
this.tel = tel;
}

public String getFaxNo() {
return faxNo;
}

public void setFaxNo(String faxNo) {
this.faxNo = faxNo;
}

public String getTaxNo() {
return taxNo;
}

public void setTaxNo(String taxNo) {
this.taxNo = taxNo;
}

public String getOrgcode() {
return orgcode;
}

public void setOrgcode(String orgcode) {
this.orgcode = orgcode;
}

public String getRegno() {
return regno;
}

public void setRegno(String regno) {
this.regno = regno;
}

public String getRegnoCertType() {
return regnoCertType;
}

public void setRegnoCertType(String regnoCertType) {
this.regnoCertType = regnoCertType;
}

public String getEmpAddr() {
return empAddr;
}

public void setEmpAddr(String empAddr) {
this.empAddr = empAddr;
}

public String getPoscode() {
return poscode;
}

public void setPoscode(String poscode) {
this.poscode = poscode;
}

public String getAprvEstaDept() {
return aprvEstaDept;
}

public void setAprvEstaDept(String aprvEstaDept) {
this.aprvEstaDept = aprvEstaDept;
}

public Date getAprvEstaDate() {
return aprvEstaDate;
}

public void setAprvEstaDate(Date aprvEstaDate) {
this.aprvEstaDate = aprvEstaDate;
}

public String getAprvEstaDocno() {
return aprvEstaDocno;
}

public void setAprvEstaDocno(String aprvEstaDocno) {
this.aprvEstaDocno = aprvEstaDocno;
}

public String getPrntAdmdvs() {
return prntAdmdvs;
}

public void setPrntAdmdvs(String prntAdmdvs) {
this.prntAdmdvs = prntAdmdvs;
}

public String getInsuOptins() {
return insuOptins;
}

public void setInsuOptins(String insuOptins) {
this.insuOptins = insuOptins;
}

public String getOrgValiStas() {
return orgValiStas;
}

public void setOrgValiStas(String orgValiStas) {
this.orgValiStas = orgValiStas;
}

public String getLegrepTel() {
return legrepTel;
}

public void setLegrepTel(String legrepTel) {
this.legrepTel = legrepTel;
}

public String getLegrepName() {
return legrepName;
}

public void setLegrepName(String legrepName) {
this.legrepName = legrepName;
}

public String getLegrepCertType() {
return legrepCertType;
}

public void setLegrepCertType(String legrepCertType) {
this.legrepCertType = legrepCertType;
}

public String getLegrepCertno() {
return legrepCertno;
}

public void setLegrepCertno(String legrepCertno) {
this.legrepCertno = legrepCertno;
}

public String getOrgcodeIssuEmp() {
return orgcodeIssuEmp;
}

public void setOrgcodeIssuEmp(String orgcodeIssuEmp) {
this.orgcodeIssuEmp = orgcodeIssuEmp;
}

public String getValiFlag() {
return valiFlag;
}

public void setValiFlag(String valiFlag) {
this.valiFlag = valiFlag;
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

public String getCrteOptins() {
return crteOptins;
}

public void setCrteOptins(String crteOptins) {
this.crteOptins = crteOptins;
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

public String getOptins() {
return optins;
}

public void setOptins(String optins) {
this.optins = optins;
}

public String getPoolarea() {
return poolarea;
}

public void setPoolarea(String poolarea) {
this.poolarea = poolarea;
}

public String getVer() {
return ver;
}

public void setVer(String ver) {
this.ver = ver;
}

}

package com.yinhai.zengtr.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (FlxReimRegInfoD)实体类
*
* @author default
* @since 2022-10-09 15:24:04
*/
public class FlxReimRegInfoDAddVo implements Serializable {

    private static final long serialVersionUID = 415275084581225947L;
    //就诊事件id
    private String mdtrtEvtId;
    //结算事件id
    private String setlId;
            //人员编号
    private String psnNo;
            //人员参保关系ID
    private String psnInsuRltsId;
            //人员姓名
    private String psnName;
            //人员证件类型
    private String psnCertType;
            //证件号码
    private String certno;
            //性别
    private String gend;
            //出生日期
    private Date brdy;
            //参保机构行政区划
    private String insuOptins;
            //险种
    private String insutype;
            //人员类别
    private String psnType;
            //特殊人员类型
    private String spPsnType;
            //特殊人员类型等级
    private String spPsnTypeLv;
            //缴费档次
    private String clctGrde;
            //单位编号
    private String empNo;
            //单位名称
    private String empName;
            //单位类型
    private String empType;
            //经济类型
    private String econType;
            //所属行业
    private String afilIndu;
            //隶属关系
    private String afilRlts;
            //单位管理类型
    private String empMgtType;
            //申报原因
    private String dclaRea;
            //定点医药机构编号
    private String fixmedinsCode;
            //定点医药机构名称
    private String fixmedinsName;
            //医疗类别
    private String medType;
            //开始时间
    private Date begntime;
            //结束时间
    private Date endtime;
            //联系人姓名
    private String conerName;
            //联系电话
    private String tel;
            //附件张数
    private Double attVal;
            //费用总额
    private Double sumfee;
            //符合范围金额
    private Double inscpScpAmt;
            //基金支付总额
    private Double fundPaySumamt;
            //银行行号
    private String bankcode;
            //银行行别代码
    private String bankTypeCode;
            //银行账号
    private String bankacct;
            //户名
    private String acctname;
            //银行同城异地标志
    private String bankSamecityOutFlag;
            //备注
    private String memo;
            //有效标志
    private String valiFlag;
            //唯一记录号
    private String rid;
            //更新时间
    private Date updtTime;
            //创建人
    private String crter;
            //创建人姓名
    private String crterName;
            //创建时间
    private Date crteTime;
            //创建机构
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

    public String getMdtrtEvtId() {
        return mdtrtEvtId;
    }

    public void setMdtrtEvtId(String mdtrtEvtId) {
        this.mdtrtEvtId = mdtrtEvtId;
    }

    public String getSetlId() {
        return setlId;
    }

    public void setSetlId(String setlId) {
        this.setlId = setlId;
    }

    @Override
    public String toString() {
        return "FlxReimRegInfoDAddVo{" +
                "psnNo='" + psnNo + '\'' +
                ", psnInsuRltsId='" + psnInsuRltsId + '\'' +
                ", psnName='" + psnName + '\'' +
                ", psnCertType='" + psnCertType + '\'' +
                ", certno='" + certno + '\'' +
                ", gend='" + gend + '\'' +
                ", brdy=" + brdy +
                ", insuOptins='" + insuOptins + '\'' +
                ", insutype='" + insutype + '\'' +
                ", psnType='" + psnType + '\'' +
                ", spPsnType='" + spPsnType + '\'' +
                ", spPsnTypeLv='" + spPsnTypeLv + '\'' +
                ", clctGrde='" + clctGrde + '\'' +
                ", empNo='" + empNo + '\'' +
                ", empName='" + empName + '\'' +
                ", empType='" + empType + '\'' +
                ", econType='" + econType + '\'' +
                ", afilIndu='" + afilIndu + '\'' +
                ", afilRlts='" + afilRlts + '\'' +
                ", empMgtType='" + empMgtType + '\'' +
                ", dclaRea='" + dclaRea + '\'' +
                ", fixmedinsCode='" + fixmedinsCode + '\'' +
                ", fixmedinsName='" + fixmedinsName + '\'' +
                ", medType='" + medType + '\'' +
                ", begntime=" + begntime +
                ", endtime=" + endtime +
                ", conerName='" + conerName + '\'' +
                ", tel='" + tel + '\'' +
                ", attVal=" + attVal +
                ", sumfee=" + sumfee +
                ", inscpScpAmt=" + inscpScpAmt +
                ", fundPaySumamt=" + fundPaySumamt +
                ", bankcode='" + bankcode + '\'' +
                ", bankTypeCode='" + bankTypeCode + '\'' +
                ", bankacct='" + bankacct + '\'' +
                ", acctname='" + acctname + '\'' +
                ", bankSamecityOutFlag='" + bankSamecityOutFlag + '\'' +
                ", memo='" + memo + '\'' +
                ", valiFlag='" + valiFlag + '\'' +
                ", rid='" + rid + '\'' +
                ", updtTime=" + updtTime +
                ", crter='" + crter + '\'' +
                ", crterName='" + crterName + '\'' +
                ", crteTime=" + crteTime +
                ", crteOptins='" + crteOptins + '\'' +
                ", opter='" + opter + '\'' +
                ", opterName='" + opterName + '\'' +
                ", optTime=" + optTime +
                ", optins='" + optins + '\'' +
                ", poolarea='" + poolarea + '\'' +
                '}';
    }

    public String getPsnNo() {
return psnNo;
}

public void setPsnNo(String psnNo) {
this.psnNo = psnNo;
}

public String getPsnInsuRltsId() {
return psnInsuRltsId;
}

public void setPsnInsuRltsId(String psnInsuRltsId) {
this.psnInsuRltsId = psnInsuRltsId;
}

public String getPsnName() {
return psnName;
}

public void setPsnName(String psnName) {
this.psnName = psnName;
}

public String getPsnCertType() {
return psnCertType;
}

public void setPsnCertType(String psnCertType) {
this.psnCertType = psnCertType;
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

public Date getBrdy() {
return brdy;
}

public void setBrdy(Date brdy) {
this.brdy = brdy;
}

public String getInsuOptins() {
return insuOptins;
}

public void setInsuOptins(String insuOptins) {
this.insuOptins = insuOptins;
}

public String getInsutype() {
return insutype;
}

public void setInsutype(String insutype) {
this.insutype = insutype;
}

public String getPsnType() {
return psnType;
}

public void setPsnType(String psnType) {
this.psnType = psnType;
}

public String getSpPsnType() {
return spPsnType;
}

public void setSpPsnType(String spPsnType) {
this.spPsnType = spPsnType;
}

public String getSpPsnTypeLv() {
return spPsnTypeLv;
}

public void setSpPsnTypeLv(String spPsnTypeLv) {
this.spPsnTypeLv = spPsnTypeLv;
}

public String getClctGrde() {
return clctGrde;
}

public void setClctGrde(String clctGrde) {
this.clctGrde = clctGrde;
}

public String getEmpNo() {
return empNo;
}

public void setEmpNo(String empNo) {
this.empNo = empNo;
}

public String getEmpName() {
return empName;
}

public void setEmpName(String empName) {
this.empName = empName;
}

public String getEmpType() {
return empType;
}

public void setEmpType(String empType) {
this.empType = empType;
}

public String getEconType() {
return econType;
}

public void setEconType(String econType) {
this.econType = econType;
}

public String getAfilIndu() {
return afilIndu;
}

public void setAfilIndu(String afilIndu) {
this.afilIndu = afilIndu;
}

public String getAfilRlts() {
return afilRlts;
}

public void setAfilRlts(String afilRlts) {
this.afilRlts = afilRlts;
}

public String getEmpMgtType() {
return empMgtType;
}

public void setEmpMgtType(String empMgtType) {
this.empMgtType = empMgtType;
}

public String getDclaRea() {
return dclaRea;
}

public void setDclaRea(String dclaRea) {
this.dclaRea = dclaRea;
}

public String getFixmedinsCode() {
return fixmedinsCode;
}

public void setFixmedinsCode(String fixmedinsCode) {
this.fixmedinsCode = fixmedinsCode;
}

public String getFixmedinsName() {
return fixmedinsName;
}

public void setFixmedinsName(String fixmedinsName) {
this.fixmedinsName = fixmedinsName;
}

public String getMedType() {
return medType;
}

public void setMedType(String medType) {
this.medType = medType;
}

public Date getBegntime() {
return begntime;
}

public void setBegntime(Date begntime) {
this.begntime = begntime;
}

public Date getEndtime() {
return endtime;
}

public void setEndtime(Date endtime) {
this.endtime = endtime;
}

public String getConerName() {
return conerName;
}

public void setConerName(String conerName) {
this.conerName = conerName;
}

public String getTel() {
return tel;
}

public void setTel(String tel) {
this.tel = tel;
}

public Double getAttVal() {
return attVal;
}

public void setAttVal(Double attVal) {
this.attVal = attVal;
}

public Double getSumfee() {
return sumfee;
}

public void setSumfee(Double sumfee) {
this.sumfee = sumfee;
}

public Double getInscpScpAmt() {
return inscpScpAmt;
}

public void setInscpScpAmt(Double inscpScpAmt) {
this.inscpScpAmt = inscpScpAmt;
}

public Double getFundPaySumamt() {
return fundPaySumamt;
}

public void setFundPaySumamt(Double fundPaySumamt) {
this.fundPaySumamt = fundPaySumamt;
}

public String getBankcode() {
return bankcode;
}

public void setBankcode(String bankcode) {
this.bankcode = bankcode;
}

public String getBankTypeCode() {
return bankTypeCode;
}

public void setBankTypeCode(String bankTypeCode) {
this.bankTypeCode = bankTypeCode;
}

public String getBankacct() {
return bankacct;
}

public void setBankacct(String bankacct) {
this.bankacct = bankacct;
}

public String getAcctname() {
return acctname;
}

public void setAcctname(String acctname) {
this.acctname = acctname;
}

public String getBankSamecityOutFlag() {
return bankSamecityOutFlag;
}

public void setBankSamecityOutFlag(String bankSamecityOutFlag) {
this.bankSamecityOutFlag = bankSamecityOutFlag;
}

public String getMemo() {
return memo;
}

public void setMemo(String memo) {
this.memo = memo;
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

public Date getCrteTime() {
return crteTime;
}

public void setCrteTime(Date crteTime) {
this.crteTime = crteTime;
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

}

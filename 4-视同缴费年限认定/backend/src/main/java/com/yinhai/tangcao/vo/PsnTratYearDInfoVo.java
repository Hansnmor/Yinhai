package com.yinhai.tangcao.vo;

import java.util.Date;
import java.io.Serializable;

/**
* (PsnTratYearD)实体类
*
* @author default
* @since 2022-10-09 16:42:28
*/
public class PsnTratYearDInfoVo implements Serializable {

    private static final long serialVersionUID = -47601585402004172L;
            //人员视同缴费ID
    private String psnTratClctId;
            //人员编号
    private String psnNo;
            //险种类型
    private String insutype;
            //人员视同缴费类型
    private String tratClctType;
            //开始年月
    private String begnYm;
            //结束年月
    private String endYm;
            //视同缴费月数
    private Double tratClctMons;
            //有效标志
    private String valiFlag;
            //备注
    private String memo;
            //医保区划
    private String insuOrg;
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
            //人员参保关系ID
    private String psnInsuRltsId;
            //参保人员管理事件ID
    private String psnInsuMgtEid;
                    
public String getPsnTratClctId() {
return psnTratClctId;
}

public void setPsnTratClctId(String psnTratClctId) {
this.psnTratClctId = psnTratClctId;
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
                
public String getTratClctType() {
return tratClctType;
}

public void setTratClctType(String tratClctType) {
this.tratClctType = tratClctType;
}
                
public String getBegnYm() {
return begnYm;
}

public void setBegnYm(String begnYm) {
this.begnYm = begnYm;
}
                
public String getEndYm() {
return endYm;
}

public void setEndYm(String endYm) {
this.endYm = endYm;
}
                
public Double getTratClctMons() {
return tratClctMons;
}

public void setTratClctMons(Double tratClctMons) {
this.tratClctMons = tratClctMons;
}
                
public String getValiFlag() {
return valiFlag;
}

public void setValiFlag(String valiFlag) {
this.valiFlag = valiFlag;
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
                
public String getPsnInsuRltsId() {
return psnInsuRltsId;
}

public void setPsnInsuRltsId(String psnInsuRltsId) {
this.psnInsuRltsId = psnInsuRltsId;
}
                
public String getPsnInsuMgtEid() {
return psnInsuMgtEid;
}

public void setPsnInsuMgtEid(String psnInsuMgtEid) {
this.psnInsuMgtEid = psnInsuMgtEid;
}
    
}
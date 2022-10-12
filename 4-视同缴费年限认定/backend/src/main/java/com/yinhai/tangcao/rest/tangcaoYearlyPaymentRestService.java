package com.yinhai.tangcao.rest;

import com.alibaba.fastjson.JSON;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.tangcao.service.read.tangcaoYearlyPaymentReadService;
import com.yinhai.tangcao.service.write.tangcaoYearlyPaymentWriteService;
import com.yinhai.tangcao.vo.InsuEmpInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInfoBQueryVo;
import com.yinhai.tangcao.vo.PsnInsuDQueryVo;
import com.yinhai.tangcao.vo.PsnTratYearDInfoVo;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * @program: backend
 * @description:
 * @author: 唐曹
 * @create: 2022-10-09 14:46
 **/
@RestService("yearlyPayment")
public class tangcaoYearlyPaymentRestService extends BaseRestService {
    @Resource
    tangcaoYearlyPaymentReadService tangcaoYearlyPaymentReadService;
    @Resource
    tangcaoYearlyPaymentWriteService tangcaoYearlyPaymentWriteService;

    @PostMapping("queryPsnInfo")
    public void queryPsnInfo(String queryCondition){
        if(!ValidateUtil.isEmpty(queryCondition)){
            List<PsnInfoBQueryVo> psnInfoBQueryVoList = tangcaoYearlyPaymentReadService.queryPsnInfo(queryCondition);
            setData("psnInfoList",psnInfoBQueryVoList);
        }
    }

    @PostMapping("queryPsnInsuInfoByPsnNo")
    public void queryPsnInsuInfoByPsnNo(String psnNo){
        if(!ValidateUtil.isEmpty(psnNo)){
            List<PsnInsuDQueryVo> psnInsuDQueryVoList = tangcaoYearlyPaymentReadService.queryPsnInsuInfoByPsnNo(psnNo);
            setData("psnInsuInfoList",psnInsuDQueryVoList);
        }
    }


    @PostMapping("queryEmpInfo")
    public void queryEmpInfo(String queryCondition){
        if(!ValidateUtil.isEmpty(queryCondition)){
            List<InsuEmpInfoBQueryVo> insuEmpInfoBQueryVoList = tangcaoYearlyPaymentReadService.queryEmpInfo(queryCondition);
            setData("empInfoList",insuEmpInfoBQueryVoList);
        }
    }

    @PostMapping("queryPsnInsuInfoByEmpNo")
    public void queryPsnInsuInfoByEmpNo(String empNo , String psnNo){
        if(!ValidateUtil.isEmpty(empNo)){
            List<PsnInsuDQueryVo> psnInsuDQueryVoList = tangcaoYearlyPaymentReadService.queryPsnInsuInfoByEmpNoAndPsnNo(empNo,psnNo);
            setData("psnInsuInfoListByEmpNo",psnInsuDQueryVoList);
        }
    }

    @PostMapping("queryPsnTratYearDInfoByPsnNo")
    public void queryPsnTratYearDInfoByPsnNo(String psnNo) {
        List<PsnTratYearDInfoVo> psnTratYearDInfoList = tangcaoYearlyPaymentReadService.queryPsnTratYearDInfoByPsnNo(psnNo);
        setData("psnTratYearDInfoList",psnTratYearDInfoList);
    }

    @PostMapping("deletePsnTratYearDInfo")
    public void deletePsnTratYearDInfo(String psnTratClctId) {
        tangcaoYearlyPaymentWriteService.deletePsnTratYearDInfo(psnTratClctId);
    }

//    @PostMapping("updatePsnTratYearDInfo")
//    public void updatePsnTratYearDInfo(String jsonStr) {
//        if(!ValidateUtil.isEmpty(jsonStr)) {
//            List<PsnTratYearDInfoVo> validatedListVoList = JSON.parseArray(jsonStr, PsnTratYearDInfoVo.class);
//            tangcaoYearlyPaymentWriteService.updatePsnTratYearDInfo(validatedListVoList);
//        }
//    }
//
//    @PostMapping("insertPsnTratYearDInfo")
//    public void insertPsnTratYearDInfo(String jsonStr) {
//        if(!ValidateUtil.isEmpty(jsonStr)) {
//            List<PsnTratYearDInfoVo> validatedListVoList = JSON.parseArray(jsonStr, PsnTratYearDInfoVo.class);
//            tangcaoYearlyPaymentWriteService.insertPsnTratYearDInfo(validatedListVoList);
//        }
//    }

    @PostMapping("insertUpdatedData")
    public void insertUpdatedData(String jsonStr1,String jsonStr2){
        if(!ValidateUtil.isEmpty(jsonStr1)&&!ValidateUtil.isEmpty(jsonStr2)){
           List<PsnTratYearDInfoVo> psnTratYearDInfoVoList1=JSON.parseArray(jsonStr1, PsnTratYearDInfoVo.class);
           List<PsnTratYearDInfoVo> psnTratYearDInfoVoList2=JSON.parseArray(jsonStr2, PsnTratYearDInfoVo.class);
            System.out.println("收到的值1："+psnTratYearDInfoVoList1);
            System.out.println("收到的值2："+psnTratYearDInfoVoList2);
            tangcaoYearlyPaymentWriteService.insertUpdatedData(psnTratYearDInfoVoList1,psnTratYearDInfoVoList2);

        }

    }
}

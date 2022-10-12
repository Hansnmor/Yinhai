package com.yinhai.zengtr.rest;

import com.alibaba.fastjson.JSON;
import com.yinhai.ta404.core.exception.AppException;
import com.yinhai.ta404.core.restservice.BaseRestService;
import com.yinhai.ta404.core.restservice.annotation.RestService;
import com.yinhai.ta404.core.utils.ResponseExportUtil;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.zengtr.service.read.zengtrSalaryDeclarationReadService;
import com.yinhai.zengtr.service.write.zengtrSalaryDeclarationWriteService;
import com.yinhai.zengtr.utils.excel.ExcelUtils;
import com.yinhai.zengtr.vo.*;

import net.sf.json.JSONArray;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@RestService("salaryDeclaration")
public class zengtrSalaryDeclarationRestService extends BaseRestService {
	@Resource
	private zengtrSalaryDeclarationReadService zengtrSalaryDeclarationReadService;

	@Resource
	private zengtrSalaryDeclarationWriteService zengtrSalaryDeclarationWriteService;

	@PostMapping("queryEmpInfo")
	public void queryEmpInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<InsuEmpInfoBQueryVo> insuEmpInfoBQueryVoList=zengtrSalaryDeclarationReadService.queryEmpInfo(empNo);
			setData("empInfoList",insuEmpInfoBQueryVoList);
		}
	}

	@PostMapping("queryEmpInsuInfo")
	public void queryEmpInsuInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			System.out.println("开始查询emp参保信息,empNo:"+empNo);
			List<EmpInsuDQueryVo> empInsuDQueryVoList=zengtrSalaryDeclarationReadService.queryEmpInsuInfo(empNo);
			setData("empInsuInfoList",empInsuDQueryVoList);
		}
	}

	//查询正常参保的人员信息
	@PostMapping("queryPsnInsuInfo")
	public void queryPsnInsuInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<PsnNormalInfoQueryVo> psnNormalInfoQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInsuInfo(empNo);
			System.out.println("最终返回的结果："+psnNormalInfoQueryVoList);
			setData("psnInsuInfolist",psnNormalInfoQueryVoList);
		}
	}

	//根据人员编号查询人员信息
	@PostMapping("queryPsnInfo")
	public void queryPsnInfo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInfoBQueryVo> psnInfoBQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInfo(psnNo);
			setData("psnInfoList",psnInfoBQueryVoList);
		}
	}

	//根据psnNo查询参保信息
	@PostMapping("queryPsnInsuInfoByPsnNo")
	public void queryPsnInsuInfoByPsnNo(String psnNo){
		if(!ValidateUtil.isEmpty(psnNo)){
			List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInsuInfoByPsnNo(psnNo);
			System.out.println("查询出的结果："+psnInsuDQueryVoList);
			setData("psnInfoInsuListByPsnNo",psnInsuDQueryVoList);
		}
	}

	//检查是否已经存入工资，有则更新数据
	@PostMapping("ifExistSalary")
	public void ifExistSalary(String jsonStr){
		if (!ValidateUtil.isEmpty(jsonStr)) {
			List<SaveWagInfoListVo> saveWagInfoListVoList = JSON.parseArray(jsonStr, SaveWagInfoListVo.class);
//			JSONArray array = JSONArray.fromObject(jsonStr);
			System.out.println("收到的数据为："+saveWagInfoListVoList);
			zengtrSalaryDeclarationWriteService.ifExistSalary(saveWagInfoListVoList);
		}
	}

	//下载模板文件
	@PostMapping("downloadTemplate")
	public void downloadTemplate(String fileName, HttpServletResponse response) throws IOException {
//		String fileUrl = "D:/upload/template1.xlsx";
//		File file = new File(fileUrl);
//		InputStream is = new FileInputStream(file);
//		ResponseExportUtil.exportFileWithStream(response, is, fileName);
		List<TemplateVo> templateVos=new ArrayList<>();
		ExcelUtils.export(response,fileName,templateVos,TemplateVo.class);
	}

	// 导入文件
	@RequestMapping("uploadFile")
	public void uploadFile(@RequestPart("file") MultipartFile file) throws Exception {
		if(file.isEmpty()) {
			throw new AppException("上传的文件是空的");
		}else{
			System.out.println("收到的文件："+file);
			List<FileImportInfoListVo> fileImportInfoListVos = ExcelUtils.readMultipartFile(file, FileImportInfoListVo.class);
			List<FileImportInfoListVo> successFile = new ArrayList<>();
			List<FileImportInfoListVo> realsuccessFile = new ArrayList<>();
			List<FileImportInfoListVo> errorFile = new ArrayList<>();
			//初步校验
			for (FileImportInfoListVo fileImportInfoListVo : fileImportInfoListVos) {
				if(fileImportInfoListVo.getRowTips().isEmpty()){
					successFile.add(fileImportInfoListVo);
				}else{
					System.out.println("错误信息："+fileImportInfoListVo.getRowTips());
					errorFile.add(fileImportInfoListVo);
				}
			}
			//进阶校验
			int flag=0;//0则表示没有校验出错误
			for (FileImportInfoListVo success : successFile) {
				System.out.println("这是success的数据："+success);
				String start=success.getStartYM();
				String end=success.getEndYM();
				if(success.getWag()<0||success.getWag()>999999999999.99){//校验工资
					flag=1;
					success.setRowTips("工资校验不正确");
				}else if(start.length()!=6||end.length()!=6||(Integer.parseInt(start.substring(4,5))!=0&&
						Integer.parseInt(start.substring(4,5))!=1)||(Integer.parseInt(end.substring(4,5))!=0&&
						Integer.parseInt(end.substring(4,5))!=1)||Integer.parseInt(start.substring(4))>12||
						Integer.parseInt(start.substring(4))>12||Integer.parseInt(start)>Integer.parseInt(end)){
					flag=1;
					success.setRowTips("开始年月或结束年月不正确");
				}else{
					//校验生存状态是否正常，是否正常缴费
					String psnNo=success.getPsnNo();
					String insutype=success.getInsutype();
					System.out.println("psnNo:"+psnNo);
					System.out.println("insutype:"+insutype);
					List<PsnInsuDQueryVo> psnInsuDQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInsuIfNormal(psnNo,insutype);
					System.out.println("psnInsuDQueryVoList:"+psnInsuDQueryVoList);
					if(ValidateUtil.isEmpty(psnInsuDQueryVoList)){
						flag=1;
					}else{
						for (PsnInsuDQueryVo psnInsuDQueryVo : psnInsuDQueryVoList) {
							if(!"1".equals(psnInsuDQueryVo.getPsnInsuStas())){
								flag=1;
							}
						}
					}
					//校验证件号码
					if(success.getCertno().length()!=18){
						flag=1;
						success.setRowTips("证件号码不正确");
					}

				}
				if(flag!=0){
					errorFile.add(success);
				}else{
					realsuccessFile.add(success);
				}
				flag=0;
			}

			System.out.println("最终success:"+realsuccessFile);
			System.out.println("最终error:"+errorFile);
			System.out.println("fileImportInfoListVo:"+ fileImportInfoListVos);

			setData("wagInfoFiles", fileImportInfoListVos);
			setData("successFile", realsuccessFile);
			setData("errorFile", errorFile);
		}
	}
}

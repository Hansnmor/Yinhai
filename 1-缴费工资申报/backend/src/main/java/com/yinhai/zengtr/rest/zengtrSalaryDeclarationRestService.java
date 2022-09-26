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
			List<EmpInsuDQueryVo> empInsuDQueryVoList=zengtrSalaryDeclarationReadService.queryEmpInsuInfo(empNo);
			setData("empInsuInfoList",empInsuDQueryVoList);
		}
	}

	//查询正常参保的人员信息
	@PostMapping("queryPsnInsuInfo")
	public void queryPsnInsuInfo(String empNo){
		if(!ValidateUtil.isEmpty(empNo)){
			List<PsnNormalInfoQueryVo> psnNormalInfoQueryVoList=zengtrSalaryDeclarationReadService.queryPsnInsuInfo(empNo);
//			System.out.println("最终返回的结果："+psnNormalInfoQueryVoList);
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
		String fileUrl = "D:/upload/template1.xlsx";
		File file = new File(fileUrl);
		InputStream is = new FileInputStream(file);
		ResponseExportUtil.exportFileWithStream(response, is, fileName);
	}

	// 导入文件
	@RequestMapping("uploadFile")
	public void uploadFile(@RequestPart("file") MultipartFile file) throws Exception {
		if(file.isEmpty()) {
			throw new AppException("上传的文件是空的");
		}else{
			System.out.println("收到的文件："+file);
			List<FileImportInfoListVo> fileImportInfoListVos = ExcelUtils.readMultipartFile(file, FileImportInfoListVo.class);
//			List<FileImportInfoListVo> successFile = new ArrayList<>();
//			List<FileImportInfoListVo> errorFile = new ArrayList<>();
//			for (FileImportInfoListVo fileImportInfoListVo : zengtrPsnInfoFileVoList) {
//				if(fileImportInfoListVo.getRowTips().isEmpty()){
//					successFile.add(fileImportInfoListVo);
//				}else{
//					System.out.println("错误信息："+fileImportInfoListVo.getRowTips());
//					errorFile.add(fileImportInfoListVo);
//				}
//			}

			System.out.println("fileImportInfoListVo:"+ fileImportInfoListVos);

			setData("wagInfoFiles", fileImportInfoListVos);
//			setData("successFile", successFile);
//			setData("errorFile", errorFile);
		}
	}
}

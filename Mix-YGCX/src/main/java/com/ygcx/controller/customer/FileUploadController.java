package com.ygcx.controller.customer;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mix.core.controller.sys.BaseController;
import com.mix.core.service.TService;
import com.mix.core.util.DateUtil;

@Controller
@RequestMapping("/fileupload")
public class FileUploadController extends BaseController {

	@Resource
	private TService service;

	@RequestMapping("/index")
	public ModelAndView index(Model model,HttpServletRequest request){
		return new ModelAndView("file/upload");
	}


	/**
	 * 描述：通过流的方式上传文件
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/upload")
	public  String  uploadExcel(HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("upfile");

		if(file.isEmpty()){
			throw new Exception("文件不存在！");
		}
		//		OutputStream os=new FileOutputStream("E:/"+new Date().getTime()+file.getOriginalFilename());
		//		 int temp;
		//		InputStream in = file.getInputStream();
		//		while((temp=in.read())!=(-1))
		//        {
		//            os.write(temp);
		//        }
		//
		File localFile = new File("E:/"+new Date().getTime()+file.getOriginalFilename());
		file.transferTo(localFile);
		//		os.flush();
		//      os.close();
		//		in.close();
		return "result";
	}

	/**
	 * 描述：通过 jquery.form.js 插件提供的ajax方式上传文件
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/ajaxUpload")
	public  ModelMap  ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			InputStream in =null;
			MultipartFile file = multipartRequest.getFile("upfile");
			Object sclb = request.getParameter("sclb");//上传类别
			if(file.isEmpty()){
				modelMap.addAttribute("res", "文件不存在！");
			}else{
			String filedateval = DateUtil.dataLongStyle(new Date());
			String lpath = getDicVal("propath","filepath");
			lpath = lpath+"/"+filedateval+"_"+file.getOriginalFilename();
			File localFile = new File(lpath);
			List<String> listsql = new ArrayList<String>();
			if(sclb.equals("INFO")){
				listsql.add("UPDATE  Sys017b  SET VALUE = '"+localFile.getName()+"' WHERE zdbm = 'importinfo' AND flbm = 'path'");
			}
			if(sclb.equals("PIC")){
				listsql.add("UPDATE  Sys017b  SET VALUE='"+lpath+"' WHERE zdbm = 'importinfo' AND flbm = 'picfilepath'");
			}
			file.transferTo(localFile);
			service.saveSqlList(listsql);
			//该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
			modelMap.addAttribute("res", "操作成功！");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("res", "操作失败！");
		}
		return modelMap;
	}

}
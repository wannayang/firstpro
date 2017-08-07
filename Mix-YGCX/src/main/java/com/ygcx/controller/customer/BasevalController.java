package com.ygcx.controller.customer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mix.core.controller.sys.BaseController;
import com.mix.core.entity.Tsyslog;
import com.mix.core.util.Global;
import com.mix.core.util.Util;
import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Sys001a;
import com.ygcx.entity.Sys001b;
import com.ygcx.entity.Sys001bId;
import com.ygcx.model.BasevalModel;
import com.ygcx.service.BasesService;

@Controller
@RequestMapping("/bases")
public class BasevalController extends BaseController {
	@Resource
	private BasesService basesService;

	@RequestMapping("/basesIndex")
	public ModelAndView basesIndex(BasevalModel basesModel, Model model, HttpServletRequest request){
		return new ModelAndView("customer/basesIndex");
	}

	@RequestMapping("/saveBases")
	public String saveBases(BasevalModel model){
//		Date date = new Date();
		Sys001bId objid = new Sys001bId();
		Sys001b obj = new Sys001b();
		BeanUtils.copyProperties(model, objid);
		BeanUtils.copyProperties(model, obj);
		obj.setId(objid);
		basesService.save(obj);
		return "redirect:/bases/basesIndex";
	}

	@RequestMapping("/deleteBases")
	public String deleteBases(HttpServletRequest request){
		this.getIusertoken(request).getTsysuser().getUsername();
		String fl = request.getParameter("fl");
		String value = request.getParameter("value");
		Sys001bId id = new Sys001bId();
		id.setFl(fl);
		id.setValue(value);
		Sys001b obj = basesService.getObjectById(id);
		basesService.delete(obj);
		Tsyslog log = new Tsyslog();
		log.setBak("deleteBases—删除基础信息：分类-值："+fl+"-"+value+" 成功");
		writeSysLog(log,request);
		return "redirect:/bases/basesIndex";
	}

	@RequestMapping("/getBases")
	@ResponseBody
	public ModelMap getBases(HttpServletRequest request, HttpServletResponse response, Model model) {
		String fl = request.getParameter("fl");
		String value = request.getParameter("value");
		Sys001bId id = new Sys001bId();
		id.setFl(fl);
		id.setValue(value);
		ModelMap modelMap = new ModelMap();
		Sys001b obj = basesService.getObjectById(id);
		modelMap.addAttribute("obj",obj);
		return modelMap;
	}	

	//返回json
	@RequestMapping("/getQueryAJsonList")
	@ResponseBody
	public ModelMap getQueryAJsonList(BasevalModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}
		PageResultSet<Sys001a> objPageResult = basesService.findPageAist(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getQueryBJsonList")
	@ResponseBody
	public ModelMap getQueryBJsonList(BasevalModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}
		PageResultSet<Sys001b> objPageResult = basesService.findPageBList(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getAllBJsonList")
	@ResponseBody
	public ModelMap getAllBJsonList(BasevalModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		List<Sys001b> res = basesService.getAllBList();
		modelMap.addAttribute("event",res);
		return modelMap;
	}

	//返回json
	@RequestMapping("/getAllAJsonList")
	@ResponseBody
	public ModelMap getAllAJsonList(BasevalModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		List<Sys001a> res = basesService.getAllAList();
		modelMap.addAttribute("event",res);
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getvalxbnx")
	@ResponseBody
	public ModelMap getvalxbnx(BasevalModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		List res = basesService.getListSql("select COUNT(1) from tb001 where czsfzh ='"+model.getCzsfzh()+"' AND czsfzh<>''" );
		modelMap.addAttribute("event",res);
		return modelMap;
	}
}

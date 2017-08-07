package com.ygcx.controller.customer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.mix.core.controller.sys.BaseController;
import com.mix.core.model.UserModel;
import com.mix.core.service.LogService;
import com.mix.core.util.Global;
import com.mix.core.util.Util;
import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Worklog;
import com.ygcx.model.WorkLogModel;
import com.ygcx.service.CustomerService;

@Controller
@RequestMapping("/worklog")
public class WorkLogController extends BaseController{
	@Resource
	private LogService service;
	
	@Resource
	private CustomerService customerService;	

	@RequestMapping("/logIndex")
	public ModelAndView logIndex(UserModel userModel, Model model, HttpServletRequest request){
		return new ModelAndView("customer/worklogindex");
	}

	@RequestMapping("/exportxls")
	public String exportxls(RedirectAttributesModelMap modelMap){
		List<Object> rows= service.getListSql("select BARCODE,CLAIMID,BOXID,RECEIPTDATE,INSUREDNAME,INSURANTID,YBH,IDNUMBER,INSUREDUNIT,INSURANCETYPE,MOBILEPHONE,EMAIL,BANKNAME,ACCOUNTNAME,BANKACCOUNT,CASEPAYMENT,CASEDEDUCTIBLE,CASEOVERINSURANCEDEDUCTION,TOTALDEDUCTIBLE,TOTALPAYMENT,CREATETIME,STATE from smis001 where 1=1");
		String header[] = {"BARCODE","CLAIMID","BOXID","RECEIPTDATE","INSUREDNAME","INSURANTID","YBH","IDNUMBER","INSUREDUNIT","INSURANCETYPE","MOBILEPHONE","EMAIL","BANKNAME","ACCOUNTNAME","BANKACCOUNT","CASEPAYMENT","CASEDEDUCTIBLE","CASEOVERINSURANCEDEDUCTION","TOTALDEDUCTIBLE","TOTALPAYMENT","CREATETIME","STATE"};
		modelMap.addFlashAttribute("header", header);
		modelMap.addFlashAttribute("rows", rows);
		return "redirect:/download/exportfile";
	}
	
	//返回json
	@RequestMapping("/getQueryJsonList")
	@ResponseBody
	public ModelMap getQueryJsonList(WorkLogModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}
		PageResultSet<Worklog> objPageResult = customerService.findlogPageList(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}	
}

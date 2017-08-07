package com.ygcx.controller.customer;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.mix.core.controller.sys.BaseController;
import com.mix.core.entity.Tsyslog;
import com.mix.core.entity.Tsysuser;
import com.mix.core.model.ConfigInfo;
import com.mix.core.util.DateUtil;
import com.mix.core.util.FileUtil;
import com.mix.core.util.Global;
import com.mix.core.util.Util;
import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Tb001;
import com.ygcx.entity.Tb001Id;
import com.ygcx.entity.Tb001b;
import com.ygcx.entity.Tb001t;
import com.ygcx.entity.Tb001xb;
import com.ygcx.entity.Tb001xbId;
import com.ygcx.entity.Worklog;
import com.ygcx.model.BasevalModel;
import com.ygcx.model.CustomerModel;
import com.ygcx.service.CustomerService;



@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {
	@Autowired  
	private ConfigInfo configInfo;
	
	@Resource
	private CustomerService customerService;

	@RequestMapping("/cxmxIndex")
	public ModelAndView cxmxIndex(CustomerModel customerModel, Model model, HttpServletRequest request){
		return new ModelAndView("customer/cxmxIndex");
	}
	
	@RequestMapping("/cxmxSjIndex")
	public ModelAndView cxmxSjIndex(CustomerModel customerModel, Model model, HttpServletRequest request){
		return new ModelAndView("customer/cxmxSjIndex");
	}

	@RequestMapping("/cxmxBjIndex")
	public ModelAndView cxmxBjIndex(CustomerModel customerModel, Model model, HttpServletRequest request){
		return new ModelAndView("customer/cxmxBjIndex");
	}

	@RequestMapping("/cxmxAddIndex")
	public ModelAndView cxmxAddIndex(CustomerModel customerModel, Model model, HttpServletRequest request){
		model.addAttribute("pagecph", customerModel.getOpercph());
		model.addAttribute("pagetbnf",customerModel.getOpertbnf());
		model.addAttribute("pagestate",customerModel.getCph()==null?"A":"U");
		return new ModelAndView("customer/cxmxAddIndex");
	}
	
	@RequestMapping("/cxmxSjAddIndex")
	public ModelAndView cxmxSjAddIndex(CustomerModel customerModel, Model model, HttpServletRequest request){
		model.addAttribute("pagecph", customerModel.getOpercph());
		model.addAttribute("pagetbnf",customerModel.getOpertbnf());
		model.addAttribute("pagestate","SJ");
		return new ModelAndView("customer/cxmxAddIndex");
	}

	@RequestMapping("/cxmxBjAddIndex")
	public ModelAndView cxmxBjAddIndex(CustomerModel customerModel, Model model, HttpServletRequest request){
		model.addAttribute("pagecph", customerModel.getOpercph());
		model.addAttribute("pagetbnf",customerModel.getOpertbnf());
		model.addAttribute("pagestate","BJ");
		return new ModelAndView("customer/cxmxAddIndex");
	}
	

	@RequestMapping("/tempindex")
	public ModelAndView tempindex(CustomerModel customerModel, Model model, HttpServletRequest request){
		return new ModelAndView("customer/customerTempList");
	}

	@RequestMapping("/cxmxPic")
	public ModelAndView cxmxPic(CustomerModel customerModel, Model model, HttpServletRequest request){
		customerModel.setCph(customerModel.getOpercph());
		model.addAttribute("info", customerModel);
		return new ModelAndView("customer/cxmxPic");
	}

	@RequestMapping("/addCustomer")
	@ResponseBody	
	public ModelMap addCustomer(CustomerModel model,HttpServletRequest request, HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		String now =  DateUtil.getSIMDateString();
		try{
			Tb001 obj = new Tb001();
			Tb001Id objid = new Tb001Id();
			BeanUtils.copyProperties(model, objid);
			obj.setId(objid);
			obj.setCzrq(DateUtil.getSIMDateString());
			Tsysuser tuser = getUser(request);

			BeanUtils.copyProperties(model, obj);
			obj.setCzr(tuser.getUsername());
			obj.setCzrq(now);
			String xzallval =model.getXzallval();
			String[] xzallvalarr = xzallval.split("#");
			customerService.dosql("delete from Tb001b where syxbdh='"+model.getSyxbdh()+"'");
			if(xzallval.length()>1){
			for(String tempxzarr:xzallvalarr){
				Tb001b objb = new Tb001b();
				String[] xzarr = tempxzarr.split(":");
				String xzmc = xzarr[0];
				String bxje = xzarr[1];
				objb.setBxje(bxje);
				objb.setSyxbdh(model.getSyxbdh());
				objb.setXzmc(xzmc);
				customerService.saveb(objb);
			}
			}
			customerService.save(obj);
			modelMap.addAttribute("event","提交成功");
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("event","操作失败");
		}
		return modelMap;
	}
	
	@RequestMapping("/addSjCustomer")
	@ResponseBody	
	public ModelMap addSjCustomer(CustomerModel model,HttpServletRequest request, HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		String now =  DateUtil.getSIMDateString();
		try{
			Tb001xb obj = new Tb001xb();
			Tb001xbId objid = new Tb001xbId();
			BeanUtils.copyProperties(model, objid);
			obj.setId(objid);
			obj.setCzrq(DateUtil.getSIMDateString());
			Tsysuser tuser = getUser(request);

			BeanUtils.copyProperties(model, obj);
			obj.setCzr(tuser.getUsername());
			obj.setCzrq(now);
			obj.setSyxbdh(model.getTempsyxbdh());
			obj.setState("2");//2算价完成
			String xzallval =model.getXzallval();
			String[] xzallvalarr = xzallval.split("#");
			customerService.savexb(obj);
			modelMap.addAttribute("event","提交成功");
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("event","操作失败");
		}
		return modelMap;
	}
	
	@RequestMapping("/saveXb")
	@ResponseBody	
	public ModelMap saveXbCustomer(CustomerModel model,HttpServletRequest request, HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		String now =  DateUtil.getSIMDateString();
		try{
			Worklog worklog = new Worklog();
			Tb001xb obj = new Tb001xb();
			Tb001xbId objid = new Tb001xbId();
			BeanUtils.copyProperties(model, objid);
			obj.setId(objid);
			obj.setCzrq(DateUtil.getSIMDateString());
			Tsysuser tuser = getUser(request);

			BeanUtils.copyProperties(model, obj);
			obj.setCzr(tuser.getUsername());
			obj.setCzrq(now);
			obj.setSyxbdh(model.getTempsyxbdh());
			System.out.println(model.getPagestate());
			if(model.getPagestate().equals("ZCSJ")){
				obj.setState("1");//
			}
			if(model.getPagestate().equals("ZCBJ")){
				obj.setState("2");//
			}			
			if(model.getPagestate().equals("SJ")){
				worklog.setLb("SJ");
				obj.setState("2");//2算价完成
			}
			if(model.getPagestate().equals("CG")){
				worklog.setLb("BJ");
				worklog.setRes("CG");
				obj.setState("3");
			}
			if(model.getPagestate().equals("SB")){
				worklog.setLb("BJ");
				worklog.setRes("SB");
				obj.setState("4");
			}
			if(model.getPagestate().equals("DD")){
				worklog.setLb("BJ");
				worklog.setRes("DD");
				obj.setState("2");
			}
			String xzallval =model.getXzallval();
			String[] xzallvalarr = xzallval.split("#");
			customerService.savexb(obj);
			if(worklog.getLb()!=null){
				worklog.setCph(model.getCph());
				worklog.setTbnf(model.getTbnf());
				worklog.setCzr(tuser.getUsername());
				worklog.setLogdate(new Date());
				worklog.setBak(model.getReason());
				customerService.saveworklog(worklog);
			}
			modelMap.addAttribute("event","提交成功");
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("event","操作失败");
		}
		return modelMap;
	}
	
	@RequestMapping("/addBjCustomer")
	@ResponseBody	
	public ModelMap addBjCustomer(CustomerModel model,HttpServletRequest request, HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		String now =  DateUtil.getSIMDateString();
		try{
			Tb001xb obj = new Tb001xb();
			Tb001xbId objid = new Tb001xbId();
			BeanUtils.copyProperties(model, objid);
			obj.setId(objid);
			obj.setCzrq(DateUtil.getSIMDateString());
			Tsysuser tuser = getUser(request);

			BeanUtils.copyProperties(model, obj);
			obj.setCzr(tuser.getUsername());
			obj.setCzrq(now);
			obj.setSyxbdh(model.getTempsyxbdh());
			obj.setState("2");//2算价完成
			String xzallval =model.getXzallval();
			String[] xzallvalarr = xzallval.split("#");
			customerService.savexb(obj);
			modelMap.addAttribute("event","提交成功");
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("event","操作失败");
		}
		return modelMap;
	}	

	@RequestMapping("/updateCustomer")
	public String updateCustomer(CustomerModel model){
		Tb001 obj = customerService.getObjectById(model.getCph());
		BeanUtils.copyProperties(model, obj);
		customerService.update(obj);
		return "redirect:/customer/cxmxIndex";
	}

	@RequestMapping("/deleteCustomer")
	public String deleteCustomer(HttpServletRequest request){
		String cph = request.getParameter("cph");
		String tbnf = request.getParameter("tbnf");
		Tb001Id id = new Tb001Id();
		id.setCph(cph);
		id.setTbnf(tbnf);
		Tb001 obj = customerService.getObjectById(id);
		customerService.delete(obj);
		Tsyslog log = new Tsyslog();
		log.setBak("deleteCustomer—删除投保信息：车牌号-投保年份："+cph+"-"+tbnf+"成功");
		writeSysLog(log,request);		
		return "redirect:/customer/cxmxIndex";
	}

	@RequestMapping("/getCustomer")
	@ResponseBody
	public ModelMap getCustomer(HttpServletRequest request, HttpServletResponse response, Model model) {
		String cph = request.getParameter("cph");
		String tbnf = request.getParameter("tbnf");
		Tb001Id id = new Tb001Id();
		id.setCph(cph);
		id.setTbnf(tbnf);
		ModelMap modelMap = new ModelMap();
		Tb001 obj = customerService.getObjectById(id);
		modelMap.addAttribute("obj",obj);
		return modelMap;
	}

	@RequestMapping("/sjCustomer")
	@ResponseBody
	public ModelMap sjCustomer(HttpServletRequest request, HttpServletResponse response, Model model) {
		String cph = request.getParameter("cph");
		String tbnf = request.getParameter("tbnf");
		Tb001xbId id = new Tb001xbId();
		id.setCph(cph);
		id.setTbnf(tbnf);
		ModelMap modelMap = new ModelMap();
		Tb001xb obj = customerService.getxbObjectById(id);
		modelMap.addAttribute("obj",obj);
		return modelMap;
	}
	
	@RequestMapping("/bjCustomer")
	@ResponseBody
	public ModelMap bjCustomer(HttpServletRequest request, HttpServletResponse response, Model model) {
		String cph = request.getParameter("cph");
		String tbnf = request.getParameter("tbnf");
		Tb001xbId id = new Tb001xbId();
		id.setCph(cph);
		id.setTbnf(tbnf);
		ModelMap modelMap = new ModelMap();
		Tb001xb obj = customerService.getxbObjectById(id);
		modelMap.addAttribute("obj",obj);
		return modelMap;
	}

	//返回json
	@RequestMapping("/getQueryZsJsonList")
	@ResponseBody
	public ModelMap getQueryZsJsonList(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}
		PageResultSet<Tb001> objPageResult = customerService.findPageList(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getQuerySjJsonList")
	@ResponseBody
	public ModelMap getQuerySjJsonList(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}
		model.setState("1");
		PageResultSet<Tb001xb> objPageResult = customerService.findPageXbList(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getQueryBjJsonList")
	@ResponseBody
	public ModelMap getQueryBjJsonList(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}
		model.setState("2");
		PageResultSet<Tb001xb> objPageResult = customerService.findPageXbList(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}	

	//返回json
	@RequestMapping("/getQueryPicJsonList")
	@ResponseBody
	public ModelMap getQueryPicJsonList(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		List<String> objPageResult = customerService.findPicList(model);
		modelMap.addAttribute("event",objPageResult);
		return modelMap;
	}

	//返回json
	@RequestMapping("/getQueryTempJsonList")
	@ResponseBody
	public ModelMap getQueryTempJsonList(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String sPage = request.getParameter("page");
		int page = 1;
		if (!Util.isNull(sPage)) {
			page = Integer.parseInt(sPage);
		}	
		PageResultSet<Tb001t> objPageResult = customerService.findTempPageList(model, page, Global.PAGE_SIZE);
		modelMap.addAttribute("event",objPageResult.getList());
		modelMap.addAttribute("pageBean", objPageResult.getPage());
		modelMap.addAttribute("pageCount",objPageResult.getPage().getTotalPage());
		return modelMap;
	}

	@RequestMapping("/exportxls")
	public String exportxls(CustomerModel model, HttpServletRequest request,RedirectAttributesModelMap modelMap){
		StringBuffer sql = new StringBuffer("select CPH,TBNF,XBNX,JFRQ,QBRQ,ZBRQ,CZXM,CZSFZH,CZLXFS,JBRXM,JBRDH,DW,JB,CLLX,CX,CJH,FDJH,CPYS,BLLB,SYXZ,CDRQ,CBGS,SYXBDH,JQXBDH,CBQD,SYXSQ,JQXSQ,SYXSH,JQXSH,BFZJESH,CCS,HCCS,BHCCS,FLFBL,FLFFS1,FLFFS2,FLFFS3,FLFZJE,SJZFBFJE,JSZDZRQ FROM TB001 u where 1=1");
		if(!Util.isNull(model.getCph())){
			sql.append(" and u.cph like '%"+model.getCph()+"%'");
		}
		if(!Util.isNull(model.getTbnf())){
			sql.append(" and u.tbnf like '%"+model.getTbnf()+"%'");
		}
		if(!Util.isNull(model.getCzxm())){
			sql.append(" and u.czxm like '%"+model.getCzxm()+"%'");
		}
		if(!Util.isNull(model.getCzsfzh())){
			sql.append(" and u.czsfzh like '%"+model.getCzsfzh()+"%'");
		}
		if(!Util.isNull(model.getIcbgs())){
			sql.append(" and u.cbgs like '%"+model.getIcbgs()+"%'");
		}
		if(!Util.isNull(model.getCjh())){
			sql.append(" and u.cjh like '%"+model.getCjh()+"%'");
		}
		if(!Util.isNull(model.getFdjh())){
			sql.append(" and u.fdjh like '%"+model.getFdjh()+"%'");
		}
		if(!Util.isNull(model.getQbrq_start())){
			sql.append(" and STR_TO_DATE(u.qbrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getQbrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getQbrq_end())){
			sql.append(" and STR_TO_DATE(u.qbrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getQbrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getZbrq_start())){
			sql.append(" and STR_TO_DATE(u.zbrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getZbrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getZbrq_end())){
			sql.append(" and STR_TO_DATE(u.zbrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getZbrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getJszdzrq_start())){
			sql.append(" and STR_TO_DATE(u.jszdzrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getJszdzrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getJszdzrq_end())){
			sql.append(" and STR_TO_DATE(u.jszdzrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getJszdzrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getCdrq_start())){
			sql.append(" and STR_TO_DATE(u.cdrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getCdrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getCdrq_end())){
			sql.append(" and STR_TO_DATE(u.cdrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getCdrq_end()+"','%Y-%m-%d')");
		}
		List<Object> rows= customerService.getListSql(sql.toString());
		//		String header[] = {"身份证号码","单位ID","单位名称","姓名","医保号","性别","在职退休状态"};
		String headers[][] = {{"车牌号","STRING"},{"投保年份","STRING"},{"续保年限","STRING"},{"缴费日期","STRING"},{"起保日期","STRING"},{"终保日期","STRING"},{"车主姓名","STRING"},{"车主身份证号","STRING"},{"车主联系方式","STRING"},{"经办人姓名","STRING"},{"经办人电话","STRING"},{"单位","STRING"},{"级别","STRING"},{"车辆类型","STRING"},{"车型","STRING"},{"车架号","STRING"},{"发动机号","STRING"},{"车牌颜色","STRING"},{"玻璃类别","STRING"},{"使用性质","STRING"},{"初登日期","STRING"},{"承保公司","STRING"},{"商业险保单号","STRING"},{"交强险保单号","STRING"},{"承保渠道","STRING"},{"商业险（税前）","STRING"},{"交强险（税前）","STRING"},{"商业险（税后）","STRING"},{"交强险（税后）","STRING"},{"保费总金额（税后）","STRING"},{"车船税","STRING"},{"含车船税","STRING"},{"不含车船税","STRING"},{"福利费比例","STRING"},{"福利费方式1（现金）","STRING"},{"福利费方式2（服务券）","STRING"},{"福利费方式3（积分）","STRING"},{"福利费总金额","STRING"},{"实际支付保费金额","STRING"},{"驾驶证到期日期","STRING"}} ;
		modelMap.addFlashAttribute("headers", headers);
		modelMap.addFlashAttribute("rows", rows);
		return "redirect:/download/exportfile";
	}

	@RequestMapping("/showImage")
	public void showImage(CustomerModel model, HttpServletRequest request,RedirectAttributesModelMap modelMap,HttpServletResponse response){//pic_addr:图片路径(d:\\upload\a.jpg)
		response.setContentType("image/*");
		FileInputStream fis = null; 
		OutputStream os = null; 
		try {
			String picname = model.getPic_name();
			String pic_addr = "d:\\ygcxpic\\"+picname+"";
			fis = new FileInputStream(pic_addr);
			os = response.getOutputStream();
			int count = 0;
			byte[] buffer = new byte[1024*8];
			while ( (count = fis.read(buffer)) != -1 ){
				os.write(buffer, 0, count);
				os.flush();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				fis.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/deletePic")
	@ResponseBody
	public ModelMap deletePic(CustomerModel model,RedirectAttributes rmodel, HttpServletRequest request, HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		String pic_addr = "d:\\ygcxpic\\"+model.getPic_name()+"";
		FileUtil.deleteFile(pic_addr);
		modelMap.addAttribute("event","删除成功");
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getvalxbnx")
	@ResponseBody
	public ModelMap getvalxbnx(BasevalModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		List res = customerService.getListSql("select COUNT(1) from tb001 where czsfzh ='"+model.getCzsfzh()+"' AND czsfzh<>''" );
		modelMap.addAttribute("event",res);
		return modelMap;
	}
	
	//返回json
	@RequestMapping("/getjsontb001b")
	@ResponseBody
	public ModelMap getjsontb001b(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		List<Tb001b> res = customerService.getListHql("from Tb001b where syxbdh = '"+model.getSyxbdh()+"'" );
		modelMap.addAttribute("event",res);
		return modelMap;
	}
	
	
	//返回json
	@RequestMapping("/syxbdhjsonCheck")
	@ResponseBody
	public String syxbdhjsonCheck(CustomerModel model, HttpServletRequest request, HttpServletResponse response) {
		List list  =	customerService.getListSql("select * from tb001b where syxbdh = '"+model.getSyxbdh()+"'");
		if(list.size()>0){
			return "false";
		}
		else{
			return "true";
		}
	}

}

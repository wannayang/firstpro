package com.ygcx.service.impl;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mix.core.dao.BaseDAO;
import com.mix.core.util.Util;
import com.mix.core.util.page.Page;
import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Tb001;
import com.ygcx.entity.Tb001b;
import com.ygcx.entity.Tb001t;
import com.ygcx.entity.Tb001xb;
import com.ygcx.entity.Worklog;
import com.ygcx.model.CustomerModel;
import com.ygcx.model.WorkLogModel;
import com.ygcx.service.CustomerService;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Resource
	private BaseDAO<Tb001> dao;
	
	@Resource
	private BaseDAO<Tb001xb> daoxb;	
	
	@Resource
	private BaseDAO<Tb001b> bdao;

	@Resource
	private BaseDAO<Tb001t> tdao;
	
	@Resource
	private BaseDAO<Object> xdao;
	
	@Resource
	private BaseDAO<Worklog> wdao;

	@Override
	public void save(Tb001 obj) {
		dao.saveOrUpdate(obj);
	}
	
	@Override
	public void savexb(Tb001xb obj){
		daoxb.saveOrUpdate(obj);
	}
	
	@Override
	public void saveb(Tb001b obj) {
		bdao.saveOrUpdate(obj);
	}

	@Override
	public void deleteb(Tb001b obj) {
		bdao.delete(obj);
	}
	
	@Override
	public void update(Tb001 obj){
		dao.update(obj);
	}

	@Override
	public void delete(Tb001 obj) {
		dao.delete(obj);
	}

	@Override
	public List<Tb001> findAllList() {
		return dao.find("from Tb001 u ");
	}

	@Override
	public List<Tb001> findListByCondition(CustomerModel model) {
		StringBuffer hql = new StringBuffer("from Tb001 u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		if(!Util.isNull(model.getCph())){
			hql.append(" and u.cph = ?");
			paramList.add(model.getCph());
		}
		if (paramList.size() == 0) {
			return null;
		}
		return dao.find(hql.toString(), paramList);
	}

	@Override
	public Tb001 findObjectByCondition(CustomerModel model) {
		StringBuffer hql = new StringBuffer("from Tb001 u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		if(!Util.isNull(model.getCph())){
			hql.append(" and u.cph = ?");
			paramList.add(model.getCph());
		}
		if (paramList.size() == 0) {
			return null;
		}
		return dao.get(hql.toString(), paramList.toArray());
	}

	@Override
	public Tb001 getObjectById(Serializable id){
		return dao.get(Tb001.class, id);
	}
	
	@Override
	public Tb001xb getxbObjectById(Serializable id){
		return daoxb.get(Tb001xb.class, id);
	}

	@Override
	public PageResultSet<Tb001> findPageList(CustomerModel model, int page, int pageSize) {
		StringBuffer hql = new StringBuffer("from Tb001 u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		if(!Util.isNull(model.getCph())){
			hql.append(" and u.id.cph like '%"+model.getCph()+"%'");
		}
		if(!Util.isNull(model.getTbnf())){
			hql.append(" and u.id.tbnf like '%"+model.getTbnf()+"%'");
		}
		if(!Util.isNull(model.getCzxm())){
			hql.append(" and u.czxm like '%"+model.getCzxm()+"%'");
		}
		if(!Util.isNull(model.getCzsfzh())){
			hql.append(" and u.czsfzh like '%"+model.getCzsfzh()+"%'");
		}
		if(!Util.isNull(model.getIcbgs())){
			hql.append(" and u.cbgs like '%"+model.getIcbgs()+"%'");
		}
		if(!Util.isNull(model.getDw())){
			hql.append(" and u.dw = '"+model.getDw()+"'");
		}
		if(!Util.isNull(model.getJb())){
			hql.append(" and u.jb = '"+model.getJb()+"'");
		}
		if(!Util.isNull(model.getCbgs())){
			hql.append(" and u.cbgs = '"+model.getCbgs()+"'");
		}	
		if(!Util.isNull(model.getCbqd())){
			hql.append(" and u.cbqd = '"+model.getCbqd()+"'");
		}
		if(!Util.isNull(model.getCjh())){
			hql.append(" and u.cjh like '%"+model.getCjh()+"%'");
		}
		if(!Util.isNull(model.getFdjh())){
			hql.append(" and u.fdjh like '%"+model.getFdjh()+"%'");
		}		
		if(!Util.isNull(model.getQbrq_start())){
			hql.append(" and STR_TO_DATE(u.qbrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getQbrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getQbrq_end())){
			hql.append(" and STR_TO_DATE(u.qbrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getQbrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getZbrq_start())){
			hql.append(" and STR_TO_DATE(u.zbrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getZbrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getZbrq_end())){
			hql.append(" and STR_TO_DATE(u.zbrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getZbrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getJszdzrq_start())){
			hql.append(" and STR_TO_DATE(u.jszdzrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getJszdzrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getJszdzrq_end())){
			hql.append(" and STR_TO_DATE(u.jszdzrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getJszdzrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getCdrq_start())){
			hql.append(" and STR_TO_DATE(u.cdrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getCdrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getCdrq_end())){
			hql.append(" and STR_TO_DATE(u.cdrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getCdrq_end()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getJfrq_start())){
			hql.append(" and STR_TO_DATE(u.jfrq,'%Y-%m-%d') >= STR_TO_DATE('"+model.getJfrq_start()+"','%Y-%m-%d')");
		}
		if(!Util.isNull(model.getJfrq_end())){
			hql.append(" and STR_TO_DATE(u.jfrq,'%Y-%m-%d') <= STR_TO_DATE('"+model.getJfrq_end()+"','%Y-%m-%d')");
		}		
		if(!Util.isNull(model.getJbrxm())){
			hql.append(" and u.jbrxm like '%"+model.getJbrxm()+"%'");
		}
		Long totalRow = dao.count(hql.toString(), paramList);
		Page pages = new Page(totalRow.intValue(), pageSize, page);
		//这里用到了Page类中的获取首页和分页大小的方法
		List<Tb001> list = dao.find(hql.toString(), paramList, page, pageSize);

		//把取出来的结果放到list中
		PageResultSet<Tb001> pageResultSet = new PageResultSet<Tb001>();

		pageResultSet.setList(list);

		pageResultSet.setPage(pages);

		return pageResultSet;
	}
	
	public PageResultSet<Worklog> findlogPageList(WorkLogModel model, int page, int pageSize){
		StringBuffer hql = new StringBuffer("from Worklog u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		if(!Util.isNull(model.getCph())){
			hql.append(" and u.cph like '%"+model.getCph()+"%'");
		}
		if(!Util.isNull(model.getTbnf())){
			hql.append(" and u.tbnf like '%"+model.getTbnf()+"%'");
		}
		if(!Util.isNull(model.getLb())){
			hql.append(" and u.lb like '%"+model.getLb()+"%'");
		}
		if(!Util.isNull(model.getLogdate())){
			hql.append(" and u.logdate like '%"+model.getLogdate()+"%'");
		}
		if(!Util.isNull(model.getRes())){
			hql.append(" and u.res like '%"+model.getRes()+"%'");
		}
			hql.append(" order by u.logdate desc");
		Long totalRow = dao.count(hql.toString(), paramList);
		Page pages = new Page(totalRow.intValue(), pageSize, page);
		//这里用到了Page类中的获取首页和分页大小的方法
		List<Worklog> list = wdao.find(hql.toString(), paramList, page, pageSize);

		//把取出来的结果放到list中
		PageResultSet<Worklog> pageResultSet = new PageResultSet<Worklog>();

		pageResultSet.setList(list);

		pageResultSet.setPage(pages);

		return pageResultSet;
	}
	
	public PageResultSet<Tb001xb> findPageXbList(CustomerModel model, int page, int pageSize){
		StringBuffer hql = new StringBuffer("from Tb001xb u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		if(!Util.isNull(model.getCph())){
			hql.append(" and u.id.cph like '%"+model.getCph()+"%'");
		}
		if(!Util.isNull(model.getTbnf())){
			hql.append(" and u.id.tbnf like '%"+model.getTbnf()+"%'");
		}
		if(!Util.isNull(model.getState())){
			hql.append(" and u.state = '"+model.getState()+"'");
		}		
		Long totalRow = daoxb.count(hql.toString(), paramList);
		Page pages = new Page(totalRow.intValue(), pageSize, page);
		//这里用到了Page类中的获取首页和分页大小的方法
		List<Tb001xb> list = daoxb.find(hql.toString(), paramList, page, pageSize);

		//把取出来的结果放到list中
		PageResultSet<Tb001xb> pageResultSet = new PageResultSet<Tb001xb>();

		pageResultSet.setList(list);

		pageResultSet.setPage(pages);

		return pageResultSet;
	}

	@Override
	public PageResultSet<Tb001t> findTempPageList(CustomerModel model, int page, int pageSize) {
		StringBuffer hql = new StringBuffer("from Tb001t u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		if(!Util.isNull(model.getCph())){
			hql.append(" and u.cph like '%"+model.getCph()+"%'");
		}
		Long totalRow = tdao.count(hql.toString(), paramList);
		Page pages = new Page(totalRow.intValue(), pageSize, page);
		//这里用到了Page类中的获取首页和分页大小的方法
		List<Tb001t> list = tdao.find(hql.toString(), paramList, page, pageSize);
		//把取出来的结果放到list中
		PageResultSet<Tb001t> pageResultSet = new PageResultSet<Tb001t>();
		pageResultSet.setList(list);
		pageResultSet.setPage(pages);
		return pageResultSet;
	}


	@Override
	public List getListSql(String sql){
		return dao.findSql(sql);
	}
	
	@Override
	public List<String> findPicList(CustomerModel model){
		  List<String> filename = new ArrayList<String>();
		  List l = xdao.findSql("select value from Sys017b where zdbm='importinfo' and flbm = 'picpath'");
		  String path = String.valueOf(l.get(0));
		  File file=new File(path);
		  File[] tempList = file.listFiles();
//		  System.out.println("该目录下对象个数："+tempList.length);
		  for (int i = 0; i < tempList.length; i++) {
			if (tempList[i].isFile()) {
			   if(tempList[i].getName().indexOf(model.getCph())>=0){
				   filename.add(tempList[i].getName());
			   }
//		    System.out.println("文     件："+tempList[i]);
		   }
		   if (tempList[i].isDirectory()) {
//		    System.out.println("文件夹："+tempList[i]);
		   }
		  }
		  return filename;
	}
	
	@Override
	public void dosql(String sql){
		xdao.executeSql(sql);
		
	}
	
	@Override
	public List getListHql(String hql){
		return xdao.find(hql);
	}
	
	@Override
	public void saveworklog(Worklog worklog){
		wdao.save(worklog);
	}

}

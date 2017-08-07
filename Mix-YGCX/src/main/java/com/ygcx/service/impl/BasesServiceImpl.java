package com.ygcx.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mix.core.dao.BaseDAO;
import com.mix.core.util.Util;
import com.mix.core.util.page.Page;
import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Sys001a;
import com.ygcx.entity.Sys001b;
import com.ygcx.model.BasevalModel;
import com.ygcx.service.BasesService;



@Service("basesService")
public class BasesServiceImpl implements BasesService {

	@Resource
	private BaseDAO<Sys001b> dao;
	
	@Resource
	private BaseDAO<Sys001a> adao;

	@Resource
	private BaseDAO<Object> xdao;

	@Override
	public void save(Sys001b obj) {
		dao.saveOrUpdate(obj);
	}

	@Override
	public void update(Sys001b obj){
		dao.update(obj);
	}

	@Override
	public void delete(Sys001b obj) {
		dao.delete(obj);
	}

	@Override
	public List<Sys001b> findAllList() {
		return dao.find("from Sys001b u ");
	}

	@Override
	public Sys001b getObjectById(Serializable id){
		return dao.get(Sys001b.class, id);
	}

	@Override
	public PageResultSet<Sys001b> findPageBList(BasevalModel model, int page, int pageSize) {
		StringBuffer hql = new StringBuffer("from Sys001b u where 1=1");
		if(!Util.isNull(model.getFl())){
		hql.append(" and u.id.fl = '"+model.getFl()+"'");
		}
		if(!Util.isNull(model.getValue())){
			hql.append(" and u.id.value = '"+model.getValue()+"'");
		}
		List<Object> paramList = new ArrayList<Object>();
		Long totalRow = dao.count(hql.toString(), paramList);
		Page pages = new Page(totalRow.intValue(), pageSize, page);
		//这里用到了Page类中的获取首页和分页大小的方法
		List<Sys001b> list = dao.find(hql.toString(), paramList, page, pageSize);
		//把取出来的结果放到list中
		PageResultSet<Sys001b> pageResultSet = new PageResultSet<Sys001b>();
		pageResultSet.setList(list);
		pageResultSet.setPage(pages);
		return pageResultSet;
	}

	@Override
	public PageResultSet<Sys001a> findPageAist(BasevalModel model, int page, int pageSize) {
		StringBuffer hql = new StringBuffer("from Sys001a u where 1=1");
		List<Object> paramList = new ArrayList<Object>();
		Long totalRow = adao.count(hql.toString(), paramList);
		Page pages = new Page(totalRow.intValue(), pageSize, page);
		//这里用到了Page类中的获取首页和分页大小的方法
		List<Sys001a> list = adao.find(hql.toString(), paramList, page, pageSize);
		//把取出来的结果放到list中
		PageResultSet<Sys001a> pageResultSet = new PageResultSet<Sys001a>();
		pageResultSet.setList(list);
		pageResultSet.setPage(pages);
		return pageResultSet;
	}
	
	@Override
	public List<Sys001b> getAllBList(){
		StringBuffer hql = new StringBuffer("from Sys001b u where 1=1 order by fl,value");
		List<Sys001b> lres = dao.find(hql.toString());
		return lres;
		
	}
	
	@Override
	public List<Sys001a> getAllAList(){
		StringBuffer hql = new StringBuffer("from Sys001a u where 1=1 order by fl");
		List<Sys001a> lres = adao.find(hql.toString());
		return lres;		
	}

	@Override
	public List getListSql(String sql){
		return dao.findSql(sql);
	}
	
	@Override
	public void dosql(String sql){
		xdao.executeSql(sql);
	}

}

package com.ygcx.service;


import java.io.Serializable;
import java.util.List;

import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Tb001;
import com.ygcx.entity.Tb001b;
import com.ygcx.entity.Tb001t;
import com.ygcx.entity.Tb001xb;
import com.ygcx.entity.Worklog;
import com.ygcx.model.CustomerModel;
import com.ygcx.model.WorkLogModel;

/**
 * 业务层
 * 
 * @author smis
 *
 */
public interface CustomerService {

	/**
	 * 添加
	 * @param obj
	 */
	public void save(Tb001 obj);
	
	public void savexb(Tb001xb obj);
	
	public void saveb(Tb001b obj);
	
	/**
	 * 修改
	 * @param obj
	 */
	public void update(Tb001 obj);
	
	public void deleteb(Tb001b obj);
	
	/**
	 * 删除
	 * @param obj
	 */
	public void delete(Tb001 obj);
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<Tb001> findAllList();
	
	/**
	 * 根据条件查询数据
	 * @param obj
	 * @return
	 */
	public List<Tb001> findListByCondition(CustomerModel model);
	
	/**
	 * 通过条件查找用户
	 * @param objModel
	 * @return
	 */
	public Tb001 findObjectByCondition(CustomerModel model);
	
	/**
	 * 通过ID查询obj
	 * @param id
	 * @return
	 */
	public Tb001 getObjectById(Serializable id);
	
	public Tb001xb getxbObjectById(Serializable id);
	
	/**
	 * 查询用户分页列表
	 * @param objModel
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageResultSet<Tb001> findPageList(CustomerModel model, int page, int pageSize);
	
	public PageResultSet<Worklog> findlogPageList(WorkLogModel model, int page, int pageSize);
	
	public PageResultSet<Tb001xb> findPageXbList(CustomerModel model, int page, int pageSize);
	
	public PageResultSet<Tb001t> findTempPageList(CustomerModel model, int page, int pageSize);
	
	public List<String> findPicList(CustomerModel model);
	
	public List getListSql(String sql);
	
	public void dosql(String sql);
	
	public List getListHql(String hql);
	
	public void saveworklog(Worklog worklog);
}

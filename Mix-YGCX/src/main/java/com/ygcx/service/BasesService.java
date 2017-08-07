package com.ygcx.service;


import java.io.Serializable;
import java.util.List;

import com.mix.core.util.page.PageResultSet;
import com.ygcx.entity.Sys001a;
import com.ygcx.entity.Sys001b;
import com.ygcx.model.BasevalModel;

/**
 * 业务层
 * 
 * @author smis
 *
 */
public interface BasesService {

	/**
	 * 添加
	 * @param obj
	 */
	public void save(Sys001b obj);
	
	/**
	 * 修改
	 * @param obj
	 */
	public void update(Sys001b obj);
	
	/**
	 * 删除
	 * @param obj
	 */
	public void delete(Sys001b obj);
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<Sys001b> findAllList();
	
	/**
	 * 通过ID查询obj
	 * @param id
	 * @return
	 */
	public Sys001b getObjectById(Serializable id);
	
	/**
	 * 查询用户分页列表
	 * @param objModel
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageResultSet<Sys001b> findPageBList(BasevalModel model, int page, int pageSize);
	
	public PageResultSet<Sys001a> findPageAist(BasevalModel model, int page, int pageSize);
	
	public List<Sys001b> getAllBList();
	
	public List<Sys001a> getAllAList();
	
	public List getListSql(String sql);
	
	
	public void dosql(String sql);
}

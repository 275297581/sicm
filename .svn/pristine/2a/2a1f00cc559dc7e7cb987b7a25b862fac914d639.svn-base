package com.iking.basic;

import java.util.List;
@SuppressWarnings("rawtypes")
public interface BasicInter {
  
	public Object uniqueQueryObject(String hql);
		/**
		 * @function 开始获取内存中值
		 */
		public Object loadById(Class clazz,java.io.Serializable id);
		
		/**
		 * @function 直接去数据库查询
		 */
		public Object getById(Class clazz,java.io.Serializable id);
		
		/**
		 * @function 执行SQL查询语句
		 */
		public List executeQuery(String hql,Object []parameters);
		
		/**
		 * @function 分页查询
		 */
		public List executeQueryByPage(String hql,Object []parameters,int pageNow,int PagesSize);
		
		/**
		 * @function 新增
		 */
		public Object add(Object obj);
		
		/**
		 * @function 修改  删除
		 */
		public int executeUpdate(String hql,Object []parameters);
		
		/**
		 * @function 查询出唯一值
		 */
		public Object uniqueQuery(String hql,Object []parameters);
		
		/**
		 * @function 查询总页数
		 */
		public int queryPageCount(String hql,Object [] parameters,int pageSize);
		
		/**
		 * @function  通过id删除
		 */
		public void delById(Class clazz,java.io.Serializable id);
		
		
		/**
		 * @function 通过对象修改
		 */
		public void update(Object object);
		/**
		 * @function 通过对象修改
		 */
		public void saveorupdate(Object object);
		/**
		 * @function 通过对象删除
		 */
		public void delete(Object object);
		/**
		 * @function 执行SQL查询语句
		 */
		public List executeQueryBySql(String sql,Object []parameters);
}

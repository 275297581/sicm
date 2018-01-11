package com.iking.basic;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BasicServer implements BasicInter {

	@Resource
	public SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Object add(Object obj) {
		System.out.println("add: " + obj.toString()); 
		return this.sessionFactory.getCurrentSession().save(obj);
	}

	public void delById(Class clazz, Serializable id) {
		System.out.println("delete: " + clazz.toString() + "  ID:  " + id);
		this.sessionFactory.getCurrentSession()
				.delete(this.loadById(clazz, id));
	}

	public List executeQuery(String hql, Object[] parameters) {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (parameters != null && parameters.length > 0)
			for (int i = 0; i < parameters.length; i++)
				query.setParameter(i, parameters[i]);
		return query.list();
	}

	public List executeQueryByPage(String hql, Object[] parameters,
			int pageNow, int PagesSize) {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (parameters != null && parameters.length > 0)
			for (int i = 0; i < parameters.length; i++)
				query.setParameter(i, parameters[i]);
		return query.setFirstResult((pageNow - 1) * PagesSize)
				.setMaxResults(PagesSize).list();
	}

	public int executeUpdate(String hql, Object[] parameters) {
		System.out.println("executeUpdate: "+ hql);
		try {
			Query query = this.sessionFactory.getCurrentSession().createQuery(
					hql);
			if (parameters != null && parameters.length > 0)
				for (int i = 0; i < parameters.length; i++)
					query.setParameter(i, parameters[i]);
			return query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Object uniqueQueryObject(String hql) {
		Query query = (Query) this.sessionFactory.getCurrentSession()
				.createQuery(hql);
		List list = query.list();
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	public Object loadById(Class clazz, Serializable id) {
		return this.sessionFactory.getCurrentSession().load(clazz, id);
	}

	public Object getById(Class clazz, Serializable id) {
		return this.sessionFactory.getCurrentSession().get(clazz, id);
	}

	public int queryPageCount(String hql, Object[] parameters, int pageSize) {
		Object obj = this.uniqueQuery(hql, parameters);
		int rowCount = Integer.parseInt(obj.toString());
		return (rowCount - 1) / pageSize + 1;
	}

	public Object uniqueQuery(String hql, Object[] parameters) {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (parameters != null && parameters.length > 0)
			for (int i = 0; i < parameters.length; i++)
				query.setParameter(i, parameters[i]);
		return query.uniqueResult();
	}

	public void update(Object object) {
		System.out.println("update: " + object.toString());
		this.sessionFactory.getCurrentSession().update(object);
	}

	public void saveorupdate(Object object) {
		System.out.println("update: " + object.toString());
		this.sessionFactory.getCurrentSession().saveOrUpdate(object);
	}
	public void delete(Object object) {
		System.out.println("delete: " + object.toString());
		this.sessionFactory.getCurrentSession().delete(object);
	}

	@Override
	public List executeQueryBySql(String sql, Object[] parameters) {
		Query query = this.sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (parameters != null && parameters.length > 0)
			for (int i = 0; i < parameters.length; i++)
				query.setParameter(i, parameters[i]);
		return query.list();
	}
}

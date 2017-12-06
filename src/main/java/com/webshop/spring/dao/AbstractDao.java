package com.webshop.spring.dao;

import java.io.Serializable;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;


public abstract class AbstractDao<PK extends Serializable, T> {

	 private final Class<T> persistentClass;
     
	    @SuppressWarnings("unchecked")
	    public AbstractDao(){
	        this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	    }
	     
	    @Autowired
	    private SessionFactory sessionFactory;
	 
	    protected Session getSession(){
	        return sessionFactory.getCurrentSession();
	    }
	 
	    public T getByKey(PK key) {
	        return (T) getSession().get(persistentClass, key);
	    }
	    
	    public void update(T entity) {
	    	getSession().update(entity);
	    }
	    
	    public void persist(T entity) {
	        getSession().persist(entity);
	    }
	 
	    public void delete(T entity) {
	        getSession().delete(entity);
	       
	    }
	    
	    @SuppressWarnings("unchecked")
		public List<T> getQuery(String hql) {
	    	Query query = getSession().createQuery(hql);
	    	return query.getResultList();
	    }
	    
		@SuppressWarnings("unchecked")
		public List<T> getListById(int id,String crit) {
			Criteria criteria = createEntityCriteria();
			criteria.add(Restrictions.eq(crit, id));
			return (List<T>)criteria.list();
		}
	    
	    @SuppressWarnings("deprecation")
		protected Criteria createEntityCriteria(){
	        return getSession().createCriteria(persistentClass);
	    }
}

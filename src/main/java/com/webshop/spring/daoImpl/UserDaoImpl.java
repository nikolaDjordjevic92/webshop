package com.webshop.spring.daoImpl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.webshop.spring.dao.AbstractDao;
import com.webshop.spring.dao.UserDao;
import com.webshop.spring.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao{

	@Override
	public User findByUsername(String name) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("username", name));
		User user = (User) criteria.uniqueResult();

//		if (user != null) {
//			Hibernate.initialize(user.getUserProfiles());
//		}

		return user;
	}

}

package org.havriutkin.memorycard2.dao;

import org.havriutkin.memorycard2.model.User;

public class UserDAO extends AbstractHibernateDAO<User> {
    public UserDAO() {
        super(User.class);
    }
}

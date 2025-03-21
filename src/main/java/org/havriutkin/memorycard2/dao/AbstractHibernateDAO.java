package org.havriutkin.memorycard2.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.havriutkin.memorycard2.utils.HibernateUtil;

import java.util.List;

public abstract class AbstractHibernateDAO<T> implements GenericDAO<T> {

    private final Class<T> entityType; // Need it, since during runtime T.class doesn't work

    public AbstractHibernateDAO(Class<T> entityType) {
        this.entityType = entityType;
    }

    @Override
    public void save(T entity) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.persist(entity);
            tx.commit();
        }
    }

    @Override
    public T findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(entityType, id);
        }
    }

    @Override
    public List<T> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from " + entityType.getSimpleName(), entityType).list();
        }
    }

    @Override
    public void update(T entity) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.merge(entity);
            tx.commit();
        }
    }

    @Override
    public void delete(T entity) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.remove(entity);
            tx.commit();
        }
    }
}

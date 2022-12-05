/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.IDao;
import entities.Admin;
import java.util.List;
import org.hibernate.HibernateException;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author hp
 */
public class AdminService implements IDao<Admin> {

    @Override
    public boolean create(Admin o) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            return true;
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean delete(Admin o) {
               Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            return true;
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean update(Admin o) {
                Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            return true;
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public Admin getById(int id) {
        Admin admin = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            admin  = (Admin) session.get(Admin.class, id);
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return admin;
    }

    @Override
    public List<Admin> getAll() {
        List<Admin> admins = null;
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            admins  =  session.createQuery("from Admin").list();
            tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return admins;
    }
    
     public Admin getByEmail(String email) {
        Admin admin = null;
        Session session = null;
        Transaction tx = null;
        try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        admin = (Admin) session.createQuery("from Admin where email = ?").setParameter(0, email).uniqueResult();
        tx.commit();
        } catch (HibernateException e) {
            if(tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return admin;
    }
}


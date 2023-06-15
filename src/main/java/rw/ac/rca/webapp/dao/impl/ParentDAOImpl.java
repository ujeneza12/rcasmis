package rw.ac.rca.webapp.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;

import rw.ac.rca.webapp.dao.ParentDAO;
import rw.ac.rca.webapp.orm.Parent;


public class ParentDAOImpl extends DAO implements ParentDAO {
    public static final Logger LOG = Logger.getLogger(ParentDAOImpl.class);
    public static ParentDAOImpl instance;

    public static ParentDAOImpl getInstance() {
        if (instance == null) {
            return new ParentDAOImpl();

        } else {
            return instance;
        }
    }

    private ParentDAOImpl() {
    }

    @Override
    public Parent saveParent(Parent parent) {
        try {
            begin();
            Parent prt = (Parent) getSession().save(parent);
            commit();
            return prt;

        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    @Override
    public Parent updateParent(Parent parent) {
        try {
            begin();
            getSession().update(parent);
            commit();
            return parent;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    @Override
    public Parent saveOrUpdateParent(Parent parent) {
        try {
            begin();
            getSession().saveOrUpdate(parent);
            commit();
            return parent;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    @Override
    public boolean deleteParent(Parent parent) {
        try {
            begin();
            getSession().delete(parent);
            commit();
            return true;
        } catch (Exception e) {
            rollback();
            return false;
        }
    }

    @Override
    public Parent getParentById(int id) {
        try {
            begin();
            Query query = getSession().createQuery("from Parent where id= :ref");
            query.setInteger("ref", id);
            Parent parent = (Parent) query.uniqueResult();
            commit();
            return parent;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Parent> getAllParents() {
        try {
            begin();
            Query query = getSession().createQuery("from Parent");
            List<Parent> parents = query.list();
            commit();
            return parents;
        } catch (Exception e) {
            rollback();
            return null;
        }
    }


}
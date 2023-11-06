/* Watchara Santawee 65130500073 */
package dev.bestzige.assignment_one.repositories;

import dev.bestzige.assignment_one.entities.Office;
import dev.bestzige.assignment_one.utils.EntityManagerBuilder;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class OfficeRepository {
    private EntityManager entityManager;
    private static int DEFAULT_LIMIT = 10;
    private static int MAX_LIMIT = 100;

    public int getDefaultLimit() {
        return DEFAULT_LIMIT;
    }

    public int getMaxLimit() {
        return MAX_LIMIT;
    }

    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public List<Office> findAll(String search, int page, int limit) {
        EntityManager entityManager = getEntityManager();
        int offset = (page - 1) * limit;
        TypedQuery<Office> query = entityManager.createNamedQuery("Office.findAll", Office.class);
        if (search != null) {
            query = entityManager.createNamedQuery("Office.search", Office.class)
                    .setParameter("search", "%" + search + "%");
        }

        return query.setFirstResult(offset)
                .setMaxResults(limit)
                .getResultList();
    }

    public Office findByOfficeCode(String officeCode) {
        EntityManager entityManager = getEntityManager();
        try {
            return entityManager.createNamedQuery("Office.findByOfficeCode", Office.class)
                    .setParameter("officeCode", officeCode)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public int count() {
        EntityManager entityManager = getEntityManager();
        try {
            return entityManager.createNamedQuery("Office.count", Long.class)
                    .getSingleResult()
                    .intValue();
        } catch (Exception e) {
            return 0;
        }
    }

    public String create(Office office) {
        if(office == null) return "Office is null";
        EntityManager entityManager = getEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(office);
            entityManager.getTransaction().commit();
            return null;
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            return e.getMessage();
        }
    }

    public String update(Office office) {
        if(office == null) return "Office is null";
        EntityManager entityManager = getEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(office);
            entityManager.getTransaction().commit();
            return null;
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            return e.getMessage();
        }
    }

    public String delete(String officeCode) {
        if(officeCode == null) return "Office code is null";
        EntityManager entityManager = getEntityManager();
        try {
            entityManager.getTransaction().begin();
            Office office = findByOfficeCode(officeCode);
            entityManager.remove(office);
            entityManager.getTransaction().commit();
            return null;
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            return e.getMessage();
        }
    }

    public String delete(Office office) {
        if(office == null) return "Office is null";
        return delete(office.getOfficeCode());
    }

    public void close() {
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
    }
}

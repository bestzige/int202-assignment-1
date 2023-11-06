/* Watchara Santawee 65130500073 */
package dev.bestzige.assignment_one.utils;

import dev.bestzige.assignment_one.configs.Enviroment;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityManagerBuilder {
    private final static EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory(Enviroment.PERSISTENCE_UNIT_NAME);

    public static EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }
}

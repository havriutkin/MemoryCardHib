package org.havriutkin.memorycard2.dao;

import org.havriutkin.memorycard2.model.CardSet;

public class CardSetDAO extends AbstractHibernateDAO<CardSet> {
    public CardSetDAO() {
        super(CardSet.class);
    }
}

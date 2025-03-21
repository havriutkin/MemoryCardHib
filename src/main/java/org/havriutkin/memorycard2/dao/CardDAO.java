package org.havriutkin.memorycard2.dao;

import org.havriutkin.memorycard2.model.Card;

public class CardDAO extends AbstractHibernateDAO<Card> {
    public CardDAO() {
        super(Card.class);
    }
}

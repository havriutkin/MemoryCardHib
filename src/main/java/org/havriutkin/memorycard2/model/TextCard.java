package org.havriutkin.memorycard2.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("TEXT")
public class TextCard extends Card {
    private String question;

    public TextCard() {
        super();
    }

    public TextCard(String title, String answer, String question, CardSet cardSet) {
        super(title, answer, cardSet);
        this.question = question;
    }

    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
}

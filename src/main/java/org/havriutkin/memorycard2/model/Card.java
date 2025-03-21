package org.havriutkin.memorycard2.model;

import jakarta.persistence.*;

@Entity
@Table(name = "cards")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "card_type", discriminatorType = DiscriminatorType.STRING)
public abstract class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String answer;

    @ManyToOne
    @JoinColumn(name = "card_set_id")
    private CardSet cardSet;

    public Card() {}

    public Card(String title, String answer, CardSet cardSet) {
        this.title = title;
        this.answer = answer;
        cardSet.addCard(this);
    }

    // Getters
    public Long getId() { return id; }
    public String getTitle() { return title; }
    public String getAnswer() { return answer; }
    public CardSet getCardSet() { return cardSet; }

    // Setters
    public void setId(Long id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setAnswer(String answer) { this.answer = answer; }
    public void setCardSet(CardSet cardSet) { this.cardSet = cardSet; }
}

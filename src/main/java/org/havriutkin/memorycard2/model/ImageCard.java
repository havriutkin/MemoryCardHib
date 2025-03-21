package org.havriutkin.memorycard2.model;

import jakarta.persistence.*;

@Entity
@DiscriminatorValue("IMAGE")
public class ImageCard extends Card {

    @Column(name = "image_url")
    private String imageUrl;

    public ImageCard() {}

    public ImageCard(String title, String answer, String imageUrl, CardSet cardSet) {
        super(title, answer, cardSet);
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}

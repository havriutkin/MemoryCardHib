package org.havriutkin.memorycard2.model;

import jakarta.persistence.*;

@Entity
@DiscriminatorValue("AUDIO")
public class AudioCard extends Card {

    @Column(name = "audio_url")
    private String audioUrl;

    public AudioCard() {}

    public AudioCard(String title, String answer, String audioUrl, CardSet cardSet) {
        super(title, answer, cardSet);
        this.audioUrl = audioUrl;
    }

    public String getAudioUrl() { return audioUrl; }
    public void setAudioUrl(String audioUrl) { this.audioUrl = audioUrl; }
}

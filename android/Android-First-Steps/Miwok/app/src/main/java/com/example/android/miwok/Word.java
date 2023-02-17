package com.example.android.miwok;

/**
 * Created by ZapptsDev on 5/22/17.
 */

public class Word {

    private String mDefaultTranslation;

    private String mMiwokTranslation;

    private int mAudioResourceId;

    private int mImageResourceId = NO_IMAGE_PROVIDED;

    public static final int NO_IMAGE_PROVIDED = -1;

    public Word(String defaultTranslation, String miowkTranslation, int audioResourceId) {

        mDefaultTranslation = defaultTranslation;
        mMiwokTranslation = miowkTranslation;
        mAudioResourceId = audioResourceId;
    }

    @Override
    public String toString() {
        return "Word{" +
                "mDefaultTranslation='" + mDefaultTranslation + '\'' +
                ", mMiwokTranslation='" + mMiwokTranslation + '\'' +
                ", mAudioResourceId=" + mAudioResourceId +
                ", mImageResourceId=" + mImageResourceId +
                '}';
    }

    public Word(String defaultTranslation, String miowkTranslation, int imageResourceId, int audioResourceId) {

        mDefaultTranslation = defaultTranslation;
        mMiwokTranslation = miowkTranslation;
        mImageResourceId = imageResourceId;
        mAudioResourceId = audioResourceId;
    }

    public String getDefaultTranslation() {

        return mDefaultTranslation;
    }

    public String getMiwokTranslation() {

        return mMiwokTranslation;
    }

    public int getImageResourceId() {

        return mImageResourceId;
    }

    public boolean hasImage(){

        return mImageResourceId != NO_IMAGE_PROVIDED;
    }

    public int getAudioResourceId() {

        return mAudioResourceId;
    }

}

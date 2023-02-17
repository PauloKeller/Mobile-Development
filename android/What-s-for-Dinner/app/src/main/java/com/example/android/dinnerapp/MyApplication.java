package com.example.android.dinnerapp;

import android.app.Application;

import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Logger;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.tagmanager.ContainerHolder;
import com.google.android.gms.tagmanager.TagManager;

/**
 * Created by ZapptsDev on 11/24/17.
 */

public class MyApplication extends Application {
    public Tracker mTracker;

    public ContainerHolder mContainerHolder;
    public TagManager mTagManager;

    // Get the Tag Manager
    public TagManager getTagManager() {
        if (mTagManager == null){
            // Create the TagManager, save it in mTagManager
            mTagManager = TagManager.getInstance(this);
        }
        return mTagManager;
    }

    // Set the ContainerHolder
    public void setContainerHolder(ContainerHolder containerHolder) {
        mContainerHolder = containerHolder;
    }

    // Get the ContainerHolder
    public ContainerHolder getContainerHolder() {
        return mContainerHolder;
    }

    // Get the tracker associated wirh this app
    public void startTracking () {

        // Initialize an Analytics tracker using a Google Analytics property ID

        // Does the Tracker already exist?
        // If not, create it

        if (mTracker == null){
            GoogleAnalytics mGoogleAnalytics = GoogleAnalytics.getInstance(this);

            // Get the config data for the tracker
            mTracker = mGoogleAnalytics.newTracker(R.xml.track_app);

            // Enable tracking of activities
            mGoogleAnalytics.enableAutoActivityReports(this);

            // Set the log level to verbose.
            mGoogleAnalytics.getLogger().setLogLevel(Logger.LogLevel.VERBOSE);
        }
    }

    public Tracker getTracker() {
        // Make sure the tracker exists
        startTracking();

        // Then return the tracker
        return mTracker;
    }
}

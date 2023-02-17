package com.example.zapptsdev.calculations_acochambrations.Activities;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.example.zapptsdev.calculations_acochambrations.R;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        try {
            Thread.sleep(1000);
            goToMain();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void goToMain(){
        Intent i = new Intent(SplashActivity.this, MainActivity.class);
        startActivity(i);
    }
}

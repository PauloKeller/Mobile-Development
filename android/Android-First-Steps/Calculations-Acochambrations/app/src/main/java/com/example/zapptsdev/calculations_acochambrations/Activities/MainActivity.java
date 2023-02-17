package com.example.zapptsdev.calculations_acochambrations.Activities;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.zapptsdev.calculations_acochambrations.R;

import org.w3c.dom.Text;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    Button number1Btn, number2Btn, number3Btn, number4Btn, number5Btn, number6Btn,
            number7Btn, number8Btn, number9Btn, number0Btn, okBtn;
    TextView equationLbl;
    String mValue = "", result = "", mValue2 = "";
    boolean isDegree = false;
    int degree, index;
    double coefficient;
    double [] C;
    boolean isReset = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        init();
        setListeners();

    }

    private void ok(){
        equationLbl.setText("");
        if (isReset) {
            equationLbl.setText("");
        }  else {
            if (!isDegree) {
                isDegree = true;
                degree = Integer.parseInt(mValue);
                C = new double[degree+1];
                mValue = "";
            } else {
                coefficient = Integer.parseInt(mValue);
                C[index] = coefficient;
                index ++;
                mValue = "";
            } if (index == degree){
                double derivative[] = new double[C.length-1];
                for(int i=0;i<derivative.length;i++){
                    derivative[i] = C[i]*(C.length - 1 -i );
                    mValue2 = " Derivada " + String.valueOf(i+1) + " "+ String.valueOf(derivative[i]);
                    result = result + mValue2;
                    equationLbl.setText(result);
                    Log.d("Result ==>", result);
                }
                reset();
            }
        }
    }

    private void sendValue (String number) {
        mValue = mValue + number;
        equationLbl.setText(mValue);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.number_1:
                sendValue("1");
                break;
            case R.id.number_2:
                sendValue("2");
                break;
            case R.id.number_3:
                sendValue("3");
                break;
            case R.id.number_4:
                sendValue("4");
                break;
            case R.id.number_5:
                sendValue("5");
                break;
            case R.id.number_6:
                sendValue("6");
                break;
            case R.id.number_7:
                sendValue("7");
                break;
            case R.id.number_8:
                sendValue("8");
                break;
            case R.id.number_9:
                sendValue("9");
                break;
            case R.id.number_0:
                sendValue("0");
                break;
            case R.id.equals_btn:
                ok();
                break;
        }
    }


    private void init(){
        number1Btn            = (Button) findViewById(R.id.number_1);
        number2Btn            = (Button) findViewById(R.id.number_2);
        number3Btn            = (Button) findViewById(R.id.number_3);
        number4Btn            = (Button) findViewById(R.id.number_4);
        number5Btn            = (Button) findViewById(R.id.number_5);
        number6Btn            = (Button) findViewById(R.id.number_6);
        number7Btn            = (Button) findViewById(R.id.number_7);
        number8Btn            = (Button) findViewById(R.id.number_8);
        number9Btn            = (Button) findViewById(R.id.number_9);
        number0Btn            = (Button) findViewById(R.id.number_0);
        equationLbl           = (TextView) findViewById(R.id.equation_lbl);
        okBtn             = (Button) findViewById(R.id.equals_btn);
    }

    private void setListeners() {
        number1Btn.setOnClickListener(this);
        number2Btn.setOnClickListener(this);
        number3Btn.setOnClickListener(this);
        number4Btn.setOnClickListener(this);
        number5Btn.setOnClickListener(this);
        number6Btn.setOnClickListener(this);
        number7Btn.setOnClickListener(this);
        number8Btn.setOnClickListener(this);
        number9Btn.setOnClickListener(this);
        number0Btn.setOnClickListener(this);
        okBtn.setOnClickListener(this);
        equationLbl.setOnClickListener(this);
    }

    private void reset(){
        mValue = "";
        result = "";
        degree = 0;
        isDegree = false;
        index = 0;
        coefficient = 0;
        isReset = true;
    };


}

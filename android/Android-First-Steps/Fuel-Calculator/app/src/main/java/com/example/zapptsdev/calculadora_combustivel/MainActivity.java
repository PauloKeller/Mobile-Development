package com.example.zapptsdev.calculadora_combustivel;

import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText mEditTextGasolina;
    EditText mEditTextEthanol;
    ImageView mImageWhoIsBetter;
    TextView mLabelWhoIsBetter;
    TextView mLabelWhoIsBetterNow;
    Button mBtnCalcular;
    float precoGasolina = 0;
    float precoEthanol = 0;
    float vantagem = 0;
    boolean vantagemGasolina = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mEditTextGasolina   = (EditText) findViewById(R.id.input_text_gasolina);
        mEditTextEthanol    = (EditText) findViewById(R.id.input_text_ethanol);
        mBtnCalcular        = (Button)   findViewById(R.id.btn_calcular);

        mBtnCalcular.setOnClickListener(calcular);

    }

    private View.OnClickListener calcular = new View.OnClickListener() {
        public void onClick(View v) {
            try{
                precoGasolina = Float.parseFloat(mEditTextGasolina.getText().toString());
                precoEthanol = Float.parseFloat(mEditTextEthanol.getText().toString());

                vantagem = precoEthanol/precoGasolina;

                if (vantagem > 0.7){
                    vantagemGasolina = true;
                }

                Log.d("Diferenca" , String.valueOf(vantagem));

                showCustomDialog();
            } catch (Exception error){
                error.printStackTrace();
            }

        }
    };

    private void showCustomDialog(){
        /**
         * Custom alert to show
         * Layout
         */
        final AlertDialog.Builder alertBuilder = new AlertDialog.Builder(MainActivity.this);
        View mView = getLayoutInflater().inflate(R.layout.progress_dialog_who_is_better, null);
        mImageWhoIsBetter = (ImageView) mView.findViewById(R.id.image_view_who_is_better);
        mLabelWhoIsBetter = (TextView) mView.findViewById(R.id.label_who_is_better);
        mLabelWhoIsBetterNow = (TextView) mView.findViewById(R.id.label_who_is_better_now);

        if (vantagemGasolina){
            mImageWhoIsBetter.setImageResource(R.drawable.gasolina);
            mLabelWhoIsBetterNow.setText(getString(R.string.label_gasolina));
        }

        alertBuilder.setView(mView);

        /**
         * Create alert
         */
        final AlertDialog dialogChangePass = alertBuilder.create();
        dialogChangePass.show();

        vantagemGasolina = false;

    }
}

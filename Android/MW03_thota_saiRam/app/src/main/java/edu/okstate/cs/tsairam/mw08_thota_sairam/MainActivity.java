package edu.okstate.cs.tsairam.mw08_thota_sairam;

import android.app.ListActivity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ((Button)findViewById(R.id.pick_ups_button)).setOnClickListener(this);
        ((Button)findViewById(R.id.drop_off_button)).setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {

        if (view.getId() == R.id.drop_off_button) {
            Intent dropOffsIntent = new Intent(getBaseContext(), DropOffListActivity.class);
            startActivity(dropOffsIntent);
        }else if(view.getId()==R.id.pick_ups_button) {
            Intent pickUpsIntent = new Intent(getBaseContext(), PickUpsListActivity.class);
            startActivity(pickUpsIntent);
        }
    }
}

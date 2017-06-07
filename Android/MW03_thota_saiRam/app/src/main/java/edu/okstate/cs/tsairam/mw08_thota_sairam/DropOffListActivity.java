package edu.okstate.cs.tsairam.mw08_thota_sairam;

import android.app.ListActivity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;

import java.util.ArrayList;

public class DropOffListActivity extends ListActivity implements AdapterView.OnItemClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ArrayAdapter<CarsData> myAdapter = new MyDropOffsArrayAdapter(this, getData());
        setListAdapter(myAdapter);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        ArrayList<CarsData> myData = this.getData();

        myData.get(i).setCellTappped(!getData().get(i).isCellTappped());

        if(getData().get(i).isCellTappped())
        {
            view.setBackgroundColor(Color.rgb(171,202,72));
        }
        else {
            view.setBackgroundColor(Color.WHITE);
        }
    }
    public ArrayList<CarsData> getData() {
        ArrayList<CarsData> myData = new ArrayList<CarsData>();
        myData.add(new CarsData("SLSF",78465,"Lime Loader",false));
        myData.add(new CarsData("BN", 441716, "Lime Loader", true));
        myData.add(new CarsData("GATX", 91381, "Feed Mill", false));
        myData.add(new CarsData("KCS",753412,"Warehouse",false));
        myData.add(new CarsData("CNW",490032,"Hampton Feed",true));
        myData.add(new CarsData("GATX", 73127,"Hampton Feed", false));
        return myData;
    }
}

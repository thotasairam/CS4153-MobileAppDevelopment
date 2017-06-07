package edu.okstate.cs.tsairam.mw08_thota_sairam;

import android.app.ListActivity;;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;

import java.util.ArrayList;

public class PickUpsListActivity extends ListActivity implements AdapterView.OnItemClickListener {

    public  ArrayAdapter<CarsData> myAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

         myAdapter = new MyPickUpsArrayAdapter(this, getData());
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
        myData.add(new CarsData("DRGW",18347,"Marble City",true));
        myData.add(new CarsData("KCS", 29900, "Cargill", false));
        myData.add(new CarsData("SP", 400089, "Lime Loader", true));
        myData.add(new CarsData("SP",401290,"Lime Loader",false));
        myData.add(new CarsData("GATX",73127,"Sallisaw",false));
        return myData;
    }
}

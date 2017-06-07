package edu.okstate.cs.tsairam.mw08_thota_sairam;

import android.app.Activity;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by thotasairam on 12/1/16.
 */
public class MyDropOffsArrayAdapter extends ArrayAdapter<CarsData> {

    private final List<CarsData> myData;
    private final Activity context;

    public MyDropOffsArrayAdapter(Activity context, ArrayList<CarsData> myData) {
        super(context, R.layout.activity_drop_off_list, myData);
        this.context = context;
        this.myData = myData;
    }

    static class ViewHolder{
        protected TextView rNameNCNum1;
        protected TextView locationNum1;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        View view = null;
        if(convertView==null) {
            LayoutInflater inflator = context.getLayoutInflater();
            view = inflator.inflate(R.layout.activity_drop_off_list,null);
            final ViewHolder viewHolder = new ViewHolder();
            viewHolder.rNameNCNum1 = (TextView) view.findViewById(R.id.road_name_car_number_1);
            viewHolder.locationNum1 = (TextView) view.findViewById(R.id.location_number_1);
            view.setTag(viewHolder);
        }
        else {
            view = convertView;
        }

        ViewHolder holder = (ViewHolder) view.getTag();

        holder.rNameNCNum1.setText((CharSequence)(myData.get(position).getRoadName()+ " " +myData.get(position).getCarNumber()));

        holder.locationNum1.setText((CharSequence)("Location: " +myData.get(position).getLocation()));

        if(myData.get(position).isCellTappped())
        {
            view.setBackgroundColor(Color.rgb(171,202,72));
        }
        else {
            view.setBackgroundColor(Color.WHITE);
        }

        return view;
    }
}

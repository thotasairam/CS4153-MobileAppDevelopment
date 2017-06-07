package edu.okstate.cs.tsairam.mw08_thota_sairam;

import android.app.Activity;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

public class MyPickUpsArrayAdapter extends ArrayAdapter<CarsData> {

    private final List<CarsData> myData;
    private final Activity context;

    public MyPickUpsArrayAdapter(Activity context, List<CarsData> myData)
    {
        super(context, R.layout.activity_pick_ups_list, myData);
        this.context = context;
        this.myData = myData;
    }

    static class ViewHolder{
        protected TextView rNameNCNum;
        protected TextView locationNum;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        View view = null;
        final ViewHolder viewHolder;
        if(convertView==null) {
            LayoutInflater inflator = context.getLayoutInflater();
            view = inflator.inflate(R.layout.activity_pick_ups_list,null);
             viewHolder = new ViewHolder();
            viewHolder.rNameNCNum = (TextView) view.findViewById(R.id.road_name_car_number);
            viewHolder.locationNum = (TextView) view.findViewById(R.id.location_number);
            view.setTag(viewHolder);
        }
        else
        {
            view = convertView;
        }

        ViewHolder holder = (ViewHolder) view.getTag();

        holder.rNameNCNum.setText((CharSequence)(myData.get(position).getRoadName()+ " " +myData.get(position).getCarNumber()));

        holder.locationNum.setText((CharSequence)("Location: " +myData.get(position).getLocation()));

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

package com.controler;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Sorting {
	
	 public static boolean ASC = true;
	    public static boolean DESC = false;

	    public static Map<String, Double> sortNow(Map<String, Double> unsortMap)
	    {


	        Map<String, Double> sortedMapDesc = sortByComparator(unsortMap, DESC);
	        return sortedMapDesc;
	    }

	    private static Map<String, Double> sortByComparator(Map<String, Double> unsortMap, final boolean order)
	    {

	        List<Entry<String, Double>> list = new LinkedList<Entry<String, Double>>(unsortMap.entrySet());

	        // Sorting the list based on values
	        Collections.sort(list, new Comparator<Entry<String, Double>>()
	        {
	            public int compare(Entry<String, Double> o1,
	                    Entry<String, Double> o2)
	            {
	                if (order)
	                {
	                    return o1.getValue().compareTo(o2.getValue());
	                }
	                else
	                {
	                    return o2.getValue().compareTo(o1.getValue());

	                }
	            }
	        });

	        // Maintaining insertion order with the help of LinkedList
	        Map<String, Double> sortedMap = new LinkedHashMap<String, Double>();
	        for (Entry<String, Double> entry : list)
	        {
	            sortedMap.put(entry.getKey(), entry.getValue());
	        }

	        return sortedMap;
	    }

	    public static void printMap(Map<String, Double> map)
	    {
	        for (Entry<String, Double> entry : map.entrySet())
	        {
	            System.out.println("Key : " + entry.getKey() + " Value : "+ entry.getValue());
	        }
	    }
}

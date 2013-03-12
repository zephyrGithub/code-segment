package com.github.codesegment.jdk;

import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/**
 * Created with IntelliJ IDEA.
 * User: chenxiaojian
 * Date: 13-2-27
 * Time: 上午11:49
 */
public class TreeMapTest {

    public static void main(String[] args) {

        TreeMap treeMap = new TreeMap();

        treeMap.put("a", "aa");
        treeMap.put("c", "aa");
        treeMap.put("d", "aa");
        treeMap.put("f", "aa");


        Set<Map.Entry<String, String>> entrySet = treeMap.entrySet();

        for (Map.Entry<String,String> entry:entrySet){
            System.out.println(entry.getKey());
        }

    }


}

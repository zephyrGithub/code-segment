package com.github.codesegment.jdk;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * User: chenxiaojian
 * Date: 13-2-21
 * Time: 上午11:28
 */
public class HashMapTest {
    public static void main(String[] args) {

        Map hashMap = new HashMap();

        hashMap.put(null, 123);
        System.out.println("hashMap contains key null: " + hashMap.containsKey(null));

        hashMap.put(null, "aaa");
        Object value = hashMap.get(null);
        System.out.println("object: " + value);
        System.out.println("hashMap size: " + hashMap.size());

        hashMap.put("aaa", "aaa");
        System.out.println(hashMap.containsValue("aaa"));

        hashMap.put(null, null);
        if (hashMap.get(null) == null) {
            System.out.println("get key null value null");
        }
        System.out.println("remove " + hashMap.remove("aaa"));

        hashMap.put("aaa", "aaa");
        hashMap.put("bbb", "aaa");
        hashMap.put("ccc", "aaa");
        hashMap.put("ddd", "aaa");
        hashMap.put("fff", "aaa");
        hashMap.put("eee", "aaa");
        Set<Map.Entry<String,String>> entrySet = hashMap.entrySet();


        for (Map.Entry<String,String> entry:entrySet){
            System.out.println(entry.getKey());
        }
    }

}

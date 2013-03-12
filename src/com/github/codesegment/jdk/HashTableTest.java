package com.github.codesegment.jdk;

import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * User: chenxiaojian
 * Date: 13-2-25
 * Time: 下午3:12
 * To change this template use File | Settings | File Templates.
 */
public class HashtableTest {

    public static void main(String[] args) {

        //测试a%b和a&(b-1)
        int b = 4;
        for (int a = 3;  ; a=new Random().nextInt()) {
            System.out.println("a: "+a );
            System.out.println(a % b);
            System.out.println(a & (b - 1));
        }


    }


}

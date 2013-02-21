package com.github.codesegment.alg;

/**
 * 输出十万以内素数
 * <p/>
 * User: chenxiaojian
 * Date: 12-12-26
 * Time: 下午10:43
 */
public class Prime {

    public static void main(String[] args) {
        printPrime();
    }

    //打印之
    private static void printPrime() {
        for (int i = 1; i <= 100000; i++) {
            if (isPrime(i)) {
                System.out.println(i);
            }
        }
    }

    //判断之
    private static boolean isPrime(int num) {
        if (num == 1 || num == 2) return true;
        for (int j = 2; j < num; j++) {
            if (num % j == 0)
                return false;
        }
        return true;
    }

}

package com.github.codesegment.alg;

/**
 * User: chenxiaojian
 * Date: 13-2-22
 * Time: 下午2:06
 */
public class HeapSort {

    private int a[];

    public HeapSort() {

    }


    //从i结点开始调整，n为节点总数，从0开始计算i节点的子节点为2*i+1，2*i+2
    public void minHeapFixDown(int _a[], int i, int n) {
        this.a = _a;
        int j, temp;

        temp = a[i];
        j = (i << 1) + 1;
        while (j < n) {
            if (j + 1 < n && a[j] > a[j + 1])  //在左右孩子找最小的
                j++;

            if (a[j] >= temp)
                break;

            a[i] = a[j]; //把较小的子结点往上移，替换他的父节点
            i = j;
            j = (i << 1) + 1;

        }
        a[i] = temp;

    }


    public void MinHeapSort(int _a[]) {
        this.a = _a;
        int n = a.length;
        for (int i = n - 1; i >= 1; i--) {
            minHeapFixDown(a, i, n);
        }


    }

    public void Swap(int value1, int value2, int index) {
        int temp = this.a[index];
        this.a[index] = this.a[0];
        this.a[0] = temp;
    }


}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeSortedArray {

function mergeArray(uint[] memory arr1,uint[] memory arr2) public pure returns (uint[] memory){
    require(arr1.length>0 && arr2.length>0,"array length must grater than 0");

    uint[] memory mergedArray = new uint[](arr1.length + arr2.length);
    uint i = 0;
    uint j = 0;
    uint k = 0;
    //比较两个数组元素，按顺序合并
    while (i < arr1.length && j < arr2.length) {
        if (arr1[i] <= arr2[j]) {
            mergedArray[k] = arr1[i];
            i++;
        } else {
            mergedArray[k] = arr2[j];
            j++;
        }
        k++;
    }
    //处理剩余元素
    while (i < arr1.length) {
        mergedArray[k] = arr1[i];
        i++;
        k++;
    }
    while (j < arr2.length) {
        mergedArray[k] = arr2[j];
        j++;
        k++;
    }
    return mergedArray;
  }
}
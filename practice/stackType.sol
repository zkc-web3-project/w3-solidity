// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackType{
    function someType() public pure {
/////////////////////////基本类型，直接存储数据在栈中/////////////////////////////////
        //整形
        uint aa = 12;
        uint8 bb = 232;
        int cc = -5;

        //布尔型
        bool dd = true;
        bool ee = false;

        //地址类型
        address ff = 0x742d35Cc6634C0532925a3b844Bc454e4438f44e;

        address userAddress = 0x742d35Cc6634C0532925a3b844Bc454e4438f44e;

        address payable payableAddress = payable(0x742d35Cc6634C0532925a3b844Bc454e4438f44e);

        //字节数组
        bytes1 hh = 0x12;
        bytes2 ii = 0x1234;
        bytes32 jj = 0x1234567890123456789012345678901234567890123456789012345678901234;

        ////////////////////引用类型，存储引用地址在栈中////////////////////////////
     
        // string public constant str11 = hex"hello";
        // uint256[] public arr1 = new uint256[](4);

    }

    enum Status{Enabled, Disabled}

    function enumTypes() public pure {
        Status status = Status.Enabled;
    }


    function example(uint256 aa,bool flag,address cc) public pure returns(int ww){
        return ww;
    }


}
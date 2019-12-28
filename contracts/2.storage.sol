pragma solidity >=0.4.33 <0.6.0;//指定编译版本号
contract HelloWorld1{
    string public a;
    string  b ="eee";
    constructor() public {
        a = "abc";
    }
    function updateNum() public {
        changeNum(a);
    }

    // aa 只是传值
    function changeNum(string memory aa) internal {
        aa = "d";
    }


    function changeNum2(string storage aa) internal {
        aa = b ;
    }
}
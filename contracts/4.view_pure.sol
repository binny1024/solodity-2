pragma solidity >=0.4.22 <0.6.0;
contract HelloWorld3 {
    uint public age;
    uint public constant name = 12;
    function constantViewPure() public {
        age = 29;
    }
    // 只读
    function getAgeByView() public view returns (uint) {
        // age += 1;  //compiling should be error
        return age;
    }
    //不可读,不可写
    function getAgeByPure() public pure returns (uint) {
        // return age; // compiling should be error;
        return name;
    }
}

pragma solidity 0.5.12;


contract Random{

  function flipHead() public returns(bool){
    uint flip = now % 2;
    if( flip == 0 ){
      return false;
    }
    else{
      return true;
    }
  }

}

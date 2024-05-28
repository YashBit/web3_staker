// SPDX - License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

library Address{
    function isContract(address account) internal view returns (bool){
        return account.code.length > 0;
    }
    function sendValue(address payable recipient, unint256 amount) internal {
        require(address(this).balance >= amount, "Address: Insufficient Balance");
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: Unable to send value, recipient may have reverted");
    }

    function functionCall(address target, bytes memory data) internal returns (bytes memory){
        return functionCall(target, data, "Address: Low Level Call Failed");
    }

    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage 
    ) internal returns (bytes memory){
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    function functionCallWithValue(
        address target, 
        bytes memory data,
        uint256 value 
    ) internal returns (bytes memory){
        return functionCallWithValue(target, data, value, "Address: Low-Level call with value failed");
    }

    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage

    ) internal returns (bytes memory){
        require(address(this).balance >= value, "Address: Insufficient Balance for Call");
        require(isContract(target), "Address: Call to non-contract");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        
    }



}
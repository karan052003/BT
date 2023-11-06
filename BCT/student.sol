// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 studentId;
        string name;
        uint256 age;
    }

    Student[] public students;

    // Function to add a new student
    function addStudent(uint256 _studentId, string memory _name, uint256 _age) public {
        students.push(Student(_studentId, _name, _age));
    }

    // Function to get the total number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Fallback function to receive Ether (if any)
    receive() external payable {}

    // Function to check the balance of the contract
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

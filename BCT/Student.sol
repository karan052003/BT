// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint id;
        string name;
        uint age;
    }
    
    Student[] public students;

    event StudentAdded(uint id, string name, uint age);

    function addStudent(uint _id, string memory _name, uint _age) public {
        students.push(Student(_id, _name, _age));
        emit StudentAdded(_id, _name, _age);
    }

    function getStudent(uint index) public view returns (uint, string memory, uint) {
        require(index < students.length, "Index out of bounds");
        return (students[index].id, students[index].name, students[index].age);
    }

    // Fallback function
    fallback() external {
        revert("Fallback function not allowed");
    }
}

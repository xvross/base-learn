// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ErrorTriageExercise {

    /**
     * @dev Finds the absolute difference between each consecutive uint and returns an array of results.
     * 
     * @param _a The first unsigned integer.
     * @param _b The second unsigned integer.
     * @param _c The third unsigned integer.
     * @param _d The fourth unsigned integer.
     * 
     * @return An array containing the absolute differences between each consecutive pair.
     */
    function diffWithNeighbor(
        uint _a,
        uint _b,
        uint _c,
        uint _d
    ) public pure returns (uint[] memory) {
        // Initialize an array to store the differences
        uint[] memory results = new uint[](3);
        results[0] = _a > _b ? _a - _b : _b - _a;
        results[1] = _b > _c ? _b - _c : _c - _b;
        results[2] = _c > _d ? _c - _d : _d - _c;
        return results;
    }

    /**
     * @dev Modifies the base by a specified integer modifier. Base is always >= 1000. Modifiers can be
     * between +100 and -100.
     * 
     * @param _base The base value to be modified.
     * @param _modifier The integer value by which the base should be modified.
     * 
     * @return The modified base value.
     */
    function applyModifier(
        uint _base,
        int _modifier
    ) public pure returns (uint) {
        if (_modifier >= 0) {
            return _base + uint(_modifier);
        } else {
            return _base - uint(-_modifier);
        }
    }

    uint[] private arr;

    /**
     * @dev Pops the last element from the array and returns it.
     * 
     * @return The last element of the array before popping.
     */
    function popWithReturn() public returns (uint) {
        require(arr.length > 0, "Array is empty");
        uint result = arr[arr.length - 1];
        arr.pop();
        return result;
    }

    /**
     * @dev Adds a new element to the end of the array.
     * 
     * @param _num The number to be added to the array.
     */
    function addToArr(uint _num) public {
        arr.push(_num);
    }

    /**
     * @dev Returns the entire array.
     * 
     * @return The array of unsigned integers.
     */
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    /**
     * @dev Resets the array to an empty state.
     */
    function resetArr() public {
        delete arr;
    }
}

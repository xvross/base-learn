// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract BasicMath {

    /**
     * @dev Adds two unsigned integers, returns the sum and an error flag.
     * @param _a First unsigned integer
     * @param _b Second unsigned integer
     * @return sum The sum of _a and _b
     * @return error A boolean indicating if an overflow occurred
     */
    function adder(uint _a, uint _b) public pure returns (uint sum, bool error) {
        unchecked {
            sum = _a + _b;
            if (sum < _a) {  // Overflow check
                return (0, true);
            }
            return (sum, false);
        }
    }

    /**
     * @dev Subtracts two unsigned integers, returns the difference and an error flag.
     * @param _a First unsigned integer
     * @param _b Second unsigned integer
     * @return difference The difference between _a and _b
     * @return error A boolean indicating if an underflow occurred
     */
    function subtractor(uint _a, uint _b) public pure returns (uint difference, bool error) {
        unchecked {
            if (_b > _a) {  // Underflow check
                return (0, true);
            }
            difference = _a - _b;
            return (difference, false);
        }
    }
}

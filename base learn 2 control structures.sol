// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ControlStructures {

    /**
     * @dev FizzBuzz function: Returns "Fizz", "Buzz", "FizzBuzz" or "Splat" based on the input number.
     * @param _number The number to check divisibility
     * @return result A string memory result based on divisibility of _number
     */
    function fizzBuzz(uint _number) public pure returns (string memory result) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    // Custom error for after-hours
    error AfterHours(uint time);

    /**
     * @dev Do Not Disturb function: Provides a message based on the time of day.
     * @param _time The input time in a 24-hour format
     * @return result A string memory representing the current period of the day
     */
    function doNotDisturb(uint _time) public pure returns (string memory result) {
        // Use assert to handle invalid time greater than or equal to 2400
        assert(_time < 2400);

        // Revert with a custom error if _time is outside of working hours (after 2200 or before 0800)
        if (_time >= 2200 || _time < 800) {
            revert AfterHours(_time);
        }

        // Revert with a string message if the time is during lunch (1200 to 1259)
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }

        // Return a message based on the input time
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
    }
}

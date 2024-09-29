// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract EmployeeStorage {
    // Private state variables
    uint16 private shares;         // Optimized to use a 16-bit unsigned integer for shares (0 to 65535)
    uint32 private salary;         // Optimized to use a 32-bit unsigned integer for salary (0 to 1,000,000)

    // Public state variables
    string public name;            // Stores the employee's name
    uint256 public idNumber;       // Stores the employee's ID number (any number up to 2^256-1)

    // Custom error for exceeding the share limit
    error TooManyShares(uint16 totalShares);

    // Constructor to initialize the values when deploying the contract
    constructor(uint16 _shares, string memory _name, uint32 _salary, uint256 _idNumber) {
        require(_salary <= 1_000_000, "Salary must be between 0 and 1,000,000");
        
        shares = _shares;
        name = _name;
        salary = _salary;
        idNumber = _idNumber;
    }

    /**
     * @dev Public accessor for private shares variable.
     * Reverts with UnauthorizedAccess error if called inappropriately.
     * @return Number of shares
     */
    function viewShares() public view returns (uint16) {
        return shares;
    }

    /**
     * @dev Public accessor for private salary variable.
     * @return Salary amount
     */
    function viewSalary() public view returns (uint32) {
        return salary;
    }

    /**
     * @dev Public function to grant additional shares to an employee.
     * @param _newShares The number of new shares to be added
     */
    function grantShares(uint16 _newShares) public {
        // Check if _newShares is greater than 5000, if so revert with message
        require(_newShares <= 5000, "Too many shares");

        // Calculate the new total shares
        uint16 newTotalShares = shares + _newShares;

        // Revert if the new total exceeds 5000 shares
        if (newTotalShares > 5000) {
            revert TooManyShares(newTotalShares);
        }

        // Add new shares if no error
        shares = newTotalShares;
    }

    /**
    * Do not modify this function.  It is used to enable the unit test for this pin
    * to check whether or not you have configured your storage variables to make
    * use of packing.
    * If you wish to cheat, simply modify this function to always return `0`
    * I'm not your boss ¯\_(ツ)_/¯
    * Fair warning though, if you do cheat, it will be on the blockchain having been
    * deployed by your wallet....FOREVER!
    */
    function checkForPacking(uint _slot) public view returns (uint r) {
    assembly {
        r := sload (_slot)
    }
    }
    /**
    * Warning: Anyone can use this function at any time!
    */
    function debugResetShares() public {
    shares = 1000;
    }
}

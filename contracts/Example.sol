pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/CappedToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/PausableToken.sol";

contract ExampleToken is MintableToken, CappedToken, BurnableToken, PausableToken {
    string public name = "EXAMLE";
    string public symbol = "EX";
    uint8 public decimals = 18;
    uint256 public cap = 2000 * (10**6);

  // Special propeties
    bool public tradingStarted = false;

  /**
  * @dev modifier that throws if trading has not started yet
   */
    modifier hasStartedTrading() {
        require(tradingStarted);
        _;
    }

  /**
  * @dev Allows the owner to enable the trading. This can not be undone
  */
    function startTrading() public onlyOwner {
        tradingStarted = true;
    }

  /**
  * @dev Allows anyone to transfer the Change tokens once trading has started
  * @param _to the recipient address of the tokens.
  * @param _value number of tokens to be transfered.
   */
    function transfer(address _to, uint _value) hasStartedTrading whenNotPaused public returns (bool) {
        return super.transfer(_to, _value);
    }

  /**
  * @dev Allows anyone to transfer the Change tokens once trading has started
  * @param _from address The address which you want to send tokens from
  * @param _to address The address which you want to transfer to
  * @param _value uint the amout of tokens to be transfered
   */
    function transferFrom(address _from, address _to, uint _value) hasStartedTrading whenNotPaused public returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function emergencyERC20Drain( ERC20 oddToken, uint amount ) public {
        oddToken.transfer(owner, amount);
    }
}




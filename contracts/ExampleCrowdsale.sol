pragma solidity ^0.4.19;

import "./Example.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "zeppelin-solidity/contracts/lifecycle/Pausable.sol";

contract ExampleTokenCrowdsale is Ownable,Pausable {
    using SafeMath for uint256;
                    // The token being sold
    ExampleToken public token;

    uint256 public decimals = 18; 

    uint256 public oneCoin = 10**decimals;

    address public multiSig; 

    // ***************************
    // amount of raised money in wei
    uint256 public weiRaised;

    // amount of raised tokens
    uint256 public tokenRaised;

    // number of participants in presale
    uint256 public numberOfPurchasers = 0;

    event HostEther(address indexed buyer, uint256 value);
    event TokenPlaced(address indexed beneficiary, uint256 amount); 
    event SetWallet(address _newWallet);
    event SendedEtherToMultiSig(address walletaddress, uint256 amountofether);

    function setWallet(address _newWallet) public onlyOwner {
        multiSig = _newWallet;
        emit SetWallet(_newWallet);
    }
    function ExampleTokenPrivatesale() public {



// *************************************

        multiSig = ; // multiSig Wallet Address

//**************************************             

        token = new ExampleToken();
    
    }


    function placeTokens(address beneficiary, uint256 _tokens) onlyOwner public {
    
        require(_tokens != 0);
        require (beneficiary != 0x0);
     // require(!hasEnded());
        //require(tokenRaised.add(_tokens) <= maxTokens);

        if (token.balanceOf(beneficiary) == 0) {
            numberOfPurchasers++;
        }
        tokenRaised = tokenRaised.add(_tokens); // so we can go slightly over
        token.mint(beneficiary, _tokens);
        emit TokenPlaced(beneficiary, _tokens); 
    }

    // low level token purchase function
    function buyTokens(address buyer, uint256 amount) whenNotPaused internal {
    
        require (multiSig != 0x0);
        require (msg.value > 1 finney);
        // update state
        weiRaised = weiRaised.add(amount);
    
        emit HostEther(buyer, amount);
        // send the ether to the MultiSig Wallet
        multiSig.transfer(this.balance);          // better in case any other ether ends up here
        emit SendedEtherToMultiSig(multiSig,amount);
    }

    // transfer ownership of the token to the owner of the presale contract
    function transferTokenContractOwnership(address _address) public onlyOwner {
    
        token.transferOwnership(_address);
    
    }

    // fallback function can be used to buy tokens
    function () public payable {
        buyTokens(msg.sender, msg.value);
    }

    function emergencyERC20Drain( ERC20 oddToken, uint amount ) public onlyOwner{
        oddToken.transfer(owner, amount);
    }
}

    
    

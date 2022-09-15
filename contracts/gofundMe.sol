// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

interface IERC20Token {
  function transfer(address, uint256) external returns (bool);
  function approve(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function totalSupply() external view returns (uint256);
  function balanceOf(address) external view returns (uint256);
  function allowance(address, address) external view returns (uint256);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract GoFundMeOnCelo {
    uint internal listLength = 0;

    address internal cUsdTokenAddress = 0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1;
       struct GoFundMe {
        address payable owner;
        string name;
        string image;
        string description;
        string location;
        uint amount;
        uint balance;
        address[] funders;
        bool funded;
        mapping (address=> bool) uniqueFunder;
    }
    // GoFundMe[] public goFundMes;
    mapping(uint => GoFundMe) goFundMes;


   function createFundMe(
		string memory _name,
		string memory _image,
		string memory _description, 
		string memory _location, 
		uint _amount
	) public {
		bool _funded = false;
        uint _balance = _amount;
       GoFundMe storage newGoFundMe = goFundMes[listLength];
			newGoFundMe.owner = payable(msg.sender);
			newGoFundMe.name = _name;
			newGoFundMe.image = _image;
			newGoFundMe.description = _description;
			newGoFundMe.location = _location;
			newGoFundMe.amount = _amount;
			newGoFundMe.balance = _balance;
            newGoFundMe.funded = _funded;
        listLength++;
	}
    function readFundMe(uint _index) public view returns (
		address payable,
		string memory, 
		string memory, 
		string memory, 
		string memory, 
		uint, 
        bool
	) {
		return (
			goFundMes[_index].owner, 
			goFundMes[_index].name, 
			goFundMes[_index].image, 
			goFundMes[_index].description, 
			goFundMes[_index].location, 
			goFundMes[_index].balance,
			goFundMes[_index].funded
		);
	}
    modifier notYetFunded(uint _index){
           GoFundMe storage goFundMe = goFundMes[_index];
           require(!goFundMe.funded, "Already funded");
           _;
    }
    	function fund(uint _index, uint _amount) public notYetFunded(_index) payable   {
		require(
		  IERC20Token(cUsdTokenAddress).transferFrom(
			msg.sender,
			goFundMes[_index].owner,
			_amount
		  ),
		  "Transfer failed."
		);
        GoFundMe storage goFundMe = goFundMes[_index];
		goFundMe.balance -= _amount;
        if(goFundMe.balance == 0){
            goFundMe.funded = true ;
        }
        if(!goFundMe.uniqueFunder[msg.sender]){
		    goFundMe.funders.push(msg.sender);
            goFundMe.uniqueFunder[msg.sender] = true;
        }
	}

        function getListLength() public view returns (uint) {
        return (listLength);
    }
        function getFundersLength(uint _index) public view returns (uint) {
            GoFundMe storage goFundMe = goFundMes[_index];
        return (goFundMe.funders.length);
    }
        function getBalance(uint _index) public view returns(uint){
           GoFundMe storage goFundMe = goFundMes[_index];
        return (goFundMe.balance); 
        }
}

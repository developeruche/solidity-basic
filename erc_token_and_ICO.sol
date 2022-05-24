
// @developeruche: ERC 20: Token
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to, uint tokens) external returns (bool success);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
    event Transfer(address indexed from, address indexed to, uint token);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Pay is ERC20Interface {
    string public name = "Pay";
    string public symbol = "PAY";
    string public decimal="0";
    uint public override totalSupply;
    address public founder;
    mapping (address => uint) public balances;
    mapping (address => mapping(address => uint)) allowed;

    constructor() {
        totalSupply = 10000000000;
        founder = msg.sender; //The wallet that deploys this contract is see as the founder of the contract
        balances[founder] = totalSupply; //initaly all the token would be in the founder wallet
    }

    function balanceOf(address tokenOwner) public view override returns (uint balance){
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public override returns (bool success){
        require(balances[msg.sender]>=tokens);
        balances[to]+=tokens; //credit the wallet of the receiver
        balances[msg.sender]-=tokens;

        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public override returns (bool success) {
        require(balances[msg.sender] >= tokens, "Insufficent Funds");
        require(tokens>0);
        allowed[msg.sender][spender]=tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public view override returns (uint noOfToken) {
        return allowed[tokenOwner][spender];
    }

    function transferFrom(address from, address to, uint tokens) public override returns (bool success){
        require(allowed[from][to] >= tokens, "You are not allowed to transfer these tokens.");
        require(balances[from] >= tokens, "Insufficent funds, contact the issuer.");
        balances[from] -= tokens;
        balances[to] += tokens;
        return true;
    }
}



// @developeruche: ICO (Inital Coin Offering)
contract ICO is Pay {
    address public manager;
    address payable public deposit;
    uint tokenPrice = 0.1 ether;
    uint public cap = 300 ether;
    uint public raisedAmount;
    uint public icoStart=block.timestamp;
    uint public icoEnd = block.timestamp+2628002; //the ico would last for 1 month
    uint public tokenTradeTime = icoEnd+3600;
    uint public maxInvest=10 ether;
    uint public minInvest = 0.1 ether;
    enum State{beforeStart,afterEnd,running,halted}

    State public icoState;
    event Invest(address investor, uint value, uint tokens);

    constructor(address payable _deposit) {
        deposit=_deposit;
        manager=msg.sender;
        icoState=State.beforeStart;
    }

    modifier onlyManager() {
        require(msg.sender == manager);
        _;
    }

    function halt() public onlyManager {
        icoState=State.halted;
    }

    function resume() public onlyManager {
        icoState = State.running;
    }

    function chanageDepositAddr (address payable newDeposit) public onlyManager {
        deposit = newDeposit;
    }
    function getState() public view returns (State) {
        if(icoState==State.halted){
            return State.halted;
        }else if (block.timestamp < icoStart){
            return State.beforeStart;
        }else if (block.timestamp >= icoStart && block.timestamp <= icoEnd){
            return State.running;
        }else {
            return State.afterEnd;
        }
    }
    function invest() payable public returns (bool) {
        icoState = getState();
        require(icoState == State.running);
        require(msg.value >= minInvest && msg.value <= maxInvest);
        raisedAmount += msg.value;
        require(raisedAmount <= cap);
        uint tokens = msg.value / tokenPrice;
        balances[msg.sender] += tokens;
        balances[founder]-=tokens;
        deposit.transfer(msg.value); //transfering the ether from the contract address to the deposit addr
        emit Invest(msg.sender, msg.value, tokens);
        return true;
    }
    function burn() public returns (bool) {
        // burning the remain tokens after ICO is completed
        icoState = getState();
        require(icoState == State.afterEnd);
        balances[founder] = 0;
        return true;
    }
    function transfer(address to, uint tokens) public override returns (bool success) {
        require (block.timestamp > tokenTradeTime);
        super.transfer(to, tokens);
        return true;
    }
    function transferFrom(address from, address to, uint tokens) public override returns (bool success) {
        require (block.timestamp > tokenTradeTime);
        super.transferFrom(from, to, tokens);
        return true;
    }
    receive() external payable {
        invest();
    }
}


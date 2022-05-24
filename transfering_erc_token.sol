// This code snippet would allow user to transfer token from one user to and other or allow decentralized exchanges to transfer toekn of a alrady deployed contract
// This code is ver useful when create a decentralized exchange
contract TransferToken {
    function transfer() external {
        Token token = Token(0xTHISISTHEADDRESSOFTHEDEPLOYEDTOKENYOUWANTTOINTERACTWITH);
        token.transfer(msg.sender, 100);
    }

    function transferFrom(address recipient, uint amount) external {
        Token token = Token(0xTHISISTHEADDRESSOFTHEDEPLOYEDTOKENYOUWANTTOINTERACTWITH);
        toekn.transferFrom(msg.sender, recipient, amount);
    }
}


contract Owner {
    function transfer(address recipient, uint amount) external {
        Token token = Token(0xTHISISTHEADDRESSOFTHEDEPLOYEDTOKENYOUWANTTOINTERACTWITH);
        token.approve(0xThisIsTheAddressOfAccountOrSmartContractYouUserWantToApproveToSpendTokenFromOwnersWallet);

        TransferToken transferToken = TranferToken(0xThisIsTheAddressOfAccountOrSmartContractYouUserWantToApproveToSpendTokenFromOwnersWallet);
        transToken.transferFrom(recipient, amount);
    }
}
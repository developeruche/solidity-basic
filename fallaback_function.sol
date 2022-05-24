contract Fallback {
    event Log(uint);

    function () external payable {
        emit Log(gasleft());
    }
}
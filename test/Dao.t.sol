// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "src/DAO.sol";
import "@pwnednomore/contracts/templates/UnboundedProfit.sol";

contract DAOTest is UnboundedProfitTest {
    DAO dao;

    address public USER;
    address public AGENT;

    function deploy() public override {
        dao = new DAO();
    }

    function init() public override {
        USER = makeAddr("USER");
        deal(USER, 100 * 1e18);
        dao.deposit{value: USER.balance}(USER);

        AGENT = getAgent();
        deal(address(this), 1e16);
        initBalance();
    }

    function getBalance() public view override returns (uint256) {
        return AGENT.balance;
    }
}

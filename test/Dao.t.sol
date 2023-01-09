// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "src/DAO.sol";
import "@pwnednomore/contracts/invariants/UnboundedProfitTest.sol";

contract DAOTest is UnboundedProfitTest {
    DAO dao;

    address public user;
    address public agent;

    function deploy() public override {
        dao = new DAO();
    }

    function init() public override {
        user = makeAddr("USER");
        deal(user, 100 * 1e18);
        dao.deposit{value: user.balance}(user);

        agent = getAgent();
        deal(address(this), 1e16);
        initBalance();
    }

    function getBalance() public view override returns (uint256) {
        return agent.balance;
    }
}

pragma solidity 0.5.17;

import "./IgnisFlr.sol";

/**
 * @title Ignis's Maximillion Contract
 */
contract Maximillion {
    /**
     * @notice The default ignisFlr market to repay in
     */
    IgnisFlr public ignisFlr;

    /**
     * @notice Construct a Maximillion to repay max in a IgnisFlr market
     */
    constructor(IgnisFlr ignisFlr_) public {
        ignisFlr = ignisFlr_;
    }

    /**
     * @notice msg.sender sends Flr to repay an account's borrow in the ignisFlr market
     * @dev The provided Flr is applied towards the borrow balance, any excess is refunded
     * @param borrower The address of the borrower account to repay on behalf of
     */
    function repayBehalf(address borrower) public payable {
        repayBehalfExplicit(borrower, ignisFlr);
    }

    /**
     * @notice msg.sender sends Flr to repay an account's borrow in a ignisFlr market
     * @dev The provided Flr is applied towards the borrow balance, any excess is refunded
     * @param borrower The address of the borrower account to repay on behalf of
     * @param ignisFlr_ The address of the ignisFlr contract to repay in
     */
    function repayBehalfExplicit(address borrower, IgnisFlr ignisFlr_) public payable {
        uint received = msg.value;
        uint borrows = ignisFlr_.borrowBalanceCurrent(borrower);
        if (received > borrows) {
            ignisFlr_.repayBorrowBehalf.value(borrows)(borrower);
            msg.sender.transfer(received - borrows);
        } else {
            ignisFlr_.repayBorrowBehalf.value(received)(borrower);
        }
    }
}

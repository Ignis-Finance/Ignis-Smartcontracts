pragma solidity 0.8.17;

abstract contract ComptrollerInterface {
    /// @notice Indicator that this is a Comptroller contract (for inspection)
    bool public constant isComptroller = true;

    /*** Assets You Are In ***/

    function enterMarkets(address[] calldata ignisTokens) virtual external returns (uint[] memory);
    function exitMarket(address ignisToken) virtual external returns (uint);

    /*** Policy Hooks ***/

    function mintAllowed(address ignisToken, address minter, uint mintAmount) virtual external returns (uint);
    function mintVerify(address ignisToken, address minter, uint mintAmount, uint mintTokens) virtual external;

    function redeemAllowed(address ignisToken, address redeemer, uint redeemTokens) virtual external returns (uint);
    function redeemVerify(address ignisToken, address redeemer, uint redeemAmount, uint redeemTokens) virtual external;

    function borrowAllowed(address ignisToken, address borrower, uint borrowAmount) virtual external returns (uint);
    function borrowVerify(address ignisToken, address borrower, uint borrowAmount) virtual external;

    function repayBorrowAllowed(
        address ignisToken,
        address payer,
        address borrower,
        uint repayAmount) virtual external returns (uint);
    function repayBorrowVerify(
        address ignisToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) virtual external;

    function liquidateBorrowAllowed(
        address ignisTokenBorrowed,
        address ignisTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) virtual external returns (uint);
    function liquidateBorrowVerify(
        address ignisTokenBorrowed,
        address ignisTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) virtual external;

    function seizeAllowed(
        address ignisTokenCollateral,
        address ignisTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) virtual external returns (uint);
    function seizeVerify(
        address ignisTokenCollateral,
        address ignisTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) virtual external;

    function transferAllowed(address ignisToken, address src, address dst, uint transferTokens) virtual external returns (uint);
    function transferVerify(address ignisToken, address src, address dst, uint transferTokens) virtual external;

    /*** Liquidity/Liquidation Calculations ***/

    function liquidateCalculateSeizeTokens(
        address ignisTokenBorrowed,
        address ignisTokenCollateral,
        uint repayAmount) virtual external view returns (uint, uint);
}

pragma solidity 0.5.17;

contract ComptrollerInterface {
    /// @notice Indicator that this is a Comptroller contract (for inspection)
    bool public constant isComptroller = true;

    /*** Assets You Are In ***/

    function enterMarkets(address[] calldata ignisTokens) external returns (uint[] memory);
    function exitMarket(address ignisToken) external returns (uint);

    /*** Policy Hooks ***/

    function mintAllowed(address ignisToken, address minter, uint mintAmount) external returns (uint);
    function mintVerify(address ignisToken, address minter, uint mintAmount, uint mintTokens) external;

    function redeemAllowed(address ignisToken, address redeemer, uint redeemTokens) external returns (uint);
    function redeemVerify(address ignisToken, address redeemer, uint redeemAmount, uint redeemTokens) external;

    function borrowAllowed(address ignisToken, address borrower, uint borrowAmount) external returns (uint);
    function borrowVerify(address ignisToken, address borrower, uint borrowAmount) external;

    function repayBorrowAllowed(
        address ignisToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function repayBorrowVerify(
        address ignisToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function liquidateBorrowAllowed(
        address ignisTokenBorrowed,
        address ignisTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function liquidateBorrowVerify(
        address ignisTokenBorrowed,
        address ignisTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function seizeAllowed(
        address ignisTokenCollateral,
        address ignisTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function seizeVerify(
        address ignisTokenCollateral,
        address ignisTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function transferAllowed(address ignisToken, address src, address dst, uint transferTokens) external returns (uint);
    function transferVerify(address ignisToken, address src, address dst, uint transferTokens) external;

    /*** Liquidity/Liquidation Calculations ***/

    function liquidateCalculateSeizeTokens(
        address ignisTokenBorrowed,
        address ignisTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}

pragma solidity ^0.8.17;

import "./IgnisToken.sol";

abstract contract PriceOracle {
    /// @notice Indicator that this is a PriceOracle contract (for inspection)
    bool public constant isPriceOracle = true;

    /**
      * @notice Get the underlying price of a qiToken asset
      * @param ignisToken The ignisToken to get the underlying price of
      * @return The underlying asset price mantissa (scaled by 1e18).
      *  Zero means the price is unavailable.
      */
    function getUnderlyingPrice(IgnisToken ignisToken) virtual external view returns (uint);
}

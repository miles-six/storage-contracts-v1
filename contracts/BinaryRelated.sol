// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BinaryRelated {
    function pow(uint256 fp, uint256 n) internal pure returns (uint256) {
        // 1.0 in Q128.128
        uint256 v = 1 << 128;
        while (n != 0) {
            if ((n & 1) == 1) {
                v = (v * fp) >> 128;
            }
            fp = (fp * fp) >> 128;
            n = n / 2;
        }
        return v;
    }

    function findNextPowerOf2(uint256 n) internal pure returns (uint256) {
        n = n - 1;
        while ((n & (n - 1) != 0)) n = n & (n - 1);
        return n << 1;
    }
    
    function reverse12Bits(uint256 input) internal pure returns (uint256) {
        assert(input < 4096);
        uint256 n = input;
        uint256 r = 0;
        for (uint256 k = 0; k < 12; k++) {
            r = (r * 2) | (n % 2);
            n = n / 2;
        }
        return r;
    }
}

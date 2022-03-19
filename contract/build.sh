#!/bin/bash
sol-merger erc1155.sol ./all
sol-merger erc721.sol ./all
sed -i '' 's/SPDX-License-Identifier: MIT/''/g' all/erc1155.sol
abigen --sol ./all/erc1155.sol --pkg contract --out ../app/admin/service/contract/erc1155.go
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Hema_Nft is ERC1155, Ownable {
    bool public paused;
    // NFT name
    string public name;

    // NFT symbol
    string public symbol;

    // Emitted when the baseURI is updated
    event updateBaseURI(string uri);

    // Mapping of accessory contracts that have permission to mint
    mapping(address => bool) public accessoryContract;

    // Mapping from token ID to token existence
    mapping(uint256 => bool) private exists;

    // Mapping from token ID to token supply
    mapping(uint256 => uint256) private tokenSupply;

    // Mapping from token ID to token max
    mapping(uint256 => uint256) private tokenSupplyMax;

    // Mapping from account to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    // Emitted when `account` mints one or more NFTs by spending Volts
    event Mint(address indexed account);

    // Emitted when a new NFT type is added
    event Add(uint256 id, uint256 newmax);

    modifier pausable() {
        require(!paused, "Paused");
        _;
    }

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _uri,
        address manager
    ) public ERC1155(_uri) {
        name = _name;
        symbol = _symbol;
        transferOwnership(manager);
    }

    function mint(address to ,uint256 id, uint256 amount) external pausable {
        require(!exists[id], "Invalid ID");
        //One time sale
        exists[id] = true;

        _mint(to, id, amount, new bytes(0));

        emit Mint(to);
    }

    function mintBatch(
        address[] calldata tos,
        uint256[] calldata tokenids,
        uint256[] calldata amount,
        bytes calldata data
    ) external onlyOwner {
        require(tokenids.length == amount.length && tos.length == amount.length, "Mismatched array lengths");
        require(checkMintBatch(tokenids),"Some tokenids already exist");
        for (uint256 i = 0; i < tokenids.length; i++) {
            if(!exists[tokenids[i]]){
                _mint(tos[i],tokenids[i],amount[i],data);
            }
            exists[tokenids[i]] = true;
        }
        emit Mint(msg.sender);
    }

    function adminBatchTransferFrom(
        address[]  memory from,
        address[]  memory tos,
        uint256[] memory tokenids,
        uint256[] memory amounts,
        bytes memory data
    ) external onlyOwner {
        require(tokenids.length == amounts.length && tos.length == amounts.length, "Mismatched array lengths");
        for (uint256 i = 0; i < tos.length; i++) {
            safeTransferFrom(from[i], tos[i], tokenids[i],amounts[i], data);
        }
    }

    function checkMintBatch(uint256[] memory tokenids) private view returns (bool) {
        bool result = false;
        for (uint256 i = 0; i < tokenids.length; i++) {
            if (!exists[tokenids[i]]){
                result = true;
            }
        }
        return result;
    }

    /**
     * @dev Internal override function for batch minting NFTs
     */
    function _mintBatch(
        address to,
        uint256[] memory tokenids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override {
        super._mintBatch(to, tokenids, amounts, data);
        for (uint256 i = 0; i < tokenids.length; i++) {
            tokenSupply[tokenids[i]] += amounts[i];
        }
    }

    /**
     * @dev Internal override function for minting an NFT
     */
    function _mint(
        address account,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) internal override {
        super._mint(account, id, amount, data);

        tokenSupply[id] += amount;
    }

    /**
     * @notice Burns an NFT
     * @dev Does not award Volts!
     * @param id The ID of the  NFT to burn
     * @param quantity The quantity of the NFT to burn
     */
    function burn(uint256 id, uint256 quantity) external pausable {
        _burn(msg.sender, id, quantity);
    }

    /**
     * @notice Batch burns NFTs
     * @dev Does not award Volts!
     * @param ids An array consisting of the IDs of the  NFTs to burn
     * @param quantities An array consisting of the quantities
     * of each NFT to burn
     */
    function burnBatch(uint256[] calldata ids, uint256[] calldata quantities)
    external
    pausable
    {
        _burnBatch(msg.sender, ids, quantities);
    }

    /**
     * @dev Internal override function for burning an NFT
     */
    function _burn(
        address account,
        uint256 id,
        uint256 amount
    ) internal override {
        super._burn(account, id, amount);

        tokenSupply[id] -= amount;
    }

    /**
     * @dev Internal override function for batch burning NFTs
     */
    function _burnBatch(
        address account,
        uint256[] memory ids,
        uint256[] memory amounts
    ) internal override {
        super._burnBatch(account, ids, amounts);

        for (uint256 i; i < ids.length; i++) {
            tokenSupply[ids[i]] -= amounts[i];
        }
    }


    /**
     * @dev Function to return the message hash that will be
     * signed by the signer
     */
    function getMessageHash(
        address account,
        uint256 volts,
        uint256 nonce
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(account, volts, nonce));
    }

    /**
     * @dev Returns the URI of a token given its ID
     * @param id ID of the token to query
     * @return uri of the token or an empty string if it does not exist
     */
    function uri(uint256 id) public view override returns (string memory) {
        require(exists[id], "URI query for nonexistent token");

        string memory baseUri = super.uri(0);
        return string(abi.encodePacked(baseUri, Strings.toString(id)));
    }

    /**
     * @dev Returns the total quantity for a token ID
     * @param id ID of the token to query
     * @return amount of token in existence
     */
    function totalSupply(uint256 id) external view returns (uint256) {
        return tokenSupply[id];
    }

    /*
     * @dev Returns the URI of a token given its ID
     * @param id ID of the token to query
     * @return uri of the token or an empty string if it does not exist
     */
    function BaseUrl() public view returns (string memory) {
        string memory baseUri = super.uri(0);
        return string(abi.encodePacked(baseUri));
    }

    /**
     * @dev Updates the mapping of accessory contracts which have
     * special permssions to mint NFTs (lootbox, bridge, etc.)
     */
    function updateAccessoryContracts(address _accessoryContract, bool allowed)
    external
    onlyOwner
    {
        accessoryContract[_accessoryContract] = allowed;
    }

    /**
     * @dev Function to set the URI for all NFT IDs
     */
    function setBaseURI(string calldata _uri) external onlyOwner {
        _setURI(_uri);

        emit updateBaseURI(_uri);
    }

    /**
     * @dev Pause or unpause the contract
     */
    function pause() external onlyOwner {
        paused = !paused;
    }
}
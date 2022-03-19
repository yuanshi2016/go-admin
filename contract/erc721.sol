// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Hema_Nft is ERC721, Ownable {
    bool public paused;
    string public _baseTokenURI;
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
    ) public ERC721(_name,_symbol) {
        _baseTokenURI = _uri;
        transferOwnership(manager);
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
            safeTransferFrom(from[i], tos[i], tokenids[i], data);
        }
    }
    function mint(address to ,uint256 id, uint256 amount) external pausable {
        require(!exists[id], "Invalid ID");
        //One time sale
        exists[id] = true;

        _safeMint(to, id, new bytes(0));
        //super._setTokenUri(id, _uri);
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
                _safeMint(tos[i],tokenids[i], new bytes(0));
            }
            exists[tokenids[i]] = true;
        }
        emit Mint(msg.sender);
    }

    function burn(uint256 id, uint256 quantity) external pausable {
        _burn(id);
    }
    function burnBatch(uint256[] calldata tokenids, uint256[] calldata quantities)
    external
    pausable
    {
        require(tokenids.length <= 0, "Mismatched array lengths");
        for (uint256 i = 0; i < tokenids.length; i++) {
            _burn(tokenids[i]);
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
        * @dev Updates the mapping of accessory contracts which have
     * special permssions to mint NFTs (lootbox, bridge, etc.)
     */
    function updateAccessoryContracts(address _accessoryContract, bool allowed)
    external
    onlyOwner
    {
        accessoryContract[_accessoryContract] = allowed;
    }
    function setBaseURI(string calldata _uri) external onlyOwner {
        _baseTokenURI = _uri;
        emit updateBaseURI(_uri);
    }
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }
    function BaseUrl() public view returns (string memory) {
        return _baseTokenURI;
    }
}
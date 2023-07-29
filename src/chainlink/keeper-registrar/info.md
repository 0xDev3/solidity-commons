# KEEPER REGISTRAR

The Keeper Registrar is a contract that allows users to register their Keeper nodes with the Chainlink network and upkeep jobs with a keeper registry. This allows the Chainlink node to be paid for its work, and for the node to be able to participate in the [Chainlink Network](/docs/chainlink-network/).

The contract is composed of two main parts:

- The `KeeperRegistry` contract, which is the owner of the contract and manages the registration of nodes.
- The `KeeperRegistryInterface` interface, which is used to interact with the `KeeperRegistry` contract.

## Registration

The `KeeperRegistry` contract is the owner of the contract and manages the registration of nodes.

To register a node, the `register` function must be called. This function accepts two parameters:

- `checkData`: the data that the node will use to check if a job is due. This is the data that will be used by the `checkUpkeep` function of the `KeeperCompatibleInterface` contract.
- `performData`: the data that the node will use to perform the job. This is the data that will be used by the `performUpkeep` function of the `KeeperCompatibleInterface` contract.

The contract is designed to have two registration workflows, one with manual approval and one with automatic approval.

The manual workflow requires a UI to call the register function on the contract, which will add the upkeep registration request to a pending request list. The contract owner must then manually call the approve function to approve the upkeep registration. The automatic workflow allows a UI to call the register function, which will directly call the registerUpkeep function on the keeper registry, and then emit an approved event to finish the flow automatically without manual intervention.

The contract has three auto-approve settings: no auto-approve, auto-approve for an allowed sender whitelist, and auto-approve for all new upkeeps subject to a maximum allowed limit. The contract also requires a minimum amount of LINK to be funded for new registrations.

The contract emits events for registration requested, approved, and rejected, as well as for changes to the configuration and the setting of allowed senders for auto-approve.
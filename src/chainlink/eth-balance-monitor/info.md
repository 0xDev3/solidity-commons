# ETH BALANCE MONITOR

This is a keeper-compatible contract that monitors and funds Ethereum addresses. The contract contains a struct called "Target" which represents a target address that needs to be funded. The contract owner can set a list of addresses to watch, each with its own minimum balance, top-up amount, and the minimum wait period between funding.

The contract has three main functions. Firstly, the setWatchList function sets the list of addresses to watch and their funding parameters. The getUnderfundedAddresses function returns a list of underfunded addresses that need to be funded. Finally, the topUp function sends funds to the provided addresses that are pre-approved and marked as needing funding.

The contract also includes several events to notify users when funds are added or withdrawn, when top-ups succeed or fail, and when the keeper registry address or minimum wait period is updated.
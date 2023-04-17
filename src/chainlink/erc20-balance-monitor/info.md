# ERC20 BALANCE MONITOR

The ERC20BalanceMonitor contract is a keeper-compatible contract that monitors and funds ERC20 tokens.
It allows an owner to set a list of subscriptions to monitor, along with their funding parameters.
The contract periodically checks the balances of these subscriptions and automatically funds them if their balance falls below a specified minimum and a certain period of time has elapsed since the last funding.
The contract ensures that it has enough funds to top up each subscription before actually sending the funds, and it also ensures that the top-up amount is greater than the minimum balance.
The contract can be paused if necessary and it emits events for certain actions, such as when funds are withdrawn or when the watchlist is updated.
The owner can withdraw funds from the contract and update the list of subscriptions to monitor.
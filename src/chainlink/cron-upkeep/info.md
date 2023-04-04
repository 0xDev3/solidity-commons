# CRON UPKEEP

The CronUpkeep contract is a keeper-compatible contract that runs various tasks on cron schedules. It allows developers to trigger actions on various targets using cron strings to specify the cadence. For example, a user may have three tasks that require regular service in their dapp ecosystem:

0xAB..CD, update(1), "0 0 * * *" --> runs update(1) on 0xAB..CD daily at midnight
0xAB..CD, update(2), "30 12 * * 0-4" --> runs update(2) on 0xAB..CD weekdays at 12:30
0x12..34, trigger(), "0 * * * *" --> runs trigger() on 0x12..34 hourly
To use this contract, a user first deploys this contract and registers it on the chainlink keeper registry. Then the user adds cron jobs by converting a cron string to an encoded cron spec and creating a job by sending a transaction to createCronJob().

The contract is pausable and proxied. It uses a delegate to check the upkeep calls. The contract keeps all the string manipulation off-chain, reducing gas costs.

The contract emits events when cron jobs are executed, created, updated, or deleted. It contains several errors that get emitted when an ID for a cron job is not found, the maximum number of jobs has been reached, the handler is invalid, the tick is in the future, the tick is too old, or the tick does not match the spec.

The contract can execute cron jobs by ID and next run-at datetime, and it can create and update cron jobs from encoded specs. The maximum number of cron jobs is set by the owner. The contract also stores the last run of a cron job and the cron spec for a given job.
#!/bin/bash
#set -x

date=$(date +"%Y%m%d%H%M")


# Print a header row
echo -e "runDate\tproTxHash\tcollateralHash\tcollateralIndex\tcollateralAddress\toperatorReward\tconfirmations\tip\tport\tregisteredHeight\tlastPaidHeight\tPoSePenalty\tPoSeRevivedHeight\tPoSeBanHeight\trevocationReason\townerAddress\tvotingAddress\tpayoutAddress\tpubKeyOperator\thasOwnerKey\thasOperatorKey\thasVotingKey\townsCollateral\townsPayeeScript\townsOperatorRewardScript"

# Do it all in one go.
dash-cli protx list registered 1|jq -r '.[]| "\(.proTxHash)\t\(.collateralHash)\t\(.collateralIndex)\t\(.collateralAddress)\t\(.operatorReward)\t\(.confirmations)\t\(.state.service)\t\(.state.registeredHeight)\t\(.state.lastPaidHeight)\t\(.state.PoSePenalty)\t\(.state.PoSeRevivedHeight)\t\(.state.PoSeBanHeight)\t\(.state.revocationReason)\t\(.state.ownerAddress)\t\(.state.votingAddress)\t\(.state.payoutAddress)\t\(.state.payoutAddress)\t\(.wallet.hasOwnerKey)\t\(.wallet.hasOperatorKey)\t\(.wallet.hasVotingKey)\t\(.wallet.ownsCollateral)\t\(.wallet.ownsPayeeScript)\t\(.wallet.ownsOperatorRewardScript)"'|sed 's/\([1234567890]\):\([1234567890]*\t\)/\1\t\2/'|while IFS= read;do echo -e "$date\t$REPLY";done


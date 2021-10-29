apt-get update
apt-get install pwgen

# Install masternode
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/energicryptocurrency/energi3-provisioning/master/scripts/linux/energi3-linux-installer.sh)" ; source ~/.bashrc

# Check that it's running
systemctl status energi3

# Create keystore file, change file name to match keystore file name. Paste the keystore contents from wallet into nano
nano /home/nrgstaker/.energicore3/keystore/UTC--2020-11-06T01-20-42.303Z--b504122fa384e5f5167dac6646994b5a45636a3d_yt

# Change to nrgstaker user
su nrgstaker

# Attach to energi console
energi3 attach

# List accounts, make sure yours exists
personal.listAccounts

# Check status, including block height
miner.stakingStatus()

# Enable staking, change to your wallet address 
personal.unlockAccount('0xb504122fa384e5f5167dac6646994b5a45636a3d', null, 0, true)

# Optional from here---------------------

# Stop the service to remove the chaindata
sudo systemctl stop energi3
energi3 removedb

# Download bootstrapped chaindata (this is faster)
cd $HOME
curl -s https://s3-us-west-2.amazonaws.com/download.energi.software/releases/chaindata/mainnet/gen3-chaindata.tar.gz | tar xvz

# Start energi3 again
sudo systemctl start energi3
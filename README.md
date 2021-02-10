# git-production

Prevent git pull or git checkout by accident for a given Linux
account.

Ensures that a production git instance neither gets pulled nor
has a different branch ckecked out without an "are you sure?"
user interaction.

# Wrap git to protect repositories in production
# ----------------------------------------------
git clone https://github.com/whitelamp-uk/git-production.git
cd git-production/
bash setup.bash
# Test
git pull
# ----------------------------------------------

# Removal
# -------
rm -rf git-production
rm -rf git-override
# Remove replacement PATH in .bashrc
nano ~/.bashrc
# -------


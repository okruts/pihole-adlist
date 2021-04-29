# download adblock lists
curl -s -L  https://easylist-downloads.adblockplus.org/ruadlist+easylist.txt https://easylist-downloads.adblockplus.org/advblock.txt > adblock.unsorted

# look for:  ||domain.tld^
sort -u adblock.unsorted | grep ^\|\|.*\^$ | grep -v \/ > adblock.sorted

# remove extra chars
sed 's/[\|^]//g' < adblock.sorted > adblock.hosts

# add 0.0.0.0
awk '{ printf "0.0.0.0 "; print }' adblock.hosts > adblock-ua.hosts

# remove files we no longer need
rm adblock.unsorted adblock.sorted adblock.hosts


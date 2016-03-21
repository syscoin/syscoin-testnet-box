SYSCOIND=syscoind
SYSCOINCLI=syscoin-cli
S1_FLAGS=
S2_FLAGS=
S1=$(SYSCOINCLI) -datadir=1 -daemon=1 $(S1_FLAGS)
S2=$(SYSCOINCLI) -datadir=2 -daemon=1 $(S2_FLAGS)

start:
	$(SYSCOINCD) -datadir=1 -daemon=1 $(S1_FLAGS)
	$(SYSCOINCD) -datadir=1 -daemon=1 $(S2_FLAGS)
	
generate-true:
	$(S1) setgenerate true
	
generate-false:
	$(S1) setgenerate false
	
getinfo:
	$(S1) getinfo
	$(S2) getinfo

getmininginfo: 
	$(S1) getmininginfo
	$(S2) getmininginfo

getaccountaddress:
	$(S1) getaccountaddress ""
	$(S2) getaccountaddress ""

stop:
	$(S1) stop
	$(S2) stop

clean:
	rm -rf 1/testnet3
	rm -rf 2/testnet3

LITECOIND=syscoind
S1_FLAGS=
S2_FLAGS=
S1=$(LITECOIND) -datadir=1 -daemon=1 $(S1_FLAGS)
S2=$(LITECOIND) -datadir=2 -daemon=1 $(S2_FLAGS)

start:
	$(S1)
	$(S2)
	
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
	rm -rf 1/cakenet
	rm -rf 2/cakenet
	tar zxvf syscoin.tgz

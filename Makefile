SYSCOIND=syscoind
SYSCOINGUI=syscoin-qt
SYSCOINCLI=syscoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(SYSCOIND) $(B1) -daemon
	$(SYSCOIND) $(B2) -daemon

start-gui:
	$(SYSCOINGUI) $(B1) &
	$(SYSCOINGUI) $(B2) &

generate:
	$(SYSCOINCLI) $(B1) generate $(BLOCKS)

getinfo:
	$(SYSCOINCLI) $(B1) getinfo
	$(SYSCOINCLI) $(B2) getinfo

send:
	$(SYSCOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

address:
	$(SYSCOINCLI) $(B1) getnewaddress $(ACCOUNT)

stop:
	$(SYSCOINCLI) $(B1) stop
	$(SYSCOINCLI) $(B2) stop

clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete

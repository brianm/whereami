.PHONY: clean

whereami:
	swiftc -static-stdlib whereami.swift

clean: 
	rm -f whereami

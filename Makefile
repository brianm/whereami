.PHONY: clean

whereami:
	swiftc -swift-version 4 -static-stdlib whereami.swift

clean: 
	rm -f whereami

.PHONY: clean

whereami:
	swiftc -swift-version 4 whereami.swift

clean: 
	rm -f whereami

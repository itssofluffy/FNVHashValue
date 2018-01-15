all: build

build:
	swift build

release:
	swift build --configuration release

docs:
	swift package generate-xcodeproj

clean:
	swift package clean

.PHONY: build test docs clean

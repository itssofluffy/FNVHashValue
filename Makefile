all: build

build:
	swift build

test:
	swift test

release:
	swift build --configuration release

docs:
	swift package generate-xcodeproj

clean:
	swift build --clean

.PHONY: build test docs clean

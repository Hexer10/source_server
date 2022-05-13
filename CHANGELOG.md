# 3.0.0
- Updated to dart 2.17.0.
- Code cleanup.
- Minor fixes.

## 3.3.0-dev
- Increased minimum sdk version: 2.14
- Implemented minecraft ping protocol.
- Implemented the new "A2S_PING" challenge: https://steamcommunity.com/discussions/forum/14/2974028351344359625/
- Improved tests.
- 

## 3.2.0-dev
- BREAKING CHANGE: Now `getRules` returns `List<ServerRule>`.
- Implemented a dummy server that replicates locally a CS:GO server query and rcon protocol.
- Implement more tests.


## 3.1.3-dev
- The query client now uses a random port (previously it would always listen to the port 6000). Thanks to @mohitkyadav
- Added test.

## 3.1.2-dev
- Implement timeout
- Fix Endianness error
- Overridden `toString` in ServerVisibility, ServerVAC and ServerType classes

## 3.1.1-dev
- Custom exceptions
- Stricter lints

## 3.1.0-dev
- Null-safety
- Bug fixes

## 1.0.0

- Initial version, created by Stagehand

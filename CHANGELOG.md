# 0.1.0-beta.2

- Restored fully automatic private whispers; previous SAY settings migrate to WHISPER.
- Removed manual say drafts and the send command.
- Kept all 28 replies, duration filtering, cooldowns, and restricted-data checks.

# 0.1.0-beta.1

- Initial Retail 12.1.0 beta.
- 28 rotating replies, say default, optional automatic whisper.
- Outdoor say uses a prepared chat draft submitted by the player.
- Strict >120-second buff filter, self/NPC exclusion, cooldowns, and baseline handling.
- Skips restricted aura data and unresolved casters; no combat-log or Forever-only API dependency.
- Automated tests included; in-game validation still required.

# 0.1.0-beta.3

- Adds optional targeted THANK emotes via mode emote; automatic whispers remain the default.
- Saves the selected mode; mode whisper restores private replies. The channel command is an alias.
- Preserves duration filters, cooldowns, and 28 whisper replies. Mode changes cancel pending replies.
- No chat-text emotes, retargeting, automatic whisper fallback, or retries when an emote fails.
- Targeted delivery and Classic/Retail automatic emotes still need in-game testing.

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

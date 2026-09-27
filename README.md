# RetailThanks

Automatic private buff thank-you whispers for **World of Warcraft Retail 12.1.0** (interface 120100). Beta by Sinestro with 28 varied English replies, no consecutive random repeat, a 60-second per-player cooldown, and three-second global limit.

Whispering is fully automatic when a qualifying buff and its caster are readable. No manual send step is required. Earlier SAY settings migrate to WHISPER on load.

## Behavior and limitations

- Watches newly applied or refreshed helpful buffs lasting **strictly longer than two minutes**.
- Ignores self-buffs, NPCs, short heals-over-time, permanent/unknown durations, and pre-existing buffs on login/reload/zoning/combat exit.
- Works **out of combat only**. Uses readable `sourceUnit`, `UnitGUID`, and `UnitFullName` values.
- Skips unknown or secret casters rather than guessing. Some strangers' buffs may therefore receive no thanks.
- Does not depend on combat-log access or Forever's caster-GUID API.
- Client restrictions can still block chat. Counters record API requests, not confirmed delivery.

## Install and commands

Extract `RetailThanks` into `_retail_/Interface/AddOns`, restart the client, and enable the addon. Do not run another auto-thanks addon alongside it.

- `/rthanks status` - settings and diagnostics.
- `/rthanks on` / `/rthanks off` - enable or disable.
- `/rthanks preview` - local preview only.
- `/rthanks groups on|off` - include buffs while grouped (default on).
- `/rthanks cooldown 60` - 30-3600 seconds per player.
- `/rthanks message Thanks for %s!` - custom reply; `%s` becomes the buff name.
- `/rthanks message random` - restore all 28 replies.
- `/rthanks debug` - local debug output.

`/retailthanks` is an alias. This version only sends whispers; old channel commands cannot reenable say.

## Testing

Out of combat, ask a party member for a long buff. Expect an automatic whisper after one second. Refresh within 60 seconds should not send another. Renew, self-buffs, and reloads should not generate thanks. In-game validation is still required.

Run `lua5.1 tests/test.lua` from the repository root. `build.ps1` packages the addon. API references checked against the [Retail UI source](https://github.com/Gethe/wow-ui-source/tree/live), build 12.1.0 (69933).

Source: https://github.com/DjSinestro1/RetailThanks

All rights reserved. No affiliation with Blizzard Entertainment.

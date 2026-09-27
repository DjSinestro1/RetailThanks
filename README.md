# RetailThanks

Friendly buff thank-yous for **World of Warcraft Retail 12.1.0** (interface 120100). Initial beta by Sinestro. Includes 28 varied, friendly English replies with no consecutive random repeat, a 60-second per-player cooldown, and a three-second global limit.

## What it does

- Watches new or refreshed helpful buffs with a reported duration **strictly greater than two minutes**.
- Ignores your own buffs, NPCs, short heals-over-time, permanent/unknown durations, and pre-existing buffs after login/reload/zoning/combat.
- Defaults to **SAY**. Outdoors, prepares a reply and prompts you to type `/rthanks send`, then press Enter. It does not attempt to bypass the hardware-input requirement. Drafts expire after 30 seconds.
- Attempts automatic say inside instances where permitted. `/rthanks channel whisper` uses automatic private thanks instead.
- Offers custom messages, saved settings, local preview and diagnostics.

## Important Retail limitations

**Out of combat only; beta, not yet tested in-game.** Modern Retail can restrict aura/caster data. This addon uses readable `sourceUnit`, `UnitGUID`, and `UnitFullName` values, never guesses who cast a buff, and skips unknown or secret casters. It does not rely on combat-log access or Forever's `GetAuraCasterGUID` API, which is absent from the checked Retail API source. A buff from an unresolvable player will receive no thanks.

Client chat restrictions can still prevent messages, especially in restricted instances. Diagnostics count API requests, not confirmed delivery. Settings and prompts are local; no data is uploaded anywhere. Do not run another auto-thanks addon alongside this one.

## Install

Download the release ZIP and extract `RetailThanks` into your Retail client's `_retail_/Interface/AddOns` folder. Restart the client and enable RetailThanks. The final path must end in `RetailThanks/RetailThanks.toc`.

## Commands

- `/rthanks channel say` - public say (default; outdoor submission requires input).
- `/rthanks channel whisper` - automatic private thanks.
- `/rthanks send` - open a pending outdoor say reply, then press Enter.
- `/rthanks status` - settings and diagnostics.
- `/rthanks on` / `/rthanks off` - enable or disable.
- `/rthanks preview` - local preview only, sends nothing.
- `/rthanks groups on|off` - include buffs while grouped (default on).
- `/rthanks cooldown 60` - 30-3600 seconds per player.
- `/rthanks message Thanks for %s!` - custom reply; `%s` becomes the buff name.
- `/rthanks message random` - restore all 28 replies.
- `/rthanks debug` - local debug output.

`/retailthanks` is an alias. The long prefix avoids taking over common raid-target shorthand commands.

## Test

Outdoors and out of combat, ask a party member for a long buff. Expect a local prompt; `/rthanks send` should open the draft and Enter should submit it. Then select whisper, wait at least 60 seconds, and try a refresh. Check that Renew, self-buffs, and reloading do not send thanks. Some strangers' buffs may have no readable caster and will be skipped.

Mocked Lua 5.1 tests: `lua5.1 tests/test.lua`. Build an installable ZIP with `build.ps1`. API references checked against the [Retail UI source](https://github.com/Gethe/wow-ui-source/tree/live), build 12.1.0 (69933), particularly UnitAuraDocumentation.lua, ChatInfoDocumentation.lua, and ChatFrameUtil.lua. Automated tests do not replace in-game validation.

Source: https://github.com/DjSinestro1/RetailThanks

All rights reserved. No affiliation with Blizzard Entertainment.

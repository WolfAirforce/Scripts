# Scripts

## Addons

Will create a skeleton for a CS:GO server with SourceMod addons.

GitHub will allow you to make 60 requests per hour, but 5000 if you have a token.
You may want set this up with the following environment variables.

| Key               | Value                 |
| ----------------- | --------------------- |
| `GITHUB_USERNAME` | `username`            |
| `GITHUB_TOKEN`    | `my_super_secret_key` |

You can generate a new token from [here](https://github.com/settings/tokens/new).

### Profiles

In order to make mode specific settings you can run the following command.

`./addons/profiles/<mode>.sh`

Currently I have provided the following configurations.

- Bunny Hop (`bhop`)
  - [bhoptimer](https://github.com/shavitush/bhoptimer) server with all of the movement plugins.
- Surf (`surf`)
  - [SurfTimer](https://github.com/surftimer/SurfTimer) server with all of the movement plugins.
- 1v1 (`1v1`)
  - Multiplayer [1v1](https://github.com/splewis/csgo-multi-1v1) server with rankings and [weapon skins](https://github.com/kgns/weapons).

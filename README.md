# RC7 Vehicle System

A complete RC7 vehicle system for FiveM servers with ownership tracking.

## Features

- Buy RC7 vehicles with in-game currency
- Track vehicle ownership in a database

## Requirements

- FiveM server
- ESX framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start rc7system` to your server.cfg
4. Import the database.sql file into your MySQL database

## Usage

- Players can buy RC7 vehicles by approaching the designated spawn location and pressing the interaction key
- Vehicle ownership is tracked in the database

## Configuration

The script can be configured in the `config.lua` file:

```lua
Config = {}

-- RC7 System Configuration
Config.RC7Price = 500000 -- Price of RC7
Config.RC7Model = 'rc7' -- Model of RC7
Config.RC7Spawn = vector3(-200.0, -576.0, 33.0) -- Spawn location of RC7
Config.RC7SpawnHeading = 270.0 -- Spawn heading of RC7

-- Database Configuration
Config.DatabaseName = 'rc7system' -- Database name
Config.DatabaseTable = 'rc7_owners' -- Database table name
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=rc7-vehicle-system&utm_content=bottom) — describe it in one sentence and get the full source code.

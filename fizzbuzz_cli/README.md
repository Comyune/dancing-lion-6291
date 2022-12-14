oclif-hello-world
=================

oclif example Hello World CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/oclif-hello-world.svg)](https://npmjs.org/package/oclif-hello-world)
[![CircleCI](https://circleci.com/gh/oclif/hello-world/tree/main.svg?style=shield)](https://circleci.com/gh/oclif/hello-world/tree/main)
[![Downloads/week](https://img.shields.io/npm/dw/oclif-hello-world.svg)](https://npmjs.org/package/oclif-hello-world)
[![License](https://img.shields.io/npm/l/oclif-hello-world.svg)](https://github.com/oclif/hello-world/blob/main/package.json)

<!-- toc -->
* [Usage](#usage)
* [Commands](#commands)
<!-- tocstop -->
# Usage
<!-- usage -->
```sh-session
$ npm install -g fizzbuzz_cli
$ fizzbuzz COMMAND
running command...
$ fizzbuzz (--version)
fizzbuzz_cli/0.0.0 darwin-arm64 node-v16.4.0
$ fizzbuzz --help [COMMAND]
USAGE
  $ fizzbuzz COMMAND
...
```
<!-- usagestop -->
# Commands
<!-- commands -->
* [`fizzbuzz hello PERSON`](#fizzbuzz-hello-person)
* [`fizzbuzz hello world`](#fizzbuzz-hello-world)
* [`fizzbuzz help [COMMAND]`](#fizzbuzz-help-command)
* [`fizzbuzz plugins`](#fizzbuzz-plugins)
* [`fizzbuzz plugins:install PLUGIN...`](#fizzbuzz-pluginsinstall-plugin)
* [`fizzbuzz plugins:inspect PLUGIN...`](#fizzbuzz-pluginsinspect-plugin)
* [`fizzbuzz plugins:install PLUGIN...`](#fizzbuzz-pluginsinstall-plugin-1)
* [`fizzbuzz plugins:link PLUGIN`](#fizzbuzz-pluginslink-plugin)
* [`fizzbuzz plugins:uninstall PLUGIN...`](#fizzbuzz-pluginsuninstall-plugin)
* [`fizzbuzz plugins:uninstall PLUGIN...`](#fizzbuzz-pluginsuninstall-plugin-1)
* [`fizzbuzz plugins:uninstall PLUGIN...`](#fizzbuzz-pluginsuninstall-plugin-2)
* [`fizzbuzz plugins update`](#fizzbuzz-plugins-update)

## `fizzbuzz hello PERSON`

Say hello

```
USAGE
  $ fizzbuzz hello [PERSON] -f <value>

ARGUMENTS
  PERSON  Person to say hello to

FLAGS
  -f, --from=<value>  (required) Who is saying hello

DESCRIPTION
  Say hello

EXAMPLES
  $ oex hello friend --from oclif
  hello friend from oclif! (./src/commands/hello/index.ts)
```

_See code: [dist/commands/hello/index.ts](https://github.com/brett-richardson/fizzbuzz-coding-test/blob/v0.0.0/dist/commands/hello/index.ts)_

## `fizzbuzz hello world`

Say hello world

```
USAGE
  $ fizzbuzz hello world

DESCRIPTION
  Say hello world

EXAMPLES
  $ fizzbuzz hello world
  hello world! (./src/commands/hello/world.ts)
```

## `fizzbuzz help [COMMAND]`

Display help for fizzbuzz.

```
USAGE
  $ fizzbuzz help [COMMAND] [-n]

ARGUMENTS
  COMMAND  Command to show help for.

FLAGS
  -n, --nested-commands  Include all nested commands in the output.

DESCRIPTION
  Display help for fizzbuzz.
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v5.1.16/src/commands/help.ts)_

## `fizzbuzz plugins`

List installed plugins.

```
USAGE
  $ fizzbuzz plugins [--core]

FLAGS
  --core  Show core plugins.

DESCRIPTION
  List installed plugins.

EXAMPLES
  $ fizzbuzz plugins
```

_See code: [@oclif/plugin-plugins](https://github.com/oclif/plugin-plugins/blob/v2.1.5/src/commands/plugins/index.ts)_

## `fizzbuzz plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ fizzbuzz plugins:install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Installs a plugin into the CLI.
  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.


ALIASES
  $ fizzbuzz plugins add

EXAMPLES
  $ fizzbuzz plugins:install myplugin 

  $ fizzbuzz plugins:install https://github.com/someuser/someplugin

  $ fizzbuzz plugins:install someuser/someplugin
```

## `fizzbuzz plugins:inspect PLUGIN...`

Displays installation properties of a plugin.

```
USAGE
  $ fizzbuzz plugins:inspect PLUGIN...

ARGUMENTS
  PLUGIN  [default: .] Plugin to inspect.

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Displays installation properties of a plugin.

EXAMPLES
  $ fizzbuzz plugins:inspect myplugin
```

## `fizzbuzz plugins:install PLUGIN...`

Installs a plugin into the CLI.

```
USAGE
  $ fizzbuzz plugins:install PLUGIN...

ARGUMENTS
  PLUGIN  Plugin to install.

FLAGS
  -f, --force    Run yarn install with force flag.
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Installs a plugin into the CLI.
  Can be installed from npm or a git url.

  Installation of a user-installed plugin will override a core plugin.

  e.g. If you have a core plugin that has a 'hello' command, installing a user-installed plugin with a 'hello' command
  will override the core plugin implementation. This is useful if a user needs to update core plugin functionality in
  the CLI without the need to patch and update the whole CLI.


ALIASES
  $ fizzbuzz plugins add

EXAMPLES
  $ fizzbuzz plugins:install myplugin 

  $ fizzbuzz plugins:install https://github.com/someuser/someplugin

  $ fizzbuzz plugins:install someuser/someplugin
```

## `fizzbuzz plugins:link PLUGIN`

Links a plugin into the CLI for development.

```
USAGE
  $ fizzbuzz plugins:link PLUGIN

ARGUMENTS
  PATH  [default: .] path to plugin

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Links a plugin into the CLI for development.
  Installation of a linked plugin will override a user-installed or core plugin.

  e.g. If you have a user-installed or core plugin that has a 'hello' command, installing a linked plugin with a 'hello'
  command will override the user-installed or core plugin implementation. This is useful for development work.


EXAMPLES
  $ fizzbuzz plugins:link myplugin
```

## `fizzbuzz plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ fizzbuzz plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ fizzbuzz plugins unlink
  $ fizzbuzz plugins remove
```

## `fizzbuzz plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ fizzbuzz plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ fizzbuzz plugins unlink
  $ fizzbuzz plugins remove
```

## `fizzbuzz plugins:uninstall PLUGIN...`

Removes a plugin from the CLI.

```
USAGE
  $ fizzbuzz plugins:uninstall PLUGIN...

ARGUMENTS
  PLUGIN  plugin to uninstall

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Removes a plugin from the CLI.

ALIASES
  $ fizzbuzz plugins unlink
  $ fizzbuzz plugins remove
```

## `fizzbuzz plugins update`

Update installed plugins.

```
USAGE
  $ fizzbuzz plugins update [-h] [-v]

FLAGS
  -h, --help     Show CLI help.
  -v, --verbose

DESCRIPTION
  Update installed plugins.
```
<!-- commandsstop -->

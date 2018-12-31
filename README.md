# caps2ctrl2esc

_Make your keyboard a little less awful_

## What does it do?

* CAPSLOCK is immediately remapped to L_CTRL
* L_CTRL (and CAPSLOCK) will execute ESC when tapped

## Dependencies

* libevdev

## Building

`make`

## Execution

The following daemonized sample execution increases the application priority
(since it'll be responsible for a vital input device, just to make sure it stays
responsible):

`sudo nice -n -20 ./caps2ctrl2esc >caps2ctrl2esc.log 2>caps2ctrl2esc.err &`

## Installation

Just execute this as previously mentioned somewhere in your bootup or .profile.

## How it works

Executing `caps2ctrl2esc` without parameters (with the necessary privileges to access
input devices) will make it monitor any devices connected (or that gets
connected) that produces CAPSLOCK or ESC events.

Upon detection it will fork and exec itself now passing the path of the detected
device as its first parameter. This child instance is then responsible for
producing an uinput clone of such device and doing the programmatic keymapping
of such device until it disconnects, at which time it ends its execution.

## Caveats

As always, there's always a caveat:

- It will "grab" the detected devices for itself.
- If you tweak your key repeat settings, check whether they get reset.

## History

This is a fork of the original [caps2esc][], which has since evolved into a full-on
tool suite called [interception-tools][] with plugins. caps2ctrl2esc is meant to serve 
as a simple, reliable replacement for utilities such as [xcape][].

## License

GPL_v3

caps2esc is Copyright © 2016 Francisco Lopes da Silva.
caps2ctrl2esc is Copyright © 2018 by Richard Slindee.

[caps2esc]: https://github.com/oblitum/caps2esc
[xcape]: https://github.com/alols/xcape
[interception-tools]: https://gitlab.com/interception/linux/tools

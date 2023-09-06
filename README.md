# SixelTerm

* [![GitHub
  CI](https://github.com/eschnett/SixelTerm.jl/workflows/CI/badge.svg)](https://github.com/eschnett/SixelTerm.jl/actions)
* [![codecov](https://codecov.io/gh/eschnett/SixelTerm.jl/branch/master/graph/badge.svg?token=6JBYLRAD2X)](https://codecov.io/gh/eschnett/SixelTerm.jl)

This is a quick-and-dirty Julia package to display graphics inline on 
terminals that support [Sixel](https://en.wikipedia.org/wiki/Sixel) graphics. 
This is like [TerminalExtensions](https://github.com/Keno/TerminalExtensions.jl)
but works with more terminals.

The main advantage of this approach is having usable graphics on remote 
connections without having to mess with X or other remote display
connections. This works for Julia running on many remote platforms, 
including the Windows Subsystem for Linux (WSL) and macOS. It works with
[WSLtty](https://github.com/mintty/wsltty) and [iTerm2](https://iterm2.com).

Terminals with Sixel support are available for Windows, Linux, MacOS, and Android. 
See [here](https://github.com/saitoha/libsixel/blob/master/README.md#terminal-requirements)
for one list.

## Examples

Here is an example using Plots with the default GR backend:

```julia
ENV["GKSwstype"] = "nul"    # needed for the GR backend on headless servers
using SixelTerm
using Plots
scatter(rand(100))
```

This is how things look in iTerm2:
<img src="https://raw.githubusercontent.com/eschnett/SixelTerm.jl/master/demo.png" width=900px></img>

Here is an example using Makie:
```julia
using SixelTerm
using CairoMakie
scatter(rand(100))
```

This is how things look in iTerm2:
<img src="https://raw.githubusercontent.com/eschnett/SixelTerm.jl/master/demo-makie.png" width=900px></img>

## Acknowledgements

This package was written by [Tom Short](https://github.com/tshort) and
is now maintained by [Erik Schnetter](https://github.com/eschnett).

[TerminalGraphics](https://github.com/m-j-w/TerminalGraphics.jl) is another package that
provides similar functionality.

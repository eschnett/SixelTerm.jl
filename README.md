# SixelTerm

* [![GitHub
  CI](https://github.com/eschnett/SixelTerm.jl/workflows/CI/badge.svg)](https://github.com/eschnett/SixelTerm.jl/actions)
* [![codecov](https://codecov.io/gh/eschnett/SixelTerm.jl/branch/master/graph/badge.svg?token=6JBYLRAD2X)](https://codecov.io/gh/eschnett/SixelTerm.jl)

This is a Julia package to display graphics inline on terminals that
support [Sixel](https://en.wikipedia.org/wiki/Sixel) graphics. This is
like
[TerminalExtensions](https://github.com/Keno/TerminalExtensions.jl)
but works with more terminals.

The main advantage of this approach is having usable graphics on remote 
connections without having to mess with X or other remote display
connections. This works for Julia running on many remote platforms, 
including the Windows Subsystem for Linux (WSL) and macOS. It works with
[WSLtty](https://github.com/mintty/wsltty) and [iTerm2](https://iterm2.com).
It also supports the [tmux](tmux.github.io) terminal multiplexer somewhat
(images can be displayed, but they disappear when changing to a different window).

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

## Similar packages

* [ITerm2Images.jl](https://github.com/eschnett/ITerm2Images.jl)
* [ImageInTerminal.jl](https://github.com/JuliaImages/ImageInTerminal.jl)
* [KittyTerminalImages.jl](https://github.com/simonschoelly/KittyTerminalImages.jl)
* [TerminalExtensions.jl](https://github.com/Keno/TerminalExtensions.jl)
* [TerminalGraphics.jl](https://github.com/m-j-w/TerminalGraphics.jl) (outdated)

## Acknowledgements

This package was written by [Tom Short](https://github.com/tshort) and
is now maintained by [Erik Schnetter](https://github.com/eschnett).

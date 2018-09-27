# SixelTerm

This is a quick-and-dirty Julia package to display graphics inline on 
terminals that support [Sixel](https://en.wikipedia.org/wiki/Sixel) graphics. 
This is like [TerminalExtensions](https://github.com/Keno/TerminalExtensions.jl)
but works with more terminals.

The main advantage of this approach is having usable graphics on remote 
connections without having to mess with X or other remote display
connections. This works for Julia running on many remote platforms, 
including the Windows Subsystem for Linux (WSL). 

Terminals with Sixel support are available for Windows, Linux, MacOS, and Android. 
See [here](https://github.com/saitoha/libsixel/blob/master/README.md#terminal-requirements)
for one list.

Here is an example using Plots with the default GR backend:

```julia
ENV["GKSwstype"] = "nul"    # needed for the GR backend on headless servers
using Plots
using SixelTerm             
scatter(rand(100))
```
Note that when using it with Plots, you have to do `using SixelTerm` after `using Plots`.
For some reason, Plots.jl adds its own display to the stack, so we need the SixelTerm
display added last.

module SixelTerm

using FileIO
using ImageIO

struct SixelDisplay <: AbstractDisplay end

const MIMES = ("image/png", "image/tiff", "image/jpeg")
const FORMATS = ("PNG", "TIFF", "JPEG")

# The tmux terminal multiplexer rewrites some escape sequences. See
# <https://iterm2.com/utilities/imgcat> for details.

# tmux requires unrecognized OSC sequences to be wrapped with DCS
# tmux; <sequence> ST, and for all ESCs in <sequence> to be replaced
# with ESC ESC. It only accepts ESC backslash for ST. We use TERM
# instead of TMUX because TERM gets passed through ssh.

function istmux()
    term = get(ENV, "TERM", "")
    return startswith(term, "screen") || startswith(term, "tmux")
end
tmux_prefix() = istmux() ? "\ePtmux;\e" : ""
tmux_postfix() = istmux() ? "\e\\" : ""

for (mime, fmt) in zip(MIMES, FORMATS)
    @eval begin
        function Base.display(::SixelDisplay, m::MIME{Symbol($mime)}, @nospecialize(x))
            io = IOBuffer()
            show(io, m, x)
            seekstart(io)
            im = load(Stream{DataFormat{Symbol($fmt)}}(io))
            write(stdout, tmux_prefix())
            save(Stream{format"SIXEL"}(stdout), im)
            write(stdout, tmux_postfix())
            return nothing
        end
        Base.displayable(::SixelDisplay, ::MIME{Symbol($mime)}) = true
    end
end

Base.displayable(::SixelDisplay, ::MIME) = false

function Base.display(d::SixelDisplay, @nospecialize(x))
    for mime in MIMES
        if showable(mime, x)
            return display(d, mime, x)
        end
    end
    throw(MethodError(display, (d, x)))
end

function __init__()
    pushdisplay(SixelDisplay())
    return nothing
end

end

module SixelTerm

using FileIO
using ImageIO

struct SixelDisplay <: AbstractDisplay end

const MIMES = ("image/png", "image/tiff", "image/jpeg")
const FORMATS = ("PNG", "TIFF", "JPEG")

for (mime, fmt) in zip(MIMES, FORMATS)
    @eval begin
        function Base.display(::SixelDisplay, m::MIME{Symbol($mime)}, @nospecialize(x))
            io = IOBuffer()
            show(io, m, x)
            seekstart(io)
            im = load(Stream{DataFormat{Symbol($fmt)}}(io))
            save(Stream{format"SIXEL"}(stdout), im)
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

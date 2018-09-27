module SixelTerm

using ImageMagick
using FileIO

struct SixelDisplay <: AbstractDisplay end

function Base.display(d::SixelDisplay, m::MIME{Symbol("image/png")}, x)
    a = repr("image/png", x)
    im = ImageMagick.load_(a)
    io = IOBuffer()
    s = Stream(format"six", io, "t.six")
    ImageMagick.save(s, im)
    write(stdout, take!(io))
end

function Base.display(d::SixelDisplay, x) 
    if showable("image/png", x)
        display(d, "image/png", x)
    else
        # fall through to the Displays lower in the display stack
        throw(MethodError(display, "nope"))
    end
end

function __init__()
    Base.Multimedia.pushdisplay(SixelDisplay())
end
    
end
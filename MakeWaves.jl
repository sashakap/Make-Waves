using FFTW, PlotlyJS

function makeSquareWave(frequency, samplingRate, seconds)
    t = range(start = 0, stop = seconds, step = 1/samplingRate)
    wave = (sin.(frequency*2pi*t))

    for (i,j) in enumerate(t)
        if(wave[i] < 0)
            wave[i] = -1
        elseif(wave[i] > 0)
            wave[i] = 1
        end
    end
    p = plot(t, wave)

    PlotlyJS.display_blink(p)
end



function makeSineWave(frequency, samplingRate, seconds)
    t = range(start = 0, stop = seconds, step = 1/samplingRate)
    wave = (sin.(frequency*2pi*t))

    p = plot(t, wave)

    PlotlyJS.display_blink(p)
end

function makeCosineWave(frequency, samplingRate, seconds)
    t = range(start = 0, stop = seconds, step = 1/samplingRate)
    wave = (cos.(frequency*2pi*t))

    p = plot(t, wave)

    PlotlyJS.display_blink(p)
end

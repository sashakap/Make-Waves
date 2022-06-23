using FFTW, PlotlyJS

function makeSquareWave(frequency, samplingRate, seconds)
    t = range(start = 0, stop = seconds, step = 1/samplingRate)
    wave = (sin.(frequency*2pi*t))

    for (i,j) in enumerate(t)
        println(wave[i])
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

    (t, wave)

end

function makeCosineWave(frequency, samplingRate, seconds)
    t = range(start = 0, stop = seconds, step = 1/samplingRate)
    wave = (cos.(frequency*2pi*t))

    (t, wave)

end

function makeTriangleWave(numNodes, numCycles, height)

    wave = zeros(Int, numNodes)
    cycleLengthf = numNodes/numCycles
    cycleLength = convert(Int64, cycleLengthf)
    incrementf = ceil(height/cycleLength)
    increment = 2*convert(Int64, incrementf)
    println(increment)
    start = 2
    endCycle = convert(Int64,cycleLength)
    halfCycle = convert(Int64,(cycleLength/2))

    for i in 1:numCycles
        for j in start:halfCycle
            wave[j] = wave[j-1] + increment
        end

        for j in halfCycle:endCycle
            wave[j] = wave[j-1] - increment
        end
        start += cycleLength
        endCycle += cycleLength
        halfCycle += cycleLength
    end

    wave

end

function makeSawtoothWave(numNodes, numCycles, height)
    wave = zeros(Int, numNodes)
    cycleLengthf = numNodes/numCycles
    cycleLength = convert(Int64, cycleLengthf)
    incrementf = ceil(height/cycleLength)
    increment = convert(Int64, incrementf)
    println(increment)
    start = 2
    endCycle = convert(Int64,cycleLength)

    for i in 1:numCycles
        for j in start:endCycle
            wave[j] = wave[j-1] + increment
        end
        start += cycleLength
        endCycle += cycleLength
    end

    wave

end

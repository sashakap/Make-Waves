using FFTW

function makeSquareWave(numNodes, numCycles, height)
    wave = zeros(Int, numNodes)
    bottom = -height
    top = height
    halfPoint = numNodes/numCycles/2
    currNode = 1
    for currNode in currNode:numNodes
        if currNode%halfPoint == 0
            if height == bottom
                height = top
            elseif height == top
                height = bottom
            end
        end
        wave[currNode] = height
    end
    wave
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

function makeSineWave(frequency)
    t = range(1, stop = 1024, length = 1024)/1024*2pi
    return sin.(frequency.*t)
end

function makeCosineWave(frequency)
    t = range(1, stop = 1024, length = 1024)/1024*2pi
    return cos.(frequency.*t)
end


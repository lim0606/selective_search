addpath('SelectiveSearchCodeIJCV'); 
addpath('SelectiveSearchCodeIJCV/Dependencies');

if(~exist('SelectiveSearchCodeIJCV/anigauss'))
    mex SelectiveSearchCodeIJCV/Dependencies/anigaussm/anigauss_mex.c SelectiveSearchCodeIJCV/Dependencies/anigaussm/anigauss.c -output anigauss
end

if(~exist('SelectiveSearchCodeIJCV/mexCountWordsIndex'))
    mex SelectiveSearchCodeIJCV/Dependencies/mexCountWordsIndex.cpp
end

if(~exist('SelectiveSearchCodeIJCV/mexFelzenSegmentIndex'))
    mex SelectiveSearchCodeIJCV/Dependencies/FelzenSegment/mexFelzenSegmentIndex.cpp -output mexFelzenSegmentIndex;
end


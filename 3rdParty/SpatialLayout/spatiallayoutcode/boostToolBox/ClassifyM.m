%   The algorithms implemented by Alexander Vezhnevets aka Vezhnick
%   <a>href="mailto:vezhnick@gmail.com">vezhnick@gmail.com</a>
%
%   Copyright (C) 2005, Vezhnevets Alexander
%   vezhnick@gmail.com
%   
%   This file is part of GML Matlab Toolbox
%   For conditions of distribution and use, see the accompanying License.txt file.
%
%   Classify Implements classification data samples by already built
%   boosted commitee
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
%    Result = Classify(Learners, Weights, Data)
%    ---------------------------------------------------------------------------------
%    Arguments:
%           Learners - cell array of weak learners
%           Weights  - vector of learners weights
%           Data      - Data to be classified. Should be DxN matrix, 
%                       where D is the dimensionality of data, and N 
%                       is the number of data samples.
%    Return:
%           Result   - vector of real valued commitee outputs for Data. 

function Result = ClassifyM(Learners, Weights, Data)

numClasses = size(Weights,1);
Result = zeros(numClasses, size(Data, 2));

for i = 1 : size(Weights,2)
%   for j=1:2^numClasses-2
%       binstr=dec2bin(j,NumClasses);
      for k=1:numClasses
          lrn_out = calc_output(Learners{i}, Data);
%          membership(j)=bin2dec(binstr(k));
%          if(membership(j)
          Result(k)=Result(k)+lrn_out*Weights(k,i);
      end
end

        
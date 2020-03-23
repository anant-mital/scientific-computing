classdef DiscreteDistribution
    
    properties
        P double {mustBeGreaterThanOrEqual(P,0), mustBeLessThanOrEqual(P,1), mustSumTo1(P)} = [];
    end
    properties (SetAccess = private)
        cumSum ;
    end
    methods
        function obj = DiscreteDistribution(p)
            if nargin == 1
                obj.P = p;   
                obj.cumSum = cumsum(p);
            else
            error("Improper Arguments");
            end
        end
        
        function A = random(obj, varargin)
            
            a = 1;
            b = 1;
            if nargin == 2
                if isscalar(varargin{1})
                 b = varargin{1};   
                else
                 vec = varargin{1};
                 a = vec(1);
                 b = vec(2);
                end
            end
            if nargin == 3
                a = varargin{1};
                b = varargin{2};
            end
            
            if(a == b)
                error("Improper arguments supplied to the function")
            end
            u = rand(1,a*b);
            A = zeros(1,a*b);
            for k = 1 : numel(A)
                for ind = 1 : length(obj.cumSum) 
                    if(obj.cumSum(ind) > u(1,k))
                        A(1,k) = ind;
                        break
                    end
                end
            end
            
            
        end
        
    end
    
    
end

function mustSumTo1(P)
s = sum(P);
e = length(P)*eps;
s = s + e;
d = 1 - s;
if d ~= 0
    error("Sum must be equal to 1");
end
end

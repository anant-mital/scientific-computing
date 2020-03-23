classdef Circle
   
    properties
        Center(1,2) double = [0,0];  % 1 × 2 floating point vector [x y]
        Radius(1,1) double {mustBePositive} = 1;  % A positive floating point number
    end
    
    methods
        % Constructor. Constructs a new Circle object.
        function obj = Circle(varargin)
            if nargin == 2
                obj.Center = varargin{1};
                obj.Radius = varargin{2};                
            else
                if nargin == 1
                    if isscalar(varargin{1})
                        obj.Radius = varargin{1};
                    else
                        if isvector(varargin{1})
                        obj.Center = varargin{1};
                        end
                    end                  
               
                end
            end
        end
        
        function circle = plus(c1,c2)
            circle = Circle(c1.Center + c2.Center,c1.Radius + c2.Radius);
        end
        
        function h = plot(obj,varargin)
            c = obj.Center;
            r = obj.Radius;
            pos = [c(1)-r c(2)-r 2*r 2*r];
            h = rectangle('Position', pos, 'Curvature', [1 1]);    
        end

        
        
    end
end

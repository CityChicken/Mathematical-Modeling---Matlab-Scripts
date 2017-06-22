function [tout,yout] = ode23tx(F,tspan,y0,arg4,varargin)
%ODE23TX  Solve non-stiff differential equations.  Textbook version of ODE23.
%
%   ODE23TX(F,TSPAN,Y0) with TSPAN = [T0 TFINAL] integrates the system
%   of differential equations dy/dt = f(t,y) from t = T0 to t = TFINAL.
%   The initial condition is y(T0) = Y0.
%
%   The first argument, F, is a function handle or an anonymous function
%   that defines f(t,y).  This function must have two input arguments,
%   t and y, and must return a column vector of the derivatives, dy/dt.
%
%   With two output arguments, [T,Y] = ODE23TX(...) returns a column 
%   vector T and an array Y where Y(:,k) is the solution at T(k).
%
%   With no output arguments, ODE23TX plots the emerging solution.
%
%   ODE23TX(F,TSPAN,Y0,RTOL) uses the relative error tolerance RTOL
%   instead of the default 1.e-3.
%
%   ODE23TX(F,TSPAN,Y0,OPTS) where OPTS = ODESET('reltol',RTOL, ...
%   'abstol',ATOL,'outputfcn',@PLOTFUN) uses relative error RTOL instead
%   of 1.e-3, absolute error ATOL instead of 1.e-6, and calls PLOTFUN
%   instead of ODEPLOT after each successful step.
%
%   More than four input arguments, ODE23TX(F,TSPAN,Y0,RTOL,P1,P2,...),
%   are passed on to F, F(T,Y,P1,P2,...).
%
%   ODE23TX uses the Runge-Kutta (2,3) method of Bogacki and Shampine (BS23).
%
%   Example    
%      tspan = [0 2*pi];
%      y0 = [1 0]';
%      F = @(t,y) [0 1; -1 0]*y;
%      ode23tx(F,tspan,y0);
%
%   See also ODE23.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

% Initialize variables.

rtol = 1.e-3;
atol = 1.e-6;
plotfun = @odeplot;
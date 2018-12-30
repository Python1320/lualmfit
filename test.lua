----------
--
-- Least-squares fitting of a simple one-dimensional data set
--
----------


require 'lmfit'


----------
-- Input vectors
----------

t = { .07, .13, .19, .26, .32, .38, .44, .51,.57, .63, .69, .76, .82, .88, .94 }
y = { .24, .35, .43, .49, .55, .61, .66, .71,.75, .79, .83, .87, .90, .94, .97 }


----------
-- Parameter vector: use any starting value, but not { 0,0,0 }
----------

p = { 1, 1, 1 }


----------
-- User define equation
--
--  @param t Scalar value
--  @param p Vector(table) of the current values for the parameters
--    (Importante: as in any Lua table, this vector should start in 1, not 0)
----------
function my_fit_function( t, p )
  return (p[1] * t + (1 - p[1] + p[2] + p[3]) * t * t) /(1 + p[2] * t + p[3] * t * t)
end


----------
-- Calls minimization function
--
--  @param t Vector of values of the independent variable
--  @param y Vector of values of the dependent variable
--  @param p Vector of parametes with initial values
--  @param my_fit_function
--  @return p Vector of parameters updated
--  @return status Status if the algorothm converge or not
--  @return evals Number of evaluations
----------
p, status, evals = lmfit.minimize( t, y, p, my_fit_function )

----------
-- Print results
----------
print('par:',table.concat(p,', '))
print('status:' ,status)
print('evals:',evals)



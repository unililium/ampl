# SETS

set I;
set J;

#

param c{J};
param q{J};
param b{I};
param a{I,J};

# VARS

var x{j in J} >= 0, <= q[j];

# OBJECTIVE F

minimize cost:
    sum{j in J} c[j] * x[j];

# CONSTRAINTS

subject to nutrients{i in I}:
    sum{j in J} a[i,j] * x[j] >= b[i];

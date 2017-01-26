# SETS

set I;
set J;

# PARAMS

param c{I};
param b{I};
param r{J};
param q_max{I,J} default 1;
param q_min{I,J} default 0;

# VARS

var x{I,J} >= 0;
var y{J} >= 0;

# OBJECTIVE FUNCTION

maximize revenue:
    sum{j in J} r[j] * y[j] - sum{i in I, j in J} c[i] * x[i,j];

# CONSTRAINTS

subject to availability{i in I}:
    sum{j in J} x[i,j] <= b[i];

subject to conservation{j in J}:
    y[j] = sum{i in I} x[i,j];

subject to max_qty{i in I, j in J}:
    x[i,j] <= q_max[i,j] * y[j];

subject to min_qty{i in I, j in J}:
    x[i,j] >= q_min[i,j] * y[j];

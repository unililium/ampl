# SETS

set V; #antennas
set J; #frequencies

# PARAMS

param coord1{V};
param coord2{V};
param d{i in V,i2 in V} := 
   sqrt((coord1[i]-coord1[i2])^2 + (coord2[i]-coord2[i2])^2);
param delta >=0;
param gamma >= 0;

# AUXILIARY SETS

set E := setof{i in V, i2 in V: i < i2 and d[i,i2] <= delta} (i,i2);


# VARIABLES

var y{J} binary;
var x{V,J} binary;


#OBJECTIVE FUNCTION

minimize use: sum{j in J} y[j];

s.t. assignment{i in V}:
   sum{j in J}x[i,j] = 1;

s.t. activation{i in V, j in J}:
   x[i,j] <= y[j];

s.t. interference{(i,i2) in E, j in J}:
   x[i,j] + x[i2,j] <= 1;

s.t. interference2{(i,i2) in E, j in J, j2 in J: abs(j-j2) <= gamma}:
   x[i,j] + x[i2,j2] <= 1;






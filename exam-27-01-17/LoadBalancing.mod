# Problem: LoadBalancing

param n > 0;
param m > 0;
set I := 1..n; # set of jobs
set J := 1..m; #set of machines
set K := 1..4;
set G{K} within I;

param b{I}; # loads of the jobs
param c{J}; # capacities of the machines

# VARS
var x{i in I,j in J} binary;

# OPT FUNC
minimize load{j in J}:
	sum{i in I} b[i] * x[i,j];

# CONSTRAINTS

s.t. capacity{j in J}:
	sum{i in I} b[i] * x[i,j] <= c[j];
	
s.t. redundancy{i in I}:
	sum{j in J} x[i,j] = 2;
	
s.t. diversification{j in J, k in K}:
	sum{i in G[k]} x[i,j] <= 2;
	
s.t. exclusion{j in J}:
	sum{i in G[1]} x[i,j] * sum{h in G[2]} x[h,j] <= 0
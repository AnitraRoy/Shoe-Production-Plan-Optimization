# Anitra Roy

###################################################s
set products;									# set I
set raw_material;								# set J 
set machines;									# set R
set warehouse;									# set W
set years = 1997..2003;
set stores = 1..10;

###################################################
param selling_price {products};				# s{I}
param demand {products};					# d{I}
param cost {raw_material};					# c{J}
param average_duration {products, raw_material}; 				# a{I,J}
param quantity {products, machines};							# q{I, R}
param operating_cost {machines};								# f{R}
param total_capacity {warehouse};										#h{W}
param resource_limit {machines};								# u:R}
param house_capacity {warehouse};											# m{W}
param month_demand {products, years, {2}, stores};



###################################################
var x {products} >= 0; # number of shoes type i to be produced in integer (can not create fractions of a shoe)
var y {warehouse} binary default 0;

###################################################
## Define your objective function here
maximize profit: (sum {i in products} ((selling_price[i] + 10) * x[i] - (10 * demand[i])))
			   - (sum {i in products, j in raw_material} (25/3600 + cost[j]/60) * x[i] * average_duration[i,j])
			   - (sum {i in products, k in machines} x[i] * quantity[i,k] * operating_cost[k])
			   - (sum {l in warehouse} total_capacity[l] * y[l]);

###################################################
subject to budget: sum {i in products, k in machines} x[i] * quantity[i,k] * operating_cost[k] <= 10000000;

subject to resources {k in machines}: sum {i in products} x[i] * quantity[i,k] <= resource_limit[k];

subject to runtime {j in raw_material}: sum {i in products} x[i] * average_duration[i,j] <= 1209600;

subject to warehouse_capacity: sum {i in products} x[i] <= sum{l in warehouse} house_capacity[l] * y[l];

subject to demand_limit {i in products}: x[i] <= demand[i];

###################################################
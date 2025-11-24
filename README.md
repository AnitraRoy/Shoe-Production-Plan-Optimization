# Shoe Company Production Optimization Model

This project develops an AMPL-based integer programming model to optimize imaginary WARP Shoe Company's production plan for February 2006. Using historical demand data and operational constraints, the model determines the optimal number of each shoe type to manufacture in order to maximize profit.

---

## **Project Overview**

WARP anticipates a significant increase in demand and requires a data-driven production plan.  
This model:

- Considers **557 shoe types**, multiple raw materials, 72 machines, and 8 warehouses.
- Incorporates constraints on:
  - Budget
  - Raw material availability
  - Machine runtime
  - Warehouse capacity
  - Market demand
- Uses **SQL queries** in AMPL to extract required tables from WARP’s **MS Access database** (local .mdb file).
- Uses **AMPL + Gurobi** to compute the optimal production strategy.
- Achieves an optimal profit of **$11,789,734.80**.

---

## **Model Components**

### **Decision Variables**
- **\( x_i \)** – number of units of shoe type *i* to produce  
- **\( y_l \)** – binary variable indicating whether warehouse *l* is used

### **Objective Function**
Maximize profit = revenue from shoe sales − operating costs − material costs − warehouse costs

### **Constraints**
- **Budget Constraint** – total operating + material costs ≤ available budget  
- **Resource Constraint** – raw material usage ≤ material availability  
- **Runtime Constraint** – machine operating time ≤ monthly limits  
- **Warehouse Capacity Constraint** – produced shoes must fit within warehouse capacity  
- **Demand Constraint** – production cannot exceed predicted February 2006 demand  

---

## **Files**

| File | Description |
|------|-------------|
| `.mod` | Defines sets, parameters, variables, objective function, and constraints (entire Mixed-Integer Linear Programming formulation) |
| `.dat` | Imports problem data from the WARP database (from a local .mdb file) |
| `.run` | AMPL script that loads data, runs the model, and calls Gurobi solver |
| `.out` | Solver results, including optimal production plan and total profit |

---


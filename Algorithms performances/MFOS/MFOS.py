# -*- coding: utf-8 -*-


import random
import numpy
import math
from solution import solution
import time


def MFO(objf, lb, ub, dim, N, Max_iteration):

    
    N = 50  # Number of search agents
    if not isinstance(lb, list):
        lb = [lb] * dim
    if not isinstance(ub, list):
        ub = [ub] * dim

    # Initialize the positions of moths
    Moth_position = numpy.zeros((N, dim))
    for i in range(dim):
        Moth_position[:, i] = numpy.random.uniform(0, 1, N) * (ub[i] - lb[i]) + lb[i]
    Moth_fitness = numpy.full(N, float("inf"))
    # Moth_fitness=numpy.fell(float("inf"))

    Convergence_curve = numpy.zeros(Max_iteration)

    sorted_population = numpy.copy(Moth_position)
    fitness_sorted = numpy.zeros(N)
    #####################
    best_flames = numpy.copy(Moth_position)
    best_flame_fitness = numpy.zeros(N)
    ####################
    double_population = numpy.zeros((2 * N, dim))
    double_fitness = numpy.zeros(2 * N)

    double_sorted_population = numpy.zeros((2 * N, dim))
    double_fitness_sorted = numpy.zeros(2 * N)
    #########################
    previous_population = numpy.zeros((N, dim))
    previous_fitness = numpy.zeros(N)

    s = solution()

    print('MFO is optimizing  "' + objf.__name__ + '"')

    timerStart = time.time()
    s.startTime = time.strftime("%Y-%m-%d-%H-%M-%S")

    Iteration = 1
    # Max_iteration=1000
    # lb=-100
    # ub=100
    # dim=30
    # Main loop
    while Iteration < Max_iteration:
 
        Flame_no = round(N - Iteration * ((N - 1) / Max_iteration))

        for i in range(0, N):

            # Check if moths go out of the search spaceand bring it back
            for j in range(dim):
                Moth_position[i, j] = numpy.clip(Moth_position[i, j], lb[j], ub[j])

            # evaluate moths
            Moth_fitness[i] = objf(Moth_position[i, :])

        if Iteration == 1:
            # Sort the first population of moths
            fitness_sorted = numpy.sort(Moth_fitness)
            I = numpy.argsort(Moth_fitness)

            sorted_population = Moth_position[I, :]

            # Update the flames
            best_flames = sorted_population
            best_flame_fitness = fitness_sorted
        else:
            #
            #        # Sort the moths
            double_population = numpy.concatenate(
                (previous_population, best_flames), axis=0
            )
            double_fitness = numpy.concatenate(
                (previous_fitness, best_flame_fitness), axis=0
            )
            #
            double_fitness_sorted = numpy.sort(double_fitness)
            I2 = numpy.argsort(double_fitness)
            #
            #
            for newindex in range(0, 2 * N):
                double_sorted_population[newindex, :] = numpy.array(
                    double_population[I2[newindex], :]
                )

            fitness_sorted = double_fitness_sorted[0:N]
            sorted_population = double_sorted_population[0:N, :]
            #
            #        # Update the flames
            best_flames = sorted_population
            best_flame_fitness = fitness_sorted

        #
        #   # Update the position best flame obtained so far
        Best_flame_score = fitness_sorted[0]
        Best_flame_pos = sorted_population[0, :]
        #
        previous_population = Moth_position
        previous_fitness = Moth_fitness
        # 
        a = -1 + Iteration * ((-1) / Max_iteration)

        # Loop counter
        for i in range(0, N):
            #
            for j in range(0, dim):
                if (
                    i <= Flame_no
                ):  # Update the position of the moth with respect to its corresponsing flame
                    # 
                    distance_to_flame = abs(sorted_population[i, j] - Moth_position[i, j])
                    b = 1
                    t = (a - 1) * random.random() + 1
                    # 
                    Moth_position[i, j] = (
                        distance_to_flame * math.exp(b * t) * math.cos(t * 2 * math.pi)
                        + sorted_population[i, j]
                    )
                #            end
                #
                if (
                    i > Flame_no
                ):  # Upaate the position of the moth with respct to one flame
                    # 
                    distance_to_flame = abs(sorted_population[i, j] - Moth_position[i, j])
                    b = 1
                    t = (a - 1) * random.random() + 1
                    # 
                    Moth_position[i, j] = (
                        distance_to_flame * math.exp(b * t) * math.cos(t * 2 * math.pi)
                        + sorted_population[Flame_no, j]
                    )

                if (
                    r < 0.5 and abs(sorted_population) >= 0.5
                ):   
                
                    fly_strength = 2 * (1 - random.random())
                    X1 = Moth_position - sorted_population * abs(
                        fly_strength * Moth_position - X[i, :]
                    )
                    X1 = numpy.clip(X1, lb, ub)

                if objf(X1) < Moth_fitness:  # improved move?
                        X[i, :] = X1.copy()
                else:  # moth perform levy-based flight around the flame
                        X2 = (
                            Moth_position
                            - sorted_population
                            * abs(fly_strength * Moth_position - X[i, :])
                            + numpy.multiply(numpy.random.randn(dim), Levy(dim))
                        )
                        X2 = numpy.clip(X2, lb, ub)
                        if objf(X2) < best_flame_fitness:
                            X[i, :] = X2.copy()
                if ( 
                    r < 0.5 and abs(sorted_population) < 0.5
                ):   
                    fly_strength = 2 * (1 - random.random())
                    X1 = Moth_position - sorted_population * abs(
                        fly_strength * Moth_position - X.mean(0)
                    )
                    X1 = numpy.clip(X1, lb, ub)

                if objf(X1) < Moth_fitness:  # improved move?
                        X[i, :] = X1.copy()
                else:  # Perform levy-based short fly around the flame
                        X2 = (
                            Moth_position
                            - sorted_population
                            * abs(fly_strength * Moth_position - X.mean(0))
                            + numpy.multiply(numpy.random.randn(dim), Levy(dim))
                        )
                        X2 = numpy.clip(X2, lb, ub)
                        if objf(X2) < best_flame_fitness:
                            X[i, :] = X2.copy()
        Convergence_curve[Iteration] = Best_flame_score
        # Display best flame fitness along the iteration
        if Iteration % 1 == 0:
            print(
                [
                    "At iteration "
                    + str(Iteration)
                    + " the best flame fitness is "
                    + str(Best_flame_score)
                ]
            )

        Iteration = Iteration + 1

    timerEnd = time.time()
    s.endTime = time.strftime("%Y-%m-%d-%H-%M-%S")
    s.executionTime = timerEnd - timerStart
    s.convergence = Convergence_curve
    s.optimizer = "MFO"
    s.objfname = objf.__name__

    return s

def Levy(dim):
    beta = 1.5
    sigma = (
        math.gamma(1 + beta)
        * math.sin(math.pi * beta / 2)
        / (math.gamma((1 + beta) / 2) * beta * 2 ** ((beta - 1) / 2))
    ) ** (1 / beta)
    u = 0.01 * numpy.random.randn(dim) * sigma
    v = numpy.random.randn(dim)
    zz = numpy.power(numpy.absolute(v), (1 / beta))
    step = numpy.divide(u, zz)
    return step
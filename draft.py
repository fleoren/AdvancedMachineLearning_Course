import numpy

########## CREATE ENVIRONMENT ##########

########### WIND
# 7x10 matrix
width = 7
length = 10
wind_matrix <- numpy.zeros((width,length))

#values for each one of the columns
wind_values = (0,0,0,1,1,1,2,2,1,0)

for i in range(len(wind_values)):
	x = numpy.ones * wind_value
	wind_matrix[;i] = x

##########

#goal 3,7

#start 3,0

########## DEFINING ACTORS AND ENVIRONMENT, AND HOW THEY INTERACT ##########

class Square:
	def __init__(self,x,y):
		self.x = x
		self.y = y
	def wind(self):
		return wind_matrix[x,y]


def move_agent(from_sq,to_sq):
	#if it tries to leave the grid, it stays on the square where it was
	if( (to_sq.x < 0) or (to_sq.x > width - 1) or (to_sq.y < 0) or (to_sq > length - 1) ):
		moves_to = from_sq
	#wind can't take it out of the grid
	elif( to_sq.y + to_sq.wind > width - 1 ):
		to.sq.y = width
	#else, we sum the value of wind to the y coordinate
	else( to_sq.y = to_sq.y + to_sq.wind ):
		moves_to = to_sq

	return moves_to	

########## AGENT POSSIBLE ACTIONS ##########
	
# agent should move in any of 4 directions: N, E, S, W

# for 1:100000
	# ideas para quitar el for:
		# cuando el best_policy no cambie en *N iteraciones, pum

# TODO simulate one policy
# randint [1,width*length] to obtain the length of the policy
# fill it out with random choices from the 4 possible
# evaluate policy

# first time: save policy as best_policy
	# if reward(current_policy) > reward(best_policy) then best_policy = current_policy

# create vector length width*length+1 called max_reward with max_reward[i] the max reward we've gotten with a policy of length i
# start filling it
# after width*length*10 iterations
	# change uniform random distribution to a distribution pondered by the max reward
	# this way the agent will stop trying policies that are too long/short
	# and find the optimal size much faster



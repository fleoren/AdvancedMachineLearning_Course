import numpy

########## CREATE ENVIRONMENT ##########

########### WIND
# 7x10 matrix
wind_matrix <- numpy.zeros((7,10))

#values for each one of the columns
wind_values = (0,0,0,1,1,1,2,2,1,0)

for i in range(len(wind_values)):
	x = numpy.ones * wind_value
	wind_matrix[;i] = x

##########

#goal 3,7

#start 3,0

########## AGENT POSSIBLE ACTIONS ##########

class Square:
	def __init__(self,x,y):
		self.x = x
		self.y = y
	def wind(self):
		return wind_matrix[x,y]


def move_agent(from_sq,to_sq):
	#if it tries to leave the grid, it stays on the square where it was
	if( to_sq.x < 0 or to_sq.x > 6 or to_sq.y < 0 or to_sq > 9 ):
		moves_to = from_sq
	#else, we sum the value of wind to the y coordinate	
	else( to_sq.y = to_sq.y + to_sq.wind )
		moves_to = to_sq

	return moves_to		

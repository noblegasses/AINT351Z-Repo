import numpy as np
from numpy import random
def Trainer(trainingdata, targetdata):
    iters = 100
    alpha = 0.0000000000001 #learning rate
    weight = random.randn(1,np.size(trainingdata,0)+1)
    error =[]
    for i in range(iters):
        augmat = np.vstack((trainingdata,np.ones(np.size(trainingdata,1))))
        O = weight*augmat
        grad = -(targetdata - O)*np.transpose(augmat)
        weight = weight- alpha*grad
        error.append((targetdata-O)*np.transpose(targetdata-O))
                
    return weight, O, error

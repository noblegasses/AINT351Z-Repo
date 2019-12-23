import numpy as np
import numpy.linalg as la
import numpy.random as rand
import copy as cp
import math as m
def GenerateGaussianData(samples , Mean1, Sigma1, Mean2, Sigma2):
    # generate Gaussian distibuted dataset for class 0
    data1 =  la.cholesky(np.matrix(Sigma1)) * rand.randn(2,samples) + np.tile(Mean1,(1,samples))
    # generate target vectors for class 0
    label1 = np.tile(np.matrix('1; 0') ,( 1, samples))
    #disp(cov(data1'));

    # generate Gaussian distibuted dataset for class 1
    data2 =  la.cholesky(np.matrix(Sigma2)) * rand.randn(2, samples) + np.tile(Mean2,(1,samples))
    # generate target vectors for class 1
    label2 = np.tile(np.matrix('0; 1') ,( 1, samples))
    #disp(cov(data2')); 

    # concatenate class0 and class1 datasets into single dataset
    data = np.hstack((data1,data2))
    targetVec = np.hstack((label1, label2))
    return(data, targetVec)


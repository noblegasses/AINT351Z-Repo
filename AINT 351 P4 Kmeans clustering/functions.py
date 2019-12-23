import numpy as np
import numpy.linalg as la
import numpy.random as rand
import copy as cp
import math as m
def GenerateGaussianData(samples , Mean1, Sigma1, Mean2, Sigma2):
    # generate Gaussian distibuted dataset for class 0
    data1 =  la.cholesky(np.matrix(Sigma1))[0,0] * rand.randn(2,samples) + np.tile(Mean1,(1,samples))
    # generate target vectors for class 0
    label1 = np.tile(np.matrix('1; 0') ,( 1, samples))
    #disp(cov(data1'));

    # generate Gaussian distibuted dataset for class 1
    data2 =  la.cholesky(np.matrix(Sigma2))[0,0] * rand.randn(2, samples) + np.tile(Mean2,(1,samples))
    # generate target vectors for class 1
    label2 = np.tile(np.matrix('0; 1') ,( 1, samples))
    #disp(cov(data2')); 

    # concatenate class0 and class1 datasets into single dataset
    data = np.hstack((data1,data2))
    targetVec = np.hstack((label1, label2))
    return(data, targetVec)

def distance(x1,y1,x2,y2):
    distance = m.sqrt((x2-x1)**2+(y2-y1)**2)
    return distance

def Kmeansclassifier (data, clusters):
    centroids=data[:2,:clusters]
    change = True
    while change == True:
        oldCentroids = cp.deepcopy(centroids)
        distances = []
        for i in range(np.size(data,1)):
            subdistances =[]
            for b in range(clusters):
                subdistances.append(distance(centroids[0,b],centroids[1,b],data[0,i],data[1,i]))
            distances.append(cp.deepcopy(np.array(subdistances)))
        classes = [np.matrix(';')]*clusters
        for i in range(len(distances)):
            minIndex = np.argmin(distances[i])
            classes[minIndex]=np.hstack((classes[minIndex],data[:2,i]))

        centroids=[]
        for i in classes:
            centroids.append([np.mean(i[0]),np.mean(i[1])])
        centroids=np.array(centroids)
        print(centroids)
        if (oldCentroids == centroids).all():
            change = False
    return classes

    

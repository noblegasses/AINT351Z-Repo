function [output]= KMeansAlgorithm (data, clusters)
    centroids =[data(1,1:clusters);data(2,1:clusters)];
    change = 1;
    while(change == 0)
        change = 1;
        
        for i = 1:1:length(data)
            for b = 1:1:clusters
                pointsToCompare = [centroids(1,b),centroids(2,b);data(1,i),data(2,i)];
                distance=zeroes(clusters);
                distance(b) = pdist(pointsToCompare,'euclidian');
            end
           [~,I] = min(distance);
           groups = array(clusters);
           groups(I)(length(groups(I)+1))= [data(1,i);data(2,i)];
           for a = 1:1:length(groups)
               groups(a)= [mean(groups(a)(1,:));mean(groups(a)(2,:)];
           end
         
            
        end
    end
end
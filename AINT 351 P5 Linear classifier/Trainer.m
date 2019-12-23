function[weight, O, error ] =  Trainer(trainingdata, targetdata)
    iters = 100000;
    alpha = 0.0000001;
    weight = randn(1,size(trainingdata,1)+1);
    
    for i = 1:iters
        augmat = [trainingdata;ones(1,size(trainingdata,2))];
        O = weight*augmat;
        grad = -(targetdata - O)*augmat';
        weight = weight- alpha*grad;
        error(i)=((targetdata-O)*(targetdata-O)');
    end
  end 
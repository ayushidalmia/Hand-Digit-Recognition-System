Hand-Digit-Recognition-System
=============================

This repository consists of the project done as part of the course  Statistical Methods in AI- Monsoon 2013. The course was instructed by [Dr. Anoop Nambodiri](http://faculty.iiit.ac.in/~anoop/)

A detailed report is available <a href="https://drive.google.com/file/d/0B87x7EOOS4ztZlUxMlE3SXp3NXc/edit?usp=sharing" target="_blank">here</a>

##Requirements
Matlab R2012a

##Problem
Handwritten Digit Recognition is one of the most fundamental problems in designing practical recognition system. Immediate applications of the digit recognition techniques include postal mail sorting, automatically address reading and mail routing, bank check processing, etc. In this experiment we train and test K-Nearest Neighbours (KNN) Classifier for pattern analysis in solving handwritten digit recognition problems, using MNIST database. 

The source folder consists of the following:

* preprocessing.m  
In this step the MNIST digit data are read and then prepocessed by converting gray scale images into binary and removing noise or spurious pixels.In order to preprocess 25% of train data and 50% of test data invoke the following from matlab:

**[label_train,BW_data_train] = preprocessing('train',25);**
**[label_test,BW_data_test] = preprocessing('test',50);**

The input of the preprocessing function is the type of sample and the percentage of the sample. It returns a Nx1 matrix which consists of all the labels of the data and a NxM binarymatrix for each image and has entries in the range 0-9. In this case since images are of fixed size 28*28, M=784. N depends on what % of random data you are taking.

* feature_X.m  
In this step we create the feature vector for the training and test samples. Invoke the following to invoke a feature say x:

**[feature]=feature_name[BW_data]**

where 'name' is one of the following five features:

* Template Matching
* Histogram Projection
* Zoning
* End Point
* Histogram Gradient

Depending upon the feature, the above function will return a NXd feature vector where d is the dimension of the feature vector. For example, in order to compute the feature vector for histogram on training data invoke the following:

  **[feature]=feature_histogram[BW_data_train];**

* knnclassifier.m
Finally, after computing the feature vector for both the training and test data set, for a particular feature we compute the accuracy and confusion matrix for k-Nearest Neighbour by sending these feature vectors as parameters along with a specified value for k. For example in order to compute 3-NN we invoke the following:  
**[accuracy] = knn(3,feature_train,feature_test,BW_data_train,BW_data_test,label_train,label_test);**
The function also writes the confusion matrix in a file named confusionmatrix.txt

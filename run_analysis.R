run_analysis <- function() {
 
        ##Read train and test data
        testx<-read.table(file="UCI HAR Dataset/test/X_test.txt",header=FALSE,colClasses="numeric")
        trainx<-read.table(file="UCI HAR Dataset/train/X_train.txt",header=FALSE,colClasses="numeric")
        ##append/merge train and test data
        completex<-rbind(trainx,testx)
        
        ##read train and test labels        
        testy<-read.table(file="UCI HAR Dataset/test/y_test.txt",header=FALSE,colClasses="character")
        trainy<-read.table(file="UCI HAR Dataset/train/y_train.txt",header=FALSE,colClasses="character")
        ##append/merge labels
        completey<-rbind(trainy,testy)
        ##read activity labels and apply to previous labels
        activitylabels<-read.table(file="UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
        activitylabels<-factor(completey[[1]],labels=activitylabels[,2])
       
        ##read subject data for test and train and merge
        subjecttest<-read.table(file="UCI HAR Dataset/test/subject_test.txt",header=FALSE,colClasses="character")
        subjecttrain<-read.table(file="UCI HAR Dataset/train/subject_train.txt",header=FALSE,colClasses="character")
        subject<-rbind(subjecttrain,subjecttest)
        
        finalx<-cbind(subject,activitylabels,completex)
                
        ##read full feature list
        features<-read.table(file="UCI HAR Dataset/features.txt",colClasses="character")
        ##names columns of complete data
        colnames(finalx)<-c("Subject","Activity",features[,2])
        
        ##identify mean and std columns
        meancol<-grepl(pattern="mean()",x=colname,fixed=TRUE)
        stdcol<-grepl(pattern="std()",x=colname,fixed=TRUE)
               
        
        ##new data rame with only mean and std columns
        finalx<-finalx[,as.logical(c(1,1,meancol+stdcol))]
                
        finalx[,1]<-as.numeric(finalx[,1])
        finalx<-finalx[order(finalx[,1],finalx[,2]),]
        
        print(dim(finalx))
        
        tidy<-aggregate(x=finalx,by=list(Subject=finalx$Subject,Activity=finalx$Activity),FUN=mean)[,c(1,2,5:dim(finalx)[2])]
        tidy<-tidy[order(tidy[,1],tidy[,2]),]
        
        print(dim(tidy))
        return(tidy)
        
        
        
}
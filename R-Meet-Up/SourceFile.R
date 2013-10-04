#Using interactivity and reading in data.
MakeFiles<-function(Cols){
  
  importData=function(){ #interactive
    print(list.files())
    dataIndex<-as.numeric(readline("What index value is your dataset? \n"))
    read.csv(list.files()[dataIndex], header=T, row.names=1, na.strings="?")
  }
  
  DataFile<-importData()
  
  Means<-apply(DataFile[,Cols], 2, mean, na.rm=T)
  
  Final<-list(DataFile, Means)
  Final
  
}


TimesTables<-function(n=10){
  
  First<-seq(1:n)
  Second<-First
  
  Tables<-matrix(data=NA, ncol=length(First), nrow=length(Second))
  
  for(i in 1:length(First)){
    
    for(j in 1:length(Second)){
      
      Tables[i,j]<-i*j
      
    }	
       
  }
  
  print(Tables)
  
}
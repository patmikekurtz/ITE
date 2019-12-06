myData <- read.csv("2019 All Data.csv")

data <- transform(data,RepairFacilityOwnershipType=revalue(RepairFacilityOwnershipType,c("Rail Road"="Railroad")))

MyData <- filter(data, ChargeDollars>0)

data<- data %>%
   mutate(myID = group_indices(., CarID, RepairDate, RepairFacilityName))

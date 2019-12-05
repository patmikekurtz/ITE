myData <- read.csv("2019 All Data.csv")

myData <- transform(myData,RepairFacilityOwnershipType=revalue(RepairFacilityOwnershipType,c("Rail Road"="Railroad")))

MyData <- filter(myData, myData$RepairFacilityOwnershipType)

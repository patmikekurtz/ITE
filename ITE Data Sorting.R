myData <- read.csv("2019 All Data.csv")

data <- transform(data,RepairFacilityOwnershipType=revalue(RepairFacilityOwnershipType,c("Rail Road"="Railroad")))
<<<<<<< HEAD
data<- data %>%
  mutate(myID = group_indices(., FullMarkCode, RepairDate))


MyData <- filter(data, ChargeDollars>0)

data <- filter(data,!is.na(TotalCharge))
data <- mutate(data,BRC=as.numeric(as.character(TotalCharge)))

quickLook <- select(data,IsRebilled,BrcType,InvoiceDate,RepairDate,BillingLagMonths,RepairFacilityOwnershipType,RepairFacilityName,AppliedJobCode,AppliedQualifierCode,BRC,IsRebilled,FullMarkCode,BuildYear,myID,CarTypeID)
costByEvent <- quickLook %>%
  filter(IsRebilled==0) %>%
  group_by(myID, CarTypeID, RepairFacilityName,FullMarkCode, RepairDate, isQual) %>%
  summarise(TotalCost = sum(BRC))


arrange(costByEvent,desc(TotalCost))

data <- select(mydata, TID, Servicer, Servicer, CarID, InvoiceDate, InvoicingParty, RepairDate, SPLC, RepairFacilityOwnershipType, RepairFacilityName, AppliedJobCode, AppliedJobMajorCategory, AppliedJobMinorCategory, Narrative, LaborCharge, MaterialCharge, TotalCharge, IsRebilled, ResponsibleParty, FullMarkCode, Age, DetailedCarType, TerminationEvent, AssetHolder, LeaseRate, LeaseEndDate, LeaseStartDate, LeaseTypeCode)

ITE_con = odbcConnect("ITE")


EventData <- data %>%
  group_by(FullMarkCode, RepairFacilityName, ParentLegalName,myID,RepairFacilityOwnershipType) %>%
  summarise(TotalCostDollars=sum(My.))


EventsByLocation <- EventData %>%
  group_by(RepairFacilityName, RepairFacilityOwnershipType) %>%
  summarise(Events=n(), TotalSpend=sum(TotalCostDollars)) %>%
  arrange(desc(Events))
=======

MyData <- filter(data, ChargeDollars>0)

data<- data %>%
   mutate(myID = group_indices(., CarID, RepairDate, RepairFacilityName))
>>>>>>> de304288338dc507338e13d86ab30b8e4ada5b1d

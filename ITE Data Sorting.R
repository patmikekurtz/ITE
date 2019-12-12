myData <- read.csv("2019 All Data.csv")

data <- transform(data,RepairFacilityOwnershipType=revalue(RepairFacilityOwnershipType,c("Rail Road"="Railroad")))
<<<<<<< HEAD

=======
<<<<<<< HEAD
>>>>>>> 399de34c2742fdd6480fd289232ef6de789405c3
data<- data %>%
  mutate(myID = group_indices(., FullMarkCode, RepairDate))


MyData <- filter(data, ChargeDollars>0)

mydata <- mydata %>%
 mutate(TotalCharge=as.numeric(as.character(TotalCharge)))%>%
 mutate(LaborCharge=as.numeric(as.character(LaborCharge)))%>%
 mutate(MaterialCharge=as.numeric(as.character(MaterialCharge)))

mydata$TotalCharge[is.na(mydata$MaterialCharge)]<-0
mydata$MaterialCharge[is.na(mydata$MaterialCharge)]<-0
mydata$LaborCharge[is.na(mydata$LaborCharge)]<-0

quickLook <- select(data,IsRebilled,BrcType,InvoiceDate,RepairDate,BillingLagMonths,RepairFacilityOwnershipType,RepairFacilityName,AppliedJobCode,AppliedQualifierCode,BRC,IsRebilled,FullMarkCode,BuildYear,myID,CarTypeID)

Event <-mydata %>%
  filter(TotalCharge>0)%>%
  group_by(TID, Servicer, Servicer, CarID, InvoiceDate, InvoicingParty, RepairDate, SPLC, RepairFacilityOwnershipType, RepairFacilityName, FullMarkCode, Age, DetailedCarType, TerminationEvent, AssetHolder, LeaseRate, LeaseEndDate, LeaseStartDate, LeaseTypeCode) %>%
  summarise(Material = sum(MaterialCharge), Labor = sum(LaborCharge), Total = sum(TotalCharge), sum(TQ),sum(SE),sum(TT),sum(CI),sum(isCorrosion))


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
<<<<<<< HEAD

=======
=======
>>>>>>> 399de34c2742fdd6480fd289232ef6de789405c3

MyData <- filter(data, ChargeDollars>0)

data<- data %>%
   mutate(myID = group_indices(., CarID, RepairDate, RepairFacilityName))
<<<<<<< HEAD



mydata <- mydata %>% 
  mutate(TQ=ifelse(AppliedJobCode==9820,1,0))%>%
  mutate(SE=ifelse(AppliedJobCode==9821,1,0))%>%
  mutate(TT=ifelse(AppliedJobCode==9840,1,ifelse(AppliedJobCode==9818,1,0)))%>%
  mutate(CI=ifelse(AppliedJobCode==9822))
  


=======
>>>>>>> de304288338dc507338e13d86ab30b8e4ada5b1d
>>>>>>> 399de34c2742fdd6480fd289232ef6de789405c3

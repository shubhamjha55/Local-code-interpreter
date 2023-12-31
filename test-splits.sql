                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                -- DBTITLE 1,Create DimUnifiedPartner_Final table 
DROP TABLE IF EXISTS DimUnifiedPartner_Final;
CREATE TABLE DimUnifiedPartner_Final AS 
SELECT  UnifiedPartnerKey
        ,SourceID AS PartnerID
        ,PartnerName
		,PartnerOrgType
		,MPNVOrgID AS VOrgID
		,DUP.PartnerGlobalID AS PartnerGlobalID
		,SourceName
		,PartnerOneSubID
		,DUP.PartnerOneSubKey
		,DUP.PartnerOneID
		,CASE WHEN DUP.PartnerOneID = -9999 THEN 'Unmatched Partners' ELSE PartnerOneName END AS PartnerOneName
		,IsLSP
		,Area 
		,Region 
		,SubRegion
		,Subsidiary
        ,SubsidiaryID
        ,CASE WHEN UnifiedPartnerKey = 2926514 THEN 'United States'
        WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgArea ELSE  DUP.VOrgArea END AS VOrgArea
        ,CASE WHEN UnifiedPartnerKey = 2926514 THEN 'United States'
        WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalArea ELSE  DUP.PartnerGlobalArea END AS PartnerGlobalArea
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgRegion ELSE DUP.VOrgRegion END AS VOrgRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalRegion ELSE DUP.PartnerGlobalRegion END AS PartnerGlobalRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgSubRegion ELSE DUP.VOrgSubRegion END AS VOrgSubRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalSubRegion ELSE DUP.PartnerGlobalSubRegion END AS PartnerGlobalSubRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgSubsidiary ELSE DUP.VOrgSubsidiary END AS VOrgSubsidiary
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalSubsidiary ELSE DUP.PartnerGlobalSubsidiary END AS PartnerGlobalSubsidiary
        ,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgSubsidiaryID ELSE DUP.VOrgSubsidiaryID END AS VOrgSubsidiaryID
        ,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalSubsidiaryID ELSE DUP.PartnerGlobalSubsidiaryID END AS PartnerGlobalSubsidiaryID
		,IsPartnerMastered
		,IsPartnerAssociated
		,PCN
        ,CASE WHEN SourceName='PCAccount' THEN IFNULL(DAT.PartnerID,-9999) ELSE IFNULL(DUP.SourceID,-9999) END AS PartnerID_Investment
        ,CASE WHEN DUP.PartnerOrgType = 'Distributor' AND DUP.SourceName = 'MSSales' THEN GDG.ReportingDistributorName ELSE 'Others' END AS GlobalDistributorGrouping
        ,CASE WHEN PDM.PartnerOneSubKey IS NOT NULL THEN 'Yes' ELSE 'No' END AS IsPDMManaged
        ,CASE WHEN MAP.PartnerOneSubKey IS NOT NULL THEN 'Yes' ELSE 'No' END AS PartnerHasOpportunity
        ,CASE WHEN HY.PartnerOneID IS NOT NULL THEN 'Yes' ELSE 'No' END AS IsHyperscaler
        ,CASE WHEN C.VOrgID IS NOT NULL THEN 1 ELSE 0 END AS HasCloudCompetency
        ,CASE WHEN PP.MPNID IS NOT NULL OR VP.VOrgPartnerID IS NOT NULL THEN 1 ELSE 0 END AS HasProfile
        ,`IsLego-ITES` AS `IsLego-ITES`
FROM OCPMart_Sales.DimUnifiedPartner_tmp DUP 
LEFT JOIN PDM_tmp PDM ON DUP.PartnerOneSubKey = PDM.PartnerOneSubKey 
LEFT JOIN MapOpptyPartner_tmp MAP ON DUP.PartnerOneSubKey = MAP.PartnerOneSubKey-- DBTITLE 1,Create DimUnifiedPartner_Final table 
DROP TABLE IF EXISTS DimUnifiedPartner_Final;
CREATE TABLE DimUnifiedPartner_Final AS 
SELECT  UnifiedPartnerKey
        ,SourceID AS PartnerID
        ,PartnerName
		,PartnerOrgType
		,MPNVOrgID AS VOrgID
		,DUP.PartnerGlobalID AS PartnerGlobalID
		,SourceName
		,PartnerOneSubID
		,DUP.PartnerOneSubKey
		,DUP.PartnerOneID
		,CASE WHEN DUP.PartnerOneID = -9999 THEN 'Unmatched Partners' ELSE PartnerOneName END AS PartnerOneName
		,IsLSP
		,Area 
		,Region 
		,SubRegion
		,Subsidiary
        ,SubsidiaryID
        ,CASE WHEN UnifiedPartnerKey = 2926514 THEN 'United States'
        WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgArea ELSE  DUP.VOrgArea END AS VOrgArea
        ,CASE WHEN UnifiedPartnerKey = 2926514 THEN 'United States'
        WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalArea ELSE  DUP.PartnerGlobalArea END AS PartnerGlobalArea
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgRegion ELSE DUP.VOrgRegion END AS VOrgRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalRegion ELSE DUP.PartnerGlobalRegion END AS PartnerGlobalRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgSubRegion ELSE DUP.VOrgSubRegion END AS VOrgSubRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalSubRegion ELSE DUP.PartnerGlobalSubRegion END AS PartnerGlobalSubRegion
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgSubsidiary ELSE DUP.VOrgSubsidiary END AS VOrgSubsidiary
		,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalSubsidiary ELSE DUP.PartnerGlobalSubsidiary END AS PartnerGlobalSubsidiary
        ,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.VOrgSubsidiaryID ELSE DUP.VOrgSubsidiaryID END AS VOrgSubsidiaryID
        ,CASE WHEN DSR.ResellerTPID IS NOT NULL THEN DSR.PartnerGlobalSubsidiaryID ELSE DUP.PartnerGlobalSubsidiaryID END AS PartnerGlobalSubsidiaryID
		,IsPartnerMastered
		,IsPartnerAssociated
		,PCN
        ,CASE WHEN SourceName='PCAccount' THEN IFNULL(DAT.PartnerID,-9999) ELSE IFNULL(DUP.SourceID,-9999) END AS PartnerID_Investment
        ,CASE WHEN DUP.PartnerOrgType = 'Distributor' AND DUP.SourceName = 'MSSales' THEN GDG.ReportingDistributorName ELSE 'Others' END AS GlobalDistributorGrouping
        ,CASE WHEN PDM.PartnerOneSubKey IS NOT NULL THEN 'Yes' ELSE 'No' END AS IsPDMManaged
        ,CASE WHEN MAP.PartnerOneSubKey IS NOT NULL THEN 'Yes' ELSE 'No' END AS PartnerHasOpportunity
        ,CASE WHEN HY.PartnerOneID IS NOT NULL THEN 'Yes' ELSE 'No' END AS IsHyperscaler
        ,CASE WHEN C.VOrgID IS NOT NULL THEN 1 ELSE 0 END AS HasCloudCompetency
        ,CASE WHEN PP.MPNID IS NOT NULL OR VP.VOrgPartnerID IS NOT NULL THEN 1 ELSE 0 END AS HasProfile
        ,`IsLego-ITES` AS `IsLego-ITES`
FROM OCPMart_Sales.DimUnifiedPartner_tmp DUP 
LEFT JOIN PDM_tmp PDM ON DUP.PartnerOneSubKey = PDM.PartnerOneSubKey 
LEFT JOIN MapOpptyPartner_tmp MAP ON DUP.PartnerOneSubKey = MAP.PartnerOneSubKey
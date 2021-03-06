/*
This script was created by Visual Studio on 09/07/2014 at 21:10.
Run this script on localhost.OpenCBS_Online_Test (OHLAPTOP3\Oskar) to make it the same as localhost.OpenCBS_GUI (OHLAPTOP3\Oskar).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[OverdueEvents] DROP CONSTRAINT [FK_OverdueEvents_ContractEvents]
ALTER TABLE [dbo].[FollowUp] DROP CONSTRAINT [FK_FollowUp_Projects]
ALTER TABLE [dbo].[SavingDepositContracts] DROP CONSTRAINT [FK_SavingDepositContract_SavingContracts]
ALTER TABLE [dbo].[VillagesPersons] DROP CONSTRAINT [FK_VillagesPersons_Villages]
ALTER TABLE [dbo].[AllowedRoleMenus] DROP CONSTRAINT [FK_AllowedRoleMenus_Roles]
ALTER TABLE [dbo].[TermDepositProducts] DROP CONSTRAINT [FK_TermDepositProducts_InstallmentTypes]
ALTER TABLE [dbo].[TermDepositProducts] DROP CONSTRAINT [FK_TermDepositProducts_SavingProducts]
ALTER TABLE [dbo].[EventAttributes] DROP CONSTRAINT [FK_EventAttributes_EventTypes]
ALTER TABLE [dbo].[SavingBookContracts] DROP CONSTRAINT [FK_SavingBookContract_SavingContracts]
ALTER TABLE [dbo].[WriteOffEvents] DROP CONSTRAINT [FK_WriteOffEvents_ContractEvents]
ALTER TABLE [dbo].[FundingLineAccountingRules] DROP CONSTRAINT [FK_FundingLineAccountingRules_AccountingRules]
ALTER TABLE [dbo].[FundingLineAccountingRules] DROP CONSTRAINT [FK_FundingLineAccountingRules_FundingLine]
ALTER TABLE [dbo].[VillagesAttendance] DROP CONSTRAINT [FK_VillagesAttendance_Villages]
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] DROP CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents]
ALTER TABLE [dbo].[ManualAccountingMovements] DROP CONSTRAINT [FK_ManualAccountingMovements_ChartOfAccounts]
ALTER TABLE [dbo].[ManualAccountingMovements] DROP CONSTRAINT [FK_ManualAccountingMovements_ChartOfAccounts1]
ALTER TABLE [dbo].[ProvisionEvents] DROP CONSTRAINT [FK_ProvisionEvents_ContractEvents]
ALTER TABLE [dbo].[CollateralPropertyValues] DROP CONSTRAINT [FK_CollateralPropertyValues_CollateralProperties]
ALTER TABLE [dbo].[CollateralPropertyValues] DROP CONSTRAINT [FK_CollateralPropertyValues_CollateralsLinkContracts]
ALTER TABLE [dbo].[Villages] DROP CONSTRAINT [FK_Villages_Users]
ALTER TABLE [dbo].[Installments] DROP CONSTRAINT [FK_Installments_Credit]
ALTER TABLE [dbo].[CollateralsLinkContracts] DROP CONSTRAINT [FK_CollateralsLinkContracts_Contracts]
ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Groups_Tiers]
ALTER TABLE [dbo].[LoanAccountingMovements] DROP CONSTRAINT [FK_LoanAccountingMovements_ChartOfAccounts]
ALTER TABLE [dbo].[LoanAccountingMovements] DROP CONSTRAINT [FK_LoanAccountingMovements_ChartOfAccounts1]
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_EconomicActivities]
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_Projects]
ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_Contracts_Villages]
ALTER TABLE [dbo].[CollateralProperties] DROP CONSTRAINT [FK_CollateralProperties_CollateralProducts]
ALTER TABLE [dbo].[CollateralProperties] DROP CONSTRAINT [FK_CollateralProperties_CollateralPropertyTypes]
ALTER TABLE [dbo].[ExoticInstallments] DROP CONSTRAINT [FK_ExoticInstallments_Exotics]
ALTER TABLE [dbo].[CreditEntryFees] DROP CONSTRAINT [FK_CreditEntryFees_Credit]
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Contracts]
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_InstallmentTypes]
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Packages]
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Temp_FundingLines]
ALTER TABLE [dbo].[Credit] DROP CONSTRAINT [FK_Credit_Users]
ALTER TABLE [dbo].[PersonGroupBelonging] DROP CONSTRAINT [FK_PersonGroupBelonging_Persons1]
ALTER TABLE [dbo].[PersonGroupBelonging] DROP CONSTRAINT [FK_PersonGroupCorrespondance_Groups]
ALTER TABLE [dbo].[CorporatePersonBelonging] DROP CONSTRAINT [FK_CorporatePersonBelonging_Corporates]
ALTER TABLE [dbo].[CorporatePersonBelonging] DROP CONSTRAINT [FK_CorporatePersonBelonging_Persons]
ALTER TABLE [dbo].[AdvancedFieldsValues] DROP CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFields]
ALTER TABLE [dbo].[AdvancedFieldsValues] DROP CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities]
ALTER TABLE [dbo].[AdvancedFields] DROP CONSTRAINT [FK_AdvancedFields_AdvancedFieldsEntities]
ALTER TABLE [dbo].[AdvancedFields] DROP CONSTRAINT [FK_AdvancedFields_AdvancedFieldsTypes]
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_ActionItems]
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_AllowedRoleActions]
ALTER TABLE [dbo].[AllowedRoleActions] DROP CONSTRAINT [FK_AllowedRoleActions_Roles]
ALTER TABLE [dbo].[TrancheEvents] DROP CONSTRAINT [FK_TrancheEvents_ContractEvents]
ALTER TABLE [dbo].[TellerEvents] DROP CONSTRAINT [FK_TellerEvents_Tellers]
ALTER TABLE [dbo].[LoansLinkSavingsBook] DROP CONSTRAINT [FK_LoansLinkSavingsBook_Contracts]
ALTER TABLE [dbo].[LoansLinkSavingsBook] DROP CONSTRAINT [FK_LoansLinkSavingsBook_SavingContracts]
ALTER TABLE [dbo].[EntryFees] DROP CONSTRAINT [FK_EntryFees_Packages]
ALTER TABLE [dbo].[SavingBookProducts] DROP CONSTRAINT [FK_SavingBookProducts_SavingProducts]
ALTER TABLE [dbo].[SavingProducts] DROP CONSTRAINT [FK_SavingProducts_Currencies]
ALTER TABLE [dbo].[City] DROP CONSTRAINT [FK_City_Districts]
ALTER TABLE [dbo].[StandardBookings] DROP CONSTRAINT [FK_StandardBookings_ChartOfAccounts]
ALTER TABLE [dbo].[StandardBookings] DROP CONSTRAINT [FK_StandardBookings_ChartOfAccounts1]
ALTER TABLE [dbo].[AmountCycles] DROP CONSTRAINT [FK_AmountCycles_Cycles]
ALTER TABLE [dbo].[Districts] DROP CONSTRAINT [FK_Districts_Provinces]
ALTER TABLE [dbo].[SavingsAccountingMovements] DROP CONSTRAINT [FK_SavingsAccountingMovements_ChartOfAccounts]
ALTER TABLE [dbo].[SavingsAccountingMovements] DROP CONSTRAINT [FK_SavingsAccountingMovements_ChartOfAccounts1]
ALTER TABLE [dbo].[ChartOfAccounts] DROP CONSTRAINT [FK_ChartOfAccounts_AccountsCategory]
ALTER TABLE [dbo].[ContractAccountingRules] DROP CONSTRAINT [FK_ContractAccountingRules_AccountingRules]
ALTER TABLE [dbo].[ContractAccountingRules] DROP CONSTRAINT [FK_ContractAccountingRules_DomainOfApplications]
ALTER TABLE [dbo].[ContractAccountingRules] DROP CONSTRAINT [FK_ContractAccountingRules_Packages]
ALTER TABLE [dbo].[ContractAccountingRules] DROP CONSTRAINT [FK_ContractAccountingRules_SavingProducts]
ALTER TABLE [dbo].[AccountingRules] DROP CONSTRAINT [FK_AccountingRules_ChartOfAccounts]
ALTER TABLE [dbo].[AccountingRules] DROP CONSTRAINT [FK_AccountingRules_ChartOfAccounts1]
ALTER TABLE [dbo].[AccountingRules] DROP CONSTRAINT [FK_AccountingRules_EventAttributes]
ALTER TABLE [dbo].[AccountingRules] DROP CONSTRAINT [FK_AccountingRules_EventTypes]
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_SavingContracts]
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_Tellers]
ALTER TABLE [dbo].[SavingEvents] DROP CONSTRAINT [FK_SavingEvents_Users]
ALTER TABLE [dbo].[Corporates] DROP CONSTRAINT [FK_Corporates_DomainOfApplications]
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Currencies]
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Cycles]
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_Exotics]
ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_Packages_InstallmentTypes]
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Tiers]
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_SavingContracts_Tiers]
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_SavingContracts_Users]
ALTER TABLE [dbo].[SavingContracts] DROP CONSTRAINT [FK_Savings_SavingProducts]
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_Banks]
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_Banks1]
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_DomainOfApplications]
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [FK_Persons_Tiers]
ALTER TABLE [dbo].[EconomicActivities] DROP CONSTRAINT [FK_DomainOfApplications_DomainOfApplications]
ALTER TABLE [dbo].[FundingLineEvents] DROP CONSTRAINT [FK_FundingLineEvents_FundingLines]
ALTER TABLE [dbo].[FundingLines] DROP CONSTRAINT [FK_FundingLines_Currencies]
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Contracts]
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents]
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Tellers]
ALTER TABLE [dbo].[ContractEvents] DROP CONSTRAINT [FK_ContractEvents_Users]
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_Branches]
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_ChartOfAccounts]
ALTER TABLE [dbo].[Tellers] DROP CONSTRAINT [FK_Tellers_Currencies]
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Branches]
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Corporates]
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Districts]
ALTER TABLE [dbo].[Tiers] DROP CONSTRAINT [FK_Tiers_Districts1]



SET IDENTITY_INSERT [dbo].[CollateralPropertyTypes] ON 

GO
INSERT [dbo].[CollateralPropertyTypes] ([id], [name]) VALUES (1, N'Number')
GO
INSERT [dbo].[CollateralPropertyTypes] ([id], [name]) VALUES (2, N'String')
GO
INSERT [dbo].[CollateralPropertyTypes] ([id], [name]) VALUES (3, N'Date')
GO
INSERT [dbo].[CollateralPropertyTypes] ([id], [name]) VALUES (4, N'Collection')
GO
INSERT [dbo].[CollateralPropertyTypes] ([id], [name]) VALUES (5, N'Owner')
GO
SET IDENTITY_INSERT [dbo].[CollateralPropertyTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountsCategory] ON 

GO
INSERT [dbo].[AccountsCategory] ([id], [name]) VALUES (1, N'BalanceSheetAsset')
GO
INSERT [dbo].[AccountsCategory] ([id], [name]) VALUES (2, N'BalanceSheetLiabilities')
GO
INSERT [dbo].[AccountsCategory] ([id], [name]) VALUES (3, N'ProfitAndLossIncome')
GO
INSERT [dbo].[AccountsCategory] ([id], [name]) VALUES (4, N'ProfitAndLossExpense')
GO
SET IDENTITY_INSERT [dbo].[AccountsCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (1, N'Cash', NULL, 0)
GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (2, N'Cheque', NULL, 0)
GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (3, N'DirectDebit', NULL, 0)
GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (4, N'WireTransfer', NULL, 0)
GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (5, N'DebitCard', NULL, 0)
GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (6, N'Voucher', NULL, 0)
GO
INSERT [dbo].[PaymentMethods] ([id], [name], [description], [pending]) VALUES (7, N'Savings', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 

GO
INSERT [dbo].[Currencies] ([id], [name], [is_pivot], [code], [is_swapped], [use_cents]) VALUES (1, N'USD', 1, N'USD', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

GO
INSERT [dbo].[Branches] ([id], [name], [deleted], [code], [address], [description]) VALUES (1, N'Default', 0, N'DEF', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[EventTypes] ON 

GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (77, N'AILE', N'Accrual Interest Loan Event', 740, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (10, N'APR', N'Anticipated Partial Repayment', 110, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (12, N'APTR', N'Anticipated Partial Total Repayment', 130, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (11, N'ATR', N'Anticipated Total Repayment', 120, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (36, N'BLGL', N'Bad Loan Good Loan', 360, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (37, N'BLLL', N'Bad Loan Late Loan', 370, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (39, N'BLRL', N'Bad Loan Rescheduled', 390, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (74, N'CDAE', N'Close Day Amount Event', 710, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (70, N'CNDE', N'Close amount Negative Difference Event', 670, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (69, N'CPDE', N'Close amount Positive Difference Event', 660, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (43, N'CSUE', N'Client save/update event', 430, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (22, N'FLNE', N'Funding line event', 240, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (33, N'GLBL', N'Good Loan Bad Loan', 330, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (32, N'GLLL', N'Good Loan Late Loan', 320, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (38, N'GLRL', N'Late Loan Rescheduled', 380, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (63, N'LCIE', N'Loan credit insurance event', 620, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (64, N'LCIP', N'Loan credit insurance premium event', 630, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (65, N'LCIW', N'Loan credit insurance Write-off event', 640, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (51, N'LEE0', N'Entry fees 0', 500, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (52, N'LEE1', N'Entry fees 1', 510, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (53, N'LEE2', N'Entry fees 2', 520, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (54, N'LEE3', N'Entry fees 3', 530, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (55, N'LEE4', N'Entry fees 4', 540, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (56, N'LEE5', N'Entry fees 5', 550, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (57, N'LEE6', N'Entry fees 6', 560, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (58, N'LEE7', N'Entry fees 7', 570, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (59, N'LEE8', N'Entry fees 8', 580, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (60, N'LEE9', N'Entry fees 9', 590, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (42, N'LIAE', N'Loan accrued interest event', 420, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (35, N'LLBL', N'Late Loan Bad Loan', 350, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (34, N'LLGL', N'Late Loan Good Loan', 340, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (41, N'LLPE', N'Loan provision event', 410, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (40, N'LLRL', N'Late Loan Rescheduled', 400, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (68, N'LOCE', N'Loan Close Event', 650, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (2, N'LODE', N'Loan Disbursement Event', 20, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (1, N'LOVE', N'Loan Validation Event', 10, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (76, N'LPAE', N'Loan Penalty Accrual Event', 730, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (75, N'MSCE', N'Manual Schedule Change Event', 720, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (73, N'ODAE', N'Open Day Amount Event', 700, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (72, N'ONDE', N'Open amount Negative Difference Event', 690, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (71, N'OPDE', N'Open amount Positive Difference Event', 680, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (4, N'RBLE', N'Repayment of Bad Loan Event', 50, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (3, N'RGLE', N'Repayment of Good Loan Event', 40, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (7, N'ROLE', N'Reschedule Of Loan Event', 80, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (5, N'ROWO', N'Repayment Over Write-Off', 60, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (6, N'RRLE', N'Repayment for Rescheduled Loan Event', 70, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (66, N'SBCS', N'Savings Block Compulsory Savings', 317, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (50, N'SCIT', N'Saving credit inter-branch transfer', 186, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (21, N'SCLE', N'Saving closure', 230, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (17, N'SCTE', N'Incoming transfer', 180, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (49, N'SDIT', N'Saving debit inter-branch transfer', 185, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (16, N'SDTE', N'Outgoing transfer', 170, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (18, N'SIAE', N'Accrued interests', 190, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (19, N'SIPE', N'Posting of accrued interests', 200, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (20, N'SMFE', N'Management fee for a period', 220, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (47, N'SOCE', N'Savings special operation credit', 480, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (48, N'SODE', N'Savings special operation dredit', 490, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (25, N'SOFE', N'Overdraft fee', 270, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (28, N'SPDE', N'Saving pending deposit event', 300, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (46, N'SPDR', N'Saving pending deposit refused event', 470, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (31, N'SRLE', N'Savings repayment for loan event', 316, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (67, N'SUCS', N'Savings Unblock Compulsory Savings', 318, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (26, N'SVAE', N'Agio', 280, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (27, N'SVCE', N'Closing of a savings account', 290, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (14, N'SVDE', N'Deposit', 150, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (13, N'SVIE', N'New saving book', 140, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (30, N'SVLD', N'Savings loan disbursement event', 315, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (29, N'SVRE', N'Savings reopen event', 310, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (15, N'SVWE', N'Withdrawal', 160, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (9, N'TEET', N'Tranche event', 100, 1)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (62, N'UCTE', N'User close teller', 610, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (23, N'ULIE', N'User login', 250, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (24, N'ULOE', N'User logout', 260, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (44, N'UMEE', N'Manual accounting entry event', 440, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (61, N'UOTE', N'User open teller', 600, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (45, N'USBE', N'Manual standard booking event', 450, 0)
GO
INSERT [dbo].[EventTypes] ([id], [event_type], [description], [sort_order], [accounting]) VALUES (8, N'WROE', N'Write-Off Even', 90, 1)
GO
SET IDENTITY_INSERT [dbo].[EventTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[EventAttributes] ON 

GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (1, N'LCIE', N'commission')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (2, N'LCIE', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (3, N'LCIP', N'commission')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (4, N'LCIP', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (5, N'LCIW', N'commission')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (6, N'LCIW', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (7, N'RRLE', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (8, N'RRLE', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (9, N'RRLE', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (10, N'RRLE', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (11, N'RGLE', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (12, N'RGLE', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (13, N'RGLE', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (14, N'RGLE', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (15, N'RBLE', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (16, N'RBLE', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (17, N'RBLE', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (18, N'RBLE', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (19, N'ATR', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (20, N'ATR', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (21, N'ATR', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (22, N'ATR', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (23, N'APR', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (24, N'APR', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (25, N'APR', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (26, N'APR', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (27, N'APTR', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (28, N'APTR', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (29, N'APTR', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (30, N'APTR', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (31, N'ROWO', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (32, N'ROWO', N'penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (33, N'ROWO', N'commissions')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (34, N'ROWO', N'interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (35, N'LODE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (36, N'GLLL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (37, N'GLBL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (38, N'LLGL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (39, N'LLBL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (40, N'BLGL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (41, N'BLLL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (42, N'GLRL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (43, N'LLRL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (44, N'BLRL', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (45, N'GLLL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (46, N'GLBL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (47, N'LLGL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (48, N'LLBL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (49, N'BLGL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (50, N'BLLL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (51, N'GLRL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (52, N'LLRL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (53, N'BLRL', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (54, N'ROLE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (55, N'ROLE', N'interest')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (56, N'WROE', N'olb')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (57, N'WROE', N'accrued_interests')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (58, N'WROE', N'accrued_penalties')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (59, N'WROE', N'past_due_days')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (60, N'WROE', N'overdue_principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (61, N'LLPE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (62, N'TEET', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (63, N'LIAE', N'accrued_interest')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (64, N'SVIE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (65, N'SIPE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (66, N'SIAE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (67, N'SVDE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (68, N'SVWE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (69, N'SDTE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (70, N'SCTE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (71, N'SCLE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (72, N'SVRE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (73, N'SVLD', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (74, N'SPDE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (75, N'SPDR', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (76, N'SCIT', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (77, N'SDIT', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (78, N'SRLE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (79, N'SVIE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (80, N'SVDE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (81, N'SVWE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (82, N'SDTE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (83, N'SCTE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (84, N'SMFE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (85, N'SCLE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (86, N'SOFE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (87, N'SVAE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (88, N'SVCE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (89, N'SVRE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (90, N'SVLD', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (91, N'SPDE', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (92, N'SCIT', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (93, N'SDIT', N'fees')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (94, N'LEE0', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (95, N'LEE1', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (96, N'LEE2', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (97, N'LEE3', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (98, N'LEE4', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (99, N'LEE5', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (100, N'LEE6', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (101, N'LEE7', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (102, N'LEE8', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (103, N'LEE9', N'fee')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (104, N'LCIE', N'commission')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (105, N'LCIE', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (106, N'LCIP', N'commission')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (107, N'LCIP', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (108, N'LCIW', N'commission')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (109, N'LCIW', N'principal')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (110, N'SBCS', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (111, N'SUCS', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (112, N'SUCS', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (113, N'CPDE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (114, N'CNDE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (115, N'OPDE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (116, N'ONDE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (117, N'CDAE', N'amount')
GO
INSERT [dbo].[EventAttributes] ([id], [event_type], [name]) VALUES (118, N'ODAE', N'amount')
GO
SET IDENTITY_INSERT [dbo].[EventAttributes] OFF
GO
SET IDENTITY_INSERT [dbo].[EconomicActivities] ON 

GO
INSERT [dbo].[EconomicActivities] ([id], [name], [parent_id], [deleted]) VALUES (1, N'Agriculture', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[EconomicActivities] OFF
GO
SET IDENTITY_INSERT [dbo].[Provinces] ON 

GO
INSERT [dbo].[Provinces] ([id], [name], [deleted]) VALUES (1, N'Paris', 0)
GO
SET IDENTITY_INSERT [dbo].[Provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

GO
INSERT [dbo].[Districts] ([id], [name], [province_id], [deleted]) VALUES (1, N'Paris', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([id], [deleted], [user_name], [user_pass], [role_code], [first_name], [last_name], [mail], [sex], [phone]) VALUES (1, 0, N'admin', N'admin', N'SUPER', N'admin', N'admin', N'Not Set', N'M', NULL)
GO
INSERT [dbo].[Users] ([id], [deleted], [user_name], [user_pass], [role_code], [first_name], [last_name], [mail], [sex], [phone]) VALUES (2, 0, N'testuser', N'testpassword', N'LOF', N'Test', N'User', N'test@test.te', N'F', N'+123456789')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[AdvancedFieldsTypes] ON 

GO
INSERT [dbo].[AdvancedFieldsTypes] ([id], [name]) VALUES (1, N'Boolean')
GO
INSERT [dbo].[AdvancedFieldsTypes] ([id], [name]) VALUES (2, N'Number')
GO
INSERT [dbo].[AdvancedFieldsTypes] ([id], [name]) VALUES (3, N'String')
GO
INSERT [dbo].[AdvancedFieldsTypes] ([id], [name]) VALUES (4, N'Date')
GO
INSERT [dbo].[AdvancedFieldsTypes] ([id], [name]) VALUES (5, N'Collection')
GO
INSERT [dbo].[AdvancedFieldsTypes] ([id], [name]) VALUES (6, N'Client')
GO
SET IDENTITY_INSERT [dbo].[AdvancedFieldsTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[AdvancedFieldsEntities] ON 

GO
INSERT [dbo].[AdvancedFieldsEntities] ([id], [name]) VALUES (1, N'Individual')
GO
INSERT [dbo].[AdvancedFieldsEntities] ([id], [name]) VALUES (2, N'SG')
GO
INSERT [dbo].[AdvancedFieldsEntities] ([id], [name]) VALUES (3, N'NSG')
GO
INSERT [dbo].[AdvancedFieldsEntities] ([id], [name]) VALUES (4, N'Corporate')
GO
INSERT [dbo].[AdvancedFieldsEntities] ([id], [name]) VALUES (5, N'Loan')
GO
INSERT [dbo].[AdvancedFieldsEntities] ([id], [name]) VALUES (6, N'Savings')
GO
SET IDENTITY_INSERT [dbo].[AdvancedFieldsEntities] OFF
GO
SET IDENTITY_INSERT [dbo].[AdvancedFields] ON 

GO
INSERT [dbo].[AdvancedFields] ([id], [entity_id], [type_id], [name], [desc], [is_mandatory], [is_unique]) VALUES (1, 5, 5, N'Type of clients', N'', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[AdvancedFields] OFF
GO
SET IDENTITY_INSERT [dbo].[AdvancedFieldsCollections] ON 

GO
INSERT [dbo].[AdvancedFieldsCollections] ([field_id], [value], [id]) VALUES (1, N'Urban', 1)
GO
INSERT [dbo].[AdvancedFieldsCollections] ([field_id], [value], [id]) VALUES (1, N'Rural', 2)
GO
SET IDENTITY_INSERT [dbo].[AdvancedFieldsCollections] OFF
GO
SET IDENTITY_INSERT [dbo].[SavingProducts] ON 

GO
INSERT [dbo].[SavingProducts] ([id], [deleted], [name], [client_type], [initial_amount_min], [initial_amount_max], [balance_min], [balance_max], [withdraw_min], [withdraw_max], [deposit_min], [deposit_max], [interest_rate], [interest_rate_min], [interest_rate_max], [currency_id], [entry_fees_min], [entry_fees_max], [entry_fees], [product_type], [code], [transfer_min], [transfer_max]) VALUES (1, 0, N'Saving Product', N'-', 0.0000, 100000000.0000, 0.0000, 100000000.0000, 1.0000, 100000000.0000, 1.0000, 100000000.0000, 0, NULL, NULL, 1, NULL, NULL, 0.0000, N'B', N'default', 1.0000, 100000000.0000)
GO
SET IDENTITY_INSERT [dbo].[SavingProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Cycles] ON 

GO
INSERT [dbo].[Cycles] ([id], [name]) VALUES (1, N'Default')
GO
SET IDENTITY_INSERT [dbo].[Cycles] OFF
GO
SET IDENTITY_INSERT [dbo].[InstallmentTypes] ON 

GO
INSERT [dbo].[InstallmentTypes] ([id], [name], [nb_of_days], [nb_of_months]) VALUES (1, N'Monthly', 0, 1)
GO
INSERT [dbo].[InstallmentTypes] ([id], [name], [nb_of_days], [nb_of_months]) VALUES (2, N'Weekly', 7, 0)
GO
INSERT [dbo].[InstallmentTypes] ([id], [name], [nb_of_days], [nb_of_months]) VALUES (3, N'Daily', 1, 0)
GO
INSERT [dbo].[InstallmentTypes] ([id], [name], [nb_of_days], [nb_of_months]) VALUES (4, N'Maturity', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[InstallmentTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 

GO
INSERT [dbo].[Packages] ([id], [deleted], [code], [name], [client_type], [amount], [amount_min], [amount_max], [interest_rate], [interest_rate_min], [interest_rate_max], [installment_type], [grace_period], [grace_period_min], [grace_period_max], [number_of_installments], [number_of_installments_min], [number_of_installments_max], [anticipated_total_repayment_penalties], [anticipated_total_repayment_penalties_min], [anticipated_total_repayment_penalties_max], [exotic_id], [loan_type], [keep_expected_installment], [charge_interest_within_grace_period], [cycle_id], [non_repayment_penalties_based_on_overdue_interest], [non_repayment_penalties_based_on_initial_amount], [non_repayment_penalties_based_on_olb], [non_repayment_penalties_based_on_overdue_principal], [non_repayment_penalties_based_on_overdue_interest_min], [non_repayment_penalties_based_on_initial_amount_min], [non_repayment_penalties_based_on_olb_min], [non_repayment_penalties_based_on_overdue_principal_min], [non_repayment_penalties_based_on_overdue_interest_max], [non_repayment_penalties_based_on_initial_amount_max], [non_repayment_penalties_based_on_olb_max], [non_repayment_penalties_based_on_overdue_principal_max], [fundingLine_id], [currency_id], [rounding_type], [grace_period_of_latefees], [anticipated_partial_repayment_penalties], [anticipated_partial_repayment_penalties_min], [anticipated_partial_repayment_penalties_max], [anticipated_partial_repayment_base], [anticipated_total_repayment_base], [number_of_drawings_loc], [amount_under_loc], [amount_under_loc_min], [amount_under_loc_max], [maturity_loc], [maturity_loc_min], [maturity_loc_max], [activated_loc], [allow_flexible_schedule], [use_guarantor_collateral], [set_separate_guarantor_collateral], [percentage_total_guarantor_collateral], [percentage_separate_guarantor], [percentage_separate_collateral], [use_compulsory_savings], [compulsory_amount], [compulsory_amount_min], [compulsory_amount_max], [insurance_min], [insurance_max], [use_entry_fees_cycles], [interest_scheme], [script_name]) VALUES (1, 0, N'default', N'Loan Product', N'-', NULL, 1000.0000, 1000000.0000, CAST(0.360000000000 AS Numeric(16, 12)), NULL, NULL, 1, 0, NULL, NULL, NULL, 3, 36, 0, NULL, NULL, NULL, 3, 1, 1, NULL, 0.001, 0, 0, 0.001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
SET IDENTITY_INSERT [dbo].[FundingLines] ON 

GO
INSERT [dbo].[FundingLines] ([id], [name], [begin_date], [end_date], [amount], [purpose], [deleted], [currency_id]) VALUES (1, N'DEFAULT_FUNDING_LINE', CAST(0x0000A35800E23083 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), CAST(922337203685477 AS Decimal(18, 0)), N'DEFAULT_FUNDING_LINE', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[FundingLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([id], [code], [deleted], [description]) VALUES (1, N'ADMIN', 0, N'Administrator role')
GO
INSERT [dbo].[Roles] ([id], [code], [deleted], [description]) VALUES (2, N'CASHI', 0, N'Cashier role')
GO
INSERT [dbo].[Roles] ([id], [code], [deleted], [description]) VALUES (3, N'LOF', 0, N'Loan officer role')
GO
INSERT [dbo].[Roles] ([id], [code], [deleted], [description]) VALUES (4, N'SUPER', 0, N'SUPER role')
GO
INSERT [dbo].[Roles] ([id], [code], [deleted], [description]) VALUES (5, N'VISIT', 0, N'Visitor role')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[ActionItems] ON 

GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (1, N'LoanServices', N'SaveLoan')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (2, N'LoanServices', N'Disburse')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (3, N'LoanServices', N'UpdateContractStatus')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (4, N'LoanServices', N'CancelLastEvent')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (5, N'ClientServices', N'SavePerson')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (6, N'LoanServices', N'Repay')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (7, N'LoanServices', N'Reschedule')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (8, N'LoanServices', N'ManualInterestCalculation')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (9, N'LoanServices', N'ManualFeesCalculation')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (10, N'LoanServices', N'ChangeRepaymentType')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (11, N'LoanServices', N'CanUserModifyEntryFees')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (12, N'SavingServices', N'SaveContract')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (13, N'SavingServices', N'CloseAndWithdraw')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (14, N'SavingServices', N'CloseAndTransfer')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (15, N'SavingServices', N'Transfer')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (16, N'SavingServices', N'Withdraw')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (17, N'SavingServices', N'Deposit')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (18, N'SavingServices', N'CanUserMakeBalanceNegative')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (19, N'LoanServices', N'WriteOff')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (20, N'SavingServices', N'SpecialOperation')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (21, N'ExchangeRateServices', N'SaveRate')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (22, N'SavingServices', N'AllowOperationsDuringPendingDeposit')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (23, N'SavingServices', N'AllowSettingSavingsOperationsFeesManually')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (24, N'SavingServices', N'FirstDeposit')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (25, N'ClientServices', N'AddExistingMember')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (26, N'ClientServices', N'RemoveMember')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (27, N'LoanServices', N'PerformBackDateOperations')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (28, N'LoanServices', N'PerformFutureDateOperations')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (29, N'SavingServices', N'PerformBackDateOperations')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (30, N'SavingServices', N'PerformFutureDateOperations')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (31, N'LoanServices', N'AddTranche')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (32, N'LoanServices', N'WaiveFee')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (33, N'ClientServices', N'SaveSolidarityGroup')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (34, N'LoanServices', N'ModifyDisbursementDate')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (35, N'LoanServices', N'ModifyFirstInstalmentDate')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (36, N'ClientServices', N'ModifyBadClient')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (37, N'LoanServices', N'ModifyGuarantorsCollaterals')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (38, N'ClientServices', N'SaveCorporate')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (39, N'ClientServices', N'SaveNonSolidarityGroup')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (40, N'LoanServices', N'ManualScheduleBeforeDisbursement')
GO
INSERT [dbo].[ActionItems] ([id], [class_name], [method_name]) VALUES (41, N'LoanServices', N'ManualScheduleAfterDisbursement')
GO
SET IDENTITY_INSERT [dbo].[ActionItems] OFF
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (1, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (1, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (2, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (2, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (2, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (3, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (3, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (3, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (4, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (19, 1, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (19, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (19, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (19, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (20, 1, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (20, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (20, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (20, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (27, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (27, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (27, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (28, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (28, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (28, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (29, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (29, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (29, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (30, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (30, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (30, 5, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (37, 1, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (37, 2, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (37, 3, 0)
GO
INSERT [dbo].[AllowedRoleActions] ([action_item_id], [role_id], [allowed]) VALUES (37, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (2, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (2, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (2, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (10, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (10, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (10, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (15, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (15, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (15, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (18, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (18, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (18, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (19, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (19, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (19, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (21, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (21, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (21, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (24, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (24, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (24, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (36, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (36, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (36, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (37, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (37, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (37, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (39, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (39, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (39, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (41, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (41, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (41, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (42, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (42, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (42, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (43, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (43, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (43, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (44, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (44, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (44, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (45, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (45, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (45, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (46, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (46, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (46, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (47, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (47, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (47, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (49, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (49, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (49, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (50, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (50, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (50, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (56, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (56, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (56, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (61, 1, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (61, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (61, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (61, 4, 1)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (61, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (62, 1, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (62, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (62, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (62, 4, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (62, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (64, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (64, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (72, 1, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (72, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (72, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (72, 4, 1)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (72, 5, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (74, 1, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (74, 2, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (74, 3, 0)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (74, 4, 1)
GO
INSERT [dbo].[AllowedRoleMenus] ([menu_item_id], [role_id], [allowed]) VALUES (74, 5, 0)
GO
INSERT [dbo].[UserRole] ([role_id], [user_id], [date_role_set]) VALUES (1, 1, NULL)
GO
INSERT [dbo].[UserRole] ([role_id], [user_id], [date_role_set]) VALUES (3, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[FundingLineEvents] ON 

GO
INSERT [dbo].[FundingLineEvents] ([id], [code], [amount], [direction], [fundingline_id], [deleted], [creation_date], [type], [user_id], [contract_event_id]) VALUES (1, N'UNLIMITED', 922337203685477.0000, 1, 1, 0, CAST(0x0000A35800E23083 AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FundingLineEvents] OFF
GO
INSERT [dbo].[UsersBranches] ([user_id], [branch_id]) VALUES (1, 1)
GO
INSERT [dbo].[SavingBookProducts] ([id], [interest_base], [interest_frequency], [calcul_amount_base], [withdraw_fees_type], [flat_withdraw_fees_min], [flat_withdraw_fees_max], [flat_withdraw_fees], [rate_withdraw_fees_min], [rate_withdraw_fees_max], [rate_withdraw_fees], [transfer_fees_type], [flat_transfer_fees_min], [flat_transfer_fees_max], [flat_transfer_fees], [rate_transfer_fees_min], [rate_transfer_fees_max], [rate_transfer_fees], [deposit_fees], [deposit_fees_max], [deposit_fees_min], [close_fees], [close_fees_max], [close_fees_min], [management_fees], [management_fees_max], [management_fees_min], [management_fees_freq], [overdraft_fees], [overdraft_fees_max], [overdraft_fees_min], [agio_fees], [agio_fees_max], [agio_fees_min], [agio_fees_freq], [cheque_deposit_min], [cheque_deposit_max], [cheque_deposit_fees], [cheque_deposit_fees_min], [cheque_deposit_fees_max], [reopen_fees], [reopen_fees_min], [reopen_fees_max], [is_ibt_fee_flat], [ibt_fee_min], [ibt_fee_max], [ibt_fee], [use_term_deposit], [term_deposit_period_min], [term_deposit_period_max], [posting_frequency]) VALUES (1, 10, 10, 0, 1, NULL, NULL, 0.0000, NULL, NULL, NULL, 1, NULL, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, 1, 0.0000, NULL, NULL, 0, NULL, NULL, 3, 1.0000, 100000000.0000, 0.0000, NULL, NULL, 0.0000, NULL, NULL, 1, NULL, NULL, 0.0000, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[AmountCycles] ([cycle_id], [number], [amount_min], [amount_max]) VALUES (1, 1, 100.0000, 1000.0000)
GO
INSERT [dbo].[AmountCycles] ([cycle_id], [number], [amount_min], [amount_max]) VALUES (1, 2, 100.0000, 10000.0000)
GO
INSERT [dbo].[AmountCycles] ([cycle_id], [number], [amount_min], [amount_max]) VALUES (1, 3, 100.0000, 100000.0000)
GO
INSERT [dbo].[AmountCycles] ([cycle_id], [number], [amount_min], [amount_max]) VALUES (1, 4, 100.0000, 1000000.0000)
GO
INSERT [dbo].[AmountCycles] ([cycle_id], [number], [amount_min], [amount_max]) VALUES (1, 5, 100.0000, 10000000.0000)
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'client_name', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'amount', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'effect_date', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'phone_num', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'address', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'loan_officer', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'contract_id', N'0')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'show_only_late_loans', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'contract_status', N'1')
GO
INSERT [dbo].[AlertSettings] ([parameter], [value]) VALUES (N'loan_status', N'1')
GO
SET IDENTITY_INSERT [dbo].[ClientTypes] ON 

GO
INSERT [dbo].[ClientTypes] ([id], [type_name]) VALUES (1, N'All')
GO
INSERT [dbo].[ClientTypes] ([id], [type_name]) VALUES (2, N'Group')
GO
INSERT [dbo].[ClientTypes] ([id], [type_name]) VALUES (3, N'Individual')
GO
INSERT [dbo].[ClientTypes] ([id], [type_name]) VALUES (4, N'Corporate')
GO
INSERT [dbo].[ClientTypes] ([id], [type_name]) VALUES (5, N'Village')
GO
SET IDENTITY_INSERT [dbo].[ClientTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[CycleObjects] ON 

GO
INSERT [dbo].[CycleObjects] ([id], [name]) VALUES (1, N'Loan amount')
GO
INSERT [dbo].[CycleObjects] ([id], [name]) VALUES (2, N'Interest rate')
GO
INSERT [dbo].[CycleObjects] ([id], [name]) VALUES (3, N'Number of installments')
GO
SET IDENTITY_INSERT [dbo].[CycleObjects] OFF
GO
SET IDENTITY_INSERT [dbo].[FiscalYear] ON 

GO
INSERT [dbo].[FiscalYear] ([id], [name], [open_date], [close_date]) VALUES (1, N'New Year', CAST(0x00008EAC00000000 AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[FiscalYear] OFF
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'ACCOUNTING_PROCESS', N'1')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'ALLOWS_MULTIPLE_GROUPS', N'1')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'ALLOWS_MULTIPLE_LOANS', N'1')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'AUTOMATIC_ID', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'BAD_LOAN_DAYS', N'180')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'CALCULATION_LATE_FEES_DURING_PUBLIC_HOLIDAYS', N'1')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'CEASE_LAIE_DAYS', N'1000')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'CITY_MANDATORY', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'CLIENT_AGE_MAX', N'100')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'CLIENT_AGE_MIN', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'CONTRACT_CODE_TEMPLATE', N'BC/YY/PC-LC/ID')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'COUNTRY', N'Kyrgyzstan')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'DONOT_SKIP_WEEKENDS_IN_INSTALLMENTS_DATE', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'ENFORCE_ID_PATTERN', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'GROUP_MAX_MEMBERS', N'20')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'GROUP_MIN_MEMBERS', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'ID_PATTERN', N'[A-Z]{2}[0-9]{7}')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'INCREMENTAL_DURING_DAYOFFS', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'INTEREST_RATE_DECIMAL_PLACES', N'2')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'INTERESTS_ALSO_CREDITED_IN_FL', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'LATE_DAYS_AFTER_ACCRUAL_CEASES', NULL)
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'MAX_GUARANTOR_AMOUNT', N'2000000000')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'MAX_LOANS_COVERED', N'10')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'MAX_NUMBER_INSTALLMENT', N'100')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'MFI_NAME', NULL)
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'MODIFY_ENTRY_FEE', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'NSG_MAX_MEMBERS', N'20')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'NSG_MIN_MEMBERS', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'NUMBER_DECIMAL_SEPARATOR', N',')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'NUMBER_GROUP_SEPARATOR', N' ')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'OLB_BEFORE_REPAYMENT', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'PAY_FIRST_INSTALLMENT_REAL_VALUE', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'PENDING_SAVINGS_MODE', N'NONE')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'REPORT_TIMEOUT', N'300')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'SAVINGS_CODE_TEMPLATE', N'IC/BC/CS/ID')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'STOP_WRITEOFF_PENALTY', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'USE_DAILY_ACCRUAL_OF_PENALTY', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'USE_MANDATORY_SAVING_ACCOUNT', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'VAT_RATE', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'WEEK_END_DAY1', N'0')
GO
INSERT [dbo].[GeneralParameters] ([key], [value]) VALUES (N'WEEK_END_DAY2', N'6')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (0, 0, N'Performing', NULL)
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (1, 30, N'PAR 1-30', N'#EAC81C')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (31, 60, N'PAR 31-60', N'#EAA01C')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (61, 90, N'PAR 61-90', N'#EA781C')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (91, 180, N'PAR 91-180', N'#EA501C')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (181, 365, N'PAR 181-365', N'#EA281C')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (365, 1000000, N'PAR >365', N'#EA001C')
GO
INSERT [dbo].[LateDaysRange] ([Min], [Max], [Label], [Color]) VALUES (0, 1000000, N'Total', NULL)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (1, 1, 100)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (2, 101, 500)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (3, 501, 1000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (4, 1001, 2000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (5, 2001, 5000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (6, 5001, 10000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (7, 10001, 20000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (8, 20001, 50000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (9, 50001, 100000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (10, 100001, 200001)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (11, 200001, 500000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (12, 500001, 600000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (13, 600001, 700000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (14, 700001, 800000)
GO
INSERT [dbo].[LoanScale] ([id], [ScaleMin], [ScaleMax]) VALUES (15, 800001, 1000000)
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (1, N'mnuClients', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (2, N'mnuNewClient', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (3, N'mnuNewPerson', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (4, N'mnuNewGroup', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (5, N'mnuNewVillage', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (6, N'newCorporateToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (7, N'mnuSearchClient', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (8, N'mnuContracts', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (9, N'mnuSearchContract', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (10, N'reasignToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (11, N'mnuAccounting', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (12, N'mnuChartOfAccounts', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (13, N'accountingRulesToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (14, N'trialBalanceToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (15, N'toolStripMenuItemAccountView', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (16, N'manualEntriesToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (17, N'standardToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (18, N'menuItemExportTransaction', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (22, N'exportImportCustomizableToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (23, N'mnuConfiguration', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (24, N'menuItemAddUser', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (25, N'rolesToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (26, N'tellersToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (27, N'branchesToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (28, N'changePasswordToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (29, N'languagesToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (30, N'frenchToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (31, N'englishToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (32, N'russianToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (33, N'kyrgyzToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (34, N'spanishToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (35, N'portugueseToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (36, N'mnuPackages', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (37, N'savingProductsToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (38, N'menuItemCollateralProducts', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (39, N'guaranteeProductsToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (40, N'toolStripMenuItemFundingLines', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (41, N'mnuDomainOfApplication', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (42, N'menuItemLocations', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (43, N'toolStripMenuItemInstallmentTypes', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (44, N'miContractCode', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (45, N'menuItemExchangeRate', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (46, N'currenciesToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (47, N'menuItemApplicationDate', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (48, N'menuItemSetting', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (49, N'menuItemAdvancedSettings', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (50, N'customizableFieldsToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (51, N'customizableExportImportToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (52, N'createCustomizableExportFileToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (53, N'createCustomizableImportFileToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (54, N'openExistingCustomizableFileToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (55, N'mView', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (56, N'miAuditTrail', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (57, N'miReports', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (58, N'mnuDatamanagement', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (59, N'menuItemDatabaseControlPanel', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (60, N'menuItemDatabaseMaintenance', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (62, N'closeTellerToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (63, N'mnuWindow', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (64, N'mnuHelp', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (65, N'menuItemAboutOctopus', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (66, N'octopusForumToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (67, N'questionnaireToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (68, N'userGuideToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (69, N'wIKIHelpToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (70, N'advancedCustomizableFieldsToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (71, N'mnuCreditScoringQuestions', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (72, N'mnuExtensionManager', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (73, N'mnuNewClosure', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (61, N'tellerManagementToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (74, N'tellerOperationsToolStripMenuItem', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (75, N'mnuSettings', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (76, N'mnuSecurity', 0)
GO
INSERT [dbo].[MenuItems] ([id], [component_name], [type]) VALUES (77, N'mnuProducts', 0)
GO
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[PackagesClientTypes] ON 

GO
INSERT [dbo].[PackagesClientTypes] ([id], [client_type_id], [package_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[PackagesClientTypes] ([id], [client_type_id], [package_id]) VALUES (2, 2, 1)
GO
INSERT [dbo].[PackagesClientTypes] ([id], [client_type_id], [package_id]) VALUES (3, 3, 1)
GO
INSERT [dbo].[PackagesClientTypes] ([id], [client_type_id], [package_id]) VALUES (4, 4, 1)
GO
INSERT [dbo].[PackagesClientTypes] ([id], [client_type_id], [package_id]) VALUES (5, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[PackagesClientTypes] OFF
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (1, 0, 0, 0.02, 0.02, 0.02)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (2, 1, 30, 0.1, 0.1, 0.1)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (3, 31, 60, 0.25, 0.25, 0.25)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (4, 61, 90, 0.5, 0.5, 0.5)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (5, 91, 180, 0.75, 0.75, 0.75)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (6, 181, 365, 1, 1, 1)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (7, 366, 99999, 1, 1, 1)
GO
INSERT [dbo].[ProvisioningRules] ([id], [number_of_days_min], [number_of_days_max], [provisioning_value], [provisioning_interest], [provisioning_penalty]) VALUES (8, -1, -1, 0.1, 0.1, 0.1)
GO
SET IDENTITY_INSERT [dbo].[SavingProductsClientTypes] ON 

GO
INSERT [dbo].[SavingProductsClientTypes] ([id], [saving_product_id], [client_type_id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[SavingProductsClientTypes] ([id], [saving_product_id], [client_type_id]) VALUES (2, 1, 2)
GO
INSERT [dbo].[SavingProductsClientTypes] ([id], [saving_product_id], [client_type_id]) VALUES (3, 1, 3)
GO
INSERT [dbo].[SavingProductsClientTypes] ([id], [saving_product_id], [client_type_id]) VALUES (4, 1, 4)
GO
INSERT [dbo].[SavingProductsClientTypes] ([id], [saving_product_id], [client_type_id]) VALUES (5, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[SavingProductsClientTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (1, N'Pending')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (2, N'Validated')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (3, N'Refused')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (4, N'Abandoned')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (5, N'Active')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (6, N'Closed')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (7, N'Written-off')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (8, N'Postponed')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (9, N'Deleted')
GO
INSERT [dbo].[Statuses] ([id], [status_name]) VALUES (10, N'Non-accrual')
GO
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
INSERT [dbo].[TechnicalParameters] ([name], [value]) VALUES (N'BuildNumber', N'0')
GO
INSERT [dbo].[TechnicalParameters] ([name], [value]) VALUES (N'GUID', N'e14352ba-5cb0-4642-a0c2-e020c919731e')
GO
INSERT [dbo].[TechnicalParameters] ([name], [value]) VALUES (N'last_id', N'0')
GO
INSERT [dbo].[TechnicalParameters] ([name], [value]) VALUES (N'version', N'v14.8.0.0')
GO
SET IDENTITY_INSERT [dbo].[TraceUserLogs] ON 

GO
INSERT [dbo].[TraceUserLogs] ([id], [event_code], [event_date], [user_id], [event_description]) VALUES (1, N'ULIE', CAST(0x0000A35800E6CA9F AS DateTime), 1, N'User connected')
GO
INSERT [dbo].[TraceUserLogs] ([id], [event_code], [event_date], [user_id], [event_description]) VALUES (2, N'ULOE', CAST(0x0000A35800E6D2F1 AS DateTime), 1, N'User disconnected')
GO
INSERT [dbo].[TraceUserLogs] ([id], [event_code], [event_date], [user_id], [event_description]) VALUES (3, N'ULIE', CAST(0x0000A36700BA97B7 AS DateTime), 1, N'User connected')
GO
INSERT [dbo].[TraceUserLogs] ([id], [event_code], [event_date], [user_id], [event_description]) VALUES (4, N'ULOE', CAST(0x0000A36700BBB393 AS DateTime), 1, N'User disconnected')
GO
INSERT [dbo].[TraceUserLogs] ([id], [event_code], [event_date], [user_id], [event_description]) VALUES (5, N'ULIE', CAST(0x0000A36700C0238D AS DateTime), 1, N'User connected')
GO
INSERT [dbo].[TraceUserLogs] ([id], [event_code], [event_date], [user_id], [event_description]) VALUES (6, N'ULOE', CAST(0x0000A36800856C58 AS DateTime), 1, N'User disconnected')
GO
SET IDENTITY_INSERT [dbo].[TraceUserLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[WriteOffOptions] ON 

GO
INSERT [dbo].[WriteOffOptions] ([Id], [Name]) VALUES (1, N'Standard')
GO
SET IDENTITY_INSERT [dbo].[WriteOffOptions] OFF
GO



ALTER TABLE [dbo].[OverdueEvents]
    ADD CONSTRAINT [FK_OverdueEvents_ContractEvents] FOREIGN KEY ([id]) REFERENCES [dbo].[ContractEvents] ([id])
ALTER TABLE [dbo].[FollowUp]
    ADD CONSTRAINT [FK_FollowUp_Projects] FOREIGN KEY ([project_id]) REFERENCES [dbo].[Projects] ([id])
ALTER TABLE [dbo].[SavingDepositContracts]
    ADD CONSTRAINT [FK_SavingDepositContract_SavingContracts] FOREIGN KEY ([id]) REFERENCES [dbo].[SavingContracts] ([id])
ALTER TABLE [dbo].[VillagesPersons]
    ADD CONSTRAINT [FK_VillagesPersons_Villages] FOREIGN KEY ([village_id]) REFERENCES [dbo].[Villages] ([id])
ALTER TABLE [dbo].[AllowedRoleMenus]
    ADD CONSTRAINT [FK_AllowedRoleMenus_Roles] FOREIGN KEY ([role_id]) REFERENCES [dbo].[Roles] ([id])
ALTER TABLE [dbo].[TermDepositProducts]
    ADD CONSTRAINT [FK_TermDepositProducts_InstallmentTypes] FOREIGN KEY ([installment_types_id]) REFERENCES [dbo].[InstallmentTypes] ([id])
ALTER TABLE [dbo].[TermDepositProducts]
    ADD CONSTRAINT [FK_TermDepositProducts_SavingProducts] FOREIGN KEY ([id]) REFERENCES [dbo].[SavingProducts] ([id])
ALTER TABLE [dbo].[EventAttributes]
    WITH NOCHECK ADD CONSTRAINT [FK_EventAttributes_EventTypes] FOREIGN KEY ([event_type]) REFERENCES [dbo].[EventTypes] ([event_type]) NOT FOR REPLICATION
ALTER TABLE [dbo].[SavingBookContracts]
    ADD CONSTRAINT [FK_SavingBookContract_SavingContracts] FOREIGN KEY ([id]) REFERENCES [dbo].[SavingContracts] ([id])
ALTER TABLE [dbo].[WriteOffEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_WriteOffEvents_ContractEvents] FOREIGN KEY ([id]) REFERENCES [dbo].[ContractEvents] ([id]);


GO
ALTER TABLE [dbo].[WriteOffEvents] NOCHECK CONSTRAINT [FK_WriteOffEvents_ContractEvents]
ALTER TABLE [dbo].[FundingLineAccountingRules]
    ADD CONSTRAINT [FK_FundingLineAccountingRules_AccountingRules] FOREIGN KEY ([id]) REFERENCES [dbo].[AccountingRules] ([id])
ALTER TABLE [dbo].[FundingLineAccountingRules]
    ADD CONSTRAINT [FK_FundingLineAccountingRules_FundingLine] FOREIGN KEY ([funding_line_id]) REFERENCES [dbo].[FundingLines] ([id])
ALTER TABLE [dbo].[VillagesAttendance]
    ADD CONSTRAINT [FK_VillagesAttendance_Villages] FOREIGN KEY ([village_id]) REFERENCES [dbo].[Villages] ([id])
ALTER TABLE [dbo].[ReschedulingOfALoanEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents] FOREIGN KEY ([id]) REFERENCES [dbo].[ContractEvents] ([id]);


GO
ALTER TABLE [dbo].[ReschedulingOfALoanEvents] NOCHECK CONSTRAINT [FK_ReschedulingOfALoanEvents_ContractEvents]
ALTER TABLE [dbo].[ManualAccountingMovements]
    ADD CONSTRAINT [FK_ManualAccountingMovements_ChartOfAccounts] FOREIGN KEY ([debit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[ManualAccountingMovements]
    ADD CONSTRAINT [FK_ManualAccountingMovements_ChartOfAccounts1] FOREIGN KEY ([credit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[ProvisionEvents]
    ADD CONSTRAINT [FK_ProvisionEvents_ContractEvents] FOREIGN KEY ([id]) REFERENCES [dbo].[ContractEvents] ([id])
ALTER TABLE [dbo].[CollateralPropertyValues]
    ADD CONSTRAINT [FK_CollateralPropertyValues_CollateralProperties] FOREIGN KEY ([property_id]) REFERENCES [dbo].[CollateralProperties] ([id])
ALTER TABLE [dbo].[CollateralPropertyValues]
    ADD CONSTRAINT [FK_CollateralPropertyValues_CollateralsLinkContracts] FOREIGN KEY ([contract_collateral_id]) REFERENCES [dbo].[CollateralsLinkContracts] ([id])
ALTER TABLE [dbo].[Villages]
    ADD CONSTRAINT [FK_Villages_Users] FOREIGN KEY ([loan_officer]) REFERENCES [dbo].[Users] ([id])
ALTER TABLE [dbo].[Installments]
    WITH NOCHECK ADD CONSTRAINT [FK_Installments_Credit] FOREIGN KEY ([contract_id]) REFERENCES [dbo].[Credit] ([id]);


GO
ALTER TABLE [dbo].[Installments] NOCHECK CONSTRAINT [FK_Installments_Credit]
ALTER TABLE [dbo].[CollateralsLinkContracts]
    ADD CONSTRAINT [FK_CollateralsLinkContracts_Contracts] FOREIGN KEY ([contract_id]) REFERENCES [dbo].[Contracts] ([id])
ALTER TABLE [dbo].[Groups]
    WITH NOCHECK ADD CONSTRAINT [FK_Groups_Tiers] FOREIGN KEY ([id]) REFERENCES [dbo].[Tiers] ([id]);


GO
ALTER TABLE [dbo].[Groups] NOCHECK CONSTRAINT [FK_Groups_Tiers]
ALTER TABLE [dbo].[LoanAccountingMovements]
    ADD CONSTRAINT [FK_LoanAccountingMovements_ChartOfAccounts] FOREIGN KEY ([debit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[LoanAccountingMovements]
    ADD CONSTRAINT [FK_LoanAccountingMovements_ChartOfAccounts1] FOREIGN KEY ([credit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[Contracts]
    ADD CONSTRAINT [FK_Contracts_EconomicActivities] FOREIGN KEY ([activity_id]) REFERENCES [dbo].[EconomicActivities] ([id])
ALTER TABLE [dbo].[Contracts]
    ADD CONSTRAINT [FK_Contracts_Projects] FOREIGN KEY ([project_id]) REFERENCES [dbo].[Projects] ([id])
ALTER TABLE [dbo].[Contracts]
    ADD CONSTRAINT [FK_Contracts_Villages] FOREIGN KEY ([nsg_id]) REFERENCES [dbo].[Villages] ([id])
ALTER TABLE [dbo].[CollateralProperties]
    ADD CONSTRAINT [FK_CollateralProperties_CollateralProducts] FOREIGN KEY ([product_id]) REFERENCES [dbo].[CollateralProducts] ([id])
ALTER TABLE [dbo].[CollateralProperties]
    ADD CONSTRAINT [FK_CollateralProperties_CollateralPropertyTypes] FOREIGN KEY ([type_id]) REFERENCES [dbo].[CollateralPropertyTypes] ([id])
ALTER TABLE [dbo].[ExoticInstallments]
    WITH NOCHECK ADD CONSTRAINT [FK_ExoticInstallments_Exotics] FOREIGN KEY ([exotic_id]) REFERENCES [dbo].[Exotics] ([id])
ALTER TABLE [dbo].[CreditEntryFees]
    ADD CONSTRAINT [FK_CreditEntryFees_Credit] FOREIGN KEY ([credit_id]) REFERENCES [dbo].[Credit] ([id])
ALTER TABLE [dbo].[Credit]
    WITH NOCHECK ADD CONSTRAINT [FK_Credit_Contracts] FOREIGN KEY ([id]) REFERENCES [dbo].[Contracts] ([id])
ALTER TABLE [dbo].[Credit]
    WITH NOCHECK ADD CONSTRAINT [FK_Credit_InstallmentTypes] FOREIGN KEY ([installment_type]) REFERENCES [dbo].[InstallmentTypes] ([id])
ALTER TABLE [dbo].[Credit]
    WITH NOCHECK ADD CONSTRAINT [FK_Credit_Packages] FOREIGN KEY ([package_id]) REFERENCES [dbo].[Packages] ([id])
ALTER TABLE [dbo].[Credit]
    WITH NOCHECK ADD CONSTRAINT [FK_Credit_Temp_FundingLines] FOREIGN KEY ([fundingLine_id]) REFERENCES [dbo].[FundingLines] ([id]) NOT FOR REPLICATION
ALTER TABLE [dbo].[Credit]
    WITH NOCHECK ADD CONSTRAINT [FK_Credit_Users] FOREIGN KEY ([loanofficer_id]) REFERENCES [dbo].[Users] ([id]);


GO
ALTER TABLE [dbo].[Credit] NOCHECK CONSTRAINT [FK_Credit_Users]
ALTER TABLE [dbo].[PersonGroupBelonging]
    WITH NOCHECK ADD CONSTRAINT [FK_PersonGroupBelonging_Persons1] FOREIGN KEY ([person_id]) REFERENCES [dbo].[Persons] ([id])
ALTER TABLE [dbo].[PersonGroupBelonging]
    WITH NOCHECK ADD CONSTRAINT [FK_PersonGroupCorrespondance_Groups] FOREIGN KEY ([group_id]) REFERENCES [dbo].[Groups] ([id])
ALTER TABLE [dbo].[CorporatePersonBelonging]
    ADD CONSTRAINT [FK_CorporatePersonBelonging_Corporates] FOREIGN KEY ([corporate_id]) REFERENCES [dbo].[Corporates] ([id])
ALTER TABLE [dbo].[CorporatePersonBelonging]
    ADD CONSTRAINT [FK_CorporatePersonBelonging_Persons] FOREIGN KEY ([person_id]) REFERENCES [dbo].[Persons] ([id])
ALTER TABLE [dbo].[AdvancedFieldsValues]
    ADD CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFields] FOREIGN KEY ([field_id]) REFERENCES [dbo].[AdvancedFields] ([id])
ALTER TABLE [dbo].[AdvancedFieldsValues]
    ADD CONSTRAINT [FK_AdvancedFieldsValues_AdvancedFieldsLinkEntities] FOREIGN KEY ([entity_field_id]) REFERENCES [dbo].[AdvancedFieldsLinkEntities] ([id])
ALTER TABLE [dbo].[AdvancedFields]
    ADD CONSTRAINT [FK_AdvancedFields_AdvancedFieldsEntities] FOREIGN KEY ([entity_id]) REFERENCES [dbo].[AdvancedFieldsEntities] ([id])
ALTER TABLE [dbo].[AdvancedFields]
    ADD CONSTRAINT [FK_AdvancedFields_AdvancedFieldsTypes] FOREIGN KEY ([type_id]) REFERENCES [dbo].[AdvancedFieldsTypes] ([id])
ALTER TABLE [dbo].[AllowedRoleActions]
    ADD CONSTRAINT [FK_AllowedRoleActions_ActionItems] FOREIGN KEY ([action_item_id]) REFERENCES [dbo].[ActionItems] ([id])
ALTER TABLE [dbo].[AllowedRoleActions]
    ADD CONSTRAINT [FK_AllowedRoleActions_AllowedRoleActions] FOREIGN KEY ([action_item_id], [role_id]) REFERENCES [dbo].[AllowedRoleActions] ([action_item_id], [role_id])
ALTER TABLE [dbo].[AllowedRoleActions]
    ADD CONSTRAINT [FK_AllowedRoleActions_Roles] FOREIGN KEY ([role_id]) REFERENCES [dbo].[Roles] ([id])
ALTER TABLE [dbo].[TrancheEvents]
    ADD CONSTRAINT [FK_TrancheEvents_ContractEvents] FOREIGN KEY ([id]) REFERENCES [dbo].[ContractEvents] ([id])
ALTER TABLE [dbo].[TellerEvents]
    ADD CONSTRAINT [FK_TellerEvents_Tellers] FOREIGN KEY ([teller_id]) REFERENCES [dbo].[Tellers] ([id])
ALTER TABLE [dbo].[LoansLinkSavingsBook]
    ADD CONSTRAINT [FK_LoansLinkSavingsBook_Contracts] FOREIGN KEY ([loan_id]) REFERENCES [dbo].[Contracts] ([id])
ALTER TABLE [dbo].[LoansLinkSavingsBook]
    ADD CONSTRAINT [FK_LoansLinkSavingsBook_SavingContracts] FOREIGN KEY ([savings_id]) REFERENCES [dbo].[SavingContracts] ([id])
ALTER TABLE [dbo].[EntryFees]
    ADD CONSTRAINT [FK_EntryFees_Packages] FOREIGN KEY ([id_product]) REFERENCES [dbo].[Packages] ([id])
ALTER TABLE [dbo].[SavingBookProducts]
    ADD CONSTRAINT [FK_SavingBookProducts_SavingProducts] FOREIGN KEY ([id]) REFERENCES [dbo].[SavingProducts] ([id])
ALTER TABLE [dbo].[SavingProducts]
    WITH NOCHECK ADD CONSTRAINT [FK_SavingProducts_Currencies] FOREIGN KEY ([currency_id]) REFERENCES [dbo].[Currencies] ([id])
ALTER TABLE [dbo].[City]
    ADD CONSTRAINT [FK_City_Districts] FOREIGN KEY ([district_id]) REFERENCES [dbo].[Districts] ([id])
ALTER TABLE [dbo].[StandardBookings]
    ADD CONSTRAINT [FK_StandardBookings_ChartOfAccounts] FOREIGN KEY ([debit_account_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[StandardBookings]
    ADD CONSTRAINT [FK_StandardBookings_ChartOfAccounts1] FOREIGN KEY ([credit_account_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[AmountCycles]
    ADD CONSTRAINT [FK_AmountCycles_Cycles] FOREIGN KEY ([cycle_id]) REFERENCES [dbo].[Cycles] ([id])
ALTER TABLE [dbo].[Districts]
    WITH NOCHECK ADD CONSTRAINT [FK_Districts_Provinces] FOREIGN KEY ([province_id]) REFERENCES [dbo].[Provinces] ([id])
ALTER TABLE [dbo].[SavingsAccountingMovements]
    ADD CONSTRAINT [FK_SavingsAccountingMovements_ChartOfAccounts] FOREIGN KEY ([debit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[SavingsAccountingMovements]
    ADD CONSTRAINT [FK_SavingsAccountingMovements_ChartOfAccounts1] FOREIGN KEY ([credit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[ChartOfAccounts]
    ADD CONSTRAINT [FK_ChartOfAccounts_AccountsCategory] FOREIGN KEY ([account_category_id]) REFERENCES [dbo].[AccountsCategory] ([id])
ALTER TABLE [dbo].[ContractAccountingRules]
    ADD CONSTRAINT [FK_ContractAccountingRules_AccountingRules] FOREIGN KEY ([id]) REFERENCES [dbo].[AccountingRules] ([id])
ALTER TABLE [dbo].[ContractAccountingRules]
    ADD CONSTRAINT [FK_ContractAccountingRules_DomainOfApplications] FOREIGN KEY ([activity_id]) REFERENCES [dbo].[EconomicActivities] ([id])
ALTER TABLE [dbo].[ContractAccountingRules]
    ADD CONSTRAINT [FK_ContractAccountingRules_Packages] FOREIGN KEY ([loan_product_id]) REFERENCES [dbo].[Packages] ([id])
ALTER TABLE [dbo].[ContractAccountingRules]
    ADD CONSTRAINT [FK_ContractAccountingRules_SavingProducts] FOREIGN KEY ([savings_product_id]) REFERENCES [dbo].[SavingProducts] ([id])
ALTER TABLE [dbo].[AccountingRules]
    ADD CONSTRAINT [FK_AccountingRules_ChartOfAccounts] FOREIGN KEY ([debit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[AccountingRules]
    ADD CONSTRAINT [FK_AccountingRules_ChartOfAccounts1] FOREIGN KEY ([credit_account_number_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[AccountingRules]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountingRules_EventAttributes] FOREIGN KEY ([event_attribute_id]) REFERENCES [dbo].[EventAttributes] ([id]) NOT FOR REPLICATION
ALTER TABLE [dbo].[AccountingRules]
    WITH NOCHECK ADD CONSTRAINT [FK_AccountingRules_EventTypes] FOREIGN KEY ([event_type]) REFERENCES [dbo].[EventTypes] ([event_type]) NOT FOR REPLICATION
ALTER TABLE [dbo].[SavingEvents]
    ADD CONSTRAINT [FK_SavingEvents_SavingContracts] FOREIGN KEY ([contract_id]) REFERENCES [dbo].[SavingContracts] ([id])
ALTER TABLE [dbo].[SavingEvents]
    ADD CONSTRAINT [FK_SavingEvents_Tellers] FOREIGN KEY ([teller_id]) REFERENCES [dbo].[Tellers] ([id])
ALTER TABLE [dbo].[SavingEvents]
    ADD CONSTRAINT [FK_SavingEvents_Users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id])
ALTER TABLE [dbo].[Corporates]
    ADD CONSTRAINT [FK_Corporates_DomainOfApplications] FOREIGN KEY ([activity_id]) REFERENCES [dbo].[EconomicActivities] ([id])
ALTER TABLE [dbo].[Packages]
    WITH NOCHECK ADD CONSTRAINT [FK_Packages_Currencies] FOREIGN KEY ([currency_id]) REFERENCES [dbo].[Currencies] ([id])
ALTER TABLE [dbo].[Packages]
    WITH NOCHECK ADD CONSTRAINT [FK_Packages_Cycles] FOREIGN KEY ([cycle_id]) REFERENCES [dbo].[Cycles] ([id]);


GO
ALTER TABLE [dbo].[Packages] NOCHECK CONSTRAINT [FK_Packages_Cycles]
ALTER TABLE [dbo].[Packages]
    WITH NOCHECK ADD CONSTRAINT [FK_Packages_Exotics] FOREIGN KEY ([exotic_id]) REFERENCES [dbo].[Exotics] ([id]);


GO
ALTER TABLE [dbo].[Packages] NOCHECK CONSTRAINT [FK_Packages_Exotics]
ALTER TABLE [dbo].[Packages]
    WITH NOCHECK ADD CONSTRAINT [FK_Packages_InstallmentTypes] FOREIGN KEY ([installment_type]) REFERENCES [dbo].[InstallmentTypes] ([id]);


GO
ALTER TABLE [dbo].[Packages] NOCHECK CONSTRAINT [FK_Packages_InstallmentTypes]
ALTER TABLE [dbo].[Projects]
    ADD CONSTRAINT [FK_Projects_Tiers] FOREIGN KEY ([tiers_id]) REFERENCES [dbo].[Tiers] ([id])
ALTER TABLE [dbo].[SavingContracts]
    ADD CONSTRAINT [FK_SavingContracts_Tiers] FOREIGN KEY ([tiers_id]) REFERENCES [dbo].[Tiers] ([id])
ALTER TABLE [dbo].[SavingContracts]
    ADD CONSTRAINT [FK_SavingContracts_Users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id])
ALTER TABLE [dbo].[SavingContracts]
    ADD CONSTRAINT [FK_Savings_SavingProducts] FOREIGN KEY ([product_id]) REFERENCES [dbo].[SavingProducts] ([id])
ALTER TABLE [dbo].[Persons]
    ADD CONSTRAINT [FK_Persons_Banks] FOREIGN KEY ([personalBank_id]) REFERENCES [dbo].[Banks] ([id])
ALTER TABLE [dbo].[Persons]
    ADD CONSTRAINT [FK_Persons_Banks1] FOREIGN KEY ([businessBank_id]) REFERENCES [dbo].[Banks] ([id])
ALTER TABLE [dbo].[Persons]
    WITH NOCHECK ADD CONSTRAINT [FK_Persons_DomainOfApplications] FOREIGN KEY ([activity_id]) REFERENCES [dbo].[EconomicActivities] ([id])
ALTER TABLE [dbo].[Persons]
    WITH NOCHECK ADD CONSTRAINT [FK_Persons_Tiers] FOREIGN KEY ([id]) REFERENCES [dbo].[Tiers] ([id]);


GO
ALTER TABLE [dbo].[Persons] NOCHECK CONSTRAINT [FK_Persons_Tiers]
ALTER TABLE [dbo].[EconomicActivities]
    WITH NOCHECK ADD CONSTRAINT [FK_DomainOfApplications_DomainOfApplications] FOREIGN KEY ([parent_id]) REFERENCES [dbo].[EconomicActivities] ([id])
ALTER TABLE [dbo].[FundingLineEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_FundingLineEvents_FundingLines] FOREIGN KEY ([fundingline_id]) REFERENCES [dbo].[FundingLines] ([id]) NOT FOR REPLICATION
ALTER TABLE [dbo].[FundingLines]
    WITH NOCHECK ADD CONSTRAINT [FK_FundingLines_Currencies] FOREIGN KEY ([currency_id]) REFERENCES [dbo].[Currencies] ([id])
ALTER TABLE [dbo].[ContractEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_ContractEvents_Contracts] FOREIGN KEY ([contract_id]) REFERENCES [dbo].[Contracts] ([id])
ALTER TABLE [dbo].[ContractEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents] FOREIGN KEY ([id]) REFERENCES [dbo].[LoanInterestAccruingEvents] ([id]) NOT FOR REPLICATION;


GO
ALTER TABLE [dbo].[ContractEvents] NOCHECK CONSTRAINT [FK_ContractEvents_LoanInterestAccruingEvents]
ALTER TABLE [dbo].[ContractEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_ContractEvents_Tellers] FOREIGN KEY ([teller_id]) REFERENCES [dbo].[Tellers] ([id])
ALTER TABLE [dbo].[ContractEvents]
    WITH NOCHECK ADD CONSTRAINT [FK_ContractEvents_Users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id])
ALTER TABLE [dbo].[Tellers]
    ADD CONSTRAINT [FK_Tellers_Branches] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[Branches] ([id])
ALTER TABLE [dbo].[Tellers]
    ADD CONSTRAINT [FK_Tellers_ChartOfAccounts] FOREIGN KEY ([account_id]) REFERENCES [dbo].[ChartOfAccounts] ([id])
ALTER TABLE [dbo].[Tellers]
    ADD CONSTRAINT [FK_Tellers_Currencies] FOREIGN KEY ([currency_id]) REFERENCES [dbo].[Currencies] ([id])
ALTER TABLE [dbo].[Tiers]
    ADD CONSTRAINT [FK_Tiers_Branches] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[Branches] ([id])
ALTER TABLE [dbo].[Tiers]
    WITH NOCHECK ADD CONSTRAINT [FK_Tiers_Corporates] FOREIGN KEY ([id]) REFERENCES [dbo].[Corporates] ([id]);


GO
ALTER TABLE [dbo].[Tiers] NOCHECK CONSTRAINT [FK_Tiers_Corporates]
ALTER TABLE [dbo].[Tiers]
    WITH NOCHECK ADD CONSTRAINT [FK_Tiers_Districts] FOREIGN KEY ([district_id]) REFERENCES [dbo].[Districts] ([id])
ALTER TABLE [dbo].[Tiers]
    WITH NOCHECK ADD CONSTRAINT [FK_Tiers_Districts1] FOREIGN KEY ([secondary_district_id]) REFERENCES [dbo].[Districts] ([id])
COMMIT TRANSACTION

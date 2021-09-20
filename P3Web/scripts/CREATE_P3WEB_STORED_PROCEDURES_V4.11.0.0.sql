USE [P3]
GO
/****** Object:  StoredProcedure [dbo].[v4_Users_Update_User]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Users_Update_User]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Users_Update_User]
GO
/****** Object:  StoredProcedure [dbo].[v4_Users_Add_New_User]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Users_Add_New_User]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Users_Add_New_User]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_SetRepublish_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Has_SetRepublish_Permission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Has_SetRepublish_Permission]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_Rename_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Has_Rename_Permission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Has_Rename_Permission]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_Move_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Has_Move_Permission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Has_Move_Permission]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_Delete_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Has_Delete_Permission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Has_Delete_Permission]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_UsersForNode]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_UsersForNode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_UsersForNode]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_PermittedUsers]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_PermittedUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_PermittedUsers]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_PermittedPositions]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_PermittedPositions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_PermittedPositions]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_GroupPermitted]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_GroupPermitted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_GroupPermitted]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_GroupOptionSet]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_GroupOptionSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_GroupOptionSet]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_GroupName]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_GroupName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_GroupName]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_DirectLinks]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_DirectLinks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_DirectLinks]
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_AllGroups]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_TreeView_Get_AllGroups]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_TreeView_Get_AllGroups]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Passed_Assessment]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Passed_Assessment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Passed_Assessment]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Has_Assessment]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Has_Assessment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Has_Assessment]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_Question_Possible_Answers]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Get_Question_Possible_Answers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Get_Question_Possible_Answers]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_QuesText]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Get_QuesText]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Get_QuesText]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_QuesSetID]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Get_QuesSetID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Get_QuesSetID]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_OfrdNoOfQues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Get_OfrdNoOfQues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Get_OfrdNoOfQues]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_AssessmentResult]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Get_AssessmentResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Get_AssessmentResult]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_Assessment]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Get_Assessment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Get_Assessment]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Add_AssessmentResult]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Add_AssessmentResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Add_AssessmentResult]
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Add_AssessmentAnswer]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Training_Add_AssessmentAnswer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Training_Add_AssessmentAnswer]
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Has_Current]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Status_Has_Current]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Status_Has_Current]
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_CurrentVersionStatus]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Status_Get_CurrentVersionStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Status_Get_CurrentVersionStatus]
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_CurrentItemID]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Status_Get_CurrentItemID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Status_Get_CurrentItemID]
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_ControlType]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Status_Get_ControlType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Status_Get_ControlType]
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_AvailableOptions]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Status_Get_AvailableOptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Status_Get_AvailableOptions]
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Convert_Status]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Status_Convert_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Status_Convert_Status]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByText]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_SearchItemsByText]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_SearchItemsByText]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByStyle]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_SearchItemsByStyle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_SearchItemsByStyle]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByRole]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_SearchItemsByRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_SearchItemsByRole]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByCategory]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_SearchItemsByCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_SearchItemsByCategory]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItems]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_SearchItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_SearchItems]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_Styles]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_Get_Styles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_Get_Styles]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_SearchVar]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_Get_SearchVar]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_Get_SearchVar]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_RoleAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_Get_RoleAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_Get_RoleAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_ObjFields]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_Get_ObjFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_Get_ObjFields]
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_FieldType]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Search_Get_FieldType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Search_Get_FieldType]
GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_Versions]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_RelatedActionItem_Get_Versions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_RelatedActionItem_Get_Versions]
GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_OtherUsers]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_RelatedActionItem_Get_OtherUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_RelatedActionItem_Get_OtherUsers]
GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_ItemName]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_RelatedActionItem_Get_ItemName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_RelatedActionItem_Get_ItemName]
GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_ActionItems]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_RelatedActionItem_Get_ActionItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_RelatedActionItem_Get_ActionItems]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Update_UserField]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Update_UserField]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Update_UserField]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Update_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Update_FieldData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Update_FieldData]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Tab_NotApplicable]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Tab_NotApplicable]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Tab_NotApplicable]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_RolesAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_RolesAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_RolesAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_PurgeNull]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_PurgeNull]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_PurgeNull]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Purge_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Purge_FieldData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Purge_FieldData]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_PositionAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_PositionAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_PositionAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Load_OnePane]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Load_OnePane]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Load_OnePane]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Load_FieldValues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Load_FieldValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Load_FieldValues]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_IsEntityMember]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_IsEntityMember]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_IsEntityMember]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_InternalEvents]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_InternalEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_InternalEvents]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Insert_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Insert_FieldData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Insert_FieldData]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_HasPopup]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_HasPopup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_HasPopup]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_HasAutoLabel]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_HasAutoLabel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_HasAutoLabel]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_UserResp]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_UserResp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_UserResp]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TrainRelation]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_TrainRelation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_TrainRelation]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TrainingSteps]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_TrainingSteps]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_TrainingSteps]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Trainees]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_Trainees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_Trainees]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TrainDefinitions]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_TrainDefinitions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_TrainDefinitions]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TabSettings]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_TabSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_TabSettings]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TabAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_TabAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_TabAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_SubGroups]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_SubGroups]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_SubGroups]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_StepResponsible]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_StepResponsible]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_StepResponsible]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_StepName]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_StepName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_StepName]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Step_DueInterval]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_Step_DueInterval]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_Step_DueInterval]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_SelListValues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_SelListValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_SelListValues]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Responsible]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_Responsible]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_Responsible]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_RecordName]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_RecordName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_RecordName]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_Record]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_Record]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_ObjTypeID]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_ObjTypeID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_ObjTypeID]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_ObjID]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_ObjID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_ObjID]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_NewRecordStructure]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_NewRecordStructure]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_NewRecordStructure]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Name_Formula]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_Name_Formula]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_Name_Formula]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_FieldName]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_FieldName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_FieldName]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_FieldData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_FieldData]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_DefReq]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_DefReq]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_DefReq]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_DDLValues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_DDLValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_DDLValues]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_CalculatedValue]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_CalculatedValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_CalculatedValue]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_CalculatedType]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Get_CalculatedType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Get_CalculatedType]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Edit_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Edit_Record]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Edit_Record]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Create_Tabs]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Create_Tabs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Create_Tabs]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Create_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Create_Record]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Create_Record]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Complete_Tab]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Complete_Tab]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Complete_Tab]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Complete_Item]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Complete_Item]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Complete_Item]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_TabDueDate]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Add_TabDueDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Add_TabDueDate]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_StepResponsible]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Add_StepResponsible]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Add_StepResponsible]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_Responsible]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Add_Responsible]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Add_Responsible]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_FieldValues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Add_FieldValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Add_FieldValues]
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_AllResponsible]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Record_Add_AllResponsible]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Record_Add_AllResponsible]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_UserMembershipList]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Update_UserMembershipList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Update_UserMembershipList]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_OtherUserAIList]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Update_OtherUserAIList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Update_OtherUserAIList]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_Notes]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Update_Notes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Update_Notes]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_History]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Update_History]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Update_History]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_Category]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Update_Category]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Update_Category]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Remove_UserMembership]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Remove_UserMembership]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Remove_UserMembership]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Remove_Role_Member]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Remove_Role_Member]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Remove_Role_Member]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Purge_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Purge_Role_Members]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Purge_Role_Members]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Has_EventDate_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Has_EventDate_Permission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Has_EventDate_Permission]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Has_Category_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Has_Category_Permission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Has_Category_Permission]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_UserTraining]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_UserTraining]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_UserTraining]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_UserMemberships]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_UserMemberships]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_UserMemberships]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Training]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_Training]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_Training]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Roles]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_Roles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_Roles]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_Role_Members]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_Role_Members]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_OtherUserAIList]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_OtherUserAIList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_OtherUserAIList]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_ItemCategories]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_ItemCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_ItemCategories]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Info]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_Info]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_History]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_History]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_History]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_EventDates]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Get_EventDates]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Get_EventDates]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Apply_Role_Members]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Apply_Role_Members]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_EventDate_To_SubItems]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Apply_EventDate_To_SubItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Apply_EventDate_To_SubItems]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_EventDate_To_SubFolders]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Apply_EventDate_To_SubFolders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Apply_EventDate_To_SubFolders]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_EventDate]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Apply_EventDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Apply_EventDate]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_Categories_To_SubItems]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Apply_Categories_To_SubItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Apply_Categories_To_SubItems]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_Categories_To_SubFolders]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Apply_Categories_To_SubFolders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Apply_Categories_To_SubFolders]
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Add_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Properties_Add_Role_Members]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Properties_Add_Role_Members]
GO
/****** Object:  StoredProcedure [dbo].[v4_ParaLink_Remove_PLink]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ParaLink_Remove_PLink]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ParaLink_Remove_PLink]
GO
/****** Object:  StoredProcedure [dbo].[v4_ParaLink_Get_PLinks]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ParaLink_Get_PLinks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ParaLink_Get_PLinks]
GO
/****** Object:  StoredProcedure [dbo].[v4_ParaLink_Add_PLink]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ParaLink_Add_PLink]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ParaLink_Add_PLink]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Update_PWord]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Update_PWord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Update_PWord]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_WinUser]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_WinUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_WinUser]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_UserOptionSet]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_UserOptionSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_UserOptionSet]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_User]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_User]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_User]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_PWordStatus]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_PWordStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_PWordStatus]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_P3PWord]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_P3PWord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_P3PWord]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_ForbiddenPasswords]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_ForbiddenPasswords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_ForbiddenPasswords]
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_FDAStatus]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Login_Get_FDAStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Login_Get_FDAStatus]
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_StatusPermission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ListView_Get_StatusPermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ListView_Get_StatusPermission]
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_RolePermission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ListView_Get_RolePermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ListView_Get_RolePermission]
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_ItemList]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ListView_Get_ItemList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ListView_Get_ItemList]
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_EditPermission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ListView_Get_EditPermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ListView_Get_EditPermission]
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_AddPermissionList]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ListView_Get_AddPermissionList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ListView_Get_AddPermissionList]
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_AddPermission]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ListView_Get_AddPermission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ListView_Get_AddPermission]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Update_InsertFieldValues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Update_InsertFieldValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Update_InsertFieldValues]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Update_CheckInOut]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Update_CheckInOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Update_CheckInOut]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_RoleMember]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Get_RoleMember]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Get_RoleMember]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_PTitleMember]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Get_PTitleMember]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Get_PTitleMember]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_Latest]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Get_Latest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Get_Latest]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_EventAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Get_EventAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Get_EventAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_Event]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Get_Event]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Get_Event]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_Document]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Get_Document]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Get_Document]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Create_Document2]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Create_Document2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Create_Document2]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Create_Document]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Create_Document]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Create_Document]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Cancel_Checkout]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Cancel_Checkout]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Cancel_Checkout]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Add_Roles_To_New_Document]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Add_Roles_To_New_Document]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Add_Roles_To_New_Document]
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Add_Event_Dates]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Document_Add_Event_Dates]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Document_Add_Event_Dates]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Update_HistoryMemo]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Update_HistoryMemo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Update_HistoryMemo]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Update_Group_History]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Update_Group_History]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Update_Group_History]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Trigger_Events]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Trigger_Events]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Trigger_Events]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Trigger_Event]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Trigger_Event]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Trigger_Event]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Set_Republish]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Set_Republish]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Set_Republish]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Rename]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Rename]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Rename]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Move]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Move]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Move]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Insert_HistoryMemo]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Insert_HistoryMemo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Insert_HistoryMemo]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_ParentGroupID]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Get_ParentGroupID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Get_ParentGroupID]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_Modules]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Get_Modules]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Get_Modules]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_ItemVersions]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Get_ItemVersions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Get_ItemVersions]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_Item_Group_Details]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Get_Item_Group_Details]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Get_Item_Group_Details]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_Item_For_Convert_Status]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Get_Item_For_Convert_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Get_Item_For_Convert_Status]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_HistoryMemo]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Get_HistoryMemo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Get_HistoryMemo]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Delete]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Delete]
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Add_Folder]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Default_Add_Folder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Default_Add_Folder]
GO
/****** Object:  StoredProcedure [dbo].[v4_Check_UserName]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Check_UserName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Check_UserName]
GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Get_TabList]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Attachment_Get_TabList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Attachment_Get_TabList]
GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Get_Attachments]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Attachment_Get_Attachments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Attachment_Get_Attachments]
GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Get_AttachData]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Attachment_Get_AttachData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Attachment_Get_AttachData]
GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Add_Attachment]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_Attachment_Add_Attachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_Attachment_Add_Attachment]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_TriggerEvent]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_TriggerEvent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_TriggerEvent]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_RoleAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_RoleAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_RoleAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_PositionAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_PositionAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_PositionAssigned]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_HasTriggerEvent]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_HasTriggerEvent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_HasTriggerEvent]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_GetUsersFromEntity]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_GetUsersFromEntity]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_GetUsersFromEntity]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_SelListValues]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Get_SelListValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Get_SelListValues]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_Results]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Get_Results]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Get_Results]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Get_Record]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Get_Record]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_ActionItem]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Get_ActionItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Get_ActionItem]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Fill_Users]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Fill_Users]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Fill_Users]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Fill_TreeMainNode]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Fill_TreeMainNode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Fill_TreeMainNode]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Fill_Tree]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Fill_Tree]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Fill_Tree]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Complete]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_Complete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_Complete]
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_AllAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_ActionItem_AllAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[v4_ActionItem_AllAssigned]
GO
/****** Object:  UserDefinedFunction [dbo].[v4_SecurityCheck]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_SecurityCheck]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[v4_SecurityCheck]
GO
/****** Object:  UserDefinedFunction [dbo].[v4_SplitString]    Script Date: 5/28/2021 12:31:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[v4_SplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[v4_SplitString]
GO
/****** Object:  UserDefinedFunction [dbo].[v4_SplitString]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 27, 2020>
-- Description:	<Split string into table>
-- =============================================
CREATE FUNCTION [dbo].[v4_SplitString] (@stringToSplit VARCHAR(MAX))
RETURNS
 @returnList TABLE ([Name] nvarchar(500))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(',', @stringToSplit) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(',', @stringToSplit)  
  SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)

  INSERT INTO @returnList 
  SELECT @name

  SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
 END

 INSERT INTO @returnList
 SELECT @stringToSplit

 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[v4_SecurityCheck]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <September 30, 2020>
-- Description:	<Returns a table of all permitted position titles to a folder>
-- =============================================
CREATE FUNCTION [dbo].[v4_SecurityCheck]
(	
	@ModuleID int,
	@GroupID int,
	@LevelID int
)
RETURNS TABLE 
AS
RETURN 
(
	with cte as
	(
		select [ControlID] as [GroupID]
		from [dbo].[LevelAccess]
		where [ModuleID] = @ModuleID and [GroupID] = @GroupID and [ControlType] = 6 and [LevelID] = @LevelID and [LevelValue] = 1
		union all
		select a.[GroupID]
		from [dbo].[Groups1] as a
		inner join cte as b on a.[ParentGroupID] = b.[GroupID]
		where a.[IsDeleted] = 0 and isnull(a.[Name], '') <> ''
	)
	select * from cte
)
GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_AllAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Get all assigned users for an event Action Item trigger>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_AllAssigned]
(
	@ModuleID int,
	@EventID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [ControlID], [ControlFullName], [ControlType], [CatID]
	FROM [dbo].[ControlLists]
	WHERE [ModuleID] = 14 AND [OrigID] = @EventID AND ListClass <> 15
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Complete]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Complete Action Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Complete]
(
	@Details nvarchar(MAX),
	@CompleteDate datetime,
	@Comments nvarchar(MAX),
	@ResultID int,
	@ResultName nvarchar(255),
	@AIID int
)
AS

BEGIN
	SET NOCOUNT ON;

	-- COMPLETE ACTION ITEM
	UPDATE [dbo].[Items14]
	SET [ParentGroupID] = 3, [Status] = 0, [Details] = @Details, [CompleteDate] = @CompleteDate, [Comments] = @Comments,
		[NotifiedStatus] = 0, [ResultID] = @ResultID, [ResultName] = @ResultName
	WHERE [AIID] = @AIID

	-- COMPLETE RELATED IMPROVEMENT STEP (IF APPLICABLE)
	DECLARE @OrigID INT, @GroupID INT, @ModuleID INT, @ObjID INT, @ObjTypeID INT, @IsStepCompleteWithAI BIT, @OpenAI INT, @IsLastStep BIT, @UserID INT, @UserName NVARCHAR(255), @Date DATETIME;	
	SELECT @OrigID = [ShowID], @GroupID = [ShowGroupID], @ObjID = [ShowObjID], @ModuleID = [ShowModuleID], @UserID = [UserID], @UserName = [UserName] FROM [dbo].[Items14] WHERE [AIID] = @AIID;
	SET @ObjTypeID = (SELECT [ObjTypeID] FROM [dbo].[Objects] WHERE [ObjID] = @ObjID);
	SET @Date = GETDATE();
	
	IF @ModuleID = 6
		BEGIN			
			SET @IsStepCompleteWithAI = (SELECT [CmpltStpWhnAICmplt] FROM [dbo].[DueDate] WHERE [OrigID] = @OrigID AND [ObjTypeID] = @ObjTypeID);

			IF @IsStepCompleteWithAI = 1
				BEGIN
					-- IF ALL ACTION ITEMS ARE COMPLETED, COMPLETE STEP
					SELECT @OpenAI =  COUNT(AIID) FROM [dbo].[Items14] WHERE [ShowID] = @OrigID AND [ShowModuleID] = @ModuleID AND [ShowObjID] = @ObjID AND [Status] = 2;
					IF @OpenAI = 0
						BEGIN
							-- Call Complete Step SP.
							EXEC v4_Record_Complete_Tab @UserFullName=@UserName,@CheckedDate=@Date,@CheckerID=@UserID,@ModuleID=6,@ItemID=@OrigID,@ObjID=@ObjID,@ReqID=0;

							SET @IsLastStep = 
							(
								SELECT CASE
									WHEN [ObjTypeID] = (SELECT MAX([ObjTypeID]) FROM [dbo].[DueDate] WHERE [OrigID] = @OrigID)
									THEN 1
									ELSE 0
									END AS [IsLastStep]
								FROM [dbo].[DueDate]
								WHERE [OrigID] = @OrigID AND [ObjTypeID] = @ObjTypeID
							);

							SELECT @IsLastStep = CASE
								WHEN [ObjTypeID] = (SELECT MAX([ObjTypeID]) FROM [dbo].[DueDate] WHERE [OrigID] = @OrigID)
									THEN 1
									ELSE 0
									END
								FROM [dbo].[DueDate]
								WHERE [OrigID] = @OrigID AND [ObjTypeID] = @ObjTypeID;

							-- COMPLETE ENTIRE IMPROVEMENT RECORD IF STEP IS LAST STEP
							IF @IsLastStep = 1
								BEGIN
									UPDATE [dbo].[Items6]
									SET [Status] = 0, [ModifiedBy] = @UserName, [ModifierID] = @UserID, [LastModified] = @Date, 
										[VersionedBy] = @UserName, [VersionedByID] = @UserID, [VersionDate] = @Date
									WHERE [ItemID] = @OrigID;
								END
							ELSE
								BEGIN
									DECLARE @DueDate DATETIME, @ItemName NVARCHAR(255), @ItemStepName NVARCHAR(255), @ActionItemName NVARCHAR(255), @ActionItemDetails NVARCHAR(MAX), @Exists INT;
									SET @ItemName = (SELECT TOP 1 [Name] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID);
									SET @ItemStepName = (SELECT [Caption] FROM [dbo].[ObjType] WHERE [ObjTypeID] = (@ObjTypeID + 1));
									SET @ActionItemName = 'Address Step: ' + @ItemStepName + '(' + @ItemName + ')';
									SET @ActionItemDetails = 'You have been assigned to address the step: ' + @ItemStepName + CHAR(10) + CHAR(10) +
										'Please access the item and address this step' + CHAR(10) + CHAR(10) + 
										'Item Name: ' + @ItemName + CHAR(10) + CHAR(10) + 
										'Item ID: ' + CONVERT(NVARCHAR(10), @OrigID);

									SET @DueDate = DATEADD(DAY, (SELECT [DayInterval] FROM [dbo].[DueDate] WHERE OrigID = @OrigID AND [ObjTypeID] = @ObjTypeID), @Date);
									DECLARE @ControlID INT, @ControlFullName NVARCHAR(255), @ControlType INT;
									-- TRIGGER NEXT STEP ACTION ITEM
									DECLARE assigned_cursor CURSOR FOR
										SELECT [ControlID], [ControlFullName], [ControlType]
										FROM [dbo].[ControlLists]
										WHERE [ModuleID] = 6 AND [OrigID] = @OrigID AND [ObjTypeID] = @ObjTypeID;
									OPEN assigned_cursor;
									FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlFullName, @ControlType;
									WHILE @@FETCH_STATUS = 0
										BEGIN
											IF @ControlType = 1
												BEGIN													
													SET @Exists = (SELECT COUNT([UserID]) FROM [dbo].[Items1] WHERE [UserID] = @ControlID AND [IsDeleted] = 0 AND [Status] IN (-1,0,1));
													IF @Exists > 0
														BEGIN
															EXEC v4_ActionItem_TriggerEvent @ParentGroupID=2,@AIType=0,@ParentID=0,@Name=@ActionItemName,@Details=@ActionItemDetails,@Status=2,@ModuleID=0,
																@EventID=0,@UserID=@ControlID,@UserName=@ControlFullName,@SenderName=@UserName,@SenderID=@UserID,@SendDate=@Date,@DateDue=@DueDate,
																@Priority=1,@CompleteDate=NULL,@ResultID=0,@ResultName=NULL,@Comments=@Comments,@ShowMeEnabled=1,@ShowID=@OrigID,@ShowGroupID=@GroupID,
																@ShowIsItemID=1,@ShowType=1,@ShowModuleID=@ModuleID,@ShowAction=0,@DateSet=NULL,@IsRegReminder=0,@RegReminderDay=NULL,
																@RegReminderDate=NULL,@IsFinalReminder=0,@FinalReminderDate=NULL,@NotifyOverdueEventID=NULL,@NotifyOverdueDate=NULL,
																@NotifyCompletedEventID=NULL,@Archive=0,@UrgentEmail=NULL,@SendEmailCmpltAI=NULL,@NextStartDate=NULL,@SchedRepeat=NULL,
																@SchedIntervalType=NULL,@SchedRepeatNumber=NULL,@SchedUntilDate=NULL,@SchedStatus=NULL,@IsDeleted=0,@OptionSet=NULL,
																@NotifiedStatus=2,@ModifiedBy=NULL,@LastModified=NULL,@ModifierID=NULL;
														END													
												END
											ELSE
												BEGIN
													DECLARE @SubControlID INT, @SubControlFullName NVARCHAR(255), @SubControlType INT;
													DECLARE user_cursor CURSOR FOR
														SELECT a.[ControlID], a.[ControlFullName], a.[ControlType]
														FROM [dbo].[ControlLists] AS a
														INNER JOIN [dbo].[Items1] AS b ON a.[ControlID] = b.[UserID] AND b.[IsDeleted] = 0 AND b.[Status] IN (-1,0,1)
														WHERE a.[ModuleID] = 1 AND a.[OrigID] = @ControlID AND a.[ControlType] = 1;
													OPEN user_cursor;
													FETCH NEXT FROM user_cursor INTO @SubControlID, @SubControlFullName, @SubControlType;
													WHILE @@FETCH_STATUS = 0
														BEGIN
															-- TODO TRIGGER ACTION ITEM IF USER ACTIVE
															EXEC v4_ActionItem_TriggerEvent @ParentGroupID=2,@AIType=0,@ParentID=0,@Name=@ActionItemName,@Details=@ActionItemDetails,@Status=2,@ModuleID=0,
																@EventID=0,@UserID=@SubControlID,@UserName=@SubControlFullName,@SenderName=@UserName,@SenderID=@UserID,@SendDate=@Date,@DateDue=@DueDate,
																@Priority=1,@CompleteDate=NULL,@ResultID=0,@ResultName=NULL,@Comments=@Comments,@ShowMeEnabled=1,@ShowID=@OrigID,@ShowGroupID=@GroupID,
																@ShowIsItemID=1,@ShowType=1,@ShowModuleID=@ModuleID,@ShowAction=0,@DateSet=NULL,@IsRegReminder=0,@RegReminderDay=NULL,
																@RegReminderDate=NULL,@IsFinalReminder=0,@FinalReminderDate=NULL,@NotifyOverdueEventID=NULL,@NotifyOverdueDate=NULL,
																@NotifyCompletedEventID=NULL,@Archive=0,@UrgentEmail=NULL,@SendEmailCmpltAI=NULL,@NextStartDate=NULL,@SchedRepeat=NULL,
																@SchedIntervalType=NULL,@SchedRepeatNumber=NULL,@SchedUntilDate=NULL,@SchedStatus=NULL,@IsDeleted=0,@OptionSet=NULL,
																@NotifiedStatus=2,@ModifiedBy=NULL,@LastModified=NULL,@ModifierID=NULL;
															FETCH NEXT FROM user_cursor INTO @SubControlID, @SubControlFullName, @SubControlType;
														END
													CLOSE user_cursor;
													DEALLOCATE user_cursor;
												END
											FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlFullName, @ControlType;
										END
									CLOSE assigned_cursor;
									DEALLOCATE assigned_cursor;

									-- SET ShowObjID FOR ALL NEWLY CREATED ACTION ITEMS
									UPDATE [dbo].[Items14]
									SET [ShowObjID] = (@ObjID + 1)
									WHERE [ShowModuleID] = 6 AND [ShowID] = @OrigID AND ISNULL([ShowObjID], 0) = 0;
								END
						END
				END
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Fill_Tree]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Additional Tree Nodes for User Selection Field>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Fill_Tree]
(
	@ParentGroupID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT a.[GroupId], a.[Name], (SELECT COUNT(*) FROM [dbo].[Groups1] WHERE [ParentGroupID] = a.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') AS [childnodecount]
	FROM [dbo].[Groups1] AS a
	WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
	ORDER BY a.[Name];
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Fill_TreeMainNode]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Tree Nodes for User Selection Field>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Fill_TreeMainNode]
(
	@ParentGroupID int,
	@GroupID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT a.[GroupID], a.[Name], (SELECT COUNT(*) FROM [dbo].[Groups1] WHERE ParentGroupID = a.[GroupID]) AS [childnodecount]
	FROM [dbo].[Groups1] AS a
	WHERE a.[ParentGroupID] = @ParentGroupID  AND a.[GroupID] = @GroupID AND a.[IsDeleted] = 0
	ORDER BY a.[Name]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Fill_Users]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Users List>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Fill_Users]

AS

BEGIN
	SET NOCOUNT ON;

	SELECT [UserID], [FullName], [FirstName], [LastName]
	FROM [dbo].[Items1]
	WHERE [IsDeleted] = 0 AND [Status] <> 9
	ORDER BY [LastName]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_ActionItem]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Action Item Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Get_ActionItem]
(
	@AIID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[Items14]
	WHERE [AIID] = @AIID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Related Record Data from Action Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Get_Record]
(
	@ItemID int,
	@ModuleID int,
	@ShowIsItemID bit,
	@OptionSet nvarchar(50)
)
AS

BEGIN
	SET NOCOUNT ON;

	IF @ModuleID = 3
		BEGIN
			IF @OptionSet = '1_3'
				BEGIN
					IF @ShowIsItemID = 0
						BEGIN
							SELECT TOP 1 *
							FROM [dbo].[Items3]
							WHERE [OrigID] = @ItemID AND [IsDeleted] = 0 AND [TypeOfPublish] > 0 AND [IsWithdrawn] = 0 AND [Status] = 0
							ORDER BY [ItemID] DESC
						END						
					ELSE
						SELECT *
						FROM [dbo].[Items3]
						WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [TypeOfPublish] > 0 AND [IsWithdrawn] = 0
				END			
			ELSE 
				BEGIN
					SELECT *
					FROM [dbo].[Items3]
					WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [TypeOfPublish] > 0 AND [IsWithdrawn] = 0
				END
			--	IF @ShowIsItemID = 0
			--		BEGIN
			--			SELECT TOP 1 *
			--			FROM [dbo].[Items3]
			--			WHERE [OrigID] = @ItemID AND [IsDeleted] = 0 AND [TypeOfPublish] > 0 AND [IsWithdrawn] = 0
			--				AND ([Status] = 9 OR [Status] = 5 OR [Status] = 3 OR [IsEvidence] = 1)
			--			ORDER BY [ItemID] DESC
			--		END					
			--	ELSE
			--		SELECT *
			--		FROM [dbo].[Items3]
			--		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [TypeOfPublish] > 0 AND [IsWithdrawn] = 0
		END		
	ELSE IF @ModuleID = 4
		BEGIN
			SELECT b.[GroupID], b.[ObjTypeID], a.[ItemID], a.[OrigID], a.[ParentGroupID], a.[Status]
			FROM [dbo].[Items4] AS a
			INNER JOIN [dbo].[Groups4] AS b ON a.[ParentGroupID] = b.[GroupID]
			WHERE a.[ItemID] = @ItemID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
		END		
	ELSE IF @ModuleID = 6
		BEGIN
			SELECT b.[GroupID], b.[ObjTypeID], a.[ItemID], a.[OrigID], a.[ParentGroupID], a.[Status]
			FROM [dbo].[Items6] AS a
			INNER JOIN [dbo].[Groups6] AS b ON a.[ParentGroupID] = b.[GroupID]
			WHERE a.[ItemID] = @ItemID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
		END
	ELSE
		BEGIN
			SELECT b.[GroupID], b.[ObjTypeID], a.[ItemID], a.[OrigID], a.[ParentGroupID], a.[Status]
			FROM [dbo].[Items12] AS a
			INNER JOIN [dbo].[Groups12] AS b ON a.[ParentGroupID] = b.[GroupID]
			WHERE a.[ItemID] = @ItemID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
		END		
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_Results]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Available Action Item Results>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Get_Results]
(
	@EventID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [EventID], [Name]
	FROM [dbo].[AIEventSet]
	WHERE [EventType] = 2 AND [ParentID] = @EventID
	ORDER BY [Name]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_Get_SelListValues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Values for Selection List>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_Get_SelListValues]
(
	@ItemID int,
	@FieldID int,
	@ModuleID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [NumData], [TextData]
	FROM [dbo].[RecordsData]
	WHERE [ItemID] = @ItemID AND [FieldID] = @FieldID AND [NumData] > 0 AND [MemoData] LIKE '1' AND [IsDeleted] = 0 AND [ModuleID] = @ModuleID
	ORDER BY [ID]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_GetUsersFromEntity]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/30/2017>
-- Description:	<Retrieve User Members of Entity>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_GetUsersFromEntity]
(
	@GroupID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT b.[ControlID], b.[ControlFullName], b.[ControlType]
	FROM [dbo].[Groups1] AS a
	INNER JOIN [dbo].[ControlLists] AS b ON a.[GroupID] = b.[OrigID] AND b.[ModuleID] = 1 
	INNER JOIN [dbo].[Items1] AS c ON b.[ControlID] = c.[UserID] AND c.[IsDeleted] = 0 AND c.[Status] != 9
	WHERE a.[GroupID] = @GroupID 
	ORDER BY b.[ControlID]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_HasTriggerEvent]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Any Triggered Events from Action Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_HasTriggerEvent]
(
	@EventID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[AIEventSet]
	WHERE [ParentID] = @EventID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_PositionAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve All Assigned Position Title Entities for Action Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_PositionAssigned]
(
	@ControlID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [ControlID], [ControlFullName], [ControlType], [CatID]
	FROM [dbo].[ControlLists]
	WHERE [ListClass] = 1 AND [OrigID] = @ControlID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_RoleAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve All Assigned Roles for Action Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_RoleAssigned]
(
	@RelatedID int,
	@ControlID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [ControlID], [ControlFullname], [ControlType], [CatID]
	FROM [dbo].[ControlLists]
	WHERE [OrigID] = @RelatedID AND [CatID] = @ControlID AND [IsGroup] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ActionItem_TriggerEvent]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Trigger Event>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ActionItem_TriggerEvent]
(
	@ParentGroupID int,
	@AIType int,
	@ParentID int,
	@Name nvarchar(255),
	@Details nvarchar(MAX),
	@Status int,
	@ModuleID int,
	@EventID int,
	@UserID int,
	@UserName nvarchar(255),
	@SenderName nvarchar(255),
	@SenderID int,
	@SendDate datetime,
	@DateDue datetime,
	@Priority int,
	@CompleteDate datetime,
	@ResultID int,
	@ResultName nvarchar(255),
	@Comments nvarchar(MAX),
	@ShowMeEnabled bit,
	@ShowGroupID int,
	@ShowID int,
	@ShowIsItemID bit,
	@ShowType int,
	@ShowModuleID int,
	@ShowAction int,
	@DateSet datetime,
	@IsRegReminder bit,
	@RegReminderDay int,
	@RegReminderDate datetime,
	@IsFinalReminder bit,
	@FinalReminderDate datetime,
	@NotifyOverDueEventID bit,
	@NotifyOverDueDate datetime,
	@NotifyCompletedEventID int,
	@Archive bit,
	@UrgentEmail int,
	@SendEmailCmpltAI int,
	@NextStartDate datetime,
	@SchedRepeat int,
	@SchedIntervalType int,
	@SchedRepeatNumber int,
	@SchedUntilDate datetime,
	@SchedStatus smallint,
	@IsDeleted bit,
	@OptionSet nvarchar(255),
	@NotifiedStatus smallint,
	@ModifiedBy nvarchar(255),
	@LastModified datetime,
	@ModifierID int
)
AS

BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Items14]
		([ParentGroupID], [AIType], [ParentID], [Name], [Details], [Status], [ModuleID], [EventID], [UserID], [UserName], [SenderName],
		[SenderID], [SendDate], [DateDue], [Priority], [CompleteDate], [ResultID], [ResultName], [Comments], [ShowMeEnabled], [ShowGroupID], [ShowID], 
		[ShowIsItemID], [ShowType], [ShowModuleID], [ShowAction], [DateSet], [IsRegReminder], [RegReminderDay], [RegReminderDate], [IsFinalReminder],
		[FinalReminderDate], [NotifyOverDueEventID], [NotifyOverDueDate], [NotifyCompletedEventID], [Archive], [UrgentEMail], [SendEmailCmpltAI],
		[NextStartDate], [SchedRepeat], [SchedIntervalType], [SchedRepeatNumber], [SchedUntilDate], [SchedStatus], [IsDeleted], [OptionSet],
		[NotifiedStatus], [ModifiedBy], [LastModified], [ModifierID])
	VALUES
		(@ParentGroupID, @AIType, @ParentID, @Name, @Details, @Status, @ModuleID, @EventID, @UserID, @UserName, @SenderName, 
		@SenderID, @SendDate, @DateDue, @Priority, @CompleteDate, @ResultID, @ResultName, @Comments, @ShowMeEnabled, @ShowGroupID,
		@ShowID, @ShowIsItemID, @ShowType, @ShowModuleID, @ShowAction, @DateSet, @IsRegReminder, @RegReminderDay, @RegReminderDate,
		@IsFinalReminder, @FinalReminderDate, @NotifyOverDueEventID, @NotifyOverDueDate, @NotifyCompletedEventID, @Archive,
		@UrgentEmail, @SendEmailCmpltAI, @NextStartDate, @SchedRepeat, @SchedIntervalType, @SchedRepeatNumber, @SchedUntilDate,
		@SchedStatus, @IsDeleted, @OptionSet, @NotifiedStatus, @ModifiedBy, @LastModified, @ModifierID)
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Add_Attachment]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <February 23, 2019>
-- Description:	<Insert Attachment>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Attachment_Add_Attachment]
(
	@ItemID int,
	@ObjID int,
	@ModuleID int,
	@AtchName nvarchar(255),
	@AtchExtension nvarchar(10),
	@AtchContent varbinary(MAX),
	@CreatorID int,
	@CreateBy nvarchar(255),
	@Notes nvarchar(MAX)
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
		@DateSet DateTime,
		@OrigID int,
		@AtchSerialNo int

	SET @DateSet = GETDATE()
	IF (@ModuleID = 4)
		BEGIN
			SET @OrigID = (SELECT TOP 1 [OrigID] FROM [dbo].[Items4] WHERE [ItemID] = @ItemID)
		END
	ELSE IF (@ModuleID = 6)
		BEGIN
			SET @OrigID = (SELECT TOP 1 [OrigID] FROM [dbo].[Items6] WHERE [ItemID] = @ItemID)
		END
	ELSE
		BEGIN
			SET @OrigID = (SELECT TOP 1 [OrigID] FROM [dbo].[Items12] WHERE [ItemID] = @ItemID)
		END
	SET @AtchSerialNo = (SELECT CASE MAX([AtchSerialNo])
							WHEN NULL THEN 1
							ELSE MAX([AtchSerialNo]) + 1
							END AS [AtchSerialNo]
						FROM [dbo].[Atchmnts] WHERE [OrigID] = @OrigID)
	IF @AtchSerialNo IS NULL
		SET @AtchSerialNo = 1


    INSERT INTO [dbo].[Atchmnts]
		([ItemID],[AtchPageObjID],[OrigID],[ModuleID],[TypeID],[AtchName],[AtchSerialNo],[AtchExtension],[AtchContent],
        [CreatorID],[CreateBy],[CreateDate],[ModifierID],[ModifiedBy],[LastModified],[Notes])
	OUTPUT INSERTED.AtchSerialNo
    VALUES(@ItemID,@ObjID,@OrigID,@ModuleID,1,@AtchName,@AtchSerialNo,@AtchExtension,@AtchContent,
		@CreatorID,@CreateBy,@DateSet,@CreatorID,@CreateBy,@DateSet,@Notes)
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Get_AttachData]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/8/2017>
-- Description:	<Get Attahment Binary Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Attachment_Get_AttachData]
(
	@AtchID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [AtchContent]
	FROM [dbo].[Atchmnts]
	WHERE [AtchID] = @AtchID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Get_Attachments]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/8/2017>
-- Description:	<Get Attahments>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Attachment_Get_Attachments]
(
	@ItemID int,
	@ModuleID int,
	@ObjID int
)
AS

BEGIN
	SET NOCOUNT ON;

	IF @ObjID = 0
		SELECT [AtchID], [AtchPageObjID], [AtchName], [AtchSerialNo], [CreateBy], [CreateDate], [AtchExtension], [Notes]
		FROM [dbo].[Atchmnts]
		WHERE [ItemID] = @ItemID AND [ModuleID] = @ModuleID AND [AtchPageObjID] LIKE '%'
		ORDER BY [AtchSerialNo]
	ELSE
		SELECT [AtchID], [AtchPageObjID], [AtchName], [AtchSerialNo], [CreateBy], [CreateDate], [AtchExtension], [Notes]
		FROM [dbo].[Atchmnts]
		WHERE [ItemID] = @ItemID AND [ModuleID] = @ModuleID AND [AtchPageObjID] = @ObjID
		ORDER BY [AtchSerialNo]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Attachment_Get_TabList]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/8/2017>
-- Description:	<Get Tab List for Attachments>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Attachment_Get_TabList]
(
	@ItemID int,
	@ModuleID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT a.[ObjID], c.[Caption]
	FROM [dbo].[ItemObj] AS a
	INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID] AND b.[IsDeleted] = 0
	INNER JOIN [dbo].[ObjType] AS c ON b.[ObjtypeID] = c.[ObjTypeID] AND c.[IsDeleted] = 0
	WHERE a.[ItemID] = @ItemID AND a.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0
	ORDER BY c.[ListOrder]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Check_UserName]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 20, 2021>
-- Description:	<Check if UserName Exists>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Check_UserName]
	@UserName nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Name]
	FROM [dbo].[Items1]
	WHERE [Name] = @UserName;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Add_Folder]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 30, 2020>
-- Description:	<Add folder to tree>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Add_Folder] 
	@ModuleID int,
	@ParentGroupID int,
	@Name nvarchar(255),
	@UserName nvarchar(255),
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Date DATETIME;
	SET @Date = GETDATE();

	IF @ModuleID = 1
		BEGIN
			INSERT INTO [dbo].[Groups1]([ParentGroupID],[Name],[ControlType],[ObjTypeID],[CreateBy],[CreateDate],[LastModified],[ModifiedBy],[CreatorID],[ModifierID],
				[ModuleAccess],[OptionSet])
			SELECT @ParentGroupID,@Name,0,[ObjTypeID],@UserName,@Date,@Date,@UserName,@UserID,@UserID,[ModuleAccess],[OptionSet]
			FROM [dbo].[Groups1]
			WHERE [GroupID] = @ParentGroupID;
		END
	ELSE IF @ModuleID = 3
		BEGIN
			INSERT INTO [dbo].[Groups3]([ParentGroupID],[Name],[ObjTypeID],[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],[CreateBy],[CreateDate],
				[LastModified],[ModifiedBy],[CreatorID],[ModifierID],[OptionSet],[LabelName],[RoleControlType],[NameFormula],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation],[PrintControl])
			SELECT @ParentGroupID,@Name,[ObjTypeID],[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],@UserName,@Date,
				@Date,@UserName,@UserID,@UserID,[OptionSet],[LabelName],[RoleControlType],[NameFormula],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation],[PrintControl]
			FROM [dbo].[Groups3]
			WHERE [GroupID] = @ParentGroupID;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			INSERT INTO [dbo].[Groups4]([ParentGroupID],[ObjTypeID],[Name],[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],[CreateBy],[CreateDate],
				[LastModified],[ModifiedBy],[CreatorID],[ModifierID],[OptionSet],[LabelName],[RoleControlType],[NameFormula],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation])
			SELECT @ParentGroupID,[ObjTypeID],@Name,[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],@UserName,@Date,
				@Date,@UserName,@UserID,@UserID,[OptionSet],[LabelName],[RoleControlType],[NameFormula],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation]
			FROM [dbo].[Groups4]
			WHERE [GroupID] = @ParentGroupID;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			INSERT INTO [dbo].[Groups6]([ParentGroupID],[ObjTypeID],[Name],[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],[CreateBy],[CreateDate],
				[LastModified],[ModifiedBy],[CreatorID],[ModifierID],[OptionSet],[LabelName],[RoleControlType],[NameFormula],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation])
			SELECT @ParentGroupID,[ObjTypeID],@Name,[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],@UserName,@Date,
				@Date,@UserName,@UserID,@UserID,[OptionSet],[LabelName],[RoleControlType],[NameFormula],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation]
			FROM [dbo].[Groups6]
			WHERE [GroupID] = @ParentGroupID;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			INSERT INTO [dbo].[Groups12]([ParentGroupID],[ObjTypeID],[Name],[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],[CreateBy],[CreateDate],
				[LastModified],[ModifiedBy],[CreatorID],[ModifierID],[OptionSet],[LabelName],[RoleControlType],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation])
			SELECT @ParentGroupID,[ObjTypeID],@Name,[TypeOfPublish],[PublishMode],[NeedPublish],[NeedPublishToSP],[IsLockedForPublish],@UserName,@Date,
				@Date,@UserName,@UserID,@UserID,[OptionSet],[LabelName],[RoleControlType],[LVSettings],[PublishNow],[PublishToSPNow],[SPLocation]
			FROM [dbo].[Groups12]
			WHERE [GroupID] = @ParentGroupID;
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Delete]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 16, 2020>
-- Description:	<Delete Item or Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Delete] 
	@ModuleID int,
	@OrigID int,
	@UserID int,
	@IsGroup bit
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CurrentDate DATETIME, @ItemName NVARCHAR(255), @UserName NVARCHAR(500), @MemoData NVARCHAR(MAX);
	SET @CurrentDate = GETDATE();
	SET @UserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	-- SET HISTORYMEMO
	IF @IsGroup = 1
		BEGIN
			SET @MemoData = 'Related Name: ' + @ItemName + CHAR(13) +
				'User Name: ' + @UserName + CHAR(13) + 
				'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
				'Action: Folder deleted' + CHAR(13) + CHAR(13) + 
				'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

				IF (SELECT COUNT(*) FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 0) > 0
					BEGIN
						UPDATE [dbo].[HistoryMemo]
						SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
						WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 0;
					END
				ELSE
					BEGIN
						INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[DataType],[MemoData])
						SELECT @OrigID,0,@ModuleID,0,@MemoData;
					END				
		END
	ELSE
		BEGIN
			DECLARE @ItemLabel NVARCHAR(255);
			IF @ModuleID = 1
				BEGIN
					SET @ItemLabel = (SELECT [LabelName] FROM [dbo].[Items1] WHERE [UserID] = @OrigID);
				END
			ELSE IF @ModuleID = 3
				BEGIN
					SET @ItemLabel = (SELECT [LabelName] FROM [dbo].[Items3] WHERE [ItemID] = @OrigID);
				END
			ELSE IF @ModuleID = 4
				BEGIN
					SET @ItemLabel = (SELECT [LabelName] FROM [dbo].[Items4] WHERE [ItemID] = @OrigID);
				END
			ELSE IF @ModuleID = 6
				BEGIN
					SET @ItemLabel = (SELECT [LabelName] FROM [dbo].[Items6] WHERE [ItemID] = @OrigID);
				END
			ELSE IF @ModuleID = 12
				BEGIN
					SET @ItemLabel = (SELECT [LabelName] FROM [dbo].[Items12] WHERE [ItemID] = @OrigID);
				END

			SET @MemoData = 'Item Label: ' + @ItemLabel + CHAR(13) + 
				'User Name: ' + @UserName + CHAR(13) + 
				'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
				'Action: Item Deleted' + CHAR(13) + CHAR(13) + 
				'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

			IF (SELECT COUNT(*) FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1) > 0
				BEGIN
					UPDATE [dbo].[HistoryMemo]
					SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1;
				END
			ELSE
				BEGIN
					INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[DataType],[MemoData])
					SELECT @OrigID,1,@ModuleID,0,@MemoData;
				END
		END
	
	-- DELETE ITEM/GROUP
	IF @ModuleID = 1
		BEGIN
			IF @IsGroup = 1
				BEGIN
					;WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups1]
						WHERE ([ParentGroupID] = @OrigID OR [GroupID] = @OrigID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups1] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
					)
					UPDATE [dbo].[Groups1]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] IN (SELECT [GroupID] FROM cte);
					
					UPDATE [dbo].[Items1]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE EXISTS (SELECT a.[GroupID] FROM [dbo].[Groups1] AS a WHERE a.[IsDeleted] = 1 AND a.[GroupID] = [dbo].[Items1].[ParentGroupID]);					
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items1]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [UserID] = @OrigID;
				END
		END
    IF @ModuleID = 3
		BEGIN
			IF @IsGroup = 1
				BEGIN
					;WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups3]
						WHERE ([ParentGroupID] = @OrigID OR [GroupID] = @OrigID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups3] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
					)
					UPDATE [dbo].[Groups3]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] IN (SELECT [GroupID] FROM cte);
					
					UPDATE [dbo].[Items3]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE EXISTS (SELECT a.[GroupID] FROM [dbo].[Groups3] AS a WHERE a.[IsDeleted] = 1 AND a.[GroupID] = [dbo].[Items3].[ParentGroupID]);					
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items3]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [ItemID] = @OrigID;
				END
		END
	ELSE IF @ModuleID = 4
		BEGIN
			IF @IsGroup = 1
				BEGIN
					;WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups4]
						WHERE ([ParentGroupID] = @OrigID OR [GroupID] = @OrigID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups4] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
					)
					UPDATE [dbo].[Groups4]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] IN (SELECT [GroupID] FROM cte);
					
					UPDATE [dbo].[Items4]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE EXISTS (SELECT a.[GroupID] FROM [dbo].[Groups4] AS a WHERE a.[IsDeleted] = 1 AND a.[GroupID] = [dbo].[Items4].[ParentGroupID]);
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items4]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF @IsGroup = 1
				BEGIN
					;WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups6]
						WHERE ([ParentGroupID] = @OrigID OR [GroupID] = @OrigID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups6] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
					)
					UPDATE [dbo].[Groups6]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] IN (SELECT [GroupID] FROM cte);
					
					UPDATE [dbo].[Items6]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE EXISTS (SELECT a.[GroupID] FROM [dbo].[Groups6] AS a WHERE a.[IsDeleted] = 1 AND a.[GroupID] = [dbo].[Items6].[ParentGroupID]);
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items6]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
	ELSE IF @ModuleID = 12
		BEGIN
			IF @IsGroup = 1
				BEGIN
					;WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups12]
						WHERE ([ParentGroupID] = @OrigID OR [GroupID] = @OrigID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups12] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
					)
					UPDATE [dbo].[Groups12]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] IN (SELECT [GroupID] FROM cte);
					
					UPDATE [dbo].[Items12]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE EXISTS (SELECT a.[GroupID] FROM [dbo].[Groups12] AS a WHERE a.[IsDeleted] = 1 AND a.[GroupID] = [dbo].[Items12].[ParentGroupID]);
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items12]
					SET [IsDeleted] = 1, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_HistoryMemo]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/9/2017>
-- Description:	<Retrieve Record History Memo>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Get_HistoryMemo]
(
	@OrigID int,
	@ModuleID int
)
AS

BEGIN
	-- Get record
	SET NOCOUNT ON;

	SELECT [OrigID], [Type], [ModuleID], [DataType], [MemoData]
	FROM [dbo].[HistoryMemo]
	WHERE [OrigID] = @OrigID AND [ModuleID] = @ModuleID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_Item_For_Convert_Status]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <12/12/2017>
-- Description:	<Retrieve Item Being Converted for Status>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Get_Item_For_Convert_Status] 
	@ModuleID INT,
	@ItemID INT
AS
BEGIN
	SET NOCOUNT ON;

    IF @ModuleID = 3 -- DOCUMENTS
		BEGIN
			SELECT * FROM Items3 WHERE ItemID = @ItemID AND IsDeleted = 0 AND IsWithdrawn = 0
		END
	ELSE IF @ModuleID = 4 -- RECORDS
		BEGIN
			SELECT * FROM Items4 WHERE ItemID = @ItemID AND IsDeleted = 0 AND IsWithdrawn = 0
		END
	ELSE IF @ModuleID = 6 -- IMPROVEMENTS
		BEGIN
			SELECT * FROM Items6 WHERE ItemID = @ItemID AND IsDeleted = 0 AND IsWithdrawn = 0
		END
	ELSE -- TRAINING
		BEGIN
			SELECT * FROM Items12 WHERE ItemID = @ItemID AND IsDeleted = 0 AND IsWithdrawn = 0
		END
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_Item_Group_Details]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 14, 2020>
-- Description:	<Get Item/Group details for rename/move/delete>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Get_Item_Group_Details] 
	@ModuleID int,
	@OrigID int,
	@IsGroup int
AS
BEGIN
	SET NOCOUNT ON;

	IF @ModuleID = 1
		BEGIN
			IF @IsGroup = 1
				BEGIN
					SELECT *
					FROM [dbo].[Groups1]
					WHERE [GroupID] = @OrigID;
				END
			ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items1]
					WHERE [UserID] = @OrigID
					ORDER BY [UserID] DESC;
				END
		END
    ELSE IF @ModuleID = 3
		BEGIN
			IF @IsGroup = 1
				BEGIN
					SELECT *
					FROM [dbo].[Groups3]
					WHERE [GroupID] = @OrigID;
				END
			ELSE
				BEGIN
					SELECT TOP 1 *
					FROM [dbo].[Items3]
					WHERE [OrigID] = @OrigID
					ORDER BY [ItemID] DESC;
				END
		END
	ELSE IF @ModuleID = 4
		BEGIN
			IF @IsGroup = 1
				BEGIN
					SELECT *
					FROM [dbo].[Groups4]
					WHERE [GroupID] = @OrigID;
				END
			ELSE
				BEGIN
					SELECT TOP 1 *
					FROM [dbo].[Items4]
					WHERE [OrigID] = @OrigID
					ORDER BY [ItemID] DESC;
				END
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF @IsGroup = 1
				BEGIN
					SELECT *
					FROM [dbo].[Groups6]
					WHERE [GroupID] = @OrigID;
				END
			ELSE
				BEGIN
					SELECT TOP 1 *
					FROM [dbo].[Items6]
					WHERE [OrigID] = @OrigID
					ORDER BY [ItemID] DESC;
				END
		END
	ELSE IF @ModuleID = 12
		BEGIN
			IF @IsGroup = 1
				BEGIN
					SELECT *
					FROM [dbo].[Groups12]
					WHERE [GroupID] = @OrigID;
				END
			ELSE
				BEGIN
					SELECT TOP 1 *
					FROM [dbo].[Items12]
					WHERE [OrigID] = @OrigID
					ORDER BY [ItemID] DESC;
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_ItemVersions]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 16, 2020>
-- Description:	<Return all versions of Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Get_ItemVersions]
	@ModuleID int,
	@OrigID int
AS
BEGIN
	SET NOCOUNT ON;

	IF @ModuleID = 3
		BEGIN
			SELECT [ItemID],[Version],CASE [Status]
				WHEN 0
				THEN 'Obsolete'
				WHEN 2
				THEN 'Draft'
				WHEN 3
				THEN 'Collaborate'
				WHEN 4
				THEN 'Ready'
				WHEN 5
				THEN 'Review'
				WHEN 6
				THEN 'Ready'
				WHEN 7
				THEN 'Pending'
				WHEN 9
				THEN CASE
					WHEN [IsEvidence] = 1 
					THEN 'Evidence'
					ELSE 'Current'
					END
				END AS [Status]
			FROM [dbo].[Items3]
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			ORDER BY [ItemID] DESC;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_Modules]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <April 24, 2019>
-- Description:	<Return all modules>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Get_Modules]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [ModuleID], [Name]
	FROM [dbo].[Modules]
	WHERE [ModuleType] = 0
	--WHERE [ModuleType] = 0 AND ModuleID IN (3,4,6,12)
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Get_ParentGroupID]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <July 13, 2018>
-- Description:	<Return ParentrGroupID for Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Get_ParentGroupID] 
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@ItemID int
AS
BEGIN
	SET NOCOUNT ON;

	IF @ModuleID = 3
		BEGIN
			SELECT [ParentGroupID]
			FROM [dbo].[Items3]
			WHERE [ItemID] = @ItemID
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SELECT [ParentGroupID]
			FROM [dbo].[Items4]
			WHERE [ItemID] = @ItemID
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SELECT [ParentGroupID]
			FROM [dbo].[Items6]
			WHERE [ItemID] = @ItemID
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SELECT [ParentGroupID]
			FROM [dbo].[Items12]
			WHERE [ItemID] = @ItemID
		END
	ELSE
		BEGIN
			SELECT [ParentGroupID]
			FROM [dbo].[Items14]
			WHERE [AIID] = @ItemID
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Insert_HistoryMemo]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/9/2017>
-- Description:	<Create Record History Memo>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Insert_HistoryMemo]
(
	@OrigID int,
	@Type int,
	@ModuleID int,
	@DataType tinyint,
	@HistoryMemo nvarchar(MAX)
)
AS

BEGIN
	-- Insert History
	INSERT INTO [dbo].[HistoryMemo]
		([OrigID], [Type], [ModuleID], [DataType], [MemoData])
	VALUES
		(@OrigID, @Type, @ModuleID, @DataType, @HistoryMemo)
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Move]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 22, 2020>
-- Description:	<Move Item/Group to destination>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Move]
	@ModuleID int,
	@OrigID int,
	@DestinationID int,
	@SourcePath nvarchar(500),
	@DestinationPath nvarchar(500),
	@UserID int,
	@IsGroup bit,
	@KeepProperties bit
AS
BEGIN
	SET NOCOUNT ON;

    
	DECLARE @CurrentDate DATETIME,@ItemName NVARCHAR(500),@ItemLabel NVARCHAR(500),@DestinationName NVARCHAR(500),@UserName NVARCHAR(500),@MemoData NVARCHAR(MAX),
		@ControlType INT,@TypeOfPublish INT,@PublishMode INT,@NeedPublish BIT,@NeedPublishToSP BIT,@IsLockedForPublish BIT,@PublishNow BIT,@PublishToSPNow BIT,
		@SPLocation NVARCHAR(500),@RoleControlType INT;

	SET @CurrentDate = GETDATE();
	SET @UserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	-- SET HISTORY MEMO
	IF @ModuleID = 1
		BEGIN
			SET @DestinationName = (SELECT [Name] FROM [dbo].[Groups1] WHERE [GroupID] = @DestinationID);
			IF @IsGroup = 1
				BEGIN
					SET @ItemName = (SELECT [Name] FROM [dbo].[Groups1] WHERE [GroupID] = @OrigID);					
				END
			ELSE
				BEGIN
					SET @ItemName = (SELECT TOP 1 [Name] FROM [dbo].[Items1] WHERE [OrigID] = @OrigID);
					SET @ItemLabel = (SELECT TOP 1 [LabelName] FROM [dbo].[Items1] WHERE [OrigID] = @OrigID);
				END
		END
	ELSE IF @ModuleID = 3		
		BEGIN
			SET @DestinationName = (SELECT [Name] FROM [dbo].[Groups3] WHERE [GroupID] = @DestinationID);
			IF @IsGroup = 1
				BEGIN
					SET @ItemName = (SELECT [Name] FROM [dbo].[Groups3] WHERE [GroupID] = @OrigID);					
				END
			ELSE
				BEGIN
					SET @ItemName = (SELECT TOP 1 [Name] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID);
					SET @ItemLabel = (SELECT TOP 1 [LabelName] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID);
				END
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @DestinationName = (SELECT [Name] FROM [dbo].[Groups4] WHERE [GroupID] = @DestinationID);
			IF @IsGroup = 1
				BEGIN
					SET @ItemName = (SELECT [Name] FROM [dbo].[Groups4] WHERE [GroupID] = @OrigID);					
				END
			ELSE
				BEGIN
					SET @ItemName = (SELECT TOP 1 [Name] FROM [dbo].[Items4] WHERE [OrigID] = @OrigID);
					SET @ItemLabel = (SELECT TOP 1 [LabelName] FROM [dbo].[Items4] WHERE [OrigID] = @OrigID);
				END
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @DestinationName = (SELECT [Name] FROM [dbo].[Groups6] WHERE [GroupID] = @DestinationID);
			IF @IsGroup = 1
				BEGIN
					SET @ItemName = (SELECT [Name] FROM [dbo].[Groups6] WHERE [GroupID] = @OrigID);					
				END
			ELSE
				BEGIN
					SET @ItemName = (SELECT TOP 1 [Name] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID);
					SET @ItemLabel = (SELECT TOP 1 [LabelName] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID);
				END
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @DestinationName = (SELECT [Name] FROM [dbo].[Groups12] WHERE [GroupID] = @DestinationID);
			IF @IsGroup = 1
				BEGIN
					SET @ItemName = (SELECT [Name] FROM [dbo].[Groups12] WHERE [GroupID] = @OrigID);					
				END
			ELSE
				BEGIN
					SET @ItemName = (SELECT TOP 1 [Name] FROM [dbo].[Items12] WHERE [OrigID] = @OrigID);
					SET @ItemLabel = (SELECT TOP 1 [LabelName] FROM [dbo].[Items12] WHERE [OrigID] = @OrigID);
				END
		END

	IF @IsGroup = 1
		BEGIN
			SET @MemoData = 'Related Name: ' + @ItemName + CHAR(13) + CHAR(13) +
				'User Name: ' + @UserName + CHAR(13) + 
				'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
				'Action: Moved From ' + @SourcePath + ' to ' + @DestinationPath + CHAR(13) + CHAR(13) + 
				'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

				IF (SELECT COUNT(*) FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 0) > 0
					BEGIN
						UPDATE [dbo].[HistoryMemo]
						SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
						WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 0;
					END
				ELSE
					BEGIN
						INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[DataType],[MemoData])
						SELECT @OrigID,0,@ModuleID,0,@MemoData;
					END
		END
	ELSE
		BEGIN
			SET @MemoData = 'Item Label: ' + @ItemLabel + CHAR(13) + 
				'User Name: ' + @UserName + CHAR(13) + 
				'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
				'Action: Moved from ' + @SourcePath + ' to ' + @DestinationPath + CHAR(13) + CHAR(13) + 
				'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

			IF (SELECT COUNT(*) FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1) > 0
				BEGIN
					UPDATE [dbo].[HistoryMemo]
					SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1;
				END
			ELSE
				BEGIN
					INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[DataType],[MemoData])
					SELECT @OrigID,1,@ModuleID,0,@MemoData;
				END
		END

	-- MOVE ITEM/GROUP
	IF @IsGroup = 1
		BEGIN
			IF @KeepProperties = 0
				BEGIN
					-- GET EVENT DATE SETTINGS
					DELETE FROM [dbo].[EventDate]
					WHERE [ModuleID] = @ModuleID AND [IDType] = 0 AND [OrigID] = @OrigID;

					INSERT INTO [dbo].[EventDate]([CatID],[ModuleID],[OrigID],[IDType],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],
						[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter],[StopCalculation])
					SELECT [CatID],[ModuleID],@OrigID,[IDType],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],
						[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter],[StopCalculation]
					FROM [dbo].[EventDate]
					WHERE [OrigID] = @DestinationID AND [ModuleID] = @ModuleID AND [IDType] = 0;
							
					-- GET CATEGORY SETTINGS
					DELETE FROM [dbo].[CatgryValues]
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [IDType] = 0;

					INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
					SELECT @OrigID,[IDType],[ModuleID],[CatID]
					FROM [dbo].[CatgryValues]
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @DestinationID AND [IDType] = 0;
											
					IF @ModuleID = 1
						BEGIN
							-- MOVE SELECTED FOLDER
							UPDATE [dbo].[Groups1]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 3
						BEGIN
							-- GET DESTINATION FOLDER SETTINGS
							SELECT @ControlType=[ControlType],@TypeOfPublish=[TypeOfPublish],@PublishMode=[PublishMode],@NeedPublish=[NeedPublish],@NeedPublishToSP=[NeedPublishToSP],
								@IsLockedForPublish=[IsLockedForPublish],@PublishNow=[PublishNow],@SPLocation=[SPLocation],@RoleControlType=[RoleControlType]
							FROM [dbo].[Groups3]
							WHERE [GroupID] = @DestinationID;

							-- SET DESTINATION FOLDER SETTINGS
							UPDATE [dbo].[Groups3]
							SET [ControlType]=@ControlType,[TypeOfPublish]=@TypeOfPublish,[PublishMode]=@PublishMode,[NeedPublish]=@NeedPublish,[NeedPublishToSP]=@NeedPublishToSP,
								[IsLockedForPublish]=@IsLockedForPublish,[PublishNow]=@PublishNow,[SPLocation]=@SPLocation,[RoleControlType]=@RoleControlType
							WHERE [GroupID] = @OrigID;

							-- MOVE SELECTED FOLDER
							UPDATE [dbo].[Groups3]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 4
						BEGIN
							-- MOVE SELECTED FOLDER
							UPDATE [dbo].[Groups4]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 6
						BEGIN
							-- MOVE SELECTED FOLDER
							UPDATE [dbo].[Groups6]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 12
						BEGIN
							-- MOVE SELECTED FOLDER
							UPDATE [dbo].[Groups12]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					
				END
			ELSE
				BEGIN
					IF @ModuleID = 1
						BEGIN
							UPDATE [dbo].[Groups1]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 3
						BEGIN
							UPDATE [dbo].[Groups3]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 4
						BEGIN
							UPDATE [dbo].[Groups4]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 6
						BEGIN
							UPDATE [dbo].[Groups6]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
					ELSE IF @ModuleID = 12
						BEGIN
							UPDATE [dbo].[Groups12]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [GroupID] = @OrigID;
						END
				END

		END
	ELSE
		BEGIN
			IF @KeepProperties = 0
				BEGIN
					-- GET EVENT DATE SETTINGS
					DELETE FROM [dbo].[EventDate]
					WHERE [ModuleID] = @ModuleID AND [IDType] = 1 AND [OrigID] = @OrigID;

					INSERT INTO [dbo].[EventDate]([CatID],[ModuleID],[OrigID],[IDType],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],
						[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter],[StopCalculation])
					SELECT [CatID],[ModuleID],@OrigID,1,[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],
						[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter],[StopCalculation]
					FROM [dbo].[EventDate]
					WHERE [OrigID] = @DestinationID AND [ModuleID] = @ModuleID AND [IDType] = 0;
							
					-- GET CATEGORY SETTINGS
					DELETE FROM [dbo].[CatgryValues]
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [IDType] = 1;

					INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
					SELECT @OrigID,1,[ModuleID],[CatID]
					FROM [dbo].[CatgryValues]
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @DestinationID AND [IDType] = 0;

					IF @ModuleID = 1
						BEGIN
							UPDATE [dbo].[Items1]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 3
						BEGIN
							-- GET DESTINATION FOLDER SETTINGS
							SELECT @ControlType=[ControlType],@TypeOfPublish=[TypeOfPublish],@PublishMode=[PublishMode],@NeedPublish=[NeedPublish],@NeedPublishToSP=[NeedPublishToSP],
								@IsLockedForPublish=[IsLockedForPublish],@PublishNow=[PublishNow],@SPLocation=[SPLocation],@RoleControlType=[RoleControlType]
							FROM [dbo].[Groups3]
							WHERE [GroupID] = @DestinationID;
							
							-- SET DESTINATION FOLDER SETTINGS TO ITEM
							UPDATE [dbo].[Items3]
							SET [TypeOfPublish]=@TypeOfPublish,[PublishMode]=@PublishMode,[NeedPublish]=@NeedPublish,[NeedPublishToSP]=@NeedPublishToSP,
								[IsLockedForPublish]=@IsLockedForPublish,[PublishNow]=@PublishNow,[SPLocation]=@SPLocation
							WHERE [OrigID] = @OrigID

							-- MOVE SELECTED ITEM
							UPDATE [dbo].[Items3]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 4
						BEGIN
							-- MOVE SELECTED ITEM
							UPDATE [dbo].[Items4]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 6
						BEGIN
							-- MOVE SELECTED ITEM
							UPDATE [dbo].[Items6]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 12
						BEGIN
							-- MOVE SELECTED ITEM
							UPDATE [dbo].[Items12]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
				END
			ELSE
				BEGIN
					IF @ModuleID = 1
						BEGIN
							UPDATE [dbo].[Items1]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 3
						BEGIN
							UPDATE [dbo].[Items3]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 4
						BEGIN
							UPDATE [dbo].[Items4]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 6
						BEGIN
							UPDATE [dbo].[Items6]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
					ELSE IF @ModuleID = 12
						BEGIN
							UPDATE [dbo].[Items12]
							SET [ParentGroupID] = @DestinationID, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [OrigID] = @OrigID;
						END
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Rename]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 14, 2020>
-- Description:	<Rename Item or Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Rename] 
	@ModuleID int,
	@OrigID int,
	@UserID int,
	@IsGroup bit,
	@OldName nvarchar(500),
	@OldLabel nvarchar(500),
	@NewName nvarchar(500),
	@NewLabel nvarchar(500)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CurrentDate DATETIME, @UserName NVARCHAR(500), @MemoData NVARCHAR(MAX);
	SET @CurrentDate = GETDATE();
	SET @UserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	-- SET HISTORYMEMO
	IF @IsGroup = 1
		BEGIN
			SET @MemoData = 'Related Name: ' + @OldName + CHAR(13) +
				'User Name: ' + @UserName + CHAR(13) + 
				'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
				'Action: Rename from ' + @OldName + ' to ' + @NewName + CHAR(13) + CHAR(13) + 
				'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

				IF (SELECT COUNT(*) FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 0) > 0
					BEGIN
						UPDATE [dbo].[HistoryMemo]
						SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
						WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 0;
					END
				ELSE
					BEGIN
						INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[DataType],[MemoData])
						SELECT @OrigID,0,@ModuleID,0,@MemoData;
					END				
		END
	ELSE
		BEGIN
			IF @NewName <> @OldName
				BEGIN
					SET @MemoData = 'Item Label: ' + @NewLabel + CHAR(13) + 
						'User Name: ' + @UserName + CHAR(13) + 
						'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
						'Action: Rename from ' + @OldName + ' to ' + @NewName + CHAR(13) + CHAR(13) + 
						'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

						UPDATE [dbo].[HistoryMemo]
						SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
						WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1;
				END
			IF @NewLabel <> @OldLabel
				BEGIN
					SET @MemoData = 'Item Label: ' + @NewLabel + CHAR(13) + 
						'User Name: ' + @UserName + CHAR(13) + 
						'Time: ' + CONVERT(VARCHAR, @CurrentDate, 22) + CHAR(13) +
						'Action: Rename label from ' + @OldLabel + ' to ' + @NewLabel + CHAR(13) + CHAR(13) + 
						'----------------------------------------------------------------------------' + CHAR(13) + CHAR(13);

						UPDATE [dbo].[HistoryMemo]
						SET [MemoData] = @MemoData + CONVERT(NVARCHAR(MAX), [MemoData])
						WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1;
				END
		END
	
	-- RENAME ITEM/GROUP
	IF @ModuleID = 1
		BEGIN
			IF @IsGroup = 1
				BEGIN
					UPDATE [dbo].[Groups1]
					SET [Name] = @NewName, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] = @OrigID;	
				END
			ELSE
				BEGIN
					UPDATE [dbo].[Items1]
					SET [Name] = @NewName, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;	
				END
		END
    ELSE IF @ModuleID = 3
		BEGIN
			IF @IsGroup = 1
				BEGIN
					UPDATE [dbo].[Groups3]
					SET [Name] = @NewName, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] = @OrigID;					
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items3]
					SET [Name] = @NewName, [LabelName] = @NewLabel, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
	ELSE IF @ModuleID = 4
		BEGIN
			IF @IsGroup = 1
				BEGIN
					UPDATE [dbo].[Groups4]
					SET [Name] = @NewName, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] = @OrigID;					
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items4]
					SET [Name] = @NewName, [LabelName] = @NewLabel, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF @IsGroup = 1
				BEGIN
					UPDATE [dbo].[Groups6]
					SET [Name] = @NewName, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] = @OrigID;					
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items6]
					SET [Name] = @NewName, [LabelName] = @NewLabel, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
	ELSE IF @ModuleID = 12
		BEGIN
			IF @IsGroup = 1
				BEGIN
					UPDATE [dbo].[Groups12]
					SET [Name] = @NewName, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [GroupID] = @OrigID;					
				END
			ELSE
				BEGIN					
					UPDATE [dbo].[Items12]
					SET [Name] = @NewName, [LabelName] = @NewLabel, [LastModified] = @CurrentDate, [ModifiedBy] = @UserName, [ModifierID] = @UserID
					WHERE [OrigID] = @OrigID;					
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Set_Republish]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 28, 2021>
-- Description:	<Set republish>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Set_Republish]
	@ID int,
	@UserID int,
	@IsGroup bit
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @UserFullName NVARCHAR(255),@Date DATETIME;
	DECLARE @TempTable TABLE ([GroupID] INT);

	SET @UserFullName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @UserID);
	SET @Date = GETDATE();

	IF @IsGroup = 1
		BEGIN
			;WITH cte AS 
			(
				SELECT [GroupID]
				FROM [dbo].[Groups3]
				WHERE ([ParentGroupID] = @ID OR [GroupID] = @ID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups3] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
			)
			INSERT INTO @TempTable
			SELECT [GroupID] FROM cte;

			-- Republish All Groups			
			UPDATE [Groups3]
			SET [PublishNow] = 1,[LastModified] = @Date,[ModifiedBy] = @UserFullName,[ModifierID] = @UserID
			WHERE [GroupID] IN (SELECT DISTINCT [GroupID] FROM @TempTable) AND [TypeOfPublish] <> 0;

			-- Republish All Sub-Items
			UPDATE [Items3]
			SET [PublishNow] = 1,[LastModified] = @Date,[ModifiedBy] = @UserFullName,[ModifierID] = @UserID
			WHERE [ParentGroupID] IN (SELECT DISTINCT [GroupID] FROM @TempTable) AND [TypeOfPublish] <> 0;

		END
	ELSE
		BEGIN
			UPDATE [Items3]
			SET [PublishNow] = 1,[LastModified] = @Date,[ModifiedBy] = @UserFullName,[ModifierID] = @UserID
			WHERE [OrigID] = @ID AND [TypeOfPublish] <> 0;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Trigger_Event]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Jan 22, 2018>
-- Description:	<Trigger an Event Action Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Trigger_Event] 
(
	@ParentGroupID int,
	@AIType int,
	@ParentID int,
	@Name nvarchar(255),
	@Details nvarchar(4000),
	@Status int,
	@ModuleID int,
	@EventID int,
	@UserID int,
	@UserName nvarchar(255),
	@SenderName nvarchar(255),
	@SenderID int,
	@SendDate datetime,
	@DateDue datetime,
	@Priority int,
	@CompleteDate datetime,
	@ResultID int,
	@ResultName nvarchar(255),
	@Comments nvarchar(4000),
	@ShowMeEnabled bit,
	@ShowGroupID int,
	@ShowID int,
	@ShowIsItemID bit,
	@ShowType int,
	@ShowModuleID int,
	@ShowAction int,
	@DateSet datetime,
	@IsRegReminder bit,
	@RegReminderDay int,
	@RegReminderDate datetime,
	@IsFinalReminder bit,
	@FinalReminderDate datetime,
	@NotifyOverDueEventID bit,
	@NotifyOverDueDate datetime,
	@NotifyCompletedEventID int,
	@Archive bit,
	@UrgentEmail int,
	@SendEmailCmpltAI int,
	@NextStartDate datetime,
	@SchedRepeat int,
	@SchedIntervalType int,
	@SchedRepeatNumber int,
	@SchedUntilDate datetime,
	@SchedStatus smallint,
	@IsDeleted bit,
	@OptionSet nvarchar(255),
	@NotifiedStatus smallint,
	@ModifiedBy nvarchar(255),
	@LastModified datetime,
	@ModifierID int
)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[Items14]
		([ParentGroupID], [AIType], [ParentID], [Name], [Details], [Status], [ModuleID], [EventID], [UserID], [UserName], [SenderName],
		[SenderID], [SendDate], [DateDue], [Priority], [CompleteDate], [ResultID], [ResultName], [Comments], [ShowMeEnabled], [ShowGroupID], [ShowID], 
		[ShowIsItemID], [ShowType], [ShowModuleID], [ShowAction], [DateSet], [IsRegReminder], [RegReminderDay], [RegReminderDate], [IsFinalReminder],
		[FinalReminderDate], [NotifyOverDueEventID], [NotifyOverDueDate], [NotifyCompletedEventID], [Archive], [UrgentEMail], [SendEmailCmpltAI],
		[NextStartDate], [SchedRepeat], [SchedIntervalType], [SchedRepeatNumber], [SchedUntilDate], [SchedStatus], [IsDeleted], [OptionSet],
		[NotifiedStatus], [ModifiedBy], [LastModified], [ModifierID])
	VALUES
		(@ParentGroupID, @AIType, @ParentID, @Name, @Details, @Status, @ModuleID, @EventID, @UserID, @UserName, @SenderName, 
		@SenderID, @SendDate, @DateDue, @Priority, @CompleteDate, @ResultID, @ResultName, @Comments, @ShowMeEnabled, @ShowGroupID,
		@ShowID, @ShowIsItemID, @ShowType, @ShowModuleID, @ShowAction, @DateSet, @IsRegReminder, @RegReminderDay, @RegReminderDate,
		@IsFinalReminder, @FinalReminderDate, @NotifyOverDueEventID, @NotifyOverDueDate, @NotifyCompletedEventID, @Archive,
		@UrgentEmail, @SendEmailCmpltAI, @NextStartDate, @SchedRepeat, @SchedIntervalType, @SchedRepeatNumber, @SchedUntilDate,
		@SchedStatus, @IsDeleted, @OptionSet, @NotifiedStatus, @ModifiedBy, @LastModified, @ModifierID)
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Trigger_Events]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 25, 2020>
-- Description:	<Trigger Events>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Trigger_Events]
	@EventID int,
	@ShowGroupID int,
	@ShowModuleID int,
	@ShowID int,
	@UserName nvarchar(255),
	@UserID int
AS
BEGIN

	SET NOCOUNT ON;

    DECLARE @ControlID INT, 
		@ControlFullName NVARCHAR(255), 
		@ControlType INT,
		@RoleMemberControlID INT,
		@RoleMemberControlFullName NVARCHAR(255),
		@RoleMemberControlType INT,
		@SubEntityControlID INT,
		@SubEntityControlFullName NVARCHAR(255),
		@SubEntityControlType INT,
		@ItemName NVARCHAR(255), 
		@ItemLabel NVARCHAR(255), 
		@EventIndexID INT, 
		@AITitle NVARCHAR(255), 
		@AIDetails VARCHAR(MAX),
		@AIAction NVARCHAR(255),
		@DateSet DATETIME,
		@DueDate DATETIME;

	SET @DateSet = GETDATE();
	SET @DueDate = DATEADD(DAY, (SELECT [DaysToComplete] FROM [dbo].[AIEventSet] WHERE [EventID] = @EventID), @DateSet);


	-- GET RELATED ITEM DETAILS
	SET @ItemName = (SELECT CASE @ShowModuleID
			WHEN 3 THEN (SELECT [Name] FROM [dbo].[Items3] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			WHEN 4 THEN (SELECT [Name] FROM [dbo].[Items4] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			WHEN 6 THEN (SELECT [Name] FROM [dbo].[Items6] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			WHEN 12 THEN (SELECT [Name] FROM [dbo].[Items12] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
		END);

	SET @ItemLabel = (SELECT CASE @ShowModuleID
			WHEN 3 THEN (SELECT [LabelName] FROM [dbo].[Items3] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			WHEN 4 THEN (SELECT [LabelName] FROM [dbo].[Items4] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			WHEN 6 THEN (SELECT [LabelName] FROM [dbo].[Items6] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			WHEN 12 THEN (SELECT [LabelName] FROM [dbo].[Items12] WHERE [ItemID] = @ShowID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
		END);

	-- GET EVENT DETAILS
	SET @EventIndexID = (SELECT [EventIndexID] FROM [AIEventSet] WHERE [EventID] = @EventID);
	IF @EventIndexID = 1
		SET @AIAction = 'Imported new item'
	ELSE IF @EventIndexID = 17
		SET @AIAction = 'Converted to Review'
	ELSE IF @EventIndexID = 18
		SET @AIAction = 'Converted to Draft'
	ELSE IF @EventIndexID = 19
		SET @AIAction = 'Converted to Current'
	ELSE IF @EventIndexID = 20
		SET @AIAction = 'Converted to Ready'
	ELSE IF @EventIndexID = 21
		SET @AIAction = 'Converted to Pending'
	ELSE IF @EventIndexID = 22
		SET @AIAction = 'Converted to Collaborate'


	SET @AITitle = (SELECT [Name] FROM [dbo].[AIEventSet] WHERE [EventID] = @EventID) + ' - ' + @ItemName;
	SET @AIDetails = (SELECT CONVERT(VARCHAR(MAX), [Details]) FROM [dbo].[AIEventSet] WHERE [EventID] = @EventID) + CHAR(13) +
		'---------------------------------------' + CHAR(13) +
		'Item Label: ' + @ItemLabel + CHAR(13) +
		'User Name: ' + @UserName + CHAR(13) +
		'Time: ' + CONVERT(VARCHAR, @DateSet, 22) + CHAR(13) +
		'Action: ' + @AIAction + ' - [' + @ItemName + ']';

	DECLARE assigned_cursor CURSOR FOR
		SELECT [ControlID], [ControlFullName], [ControlType]
		FROM [dbo].[ControlLists]
		WHERE [ModuleID] = 14 AND [OrigID] = @EventID AND [ListClass] = 14;

	OPEN assigned_cursor;
	FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlFullName, @ControlType
	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @ControlType = 1 --USER
				BEGIN
					INSERT INTO [dbo].[Items14]([ParentGroupID],[Name],[Details],[Status],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
						[Priority],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowModuleID],[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],
						[NotifiedStatus],[EscalateStatus],[EscalateDate])
					SELECT 2,@AITitle,@AIDetails,2,@EventID,@ControlID,@ControlFullName,@UserName,@UserID,@DateSet,@DueDate,
						[Priority],1,@ShowGroupID,@ShowID,0,@ShowModuleID,[IsRegReminder],[RegReminderDay],DATEADD(DAY, CASE [RegReminderDay] WHEN NULL THEN 0 ELSE [RegReminderDay] END, @DateSet),[IsFinalReminder],DATEADD(DAY, -(CASE [FinalReminderDay] WHEN NULL THEN 0 ELSE [FinalReminderDay] END), @DueDate),
						2,[IsEscalateSet],CASE [IsEscalateSet] WHEN 1 THEN DATEADD(DAY, [EscalateNum], @DueDate) ELSE CONVERT(DATETIME, '1900-01-01 00:00:01') END
					FROM [dbo].[AIEventSet]
					WHERE [EventID] = @EventID;
				END
			IF @ControlType = 6 --ENTITY
				BEGIN					
					DECLARE user_cursor CURSOR FOR
						WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups1]
							WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups1] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
						)
						SELECT [ControlID], [ControlFullName], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [OrigID] IN (SELECT DISTINCT [GroupID] FROM cte)
						GROUP BY [ControlID], [ControlFullName], [ControlType];

						OPEN user_cursor
						FETCH NEXT FROM user_cursor INTO @ControlID, @ControlFullName, @ControlType
						WHILE @@FETCH_STATUS = 0
							BEGIN
								INSERT INTO [dbo].[Items14]([ParentGroupID],[Name],[Details],[Status],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
									[Priority],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowModuleID],[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],
									[NotifiedStatus],[EscalateStatus],[EscalateDate])
								SELECT 2,@AITitle,@AIDetails,2,@EventID,@ControlID,@ControlFullName,@UserName,@UserID,@DateSet,@DueDate,
									[Priority],1,@ShowGroupID,@ShowID,0,@ShowModuleID,[IsRegReminder],[RegReminderDay],DATEADD(DAY, CASE [RegReminderDay] WHEN NULL THEN 0 ELSE [RegReminderDay] END, @DateSet),[IsFinalReminder],DATEADD(DAY, -(CASE [FinalReminderDay] WHEN NULL THEN 0 ELSE [FinalReminderDay] END), @DueDate),
									2,[IsEscalateSet],CASE [IsEscalateSet] WHEN 1 THEN DATEADD(DAY, [EscalateNum], @DueDate) ELSE CONVERT(DATETIME, '1900-01-01 00:00:01') END
								FROM [dbo].[AIEventSet]
								WHERE [EventID] = @EventID;

								FETCH NEXT FROM user_cursor INTO @ControlID, @ControlFullName, @ControlType;
							END
						CLOSE user_cursor;
						DEALLOCATE user_cursor;
				END
			IF @ControlType = 5 --ROLE
				BEGIN					
					DECLARE member_cursor CURSOR FOR
						SELECT [ControlID], [ControlFullName], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = @ShowModuleID AND [OrigID] = @ShowGroupID AND [IsGroup] = 1 AND [CatID] = @ControlID

						OPEN member_cursor
						FETCH NEXT FROM member_cursor INTO @RoleMemberControlID, @RoleMemberControlFullName, @RoleMemberControlType
						WHILE @@FETCH_STATUS = 0
							BEGIN
								IF @RoleMemberControlType = 1
									BEGIN
										INSERT INTO [dbo].[Items14]([ParentGroupID],[Name],[Details],[Status],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
											[Priority],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowModuleID],[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],
											[NotifiedStatus],[EscalateStatus],[EscalateDate])
										SELECT 2,@AITitle,@AIDetails,2,@EventID,@RoleMemberControlID,@RoleMemberControlFullName,@UserName,@UserID,@DateSet,@DueDate,
											[Priority],1,@ShowGroupID,@ShowID,0,@ShowModuleID,[IsRegReminder],[RegReminderDay],DATEADD(DAY, CASE [RegReminderDay] WHEN NULL THEN 0 ELSE [RegReminderDay] END, @DateSet),[IsFinalReminder],DATEADD(DAY, -(CASE [FinalReminderDay] WHEN NULL THEN 0 ELSE [FinalReminderDay] END), @DueDate),
											2,[IsEscalateSet],CASE [IsEscalateSet] WHEN 1 THEN DATEADD(DAY, [EscalateNum], @DueDate) ELSE CONVERT(DATETIME, '1900-01-01 00:00:01') END
										FROM [dbo].[AIEventSet]
										WHERE [EventID] = @EventID;
									END
								ELSE
									BEGIN
										DECLARE subuser_cursor CURSOR FOR
											WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups1]
												WHERE [ParentGroupID] = @RolememberControlID OR [GroupID] = @RoleMemberControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups1] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
											)
											SELECT [ControlID], [ControlFullName], [ControlType]
											FROM [dbo].[ControlLists]
											WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [OrigID] IN (SELECT DISTINCT [GroupID] FROM cte)
											GROUP BY [ControlID], [ControlFullName], [ControlType];

											OPEN subuser_cursor
											FETCH NEXT FROM subuser_cursor INTO @SubEntityControlID, @SubEntityControlFullName, @SubEntityControlType
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO [dbo].[Items14]([ParentGroupID],[Name],[Details],[Status],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
														[Priority],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowModuleID],[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],
														[NotifiedStatus],[EscalateStatus],[EscalateDate])
													SELECT 2,@AITitle,@AIDetails,2,@EventID,@SubEntityControlID,@SubEntityControlFullName,@UserName,@UserID,@DateSet,@DueDate,
														[Priority],1,@ShowGroupID,@ShowID,0,@ShowModuleID,[IsRegReminder],[RegReminderDay],DATEADD(DAY, CASE [RegReminderDay] WHEN NULL THEN 0 ELSE [RegReminderDay] END, @DateSet),[IsFinalReminder],DATEADD(DAY, -(CASE [FinalReminderDay] WHEN NULL THEN 0 ELSE [FinalReminderDay] END), @DueDate),
														2,[IsEscalateSet],CASE [IsEscalateSet] WHEN 1 THEN DATEADD(DAY, [EscalateNum], @DueDate) ELSE CONVERT(DATETIME, '1900-01-01 00:00:01') END
													FROM [dbo].[AIEventSet]
													WHERE [EventID] = @EventID;

													FETCH NEXT FROM subuser_cursor INTO @SubEntityControlID, @SubEntityControlFullName, @SubEntityControlType;
												END
											CLOSE subuser_cursor;
											DEALLOCATE subuser_cursor;
									END
								FETCH NEXT FROM member_cursor INTO @RoleMemberControlID, @RoleMemberControlFullName, @RoleMemberControlType
							END
						CLOSE member_cursor
						DEALLOCATE member_cursor
				END
			FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlFullName, @ControlType
		END
	CLOSE assigned_cursor;
	DEALLOCATE assigned_cursor;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Update_Group_History]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Update_Group_History]
	@ModuleID int,
	@GroupID int,
	@ItemName nvarchar(255),
	@ItemLabel nvarchar(255),
	@TaskName nvarchar(255),
	@TaskType int,
	@UserName nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Details VARCHAR(MAX);
	IF @TaskType = 0 -- Item Edited
		BEGIN
			SET @Details = 'Item Label: ' + @ItemLabel + CHAR(13) +
			'Username: ' + @UserName + CHAR(13) +
			'Time: ' + CONVERT(VARCHAR, GETDATE(), 22) + CHAR(13) + 
			'Action: ' + @TaskName + ' [' + @ItemName + ']' + CHAR(13) + CHAR(13) +
			'****************************************************************'
		END
	ELSE IF @TaskType = 1 -- Roles changed
		BEGIN
			SET @Details = 'Following property has been changed by ' + @UserName + ' (' + CONVERT(VARCHAR, GETDATE(), 22) + ')' + CHAR(13) +
			'1. Role has been changed.' + CHAR(13) + CHAR(13) +
			'****************************************************************'
		END

	IF (SELECT COUNT([OrigID]) FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [Type] = 0) > 0
		BEGIN
			UPDATE [dbo].[HistoryMemo]
			SET [MemoData] = @Details + CHAR(13) + Char(13) + CONVERT(VARCHAR(MAX), [MemoData])
			WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [Type] = 0;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[MemoData])
			VALUES(@GroupID,0,@ModuleID,@Details);
		END
		    
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Default_Update_HistoryMemo]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Jun 9, 2017>
-- Description:	<Retrieve Record History Memo>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Default_Update_HistoryMemo]
(
	@OrigID int,
	@ModuleID int,
	@HistoryMemo nvarchar(MAX)
)
AS

BEGIN
	SET NOCOUNT ON;
	-- Update History
	UPDATE [dbo].[HistoryMemo]
	SET [MemoData] = @HistoryMemo
	WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = 1;
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Add_Event_Dates]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reynoe>
-- Create date: <March 30, 2020>
-- Description:	<Add Event Dates from Parent Folder to new Document>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Add_Event_Dates]
	@ItemID int,
	@GroupID int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[EventDate]([CatID],[ModuleID],[OrigID],[IDType],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter],[StopCalculation])
	SELECT [CatID],3,@ItemID,1,[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter],[StopCalculation]
	FROM [dbo].[EventDate]
	WHERE [ModuleID] = 3 AND [IDType] = 0 AND [OrigID] = @GroupID

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Add_Roles_To_New_Document]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 24, 2020>
-- Description:	<Inherit Role Members from Parent Folder when Adding Document>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Add_Roles_To_New_Document]
	@GroupID int,
	@OrigID int,
	@UserFullName nvarchar(255),
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CatID INT, @ControlID INT, @ControlFullName NVARCHAR(255), @ControlType INT, @DateVar DATETIME;

	SET @DateVar = GETDATE();

    -- INHERIT ROLES FROM PARENT GROUP
	DECLARE group_roles CURSOR FOR
		SELECT [CatID], [ControlID], [ControlFullName], [ControlType]
		FROM [dbo].[ControlLists]
		WHERE [ModuleID] = 3 AND [OrigID] = @GroupID AND [IsGroup] = 1;

	OPEN group_roles;
	FETCH NEXT FROM group_roles INTO @CatID, @ControlID, @ControlFullName, @ControlType;

	WHILE @@FETCH_STATUS = 0
		BEGIN

			INSERT INTO [dbo].[ControlLists]([OrigID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
			VALUES (@OrigID,0,5,3,@CatID,@ControlID,@ControlFullName,@ControlType,@UserFullName,@UserID,@DateVar);

			FETCH NEXT FROM group_roles INTO @CatID, @ControlID, @ControlFullName, @ControlType;
		END

	CLOSE group_roles;
	DEALLOCATE group_roles;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Cancel_Checkout]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Sept 19, 2018>
-- Description:	<Cancel Checkout of document>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Cancel_Checkout]
(
	@ItemID int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OrigID INT
	SET @OrigID = (SELECT [OrigID] FROM [dbo].[Items3] WHERE [ItemID] = @ItemID)

    UPDATE [dbo].[Items3]
	SET [IsCheckedOut] = 0
	WHERE [OrigID] = @OrigID
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Create_Document]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <March 23, 2020>
-- Description:	<Add new document>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Create_Document]
(
	@GroupID INT,
	@Name NVARCHAR(255),
	@FileExtension NVARCHAR(10),
	@Status INT,
	@IsEvidence BIT,
	@LabelName NVARCHAR(255),
	@TypeOfPublish INT,
	@PublishMode INT,
	@NeedPublish BIT,
	@NeedPublishToSP BIT,
	@IsLockedForPublish BIT,
	@PublishNow BIT,
	@PublishToSPNow BIT,
	@SPLocation NVARCHAR(450),
	@UserID INT,
	@UserFullName NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DateVar DATETIME, @NewItemID INT
	SET @DateVar = GETDATE();

	-- INSERT NEW ROW
	INSERT INTO [dbo].[Items3]([OrigID],[ParentGroupID],[Name],[FileExtension],[HasPLink],[Status],[IsEvidence],[Version],[IsCheckedOut],[IsDeleted],[TypeOfPublish],[PublishMode],[NeedPublish],
		[NeedPublishToSP],[IsLockedForPublish],[VersionDate],[VersionedBy],[VersionedByID],[LabelName],[CreateBy],[CreateDate],[ModifiedBy],[LastModified],[CreatorID],
		[ModifierID],[PublishNow],[PublishToSPNow],[SPLocation])
	OUTPUT inserted.[ItemID]
	VALUES(0,@GroupID,@Name,@FileExtension,0,@Status,@IsEvidence,'0',0,0,@TypeOfPublish,@PublishMode,@NeedPublish,@NeedPublishToSP,@IsLockedForPublish,@DateVar,@UserFullName,@UserID,@LabelName,@UserFullName,
		@DateVar,@UserFullName,@DateVar,@UserID,@UserID,@PublishNow,@PublishToSPNow,@SPLocation)

	-- UPDATE NEW ROW FOR OrigID
	SET @NewItemID = SCOPE_IDENTITY()
	UPDATE [dbo].[Items3]
	SET [OrigID] = @NewItemID
	WHERE [ItemID] = @NewItemID

	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Create_Document2]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <March 23, 2020>
-- Description:	<Add new document>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Create_Document2]
(
	@GroupID INT,
	@Name NVARCHAR(255),
	@FileExtension NVARCHAR(10),
	@Status INT,
	@IsEvidence BIT,
	@LabelName NVARCHAR(255),
	@UserID INT,
	@UserFullName NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DateVar DATETIME, 
		@NewItemID INT, 
		@TypeOfPublish INT, 
		@PublishMode INT, 
		@NeedPublish BIT, 
		@NeedPublishToSP BIT, 
		@IsLockedForPublish BIT, 
		@PublishNow BIT, 
		@PublishToSPNow BIT, 
		@SPLocation NVARCHAR(450),
		@GroupOptionSet NVARCHAR(255),
		@DocumentCount INT,
		@NewName NVARCHAR(255),
		@NewLabel NVARCHAR(255)
	
	DECLARE @Table TABLE ([OrigID] INT);
	SET @DateVar = GETDATE();
	SELECT @TypeOfPublish = [TypeOfPublish], 
		@PublishMode = [PublishMode], 
		@NeedPublish = [NeedPublish], 
		@NeedPublishToSP = [NeedPublishToSP], 
		@IsLockedForPublish = [IsLockedForPublish], 
		@SPLocation = [SPLocation]
	FROM [dbo].[Groups3]
	WHERE [GroupID] = @GroupID

	SET @PublishNow = 0;
	SET @PublishToSPNow = 0;

	IF @Status IN (3,4,5,6,7,9)
		BEGIN
			IF @TypeOfPublish > 0
				BEGIN
					IF @NeedPublishToSP = 1
						BEGIN
							SET @PublishToSPNow = 1
						END
					SET @PublishNow = 1
				END
		END

	-- INSERT NEW ROW
	INSERT INTO [dbo].[Items3]([OrigID],[ParentGroupID],[Name],[FileExtension],[HasPLink],[Status],[IsEvidence],[Version],[IsCheckedOut],[IsDeleted],[TypeOfPublish],[PublishMode],[NeedPublish],
		[NeedPublishToSP],[IsLockedForPublish],[VersionDate],[VersionedBy],[VersionedByID],[LabelName],[CreateBy],[CreateDate],[ModifiedBy],[LastModified],[CreatorID],
		[ModifierID],[PublishNow],[PublishToSPNow],[SPLocation])
	OUTPUT inserted.[ItemID]
	VALUES(0,@GroupID,@Name,@FileExtension,0,@Status,@IsEvidence,'0',0,0,@TypeOfPublish,@PublishMode,@NeedPublish,@NeedPublishToSP,@IsLockedForPublish,@DateVar,@UserFullName,@UserID,@LabelName,@UserFullName,
		@DateVar,@UserFullName,@DateVar,@UserID,@UserID,@PublishNow,@PublishToSPNow,@SPLocation)

	-- UPDATE NEW ROW FOR OrigID
	SET @NewItemID = SCOPE_IDENTITY()
	UPDATE [dbo].[Items3]
	SET [OrigID] = @NewItemID
	WHERE [ItemID] = @NewItemID

	SET @GroupOptionSet = (SELECT [OptionSet] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID)
	IF CHARINDEX('1_6', @GroupOptionSet) > 0
		BEGIN
			IF @Name LIKE '%(*)%'
				BEGIN
					SET @NewName = (SELECT REPLACE(@Name, '(*)', (SELECT RIGHT('00000000' + CONVERT(VARCHAR, @NewItemID), 8))))
					UPDATE [dbo].[Items3]
					SET [Name] = @NewName
					WHERE [OrigID] = @NewItemID;
				END
			IF @Name LIKE '%(?)%'
				BEGIN					
					INSERT INTO @Table SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @GroupID GROUP BY [OrigID];
					SET @DocumentCount = (SELECT COUNT([OrigID]) FROM @Table);
					SET @NewName = (SELECT REPLACE(@Name, '(?)', CONVERT(VARCHAR, @DocumentCount)));
					UPDATE [dbo].[Items3]
					SET [Name] = @NewName
					WHERE [OrigID] = @NewItemID;
					DELETE FROM @Table;
				END

			-- IF AUTOLABEL, UPDATE LabelName with autotext specifications
			IF @LabelName LIKE '%(*)%'
				BEGIN
					SET @NewLabel = (SELECT REPLACE(@LabelName, '(*)', (SELECT RIGHT('00000000' + CONVERT(VARCHAR, @NewItemID), 8))));
					UPDATE [dbo].[Items3]
					SET [LabelName] = @NewLabel
					WHERE [OrigID] = @NewItemID;
				END
			IF @LabelName LIKE '%(?)%'
				BEGIN
					INSERT INTO @Table SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @GroupID GROUP BY [OrigID];
					SET @DocumentCount = (SELECT COUNT([OrigID]) FROM @Table);
					SET @NewLabel = (SELECT REPLACE(@LabelName, '(?)', CONVERT(NVARCHAR(10), @DocumentCount)));
					UPDATE [dbo].[Items3]
					SET [LabelName] = @NewLabel
					WHERE [OrigID] = @NewItemID;
					DELETE FROM @Table;
					PRINT 'Label'
				END
		END

	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_Document]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 4, 2020>
-- Description:	<Retrieve Document Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Get_Document]
(
	@ItemID int,
	@IsItemID bit,
	@Status int
)
AS

BEGIN
	SET NOCOUNT ON;

	IF @IsItemID = 0
		BEGIN
			SELECT *, 'D' + Right(Replicate('0',7) + convert(varchar(7), [ItemID]), 7) AS [ItemIDFileName], 
				'D' + Right(Replicate('0',7) + convert(varchar(7), [OrigID]), 7) AS [OrigIDFileName],
				CASE [Status]
					WHEN 0 THEN 'OBSOLETE'
					WHEN 2 THEN 'DRAFT'
					WHEN 3 THEN 'COLLABORATE'
					WHEN 5 THEN 'UNDER REVIEW'
					WHEN 6 THEN 'READY'
					WHEN 7 THEN 'PENDING'
					WHEN 9 THEN (SELECT CASE [IsEvidence] WHEN 1 THEN 'EVIDENCE' ELSE 'CURRENT' END)
				END AS [StatusText]
			FROM [Items3]
			WHERE [Status] = @Status AND [OrigID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
		END
	ELSE
		BEGIN
			SELECT *, 'D' + Right(Replicate('0',7) + convert(varchar(7), [ItemID]), 7) AS [ItemIDFileName],
				'D' + Right(Replicate('0',7) + convert(varchar(7), [OrigID]), 7) AS [OrigIDFileName],
				CASE [Status]
					WHEN 0 THEN 'OBSOLETE'
					WHEN 2 THEN 'DRAFT'
					WHEN 3 THEN 'COLLABORATE'
					WHEN 5 THEN 'UNDER REVIEW'
					WHEN 6 THEN 'READY'
					WHEN 7 THEN 'PENDING'
					ELSE 'CURRENT'
				END AS [StatusText]
			FROM [Items3]
			WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
		END

	SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_Event]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <2018/01/23>
-- Description:	<Get Document Trigger Event>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Get_Event]
(
	@EventIndexID int,
	@RelatedID int,
	@RelatedModuleID int
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[AIEventSet]
	WHERE [EventIndexID] = @EventIndexID AND [RelatedID] = @RelatedID AND [RelatedModuleID] = @RelatedModuleID
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_EventAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Jan 23, 2018>
-- Description:	<Retrieve Action Item Recipients for an Item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Get_EventAssigned]
(
	@OrigID int
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT [ControlID], [ControlFullName], [ObjTypeID], [ListClass], [ControlType]
	FROM [dbo].[ControlLists]
	WHERE [ModuleID] = 14 AND [ListClass] = 14 AND [OrigID] = @OrigID;
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_Latest]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Apr 11, 2018>
-- Description:	<Retrieve Most Recent Document Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Get_Latest]
(
	@OrigID INT
)
AS

BEGIN
	SELECT TOP 1 *
	FROM [dbo].[Items3]
	WHERE [OrigiD] = @OrigID
	ORDER BY [ItemID] DESC
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_PTitleMember]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Apr 9, 2018>
-- Description:	<Retrieve Position Title Members for Documents>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Get_PTitleMember]
	@OrigID INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TempTable TABLE
	(
		[ControlID] INT,
		[ControlFullName] NVARCHAR(255)
	);

	WITH cte AS
	(
		SELECT [GroupID]
		FROM [dbo].[Groups1]
		WHERE ([ParentGroupID] = @OrigID OR [GroupID] = @OrigID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
		UNION ALL
		SELECT a.[GroupID]
		FROM [dbo].[Groups1] AS a
		INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
		WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
	)
	INSERT INTO @TempTable
	SELECT [ControlID], [ControlFullName]
	FROM [dbo].[ControlLists]
	WHERE [ModuleID] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte);

	SELECT * FROM @TempTable;

 --   SELECT [ControlID], [ControlFullName]
	--FROM [dbo].[ControlLists]
	--WHERE [ModuleID] = 1 AND [OrigID] = @OrigID
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Get_RoleMember]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Apr 9, 2018>
-- Description:	<Retrieve Role Members for Documents>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Get_RoleMember]
(
	@CatID int,
	@OrigID int
)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [ControlID], [ControlFullName], [ControlType]
	FROM [dbo].[ControlLists]
	WHERE [CatID] = @CatID AND [OrigID] = @OrigID
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Update_CheckInOut]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Mar 7, 2018>
-- Description:	<Update Checkout/CheckIn status of Draft file>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Update_CheckInOut]
(
	@ItemID int,
	@UserFullName nvarchar(255),
	@CheckStatus int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OrigID INT
	SET @OrigID = (SELECT [OrigID] FROM [dbo].[Items3] WHERE [ItemID] = @ItemID)

    IF @CheckStatus = 1
		BEGIN
			UPDATE [dbo].[Items3]
			SET [IsCheckedOut] = @CheckStatus, [CheckedOutBy] = @UserFullName, [CheckedOutDate] = GETDATE()
			WHERE [OrigID] = @OrigID
		END
	ELSE
		BEGIN		
			UPDATE [dbo].[Items3]
			SET [IsCheckedOut] = 0
			WHERE [OrigID] = @OrigID
		END
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Document_Update_InsertFieldValues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 11, 2020>
-- Description:	<Update InsertFieldValues table>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Document_Update_InsertFieldValues]
	@OrigID int,
	@CatID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Update InsertFieldValues
	DECLARE @FieldValues NVARCHAR(MAX);
	IF @OrigID IN (SELECT [OrigID] FROM [dbo].[InsertFieldValues] WHERE [RoleCatID] = @CatID AND [SubType] = 1 GROUP BY [OrigID])
		BEGIN
			UPDATE [dbo].[InsertFieldValues]
			SET [FieldValues] = 
			(
				SELECT STUFF((SELECT ',' + [ControlFullName]
				FROM [dbo].[ControlLists]
				WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 1
				GROUP BY [ControlFullName]
				ORDER BY [ControlFullName]
				FOR XML PATH('')), 1, 1, '') [FieldValues]
			)
			WHERE [RoleCatID] = @CatID AND [OrigID] = @OrigID AND [SubType] = 1
		END
	ELSE
		BEGIN
			SET @FieldValues = 
			(
				SELECT STUFF((SELECT ',' + [ControlFullName]
				FROM [dbo].[ControlLists]
				WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 1
				GROUP BY [ControlFullName]
				ORDER BY [ControlFullName]
				FOR XML PATH('')), 1, 1, '')
			)
	
			INSERT INTO [dbo].[InsertFieldValues]([ItemID],[RoleCatID],[SubType],[OrigID],[FieldValues])
			SELECT [ItemID],@CatID,1,@OrigID,@FieldValues
			FROM [dbo].[Items3]
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
		END
	
	IF @OrigID IN (SELECT [OrigID] FROM [dbo].[InsertFieldValues] WHERE [RoleCatID] = @CatID AND [SubType] = 2 GROUP BY [OrigID])
		BEGIN
			UPDATE [dbo].[InsertFieldValues]
			SET [FieldValues] = 
			(
				SELECT STUFF((SELECT ',' + [ControlFullName]
				FROM [dbo].[ControlLists]
				WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 6
				GROUP BY [ControlFullName]
				ORDER BY [ControlFullName]
				FOR XML PATH('')), 1, 1, '')
			)
			WHERE [RoleCatID] = @CatID AND [OrigID] = @OrigID AND [SubType] = 2
		END
	ELSE
		BEGIN
			SET @FieldValues = 
			(
				SELECT STUFF((SELECT ',' + [ControlFullName]
				FROM [dbo].[ControlLists]
				WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 6
				GROUP BY [ControlFullName]
				ORDER BY [ControlFullName]
				FOR XML PATH('')), 1, 1, '')
			)
	
			INSERT INTO [dbo].[InsertFieldValues]([ItemID],[RoleCatID],[SubType],[OrigID],[FieldValues])
			SELECT [ItemID],@CatID,2,@OrigID,@FieldValues
			FROM [dbo].[Items3]
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
		END

	-- Delete blank values
	DELETE FROM [dbo].[InsertFieldValues]
	WHERE [FieldValues] IS NULL OR [FieldValues] = ''

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_AddPermission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 8, 2019>
-- Description:	<Get Add Item Permission from Database>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ListView_Get_AddPermission]
(
	@ModuleID int,
	@UserID int,
	@GroupID int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelID INT, @UserStatus INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @ModuleID = 3
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID);
			SET @LevelID = 3002;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID);
			SET @LevelID = 4002;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID);
			SET @LevelID = 6002;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups12] WHERE [GroupID] = @GroupID);
			SET @LevelID = 12002;
		END

	IF @ControlType = 0
		BEGIN
			INSERT INTO @TempTable
			SELECT @UserID AS [ID]
		END
	ELSE
		BEGIN
			IF (@ModuleID = 1 AND @UserStatus = 1)
				BEGIN
					INSERT INTO @TempTable
					SELECT @UserID AS [ID];
				END
			ELSE
				BEGIN
					DECLARE assigned_cursor CURSOR FOR
						SELECT [ControlID], [ControlType]
						FROM [dbo].[LevelAccess] 
						WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] = @LevelID AND [LevelValue] = 1 AND [IsDeleted] = 0; -- Add Item
					OPEN assigned_cursor;
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							IF @ControlType = 1 -- User
								BEGIN
									IF @UserID = @ControlID
										BEGIN
											INSERT INTO @TempTable
											SELECT @UserID AS [ID];
										END
								END
							ELSE IF @ControlType = 6 -- Entity
								BEGIN					
									WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups1]
										WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups1] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
									)
									INSERT INTO @TempTable
									SELECT [ID]
									FROM [dbo].[ControlLists]
									WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [OrigID] IN (SELECT [GroupID] FROM cte)
								END
							FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
						END
					CLOSE assigned_cursor;
					DEALLOCATE assigned_cursor;
				END
		END
	SELECT [ID]
	FROM @TempTable;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_AddPermissionList]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 31, 2020>
-- Description:	<Return available add permissions for user>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ListView_Get_AddPermissionList]
	@ModuleID int,
	@GroupID int,
	@UserID int
AS
BEGIN

	SET NOCOUNT ON;

    DECLARE @UserStatus INT, @ParentID INT, @GroupControlType INT, @PLevelID INT, @PControlID INT, @PControlType INT;
	DECLARE @Table TABLE
	(
		[LevelID] INT,
		[LevelCaption] NVARCHAR(255)
	);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);
	SET @ParentID = 32;

	IF @ModuleID = 3
		BEGIN
			SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID);
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID);
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID);
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups12] WHERE [GroupID] = @GroupID);
		END

	IF @GroupControlType = 0
		BEGIN
			IF @UserStatus = 1
				BEGIN
					INSERT INTO @Table
					SELECT [LevelID], [LevelCaption]
					FROM [dbo].[LevelSet]
					WHERE [ModuleID] = @ModuleID AND [ParentID] = @ParentID
					ORDER BY [LevelCaption]
				END
			ELSE
				BEGIN
					IF @ModuleID = 3
						BEGIN
							INSERT INTO @Table
							SELECT [LevelID], [LevelCaption]
							FROM [dbo].[LevelSet]
							WHERE [ParentID] = @ParentID AND [LevelID] < 4000 AND [LevelID] <> 3004
							ORDER BY [LevelCaption]
						END
					ELSE
						BEGIN
							INSERT INTO @Table
							SELECT CASE @ModuleID
									WHEN 4 THEN 4002
									WHEN 6 THEN 6002
									WHEN 12 THEN 12002
								END AS [LevelID], 'Add New Item' AS [LevelCaption]
							ORDER BY [LevelCaption]
						END					
				END
		END
	ELSE
		IF @UserStatus = 1
			BEGIN
				INSERT INTO @Table
				SELECT a.[LevelID], a.[LevelCaption]
				FROM [dbo].[LevelSet] AS a
				INNER JOIN [dbo].[LevelAccess] AS b ON a.LevelID = b.[LevelID] AND b.[LevelValue] = 1 AND b.[IsDeleted] = 0 AND b.[GroupID] = @GroupID
				WHERE a.[ModuleID] = @ModuleID AND a.[ParentID] = @ParentID
				GROUP BY a.[LevelID], a.[LevelCaption];
			END
		ELSE IF @UserStatus = 0
			BEGIN
				DECLARE permitted_cursor CURSOR FOR
					SELECT a.[ControlID], a.[ControlType]
					FROM [dbo].[LevelAccess] AS a
					INNER JOIN [dbo].[LevelSet] AS b ON a.[LevelID] = b.[LevelID] AND b.[ModuleID] = @ModuleID AND b.[ParentID] = @ParentID
					WHERE a.[ModuleID] = @ModuleID AND a.[GroupID] = @GroupID AND a.[LevelValue] = 1 AND a.[IsDeleted] = 0
					GROUP BY a.[ControlID], a.[ControlType];
				OPEN permitted_cursor
				FETCH NEXT FROM permitted_cursor INTO @PControlID, @PControlType;
				WHILE @@FETCH_STATUS = 0
					BEGIN
						IF @PControlType = 1
							BEGIN
								INSERT INTO @Table([LevelID],[LevelCaption])
								SELECT a.[LevelID], a.[LevelCaption]
								FROM [dbo].[LevelSet] AS a
								INNER JOIN [dbo].[LevelAccess] AS b ON a.[LevelID] = b.[LevelID] AND b.[ModuleID] = @ModuleID AND b.[LevelValue] = 1 AND b.ControlID = @UserID AND b.[ControlType] = 1
								WHERE a.[ModuleID] = @ModuleID AND a.[ParentID] = @ParentID;
							END
						ELSE IF @PControlType = 6
							BEGIN
								WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups1]
									WHERE [ParentGroupID] = @PControlID OR [GroupID] = @PControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups1] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
								), cte2 AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups1]
									WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cte) OR [GroupID] = @PControlID
								)
								INSERT INTO @Table([LevelID],[LevelCaption])
								SELECT a.[LevelID], a.[LevelCaption]
								FROM [dbo].[LevelSet] AS a
								INNER JOIN [dbo].[LevelAccess] AS b ON a.[LevelID] = b.[LevelID] AND b.[ModuleID] = @ModuleID AND b.[GroupID] = @GroupID AND b.[LevelValue] = 1 AND b.[ControlType] = 6
								WHERE a.[ModuleID] = @ModuleID and a.[ParentID] = @ParentID AND @UserID IN 
								(
									SELECT [ControlID] 
									FROM [dbo].[ControlLists] 
									WHERE [ModuleID] = 1 AND [IsGroup] = 1 AND [OrigID] IN 
									(
										SELECT [GroupID] FROM cte2
									)
								)
								GROUP BY a.[LevelID], a.[LevelCaption]								
							END
						FETCH NEXT FROM permitted_cursor INTO @PControlID, @PControlType;
					END
				CLOSE permitted_cursor;
				DEALLOCATE permitted_cursor;
			END
		ELSE
			BEGIN
				DECLARE permitted_cursor CURSOR FOR
					SELECT a.[ControlID], a.[ControlType]
					FROM [dbo].[LevelAccess] AS a
					INNER JOIN [dbo].[LevelSet] AS b ON a.[LevelID] = b.[LevelID] AND b.[ModuleID] = @ModuleID AND b.[ParentID] = @ParentID
					WHERE a.[ModuleID] = @ModuleID AND a.[GroupID] = @GroupID AND a.[LevelValue] = 1 AND a.[IsDeleted] = 0
					GROUP BY a.[ControlID], a.[ControlType];
				OPEN permitted_cursor
				FETCH NEXT FROM permitted_cursor INTO @PControlID, @PControlType;
				WHILE @@FETCH_STATUS = 0
					BEGIN
						IF @PControlType = 1
							BEGIN
								INSERT INTO @Table([LevelID],[LevelCaption])
								SELECT a.[LevelID], a.[LevelCaption]
								FROM [dbo].[LevelSet] AS a
								INNER JOIN [dbo].[LevelAccess] AS b ON a.[LevelID] = b.[LevelID] AND b.[ModuleID] = @ModuleID AND b.[LevelValue] = 1 AND b.ControlID = @UserID AND b.[ControlType] = 1
								WHERE a.[ModuleID] = @ModuleID AND a.[ParentID] = @ParentID AND a.[LevelID] NOT IN (3004,4004,6004,12004);
							END
						ELSE IF @PControlType = 6
							BEGIN
								WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups1]
									WHERE [ParentGroupID] = @PControlID OR [GroupID] = @PControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups1] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
								), cte2 AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups1]
									WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cte) OR [GroupID] = @PControlID
								)
								INSERT INTO @Table([LevelID],[LevelCaption])
								SELECT a.[LevelID], a.[LevelCaption]
								FROM [dbo].[LevelSet] AS a
								INNER JOIN [dbo].[LevelAccess] AS b ON a.[LevelID] = b.[LevelID] AND b.[ModuleID] = @ModuleID AND b.[GroupID] = @GroupID AND b.[LevelValue] = 1 AND b.[ControlType] = 6
								WHERE a.[ModuleID] = @ModuleID and a.[ParentID] = @ParentID AND @UserID IN 
								(
									SELECT [ControlID] 
									FROM [dbo].[ControlLists] 
									WHERE [ModuleID] = 1 AND [IsGroup] = 1 AND [OrigID] IN 
									(
										SELECT [GroupID] FROM cte2
									)
								) AND a.[LevelID] NOT IN (3004,4004,6004,12004)
								GROUP BY a.[LevelID], a.[LevelCaption];				
							END
						FETCH NEXT FROM permitted_cursor INTO @PControlID, @PControlType;
					END
				CLOSE permitted_cursor;
				DEALLOCATE permitted_cursor;
			END

	SELECT [LevelID], [LevelCaption]
	FROM @Table
	GROUP BY [LevelID], [LevelCaption]
	ORDER BY [LevelCaption];

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_EditPermission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 8, 2019>
-- Modified date: <August 13, 2020>
-- Description:	<Get Edit Permission from Database>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ListView_Get_EditPermission]
(
	@ModuleID int,
	@UserID int,
	@OrigID int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TempTable TABLE
	(
		ID INT
	)

	DECLARE @LevelID INT, @ControlID INT, @ControlType INT, @SubControlID INT, @SubControlType INT, @RoleControlType INT, @UserStatus INT;

	SET @RoleControlType = 0;
	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @ModuleID = 1
		BEGIN
			SET @LevelID = 1101;
		END
	IF @ModuleID = 3
		BEGIN
			SET @LevelID = 3101;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @LevelID = 4101;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @LevelID = 6101;
			SET @RoleControlType = (SELECT [RoleControlType] FROM [dbo].[Groups6] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID))
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @LevelID = 12101;
		END

	IF @RoleControlType = 0 OR @UserStatus = 1
		BEGIN
			SELECT @UserID AS [ID];
		END
	ELSE
		BEGIN
			DECLARE role_cursor CURSOR FOR
			SELECT [ControlID], [ControlType]
			FROM [dbo].[LevelAccess]
			WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [IsDeleted] = 0 AND [ControlType] = 5;
			OPEN role_cursor;
			FETCH NEXT FROM role_cursor INTO @ControlID, @ControlType;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					DECLARE member_cursor CURSOR FOR
						SELECT [ControlID], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [CatID] = @ControlID AND [OrigID] = @OrigID;
					OPEN member_cursor;
					FETCH NEXT FROM member_cursor INTO @SubControlID, @SubControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups1]
								WHERE [ParentGroupID] = @SubControlID OR [GroupID] = @SubControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups1] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
							)
							INSERT INTO @TempTable(ID)
							SELECT [ControlID] AS [ID]
							FROM [dbo].[ControlLists]
							WHERE [OrigID] IN (SELECT [GroupID] FROM cte) AND [ModuleID] = 1;
							FETCH NEXT FROM member_cursor INTO @SubControlID, @SubControlType;
						END
					CLOSE member_cursor;
					DEALLOCATE member_cursor;
					FETCH NEXT FROM role_cursor INTO @ControlID, @ControlType;
				END
			CLOSE role_cursor;
			DEALLOCATE role_cursor;
			SELECT * FROM @TempTable
		END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_ItemList]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[v4_ListView_Get_ItemList]
(
	@ParentGroupID int,
	@ModuleID int,
	@UserID int
)
AS
SET NOCOUNT ON;

DECLARE @TempParentGroupID INT, @TempModuleID INT, @TempUserID INT, @UserStatus INT, @RowCount INT, @GroupControlType INT
SET @TempParentGroupID = @ParentGroupID;
SET @TempModuleID = @ModuleID;
SET @TempUserID = @UserID;
SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @TempUserID);

IF (@TempModuleID = 1)
	BEGIN
		SELECT [UserID],[ParentGroupID],[Name],[FirstName],[LastName],[FullName],[Email],CASE [Status]
			WHEN -2 THEN 'External User'
			WHEN -1 THEN 'Restricted User'
			WHEN 0 THEN 'Normal User'
			WHEN 1 THEN 'Administrator'
			ELSE 'Disabled'
			END AS [Status]
		FROM [dbo].[Items1]
		WHERE [ParentGroupID] = @TempParentGroupID AND [IsDeleted] = 0
		ORDER BY [Name];
	END
ELSE IF (@TempModuleID = 3)
BEGIN
	SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups3] WHERE [GroupID] = @TempParentGroupID)
	DECLARE @GroupOptionSet NVARCHAR(50)
	SET @GroupOptionSet = (SELECT [OptionSet] FROM [dbo].[Groups3] WHERE [GroupID] = @TempParentGroupID AND [IsDeleted] = 0)
	;WITH cte AS
		(SELECT [OrigID], [ItemID], [ParentGroupID], [Name], [LabelName], [Status], 
			CASE [Status]
				WHEN 0 THEN CASE
					WHEN @GroupOptionSet LIKE '%1_3%' THEN 'Complete (' + [Version] + ')'
					ELSE 'Obsolete (' + [Version] + ')' END
				WHEN 2 THEN CASE
					WHEN @GroupOptionSet LIKE '%1_3%' THEN 'Open (' + [Version] + ')'
					ELSE 'Draft (' + [Version] + ')' END
				WHEN 3 THEN 'Collaborate (' + [Version] + ')'
				WHEN 4 THEN 'Ready (' + [Version] + ')'
				WHEN 5 THEN 'Review (' + [Version] + ')'
				WHEN 6 THEN 'Ready (' + [Version] + ')'
				WHEN 7 THEN 'Pending (' + [Version] + ')'
				WHEN 9 THEN CASE
					WHEN [IsEvidence] = 1 THEN 'Evidence (' + [Version] + ')'
					ELSE 'Current (' + [Version] + ')' END
			END AS [VersionStatus],
			[VersionedBy], [VersionDate],
			CASE [HasPLink]
				WHEN 1 THEN 'P-L'
				WHEN -1 THEN 'P-L'
				ELSE ''
			END AS [HasPLink],
			[ModifiedBy], [lastModified], [FileExtension], [TypeOfPublish],
			CASE
				WHEN EXISTS (SELECT [ItemID] FROM [dbo].[Items3] WHERE [OrigID] = base.[OrigID] AND ISNULL([IsCheckedOut], 0) <> 0 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
				THEN 1
			END AS [IsCheckedOut], 
			CASE
				WHEN (SELECT TOP 1 [CheckedOutBy]
					FROM [dbo].[Items3] 
					WHERE OrigID = base.[OrigID] AND ([IsCheckedOut] IS NOT NULL AND [IsCheckedOut] <> 0)) IS NOT NULL
						THEN (SELECT TOP 1 CheckedOutBy
						FROM [dbo].[Items3] 
						WHERE [OrigID] = base.[OrigID] AND ISNULL([IsCheckedOut], 0) <> 0 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
				END AS [CheckedOutBy], 
			CASE
				WHEN (SELECT TOP 1 [CheckedOutBy]
					FROM [dbo].[Items3] 
					WHERE [OrigID] = base.[OrigID] AND ([IsCheckedOut] IS NOT NULL AND [IsCheckedOut] <> 0)) IS NOT NULL
				THEN (SELECT TOP 1 [CheckedOutDate]
					FROM [dbo].[Items3] 
					WHERE [OrigID] = base.[OrigID] AND ISNULL([IsCheckedOut], 0) <> 0 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			END AS [CheckedOutDate],
			ROW_NUMBER() OVER (PARTITION BY [OrigID] ORDER BY [ItemID] DESC) AS [RowNum],
				(CASE 
					WHEN (SELECT COUNT([OrigID]) 
						FROM [dbo].[Items3]
						WHERE [OrigID] = base.[OrigID] AND [IsWithdrawn] = 0 AND [IsDeleted] = 0) = 1
					THEN NULL 
					WHEN (SELECT COUNT([OrigID])
						FROM [dbo].[Items3]
						WHERE [OrigID] = base.[OrigID] AND [Status] <> 0 AND [IsWithdrawn] = 0 AND [IsDeleted] = 0) > 1 AND (SELECT COUNT([OrigID])
							FROM [dbo].[Items3]
							WHERE [OrigID] = base.[OrigID] AND [IsWithdrawn] = 0 AND [Status] = 7 AND [IsDeleted] = 0) != 1
					THEN (SELECT CASE [Status]
							WHEN 2 THEN 'Draft (' + [Version] + ')'
							WHEN 3 THEN 'Collaborate (' + [Version] + ')'
							WHEN 4 THEN 'Ready (' + [Version] + ')'
							WHEN 5 THEN 'Review (' + [Version] + ')'
							WHEN 6 THEN 'Ready (' + [Version] + ')'
						END AS [Status]
						FROM [dbo].[Items3]
						WHERE [ItemID] = (SELECT MAX([ItemID])
							FROM [dbo].[Items3] WHERE [OrigID] = base.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0))
					WHEN (SELECT COUNT([OrigID])
						FROM [dbo].[Items3]
					WHERE [OrigID] = base.[OrigID] AND [Status] NOT IN (0, 9) AND [IsWithdrawn] = 0 AND [IsDeleted] = 0) = 1
					THEN 'Pending' + ' (' + (SELECT [Version] FROM [dbo].[Items3] WHERE [OrigID] = base.[OrigID] AND [Status] = 7) + ')'
						WHEN (SELECT COUNT([OrigID])
						FROM [dbo].[Items3]
						WHERE [OrigID] = base.[OrigID] AND [Status] <> 0 AND [IsWithdrawn] = 0 AND [IsDeleted] = 0) > 1 AND (SELECT COUNT([OrigID])
							FROM [dbo].[Items3] i3
								WHERE [OrigID] = base.[OrigID] AND [Status] IN (2, 3, 4, 5, 6, 7)	AND [Status] NOT IN (9, 0) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0) > 1
					THEN 'Pending (' + (SELECT [Version] FROM [dbo].[Items3] WHERE [OrigID] = base.[OrigID] AND [Status] = 7) + ')' + ', ' + (SELECT CASE [Status]
						WHEN 2 THEN 'Draft (' + [Version] + ')'
						WHEN 3 THEN 'Collaborate (' + [Version] + ')'
						WHEN 4 THEN 'Ready (' + [Version] + ')'
						WHEN 5 THEN 'Review (' + [Version] + ')'
						WHEN 6 THEN 'Ready (' + [Version] + ')'
					END AS [Status]
					FROM P3.dbo.[Items3] i3
					WHERE [OrigID] = base.[OrigID] AND [Status] IN (2, 3, 4, 5, 6) AND [Status] NOT IN (9, 0, 7) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
                 END) AS [Processing], [IsEvidence]
		FROM [dbo].[Items3] as base
		WHERE [ParentGroupID] = @TempParentGroupID AND [ItemID] <> 0 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Status] <> 0)
	SELECT *
	FROM cte
	WHERE [Processing] IS NULL OR ([Processing] IS NOT NULL AND [Status] = 9) OR ([Status] = 7 AND [ItemID] = [OrigID])
	ORDER BY [Name]
END
ELSE IF (@TempModuleID = 4)
BEGIN
	SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups4] WHERE [GroupID] = @TempParentGroupID)
	IF @UserStatus = 1 OR @GroupControlType = 0
		BEGIN
			;WITH cte AS
				(SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
					CASE a.[Status]
						WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
						ELSE 'Complete ' + '(' + [Version] + ')'
					END AS [Status],
					a.[Version], a.[VersionedBy], a.[VersionDate],
					CASE
						WHEN a.[HasPLink] = 1 THEN 'P-L'
						WHEN a.[HasPLink] = -1 THEN 'P-L'
						ELSE ''
					END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
					a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
					ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
				FROM [dbo].[Items4] AS a
				INNER JOIN [dbo].[Groups4] AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0)
			SELECT * FROM cte
			WHERE [RowNum] = 1
			ORDER BY [Name]
		END
	ELSE
		BEGIN
			;WITH cte AS
			(
				SELECT [GroupID]
				FROM [dbo].[Groups1]
				WHERE [ParentGroupID] IN 
				(
					SELECT [ControlID] FROM [dbo].[LevelAccess] WHERE [ModuleID] = @TempModuleID AND [LevelID] = 4017 AND [LevelValue] = 1 AND [GroupID] = @TempParentGroupID
				)
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups1] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
			)
			SELECT @RowCount = (SELECT COUNT(a.[GroupID]) FROM cte AS a JOIN (SELECT [OrigID] AS [GroupID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlID] = @TempUserID) AS b ON a.[GroupID] = b.[GroupID])
			IF @ROWCOUNT > 0
				BEGIN
					;WITH cte AS
					(
						SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
						CASE a.[Status]
							WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
							ELSE 'Complete ' + '(' + [Version] + ')'
						END AS [Status],
						a.[Version], a.[VersionedBy], a.[VersionDate],
						CASE
							WHEN a.[HasPLink] = 1 THEN 'P-L'
							WHEN a.[HasPLink] = -1 THEN 'P-L'
							ELSE ''
						END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
						a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
						ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] AS b ON a.[ParentGroupID] = b.[GroupID]
					WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0
					)
					SELECT * FROM cte
					WHERE [RowNum] = 1
					ORDER BY [Name]
				END
			ELSE
				BEGIN
					;WITH cte AS
					(
						SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
						CASE a.[Status]
							WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
							ELSE 'Complete ' + '(' + [Version] + ')'
						END AS [Status],
						a.[Version], a.[VersionedBy], a.[VersionDate],
						CASE
							WHEN a.[HasPLink] = 1 THEN 'P-L'
							WHEN a.[HasPLink] = -1 THEN 'P-L'
							ELSE ''
						END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
						a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
						ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] AS b ON a.[ParentGroupID] = b.[GroupID]
					WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0 AND a.[CreatorID] = @TempUserID
					)
					SELECT * FROM cte
					WHERE [RowNum] = 1
					ORDER BY [Name]
				END
		END
END
ELSE IF (@TempModuleID = 6)
BEGIN
	SET @GroupControlType = (SELECT [ControlType] FROM [dbo].[Groups6] WHERE [GroupID] = @TempParentGroupID)
	IF @UserStatus = 1 OR @GroupControlType = 0
		BEGIN
			;WITH cte AS
				(SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
					CASE a.[Status]
						WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
						ELSE 'Complete ' + '(' + [Version] + ')'
					END AS [Status],
					a.[Version], a.[VersionedBy], a.[VersionDate],
					CASE
						WHEN a.[HasPLink] = 1 THEN 'P-L'
						WHEN a.[HasPLink] = -1 THEN 'P-L'
						ELSE ''
					END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
					a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
					ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
				FROM [dbo].[Items6] AS a
				INNER JOIN [dbo].[Groups6] AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0)
			SELECT * FROM cte
			WHERE [RowNum] = 1
			ORDER BY [Name]
		END
	ELSE
		BEGIN
			;WITH cte AS
			(
				SELECT [GroupID]
				FROM [dbo].[Groups1]
				WHERE [ParentGroupID] IN 
				(
					SELECT [ControlID] FROM [dbo].[LevelAccess] WHERE [ModuleID] = @TempModuleID AND [LevelID] = 6017 AND [LevelValue] = 1 AND [GroupID] = @TempParentGroupID
				)
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups1] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
			)
			SELECT @RowCount = (SELECT COUNT(a.[GroupID]) FROM cte AS a JOIN (SELECT [OrigID] AS [GroupID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlID] = @TempUserID) AS b ON a.[GroupID] = b.[GroupID])
			IF @ROWCOUNT > 0
				BEGIN
					;WITH cte AS
					(
						SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
						CASE a.[Status]
							WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
							ELSE 'Complete ' + '(' + [Version] + ')'
						END AS [Status],
						a.[Version], a.[VersionedBy], a.[VersionDate],
						CASE
							WHEN a.[HasPLink] = 1 THEN 'P-L'
							WHEN a.[HasPLink] = -1 THEN 'P-L'
							ELSE ''
						END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
						a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
						ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] AS b ON a.[ParentGroupID] = b.[GroupID]
					WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0
					)
					SELECT * FROM cte
					WHERE [RowNum] = 1
					ORDER BY [Name]
				END
			ELSE
				BEGIN
					;WITH cte AS
					(
						SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
						CASE a.[Status]
							WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
							ELSE 'Complete ' + '(' + [Version] + ')'
						END AS [Status],
						a.[Version], a.[VersionedBy], a.[VersionDate],
						CASE
							WHEN a.[HasPLink] = 1 THEN 'P-L'
							WHEN a.[HasPLink] = -1 THEN 'P-L'
							ELSE ''
						END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
						a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
						ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] AS b ON a.[ParentGroupID] = b.[GroupID]
					WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0 AND a.[CreatorID] = @TempUserID
					)
					SELECT * FROM cte
					WHERE [RowNum] = 1
					ORDER BY [Name]
				END
		END
END
ELSE IF (@TempModuleID = 12)
BEGIN
	;WITH cte AS
		(SELECT a.[OrigID], a.[ItemID], a.[ParentGroupID],  a.[Name], a.[LabelName], a.[CreateBy], a.[CreateDate],
			CASE a.[Status]
				WHEN 2 THEN 'Open ' + '(' + [Version] + ')'
				ELSE 'Complete ' + '(' + [Version] + ')'
			END AS [Status],
			a.[Version], a.[VersionedBy], a.[VersionDate],
			CASE
				WHEN a.[HasPLink] = 1 THEN 'P-L'
				WHEN a.[HasPLink] = -1 THEN 'P-L'
				ELSE ''
			END AS [HasPLink], a.[ModifiedBy], a.[LastModified],
			a.[FileExtension], a.[TypeOfPublish], b.[ObjTypeID],
			ROW_NUMBER() OVER (PARTITION BY a.[OrigID] ORDER BY a.[ItemID] DESC) AS [RowNum]
		FROM [dbo].[Items12] AS a
		INNER JOIN [dbo].[Groups12] AS b ON a.[ParentGroupID] = b.[GroupID]
		WHERE LEN(a.[Name]) > 0 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0 AND a.[ParentGroupID] = @TempParentGroupID AND a.[ItemID] <> 0)
		SELECT * FROM cte
		WHERE [RowNum] = 1
		ORDER BY [Name];
END
ELSE IF (@TempModuleID = 14)
BEGIN
	SELECT [AIID], [UserName], [Name], [ShowID],
		CASE [ShowModuleID]
			WHEN 1 THEN 'Users'
			WHEN 3 THEN 'Documents'
			WHEN 4 THEN 'Records'
			WHEN 6 THEN 'Improvements'
			WHEN 12 THEN 'Training'			
			ELSE ''
		END AS [ShowModuleName],
		[DateDue], [SenderName], [SenderID], [SendDate], 
		CASE [Priority]
			WHEN 0 THEN 'Low'
			WHEN 1 THEN 'Normal'
			WHEN 2 THEN 'Urgent'
			END AS [Priority], [CompleteDate], [NotifiedStatus], [UserID], [ShowModuleID]
	FROM [dbo].[Items14]
	WHERE [ParentGroupID] = @TempParentGroupID AND [UserID] = @TempUserID AND [IsDeleted] = 0
	ORDER BY [SendDate] DESC
	OPTION (RECOMPILE);
END

SET NOCOUNT OFF;

GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_RolePermission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 27, 2020>
-- Description:	<Check if user has permission to edit roles in folder or item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ListView_Get_RolePermission] 
	@ModuleID int,
	@OrigID int,
	@UserID int,
	@IsGroup int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @GroupID INT, @LevelID INT

	IF @IsGroup = 0
		BEGIN
			IF @ModuleID = 3
				BEGIN
					SET @GroupID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID);
					SET @LevelID = 3012;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					SET @GroupID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = @OrigID);
					SET @LevelID = 4012;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					SET @GroupID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID);
					SET @LevelID = 6012;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					SET @GroupID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items12] WHERE [OrigID] = @OrigID);
					SET @LevelID = 12012;
				END
		END
	ELSE
		BEGIN
			SET @GroupID = @OrigID
		END

	DECLARE @ControlID INT, @ControlType INT

	DECLARE assigned_cursor CURSOR FOR
		SELECT [ControlID], [ControlType]
		FROM [dbo].[LevelAccess] 
		WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] = @LevelID AND [LevelValue] = 1 AND [IsDeleted] = 0; -- Modify Role

	OPEN assigned_cursor
	FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType
	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @ControlType = 1 -- User
				BEGIN
					IF @UserID = @ControlID
						BEGIN
							SELECT UserID FROM [dbo].[Items1] WHERE [UserID] = @UserID AND [IsDeleted] = 0 AND [Status] <> 9
						END
				END
			ELSE IF @ControlType = 6 -- Entity
				BEGIN
					WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups1]
						WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups1] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					SELECT [ID]
					FROM [dbo].[ControlLists]
					WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [OrigID] IN (SELECT [GroupID] FROM cte)
				END
			FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType
		END
	CLOSE assigned_cursor
	DEALLOCATE assigned_cursor

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_ListView_Get_StatusPermission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 8, 2019>
-- Description:	<Get Status Change Permission from Database>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ListView_Get_StatusPermission]
(
	@ModuleID int,
	@UserID int,
	@OrigID int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TempTable TABLE
(
	ID INT
)

DECLARE @ParentID INT, @ControlID INT, @ControlType INT, @SubControlID INT, @SubControlType INT;

	IF @ModuleID = 3
		BEGIN
			SET @ParentID = 42;
		END
	ELSE
		BEGIN
			SET @ParentID = 40;
		END	
	
	DECLARE role_cursor CURSOR FOR
		SELECT [ControlID], [ControlType]
		FROM [dbo].[LevelAccess]
		WHERE [LevelID] IN (SELECT [LevelID] FROM [dbo].[LevelSet] WHERE [ModuleID] = @ModuleID AND [ParentID] = @ParentID) AND [LevelValue] = 1 AND [IsDeleted] = 0 AND [ControlType] = 5
		GROUP BY [ControlID], [ControlType];
	OPEN role_cursor;
	FETCH NEXT FROM role_cursor INTO @ControlID, @ControlType;
	WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE member_cursor CURSOR FOR
				SELECT [ControlID], [ControlType]
				FROM [dbo].[ControlLists]
				WHERE [CatID] = @ControlID AND [OrigID] = @OrigID;
			OPEN member_cursor;
			FETCH NEXT FROM member_cursor INTO @SubControlID, @SubControlType;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					IF @SubControlType = 1
						BEGIN
							IF @UserID = @SubControlID
							INSERT INTO @TempTable(ID)
							VALUES(@UserID);
						END
					ELSE
						BEGIN
							WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups1]
								WHERE [ParentGroupID] = @SubControlID OR [GroupID] = @SubControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups1] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
							)
							INSERT INTO @TempTable(ID)
							SELECT [ControlID] AS [ID]
							FROM [dbo].[ControlLists]
							WHERE [OrigID] IN (SELECT [GroupID] FROM cte) AND [ModuleID] = 1;
						END
					FETCH NEXT FROM member_cursor INTO @SubControlID, @SubControlType;
				END
			CLOSE member_cursor;
			DEALLOCATE member_cursor;
			FETCH NEXT FROM role_cursor INTO @ControlID, @ControlType;
		END
	CLOSE role_cursor;
	DEALLOCATE role_cursor;
	SELECT * FROM @TempTable;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_FDAStatus]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Jul 12, 2017>
-- Description:	<Check FDA settings for Password control>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_FDAStatus]
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [P3Key],[Value1]
	FROM [P3].[dbo].[SystemSettings]
	WHERE [P3Key] = 'IsFDA' OR [P3Key] = 'FDAPWordNotSameNumber'
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_ForbiddenPasswords]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Jul 12, 2017>
-- Description:	<Check new password against forbidden passwords list>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_ForbiddenPasswords]
(
	@UserName nvarchar(255)
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT a.[OldPass]
	FROM [P3].[dbo].[UserPass] AS a
	INNER JOIN [P3].[dbo].[Items1] AS b ON a.[UserID] = b.[UserID] AND b.[Name] = @UserName
	WHERE a.[ChangeDate] > DATEADD(m,-6,a.[ChangeDate])
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_P3PWord]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/12/2017>
-- Description:	<Retrieve Encrypted Password for Windows Authentication>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_P3PWord]
(
@UserName nvarchar(255)
)
AS

BEGIN
	SELECT [PWord]
	FROM [P3].[dbo].[Items1]
	WHERE [Name] = @UserName AND [Status] <> 9 AND [IsDeleted] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_PWordStatus]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Jul 12, 2017>
-- Description:	<Retrieve User OptionSet for Change Password method>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_PWordStatus]
(
	@UserName nvarchar(255)
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [OptionSet]
	FROM [P3].[dbo].[Items1]
	WHERE [Name] = @UserName AND [Status] <> 9 AND [IsDeleted] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_User]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 10, 2017>
-- Description:	<Retrieve User Details at Login for AuthCookie>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_User]
(
	@UserName nvarchar(255),
	@Password nvarchar(255)
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [UserID],[Name],[FullName],[EMail],[Status],[ModuleAccess],[OptionSet],[MyLanguage]
	FROM [P3].[dbo].[Items1]
	WHERE [Name] = @UserName AND [Status] NOT IN (-2,9) AND [IsDeleted] = 0 AND [PWord] = @Password
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_UserOptionSet]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Jul 12, 2017>
-- Description:	<Retrieve User OptionSet>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_UserOptionSet]
(
	@UserName nvarchar(255)
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [OptionSet]
	FROM [dbo].[Items1]
	WHERE [Name] = @UserName
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Get_WinUser]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Oct 31, 2018>
-- Description:	<Retrieve User Details at Windows Login for AuthCookie>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Get_WinUser]
(
	@UserName nvarchar(255)
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [UserID],[Name],[FullName],[EMail],[Status],[ModuleAccess],[OptionSet],[MyLanguage]
	FROM [P3].[dbo].[Items1]
	WHERE [Name] = @UserName AND [Status] <> 9 AND [IsDeleted] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Login_Update_PWord]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Jul 12, 2017>
-- Description:	<Update User Password and Optionset.>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Login_Update_PWord]
(
	@UserID int,
	@NewPass nvarchar(255),
	@OptionSet nvarchar(255),
	@IsFDA bit
)
AS

BEGIN
	SET NOCOUNT ON;

	--Add old password to UserPass if IsFDA Set
	DECLARE @OldPW NVARCHAR(255)
	SET @OldPW = (SELECT [PWord] FROM [dbo].[Items1] WHERE [UserID] = @UserID AND [IsDeleted] = 0 AND [Status] != 9)

	-- Update Password in database
	UPDATE [P3].[dbo].[Items1]
	SET [PWord] = @NewPass, [OptionSet] = @OptionSet
	WHERE [UserID] = @UserID AND [IsDeleted] = 0 AND [Status] != 9

	-- If FDA rules applied, add old password to registry
	IF @IsFDA = 1
	BEGIN
		INSERT INTO [P3].[dbo].[UserPass]([UserID],[OldPass],[ChangeDate])
		VALUES(@UserID,@OldPW,GETDATE())
	END

	
END


GO
/****** Object:  StoredProcedure [dbo].[v4_ParaLink_Add_PLink]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 16, 2020>
-- Description:	<Add Para-Link to item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ParaLink_Add_PLink] 
	@OrigID INT,
	@ModuleID INT,
	@LinkedOrigID INT,
	@LinkedModuleID INT,
	@UserName NVARCHAR(255),
	@UserID INT,
	@LinkedType INT
AS
BEGIN
	SET NOCOUNT ON;

	-- Insert Para-Link
	INSERT INTO [dbo].[ParaLink]([OrigID],[MyType],[ModuleID],[PMarkID],[LinkedOrigID],[LinkedType],[LinkedModuleID],[LinkedPMarkID],[CreateDate],[CreateBy],[CreatorID])
	VALUES(@OrigID,1,@ModuleID,0,@LinkedOrigID,@LinkedType,@LinkedModuleID,0,GETDATE(),@UserName,@UserID);

	-- Update Item to show it has a Para-Link
	IF @ModuleID = 3
		BEGIN
			UPDATE [dbo].[Items3]
			SET [HasPLink] = 1
			WHERE [OrigID] = @OrigID
		END
	IF @ModuleID = 4
		BEGIN
			UPDATE [dbo].[Items4]
			SET [HasPLink] = 1
			WHERE [OrigID] = @OrigID
		END
	IF @ModuleID = 6
		BEGIN
			UPDATE [dbo].[Items6]
			SET [HasPLink] = 1
			WHERE [OrigID] = @OrigID
		END
	IF @ModuleID = 12
		BEGIN
			UPDATE [dbo].[Items12]
			SET [HasPLink] = 1
			WHERE [OrigID] = @OrigID
		END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_ParaLink_Get_PLinks]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 17, 2020>
-- Description:	<Retrieve All Para-Links>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ParaLink_Get_PLinks]
(
	@OrigID int,
	@ModuleID int
)
AS
BEGIN
	SET NOCOUNT ON;

	-- Find Linked To:
	; WITH CTE AS
	(
		SELECT a.[PLinkID], CASE WHEN a.[PMarkID] <> 0 THEN 
				CASE WHEN (SELECT COUNT(*) FROM [dbo].[ParaLink] WHERE [OrigID] = a.[OrigID]) > 1
				THEN -1
				ELSE a.[PMarkID]
				END
			ELSE a.[PMarkID]
			END AS [PMarkID],
			a.[OrigID], [MyType],
			CASE a.[LinkedModuleID]
				WHEN 3 THEN (SELECT [ItemID] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID] AND [Status] = 9 AND [IsDeleted] = 0 AND [IsWithDrawn] = 0)
				WHEN 4 THEN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 ORDER BY [ItemID] DESC)
				WHEN 6 THEN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 ORDER BY [ItemID] DESC)
				WHEN 12 THEN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 ORDER BY [ItemID] DESC)
				ELSE 0
			END AS [ItemID],
			CASE a.[LinkedType]
				WHEN 1 THEN (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN (SELECT TOP 1 [Name] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
						WHEN 4 THEN (SELECT TOP 1 [Name] FROM [dbo].[Items4] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
						WHEN 6 THEN (SELECT TOP 1 [Name] FROM [dbo].[Items6] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
						ELSE (SELECT TOP 1 [Name] FROM [dbo].[Items12] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
					END)
				ELSE (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN (SELECT TOP 1 [Name] FROM [dbo].[Groups3] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
						WHEN 4 THEN (SELECT TOP 1 [Name] FROM [dbo].[Groups4] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
						WHEN 6 THEN (SELECT TOP 1 [Name] FROM [dbo].[Groups6] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
						ELSE (SELECT TOP 1 [Name] FROM [dbo].[Groups12] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
					END)
			END AS [Name],
			CASE [LinkedType]
				WHEN 1 THEN (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN (SELECT TOP 1 [LabelName] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
						WHEN 4 THEN (SELECT TOP 1 [LabelName] FROM [dbo].[Items4] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
						WHEN 6 THEN (SELECT TOP 1 [LabelName] FROM [dbo].[Items6] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
						ELSE (SELECT TOP 1 [LabelName] FROM [dbo].[Items12] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
					END)
				ELSE NULL
			END AS [LabelName],
			CASE [LinkedType]
				WHEN 1 THEN (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN 1
						WHEN 4 THEN (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups4] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = a.[LinkedOrigID]) AND [IsDeleted] = 0)
						WHEN 6 THEN (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups6] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = a.[LinkedOrigID]) AND [IsDeleted] = 0)
						ELSE (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups12] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items12] WHERE [OrigID] = a.[LinkedOrigID]) AND [IsDeleted] = 0)
					END)
				ELSE 0
			END AS [ObjTypeID],
			CASE [LinkedModuleID]
				WHEN 3 THEN (SELECT CASE [LinkedType]
						WHEN 1 THEN (SELECT TOP 1 [FileExtension] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID])
						ELSE 'folder'
					END)
				ELSE (SELECT CASE [LinkedModuleID]
						WHEN 4 THEN (SELECT CASE [LinkedType]
								WHEN 1 THEN 'record'
								ELSE 'folder'
							END)
						WHEN 6 THEN (SELECT CASE [LinkedType]
								WHEN 1 THEN 'improvement'
								ELSE 'folder'
							END)
						ELSE (SELECT CASE [LinkedType]
								WHEN 1 THEN 'training'
								ELSE 'folder'
							END)
					END)
			END AS [FileExtension],
			CASE [LinkedModuleID]
				WHEN 3 THEN (SELECT CASE [LinkedType]
						WHEN 1 THEN (SELECT CASE [ModuleID]
								WHEN 3 THEN (SELECT TOP 1 [TypeOfPublish] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID])
								ELSE 0
							END)
						ELSE 0
					END)
				ELSE 0
			END AS [TypeOfPublish],
			CASE [LinkedType]
				WHEN 1 THEN (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID])
						WHEN 4 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = a.[LinkedOrigID])
						WHEN 6 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = a.[LinkedOrigID])
						WHEN 12 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID])
					END)
				ELSE 0
			END AS [ParentGroupID],
			a.[ModuleID], a.[LinkedOrigID], a.[LinkedType], a.[LinkedModuleID]
		FROM [dbo].[ParaLink] AS a
		WHERE a.[OrigID] = @OrigID AND a.[ModuleID] = @ModuleID
	)
	SELECT * 
	FROM cte 
	WHERE [Name] IS NOT NULL AND [PMarkID] <> -1
	ORDER BY [Name]

	-- Find linked from
	;WITH cte AS
	(
		SELECT a.[PLinkID], CASE WHEN a.[PMarkID] <> 0 THEN 
				CASE WHEN (SELECT COUNT(*) FROM [dbo].[ParaLink] WHERE [LinkedOrigID] = a.[OrigID]) > 1
				THEN -1
				ELSE a.[PMarkID]
				END
			ELSE a.[PMarkID]
			END AS [PMarkID],
			a.[OrigID], [MyType],
			CASE a.[ModuleID]
				WHEN 3 THEN (SELECT [ItemID] FROM [dbo].[Items3] WHERE [OrigID] = a.[OrigID] AND [Status] = 9 AND [IsDeleted] = 0 AND [IsWithDrawn] = 0)
				WHEN 4 THEN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 ORDER BY [ItemID] DESC)
				WHEN 6 THEN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 ORDER BY [ItemID] DESC)
				WHEN 12 THEN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithDrawn] = 0 ORDER BY [ItemID] DESC)
				ELSE 0
			END AS [ItemID],
			CASE a.[LinkedType]
				WHEN 1 THEN (SELECT CASE [ModuleID]
						WHEN 3 THEN (SELECT TOP 1 [Name] FROM [dbo].[Items3] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
						WHEN 4 THEN (SELECT TOP 1 [Name] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
						WHEN 6 THEN (SELECT TOP 1 [Name] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
						ELSE (SELECT TOP 1 [Name] FROM [dbo].[Items12] WHERE [OrigID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL)
					END)
				ELSE (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN (SELECT TOP 1 [Name] FROM [dbo].[Groups3] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
						WHEN 4 THEN (SELECT TOP 1 [Name] FROM [dbo].[Groups4] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
						WHEN 6 THEN (SELECT TOP 1 [Name] FROM [dbo].[Groups6] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
						ELSE (SELECT TOP 1 [Name] FROM [dbo].[Groups12] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0 AND [Name] IS NOT NULL)
					END)
			END AS [Name],
			CASE [LinkedType]
				WHEN 1 THEN (SELECT CASE [ModuleID]
						WHEN 3 THEN (SELECT TOP 1 [LabelName] FROM [dbo].[Items3] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
						WHEN 4 THEN (SELECT TOP 1 [LabelName] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
						WHEN 6 THEN (SELECT TOP 1 [LabelName] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
						ELSE (SELECT TOP 1 [LabelName] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 AND [Name] IS NOT NULL ORDER BY [ItemID] DESC)
					END)
				ELSE NULL
			END AS [LabelName],
			CASE [LinkedType]
				WHEN 1 THEN (SELECT CASE [ModuleID]
					WHEN 3 THEN 1
						WHEN 4 THEN (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups4] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AND [IsDeleted] = 0)
						WHEN 6 THEN (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups6] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AND [IsDeleted] = 0)
						ELSE (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups12] WHERE [GroupID] = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AND [IsDeleted] = 0)
					END)
				ELSE (SELECT CASE [LinkedModuleID]
						WHEN 3 THEN 1
						WHEN 4 THEN (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups4] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0)
						WHEN 6 THEN (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups6] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0)
						ELSE (SELECT TOP 1 [ObjTypeID] FROM [dbo].[Groups12] WHERE [GroupID] = a.[LinkedOrigID] AND [IsDeleted] = 0)
					END)
			END AS [ObjTypeID],
			CASE [ModuleID]
				WHEN 3 THEN (SELECT CASE [LinkedType]
						WHEN 1 THEN (SELECT TOP 1 [FileExtension] FROM [dbo].[Items3] WHERE [OrigID] = a.[LinkedOrigID])
						ELSE 'folder'
					END)
				ELSE (SELECT CASE [ModuleID]
						WHEN 4 THEN (SELECT CASE [LinkedType]
								WHEN 1 THEN 'record'
								ELSE 'folder'
							END)
						WHEN 6 THEN (SELECT CASE [LinkedType]
								WHEN 1 THEN 'improvement'
								ELSE 'folder'
							END)
						ELSE (SELECT CASE [LinkedType]
								WHEN 1 THEN 'training'
								ELSE 'folder'
							END)
					END)
			END AS [FileExtension],
			CASE [LinkedModuleID]
				WHEN 3 THEN (SELECT CASE [LinkedType]
						WHEN 1 THEN (SELECT CASE [ModuleID]
								WHEN 3 THEN (SELECT TOP 1 [TypeOfPublish] FROM [dbo].[Items3] WHERE [OrigID] = a.[OrigID])
								ELSE 0
							END)
						ELSE 0
					END)
				ELSE 0
			END AS [TypeOfPublish],
			CASE [LinkedType]
				WHEN 1 THEN (SELECT CASE [ModuleID]
						WHEN 3 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = a.[OrigID])
						WHEN 4 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])
						WHEN 6 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])
						WHEN 12 THEN (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = a.[OrigID])
					END)
				ELSE 0
			END AS [ParentGroupID],
			a.[ModuleID], a.[LinkedOrigID], a.[LinkedType], a.[LinkedModuleID]
		FROM [dbo].[ParaLink] AS a
		WHERE a.[LinkedOrigID] = @OrigID AND a.[LinkedModuleID] = @ModuleID
	)
	SELECT *
	FROM cte 
	WHERE [Name] IS NOT NULL AND [PMarkID] <> -1
	ORDER BY [Name]

	SET NOCOUNT OFF;

END

GO
/****** Object:  StoredProcedure [dbo].[v4_ParaLink_Remove_PLink]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 18, 2020>
-- Description:	<Remove selected Para-Link>
-- =============================================
CREATE PROCEDURE [dbo].[v4_ParaLink_Remove_PLink]
	@PLinkID int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OrigID INT, @ModuleID INT, @LinkCount INT;
	
	SELECT @OrigID = [OrigID], @ModuleID = [ModuleID]
	FROM [dbo].[ParaLink]
	WHERE [PLinkID] = @PLinkID;

	-- Remove Link
	DELETE FROM [dbo].[ParaLink]
	WHERE [PLinkID] = @PLinkID;

	-- If Source Item no longer has links, unflag it
	SET @LinkCount = (SELECT COUNT(PLinkID) FROM [dbo].[ParaLink] WHERE ([OrigID] = @OrigID AND [ModuleID] = @ModuleID) OR ([LinkedOrigID] = @OrigID AND [LinkedModuleID] = @ModuleID))

	IF @LinkCount = 0
		BEGIN
			IF @ModuleID = 3
				BEGIN
					UPDATE [dbo].[Items3]
					SET [HasPLink] = 0
					WHERE [OrigID] = @OrigID;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					UPDATE [dbo].[Items4]
					SET [HasPLink] = 0
					WHERE [OrigID] = @OrigID;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					UPDATE [dbo].[Items6]
					SET [HasPLink] = 0
					WHERE [OrigID] = @OrigID;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					UPDATE [dbo].[Items12]
					SET [HasPLink] = 0
					WHERE [OrigID] = @OrigID;
				END
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Add_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 9, 2020>
-- Description:	<Add members to selected role>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Add_Role_Members]
	@ModuleID INT,
	@OrigID INT,
	@IsGroup INT,
	@CatID INT,
	@ControlID INT,
	@ControlFullName NVARCHAR(255),
	@ControlType INT,
	@CreateBy NVARCHAR(255),
	@CreatorID INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @IsItemID BIT, @FieldValues NVARCHAR(MAX);
	IF @IsGroup = 1
		BEGIN
			SET @IsItemID = 0
		END
	ELSE
		BEGIN
			SET @IsItemID = 1
		END

    INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ObjTypeID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
	VALUES(@OrigID,@IsItemID,@IsGroup,5,@ModuleID,@CatID,0,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE())

	IF (@ModuleID = 3 AND @IsGroup = 0)
		BEGIN
			-- Update InsertFieldValues
			IF @OrigID IN (SELECT [OrigID] FROM [dbo].[InsertFieldValues] WHERE [RoleCatID] = @CatID AND [SubType] = 1 GROUP BY [OrigID])
				BEGIN
					UPDATE [dbo].[InsertFieldValues]
					SET [FieldValues] = 
					(
						SELECT STUFF((SELECT ',' + [ControlFullName]
						FROM [dbo].[ControlLists]
						WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 1
						GROUP BY [ControlFullName]
						ORDER BY [ControlFullName]
						FOR XML PATH('')), 1, 1, '') [FieldValues]
					)
					WHERE [RoleCatID] = @CatID AND [OrigID] = @OrigID AND [SubType] = 1
				END
			ELSE
				BEGIN
					SET @FieldValues = 
					(
						SELECT STUFF((SELECT ',' + [ControlFullName]
						FROM [dbo].[ControlLists]
						WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 1
						GROUP BY [ControlFullName]
						ORDER BY [ControlFullName]
						FOR XML PATH('')), 1, 1, '')
					)
			
					INSERT INTO [dbo].[InsertFieldValues]([ItemID],[RoleCatID],[SubType],[OrigID],[FieldValues])
					SELECT [ItemID],@CatID,1,@OrigID,@FieldValues
					FROM [dbo].[Items3]
					WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
				END
			
			IF @OrigID IN (SELECT [OrigID] FROM [dbo].[InsertFieldValues] WHERE [RoleCatID] = @CatID AND [SubType] = 2 GROUP BY [OrigID])
				BEGIN
					UPDATE [dbo].[InsertFieldValues]
					SET [FieldValues] = 
					(
						SELECT STUFF((SELECT ',' + [ControlFullName]
						FROM [dbo].[ControlLists]
						WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 6
						GROUP BY [ControlFullName]
						ORDER BY [ControlFullName]
						FOR XML PATH('')), 1, 1, '')
					)
					WHERE [RoleCatID] = @CatID AND [OrigID] = @OrigID AND [SubType] = 2
				END
			ELSE
				BEGIN
					SET @FieldValues = 
					(
						SELECT STUFF((SELECT ',' + [ControlFullName]
						FROM [dbo].[ControlLists]
						WHERE [OrigID] = @OrigID AND [CatID] = @CatID AND [ListClass] = 5 AND [ModuleID] = 3 AND [IsGroup] = 0 AND [ControlType] = 6
						GROUP BY [ControlFullName]
						ORDER BY [ControlFullName]
						FOR XML PATH('')), 1, 1, '')
					)
			
					INSERT INTO [dbo].[InsertFieldValues]([ItemID],[RoleCatID],[SubType],[OrigID],[FieldValues])
					SELECT [ItemID],@CatID,2,@OrigID,@FieldValues
					FROM [dbo].[Items3]
					WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
				END

			DELETE FROM [dbo].[InsertFieldValues]
			WHERE [FieldValues] IS NULL OR [FieldValues] = ''
		END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_Categories_To_SubFolders]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 4, 2021>
-- Description:	<Apply Selected Group Categories to all sub-folders and items>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Apply_Categories_To_SubFolders]
	@ModuleID int,
	@GroupID int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @TModuleID INT, @TGroupID INT, @CatID INT, @SubGroupID INT;
	SET @TModuleID = @ModuleID;
	SET @TGroupID = @TGroupID;

	IF @ModuleID = 3
		BEGIN
			-- DELETE ALL OLD CATEGORIES FOR ALL SUBFOLDERS
			;WITH cte AS 
			(
				SELECT [GroupID]
				FROM [dbo].[Groups3]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups3] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM cte) AND [IDType] = 0;

			-- ADD NEW CATEGORIES FOR ALL SUB-FOLDERS AND ITEMS
			DECLARE categories_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN categories_cursor;
			FETCH NEXT FROM categories_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					DECLARE groups_cursor CURSOR FOR
						WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups3]
							WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups3] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						)
						SELECT [GroupID] FROM cte;
					OPEN groups_cursor;
					FETCH NEXT FROM groups_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@SubGroupID,0,@ModuleID,@CatID);
							EXEC [dbo].[v4_Properties_Apply_Categories_To_SubItems] @ModuleID=@ModuleID,@GroupID=@SubGroupID;

							FETCH NEXT FROM groups_cursor INTO @SubGroupID;
						END
					CLOSE groups_cursor;
					DEALLOCATE groups_cursor;
					FETCH NEXT FROM categories_cursor INTO @CatID;
				END
			CLOSE categories_cursor;
			DEALLOCATE categories_cursor;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			-- DELETE ALL OLD CATEGORIES FOR ALL SUBFOLDERS
			;WITH cte AS 
			(
				SELECT [GroupID]
				FROM [dbo].[Groups4]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups4] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM cte) AND [IDType] = 0;

			-- ADD NEW CATEGORIES FOR ALL SUB-FOLDERS AND ITEMS
			DECLARE categories_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN categories_cursor;
			FETCH NEXT FROM categories_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					DECLARE groups_cursor CURSOR FOR
						WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups4]
							WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups4] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						)
						SELECT [GroupID] FROM cte;
					OPEN groups_cursor;
					FETCH NEXT FROM groups_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@SubGroupID,0,@ModuleID,@CatID);
							EXEC [dbo].[v4_Properties_Apply_Categories_To_SubItems] @ModuleID=@ModuleID,@GroupID=@SubGroupID;

							FETCH NEXT FROM groups_cursor INTO @SubGroupID;
						END
					CLOSE groups_cursor;
					DEALLOCATE groups_cursor;
					FETCH NEXT FROM categories_cursor INTO @CatID;
				END
			CLOSE categories_cursor;
			DEALLOCATE categories_cursor;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			-- DELETE ALL OLD CATEGORIES FOR ALL SUBFOLDERS
			;WITH cte AS 
			(
				SELECT [GroupID]
				FROM [dbo].[Groups6]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups6] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM cte) AND [IDType] = 0;

			-- ADD NEW CATEGORIES FOR ALL SUB-FOLDERS AND ITEMS
			DECLARE categories_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN categories_cursor;
			FETCH NEXT FROM categories_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					DECLARE groups_cursor CURSOR FOR
						WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups6]
							WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups6] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						)
						SELECT [GroupID] FROM cte;
					OPEN groups_cursor;
					FETCH NEXT FROM groups_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@SubGroupID,0,@ModuleID,@CatID);
							EXEC [dbo].[v4_Properties_Apply_Categories_To_SubItems] @ModuleID=@ModuleID,@GroupID=@SubGroupID;

							FETCH NEXT FROM groups_cursor INTO @SubGroupID;
						END
					CLOSE groups_cursor;
					DEALLOCATE groups_cursor;
					FETCH NEXT FROM categories_cursor INTO @CatID;
				END
			CLOSE categories_cursor;
			DEALLOCATE categories_cursor;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			-- DELETE ALL OLD CATEGORIES FOR ALL SUBFOLDERS
			;WITH cte AS 
			(
				SELECT [GroupID]
				FROM [dbo].[Groups12]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups12] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM cte) AND [IDType] = 0;

			-- ADD NEW CATEGORIES FOR ALL SUB-FOLDERS AND ITEMS
			DECLARE categories_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN categories_cursor;
			FETCH NEXT FROM categories_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					DECLARE groups_cursor CURSOR FOR
						WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups12]
							WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups12] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
						)
						SELECT [GroupID] FROM cte;
					OPEN groups_cursor;
					FETCH NEXT FROM groups_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@SubGroupID,0,@ModuleID,@CatID);
							EXEC [dbo].[v4_Properties_Apply_Categories_To_SubItems] @ModuleID=@ModuleID,@GroupID=@SubGroupID;

							FETCH NEXT FROM groups_cursor INTO @SubGroupID;
						END
					CLOSE groups_cursor;
					DEALLOCATE groups_cursor;
					FETCH NEXT FROM categories_cursor INTO @CatID;
				END
			CLOSE categories_cursor;
			DEALLOCATE categories_cursor;
		END
    
	SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_Categories_To_SubItems]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 4, 2021>
-- Description:	<Apply Folder Categories to Sub-Items>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Apply_Categories_To_SubItems]
	@ModuleID int,
	@GroupID int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @CatID INT, @ItemOrigID INT, @HasCategory INT;

	IF @ModuleID = 3
		BEGIN
			-- Remove old categories
			;WITH cte AS
			(
				SELECT [OrigID]
				FROM [dbo].[Items3]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT DISTINCT [OrigID] FROM cte) AND [IDType] = 1;

			-- Add new categories (if applicable)
			DECLARE category_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN category_cursor;
			FETCH NEXT FROM category_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN					
					DECLARE item_cursor CURSOR FOR
						SELECT DISTINCT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0;
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@ItemOrigID,1,@ModuleID,@CatID);
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
					FETCH NEXT FROM category_cursor INTO @CatID;
				END
			CLOSE category_cursor;
			DEALLOCATE category_cursor;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			-- Remove old categories
			;WITH cte AS
			(
				SELECT [OrigID]
				FROM [dbo].[Items4]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT DISTINCT [OrigID] FROM cte) AND [IDType] = 1;

			-- Add new categories (if applicable)
			DECLARE category_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN category_cursor;
			FETCH NEXT FROM category_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN					
					DECLARE item_cursor CURSOR FOR
						SELECT DISTINCT [OrigID]
						FROM [dbo].[Items4]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0;
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@ItemOrigID,1,@ModuleID,@CatID);							
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
					FETCH NEXT FROM category_cursor INTO @CatID;
				END
			CLOSE category_cursor;
			DEALLOCATE category_cursor;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			-- Remove old categories
			;WITH cte AS
			(
				SELECT [OrigID]
				FROM [dbo].[Items6]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT DISTINCT [OrigID] FROM cte) AND [IDType] = 1;

			-- Add new categories (if applicable)
			DECLARE category_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN category_cursor;
			FETCH NEXT FROM category_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN					
					DECLARE item_cursor CURSOR FOR
						SELECT DISTINCT [OrigID]
						FROM [dbo].[Items6]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0;
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@ItemOrigID,1,@ModuleID,@CatID);							
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
					FETCH NEXT FROM category_cursor INTO @CatID;
				END
			CLOSE category_cursor;
			DEALLOCATE category_cursor;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			-- Remove old categories
			;WITH cte AS
			(
				SELECT [OrigID]
				FROM [dbo].[Items12]
				WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			)
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT DISTINCT [OrigID] FROM cte) AND [IDType] = 1;

			-- Add new categories (if applicable)
			DECLARE category_cursor CURSOR FOR
				SELECT [CatID]
				FROM [dbo].[CatgryValues]
				WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
			OPEN category_cursor;
			FETCH NEXT FROM category_cursor INTO @CatID;
			WHILE @@FETCH_STATUS = 0
				BEGIN					
					DECLARE item_cursor CURSOR FOR
						SELECT DISTINCT [OrigID]
						FROM [dbo].[Items12]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0;
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
							VALUES(@ItemOrigID,1,@ModuleID,@CatID);							
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
					FETCH NEXT FROM category_cursor INTO @CatID;
				END
			CLOSE category_cursor;
			DEALLOCATE category_cursor;
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_EventDate]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 3, 2021>
-- Description:	<Apply Event Date Settings to Item/Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Apply_EventDate] 
	@ModuleID int,
	@IsGroup int,
	@OrigID int,
	@CatID int,
	@SetType int,
	@DateType int,
	@Repeat int,
	@IntervalNum int,
	@IntervalType int,
	@DateValue datetime,
	@TriggerNum int,
	@TriggerType int,
	@TriggerDate datetime,
	@TriggerBeforeAfter int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DateID INT, @IsEvidence BIT;

	-- DELETE IF CHANGED TO 'NOT SET'
	IF @SetType = 0
		BEGIN
			IF @IsGroup = 1
				BEGIN
					DELETE FROM [dbo].[EventDate]
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = 0;
				END
			ELSE
				BEGIN
					DELETE FROM [dbo].[EventDate]
					WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = 1;
				END			
		END
	ELSE
		BEGIN
			-- SET TRIGGER DATE
			IF @IsGroup = 1
				BEGIN
					SET @TriggerDate = CONVERT(DATETIME, '1900-01-01');
				END
			ELSE
				BEGIN
					IF @SetType = 1
						BEGIN
							IF @TriggerType = 3 -- DAY
								BEGIN
									IF @TriggerBeforeAfter = 0
										BEGIN
											SET @TriggerDate = DATEADD(DAY, (@TriggerNum * -1), @DateValue);
										END
									ELSE
										BEGIN
											SET @TriggerDate = DATEADD(DAY, @TriggerNum, @DateValue);
										END							
								END
							ELSE IF @TriggerType = 4 --WEEK
								BEGIN
									IF @TriggerBeforeAfter = 0
										BEGIN
											SET @TriggerDate = DATEADD(WEEK, (@TriggerNum * -1), @DateValue);
										END
									ELSE
										BEGIN
											SET @TriggerDate = DATEADD(WEEK, @TriggerNum, @DateValue);
										END							
								END
							ELSE IF @TriggerType = 5 --MONTH
								BEGIN
									IF @TriggerBeforeAfter = 0
										BEGIN
											SET @TriggerDate = DATEADD(MONTH, (@TriggerNum * -1), @DateValue);
										END
									ELSE
										BEGIN
											SET @TriggerDate = DATEADD(MONTH, @TriggerNum, @DateValue);
										END							
								END
							ELSE IF @TriggerType = 6 --YEAR
								BEGIN
									IF @TriggerBeforeAfter = 0
										BEGIN
											SET @TriggerDate = DATEADD(YEAR, (@TriggerNum * -1), @DateValue);
										END
									ELSE
										BEGIN
											SET @TriggerDate = DATEADD(YEAR, @TriggerNum, @DateValue);
										END							
								END
						END
					ELSE IF @SetType = 2
						BEGIN
							DECLARE @TempTrigger DATETIME;
							SET @TempTrigger = (SELECT [datevalue] FROM [dbo].[ItemsDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [DateType] = @DateType);
							IF @TempTrigger IS NOT NULL						
								BEGIN
									WHILE @TempTrigger < GETDATE()
									BEGIN
										IF @IntervalType = 3 --DAY
											BEGIN
												SET @TempTrigger = DATEADD(DAY, @IntervalNum, @TempTrigger);
											END
										IF @IntervalType = 4 --WEEK
											BEGIN
												SET @TempTrigger = DATEADD(WEEK, @IntervalNum, @TempTrigger);
											END
										IF @IntervalType = 5 --MONTH
											BEGIN
												SET @TempTrigger = DATEADD(MONTH, @IntervalNum, @TempTrigger);
											END
										IF @IntervalType = 6 --YEAR
											BEGIN
												SET @TempTrigger = DATEADD(YEAR, @IntervalNum, @TempTrigger);
											END
									END

									IF @TriggerType = 3 -- DAY
										BEGIN
											IF @TriggerBeforeAfter = 0
												BEGIN
													SET @TriggerDate = DATEADD(DAY, (@TriggerNum * -1), @TempTrigger);
												END
											ELSE
												BEGIN
													SET @TriggerDate = DATEADD(DAY, @TriggerNum, @TempTrigger);
												END							
										END
									ELSE IF @TriggerType = 4 --WEEK
										BEGIN
											IF @TriggerBeforeAfter = 0
												BEGIN
													SET @TriggerDate = DATEADD(WEEK, (@TriggerNum * -1), @TempTrigger);
												END
											ELSE
												BEGIN
													SET @TriggerDate = DATEADD(WEEK, @TriggerNum, @TempTrigger);
												END							
										END
									ELSE IF @TriggerType = 5 --MONTH
										BEGIN
											IF @TriggerBeforeAfter = 0
												BEGIN
													SET @TriggerDate = DATEADD(MONTH, (@TriggerNum * -1), @TempTrigger);
												END
											ELSE
												BEGIN
													SET @TriggerDate = DATEADD(MONTH, @TriggerNum, @TempTrigger);
												END							
										END
									ELSE IF @TriggerType = 6 --YEAR
										BEGIN
											IF @TriggerBeforeAfter = 0
												BEGIN
													SET @TriggerDate = DATEADD(YEAR, (@TriggerNum * -1), @TempTrigger);
												END
											ELSE
												BEGIN
													SET @TriggerDate = DATEADD(YEAR, @TriggerNum, @TempTrigger);
												END							
										END
								END					
						END
					
					-- IF ITEM IS EVIDENCE, RESET TRIGGER DATE
					IF @IsEvidence = 1
						BEGIN
							SET @TriggerDate = CONVERT(DATETIME, '1900-01-01');
						END

				END

			-- ADD/UPDATE EVENT DATE
			IF @IsGroup = 1
				BEGIN		
					-- INSERT/UPDATE IF NEW EVENT DATE
					SET @DateID = (SELECT [DateID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = 0);
					IF @DateID IS NULL
						BEGIN
							INSERT INTO [dbo].[EventDate]([CatID],[ModuleID],[OrigID],[IDType],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],[DateValue],[TriggerNum],[TriggerType],
								[TriggerDate],[TriggerBeforeAfter],[StopCalculation])
							SELECT @CatID,@ModuleID,@OrigID,0,@SetType,@DateType,@Repeat,@IntervalNum,@IntervalType,@DateValue,@TriggerNum,@TriggerType,@TriggerDate,@TriggerBeforeAfter,0;
						END
					ELSE
						BEGIN
							UPDATE [dbo].[EventDate]
							SET [SetType] = @SetType, [DateType] = @DateType, [Repeat] = @Repeat, [IntervalNum] = @IntervalNum, [IntervalType] = @IntervalType,	[DateValue] = @DateValue, 
								[TriggerNum] = @TriggerNum, [TriggerType] = @TriggerType, [TriggerDate] = @TriggerDate, [TriggerBeforeAfter] = @TriggerBeforeAfter, [StopCalculation] = 0
							WHERE [DateID] = @DateID;
						END
				END
			ELSE
				BEGIN
					-- INSERT/UPDATE IF NEW EVENT DATE
					SET @DateID = (SELECT [DateID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = 1);
					IF @DateID IS NULL
						BEGIN
							INSERT INTO [dbo].[EventDate]([CatID],[ModuleID],[OrigID],[IDType],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],[DateValue],[TriggerNum],[TriggerType],
								[TriggerDate],[TriggerBeforeAfter],[StopCalculation])
							SELECT @CatID,@ModuleID,@OrigID,1,@SetType,@DateType,@Repeat,@IntervalNum,@IntervalType,@DateValue,@TriggerNum,@TriggerType,@TriggerDate,@TriggerBeforeAfter,0;
						END
					ELSE
						BEGIN
							UPDATE [dbo].[EventDate]
							SET [SetType] = @SetType, [DateType] = @DateType, [Repeat] = @Repeat, [IntervalNum] = @IntervalNum, [IntervalType] = @IntervalType,	[DateValue] = @DateValue, 
								[TriggerNum] = @TriggerNum, [TriggerType] = @TriggerType, [TriggerDate] = @TriggerDate, [TriggerBeforeAfter] = @TriggerBeforeAfter, [StopCalculation] = 0
							WHERE [DateID] = @DateID;
						END
				END
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_EventDate_To_SubFolders]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 4, 2021>
-- Description:	<Apply Event Dates to all sub-folders and items>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Apply_EventDate_To_SubFolders]
	@ModuleID int,
	@GroupID int
AS
BEGIN

	SET NOCOUNT ON;

	-- DECLARE EVENT DATE VARIABLES
	DECLARE @EDDateID INT, @EDCatID INT, @EDSetType INT, @EDDateType INT, @EDRepeat INT, @EDIntervalNum INT, @EDIntervalType INT, @EDDateValue DATETIME, @EDTriggerNum INT, 
		@EDTriggerType INT, @EDTriggerDate DATETIME, @EDTriggerBeforeAfter INT;
	-- DECLARE ITEM/GROUP VARIABLES
	DECLARE @ItemOrigID INT, @SubGroupID INT;
	-- DECLARE GroupID TABLE
	DECLARE @Groups TABLE
	(
		[GroupID] INT
	);

	IF @ModuleID = 3
		BEGIN
			;WITH cte AS
			(
				SELECT [GroupID]
				FROM [dbo].[Groups3]
				WHERE ([ParentGroupID] = @GroupID OR [GroupID] = @GroupID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups3] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			INSERT INTO @Groups
			SELECT * FROM cte
			GROUP BY [GroupID];
		END
	ELSE IF @ModuleID = 4
		BEGIN
			;WITH cte AS
			(
				SELECT [GroupID]
				FROM [dbo].[Groups4]
				WHERE ([ParentGroupID] = @GroupID OR [GroupID] = @GroupID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups4] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			INSERT INTO @Groups
			SELECT * FROM cte
			GROUP BY [GroupID];
		END
	ELSE IF @ModuleID = 6
		BEGIN
			;WITH cte AS
			(
				SELECT [GroupID]
				FROM [dbo].[Groups6]
				WHERE ([ParentGroupID] = @GroupID OR [GroupID] = @GroupID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups6] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			INSERT INTO @Groups
			SELECT * FROM cte
			GROUP BY [GroupID];
		END
	ELSE IF @ModuleID = 12
		BEGIN
			;WITH cte AS
			(
				SELECT [GroupID]
				FROM [dbo].[Groups12]
				WHERE ([ParentGroupID] = @GroupID OR [GroupID] = @GroupID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
				UNION ALL
				SELECT a.[GroupID]
				FROM [dbo].[Groups12] AS a
				INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
				WHERE a.[IsDeleted] = 0 AND ISNULL([Name], '') <> ''
			)
			INSERT INTO @Groups
			SELECT * FROM cte
			GROUP BY [GroupID];
		END

	-- REPLACE ON ALL SUB-ITEMS	& FOLDERS
	DECLARE eventdate_cursor CURSOR FOR
		SELECT [DateID],[CatID],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter]
		FROM [dbo].[EventDate]
		WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
	OPEN eventdate_cursor;
	FETCH NEXT FROM eventdate_cursor INTO @EDDateID, @EDCatID, @EDSetType, @EDDateType, @EDRepeat, @EDIntervalNum, @EDIntervalType, @EDDateValue, 
		@EDTriggerNum, @EDTriggerType, @EDTriggerDate, @EDTriggerBeforeAfter;
	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @ModuleID = 3
				BEGIN
					-- APPLY EVENT DATES TO SUB-GROUPS
					DECLARE group_cursor CURSOR FOR
						SELECT [GroupID]
						FROM @Groups;
					OPEN group_cursor;
					FETCH NEXT FROM group_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=3,@IsGroup=1,@OrigID=@SubGroupID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM group_cursor INTO @SubGroupID;
						END
					CLOSE group_cursor;
					DEALLOCATE group_cursor;

					-- APPLY EVENT DATES TO SUB-ITEMS
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=3,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					-- APPLY EVENT DATES TO SUB-GROUPS
					DECLARE group_cursor CURSOR FOR
						SELECT [GroupID]
						FROM @Groups;
					OPEN group_cursor;
					FETCH NEXT FROM group_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=4,@IsGroup=1,@OrigID=@SubGroupID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM group_cursor INTO @SubGroupID;
						END
					CLOSE group_cursor;
					DEALLOCATE group_cursor;

					-- APPLY EVENT DATES TO SUB-ITEMS
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items4]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=4,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					-- APPLY EVENT DATES TO SUB-GROUPS
					DECLARE group_cursor CURSOR FOR
						SELECT [GroupID]
						FROM @Groups;
					OPEN group_cursor;
					FETCH NEXT FROM group_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=6,@IsGroup=1,@OrigID=@SubGroupID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM group_cursor INTO @SubGroupID;
						END
					CLOSE group_cursor;
					DEALLOCATE group_cursor;

					-- APPLY EVENT DATES TO SUB-ITEMS
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items6]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=6,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					-- APPLY EVENT DATES TO SUB-GROUPS
					DECLARE group_cursor CURSOR FOR
						SELECT [GroupID]
						FROM @Groups;
					OPEN group_cursor;
					FETCH NEXT FROM group_cursor INTO @SubGroupID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=12,@IsGroup=1,@OrigID=@SubGroupID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM group_cursor INTO @SubGroupID;
						END
					CLOSE group_cursor;
					DEALLOCATE group_cursor;

					-- APPLY EVET DATES TO SUB-ITEMS
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items12]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=12,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END

			FETCH NEXT FROM eventdate_cursor INTO @EDDateID, @EDCatID, @EDSetType, @EDDateType, @EDRepeat, @EDIntervalNum, @EDIntervalType, @EDDateValue, 
				@EDTriggerNum, @EDTriggerType, @EDTriggerDate, @EDTriggerBeforeAfter;
		END
	CLOSE eventdate_cursor;
	DEALLOCATE eventdate_cursor;	

	-- REMOVE ITEM EVENT DATES THAT DO NOT EXIST AT PARENT FOLDER
	IF @ModuleID = 3
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM @Groups) AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items3] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	ELSE IF @ModuleID = 4
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM @Groups) AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	ELSE IF @ModuleID = 6
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM @Groups) AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items6] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	ELSE IF @ModuleID = 12
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] IN (SELECT [GroupID] FROM @Groups) AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items12] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END

	-- IF NO EVENT DATES EXIST IN ROOT DELETE ALL EVENT DATES FROM ALL SUB-FOLDERS AND ITEMS
	DECLARE @EventDateCount INT;
	SET @EventDateCount = (SELECT COUNT([DateID]) FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0);
	IF @EventDateCount = 0
		BEGIN
			-- DELETE FOR GROUPS
			DELETE FROM [dbo].[EventDate]
			WHERE [OrigID] IN (SELECT [GroupID] FROM @Groups) AND [IDType] = 0 AND [ModuleID] = @ModuleID;

			-- DELETE FROM ITEMS
			IF @ModuleID = 3
				BEGIN
					DELETE FROM [dbo].[EventDate]
					WHERE [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items3] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 GROUP BY [OrigID]) AND [IDType] = 1 AND [ModuleID] = @ModuleID;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					DELETE FROM [dbo].[EventDate]
					WHERE [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 GROUP BY [OrigID]) AND [IDType] = 1 AND [ModuleID] = @ModuleID;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					DELETE FROM [dbo].[EventDate]
					WHERE [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 GROUP BY [OrigID]) AND [IDType] = 1 AND [ModuleID] = @ModuleID;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					DELETE FROM [dbo].[EventDate]
					WHERE [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] IN (SELECT [GroupID] FROM @Groups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0 GROUP BY [OrigID]) AND [IDType] = 1 AND [ModuleID] = @ModuleID;
				END
		END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_EventDate_To_SubItems]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 3, 2021>
-- Description:	<Apply Event Date to items in Folder>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Apply_EventDate_To_SubItems]
	@ModuleID int,
	@GroupID int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- DECLARE EVENT DATE VARIABLES
	DECLARE @EDDateID INT, @EDCatID INT, @EDSetType INT, @EDDateType INT, @EDRepeat INT, @EDIntervalNum INT, @EDIntervalType INT, @EDDateValue DATETIME, @EDTriggerNum INT, 
		@EDTriggerType INT, @EDTriggerDate DATETIME, @EDTriggerBeforeAfter INT;
	-- DECLARE ITEM VARIABLES
	DECLARE @ItemOrigID INT, @ItemIsEvidence BIT;

	DECLARE eventdate_cursor CURSOR FOR
		SELECT [DateID],[CatID],[SetType],[DateType],[Repeat],[IntervalNum],[IntervalType],[DateValue],[TriggerNum],[TriggerType],[TriggerDate],[TriggerBeforeAfter]
		FROM [dbo].[EventDate]
		WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0;
	OPEN eventdate_cursor;
	FETCH NEXT FROM eventdate_cursor INTO @EDDateID, @EDCatID, @EDSetType, @EDDateType, @EDRepeat, @EDIntervalNum, @EDIntervalType, @EDDateValue, 
		@EDTriggerNum, @EDTriggerType, @EDTriggerDate, @EDTriggerBeforeAfter;
	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @ModuleID = 3
				BEGIN					
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=3,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items4]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=4,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items6]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=6,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;					
				END
			ELSE IF @ModuleID = 12
				BEGIN
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items12]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];
					OPEN item_cursor
					FETCH NEXT FROM item_cursor INTO @ItemOrigID;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- APPLY EVENT DATE
							EXEC [dbo].[v4_Properties_Apply_EventDate] @ModuleID=12,@IsGroup=0,@OrigID=@ItemOrigID,@CatID=@EDCatID,@SetType=@EDSetType,@DateType=@EDDateType,
								@Repeat=@EDRepeat,@IntervalNum=@EDIntervalNum,@IntervalType=@EDIntervalType,@DateValue=@EDDateValue,@TriggerNum=@EDTriggerNum,@TriggerType=@EDTriggerType,
								@TriggerDate=@EDTriggerDate,@TriggerBeforeAfter=@EDTriggerBeforeAfter;
							FETCH NEXT FROM item_cursor INTO @ItemOrigID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;					
				END
			
			FETCH NEXT FROM eventdate_cursor INTO @EDDateID, @EDCatID, @EDSetType, @EDDateType, @EDRepeat, @EDIntervalNum, @EDIntervalType, @EDDateValue, 
				@EDTriggerNum, @EDTriggerType, @EDTriggerDate, @EDTriggerBeforeAfter;
		END
	CLOSE eventdate_cursor;
	DEALLOCATE eventdate_cursor;

	-- REMOVE ITEM EVENT DATES THAT DO NOT EXIST AT PARENT FOLDER
	IF @ModuleID = 3
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items3] WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	ELSE IF @ModuleID = 4
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	ELSE IF @ModuleID = 6
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items6] WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	ELSE IF @ModuleID = 12
		BEGIN
			DELETE FROM [dbo].[EventDate]
			WHERE [ModuleID] = @ModuleID AND [IDType] = 1 
				AND [CatID] NOT IN (SELECT [CatID] FROM [dbo].[EventDate] WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [IDType] = 0)
				AND [OrigID] IN (SELECT [OrigID] FROM [dbo].[Items12] WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0);
		END
	
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Apply_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 7, 2020>
-- Description:	<Add new members to role>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Apply_Role_Members]
	@Type int,
	@ModuleID int,
	@GroupID int,
	@CatID int,
	@CreateBy nvarchar(255),
	@CreatorID int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ControlID INT;
	DECLARE @ControlFullName NVARCHAR(255);
	DECLARE @ControlType INT;
	DECLARE @FileID INT;
	DECLARE @SubGroupID INT;
	DECLARE @SubFileID INT;
	DECLARE @FieldValues NVARCHAR(MAX);

	IF @Type = 1
		BEGIN
			IF @ModuleID = 3
				BEGIN			
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] = 109 AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]

					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @FileID;

					WHILE @@FETCH_STATUS = 0
						BEGIN						
							DECLARE role_cursor CURSOR FOR
								SELECT [ControlID], [ControlFullName], [ControlType]
								FROM [dbo].[ControlLists]
								WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [CatID] = @CatID AND [IsGroup] = 1;

							OPEN role_cursor
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType

							WHILE @@FETCH_STATUS = 0
							BEGIN
								-- Update role member for item
								INSERT INTO [dbo].[ControlLists]([OrigID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
								VALUES (@FileID,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
								
								-- Update InsertFieldValues
								--EXEC [dbo].[v4_Document_Update_InsertFieldValues] @OrigID = @FileID, @CatID = @CatID;
								
								FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
							END
							
							CLOSE role_cursor
							DEALLOCATE role_cursor

							FETCH NEXT FROM item_cursor INTO @FileID;
						END
					CLOSE item_cursor;
					DEALLOCATE item_cursor;				
				END
			ELSE IF @ModuleID = 4
				BEGIN
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items4]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];

					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @FileID;

					WHILE @@FETCH_STATUS = 0
						BEGIN
							DECLARE role_cursor CURSOR FOR
								SELECT [ControlID], [ControlFullName], [ControlType]
								FROM [dbo].[ControlLists]
								WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [CatID] = @CatID AND [IsGroup] = 1;

							OPEN role_cursor
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType

							WHILE @@FETCH_STATUS = 0
							BEGIN
								INSERT INTO [dbo].[ControlLists]([OrigID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
								VALUES (@FileID,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

								FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
							END
							
							CLOSE role_cursor
							DEALLOCATE role_cursor

							FETCH NEXT FROM item_cursor INTO @FileID;
						END;

					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items6]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];

					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @FileID;

					WHILE @@FETCH_STATUS = 0
						BEGIN
							DECLARE role_cursor CURSOR FOR
								SELECT [ControlID], [ControlFullName], [ControlType]
								FROM [dbo].[ControlLists]
								WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [CatID] = @CatID AND [IsGroup] = 1;

							OPEN role_cursor
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType

							WHILE @@FETCH_STATUS = 0
							BEGIN
								INSERT INTO [dbo].[ControlLists]([OrigID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
								VALUES (@FileID,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

								FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
							END
							
							CLOSE role_cursor
							DEALLOCATE role_cursor

							FETCH NEXT FROM item_cursor INTO @FileID;
						END;

					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					DECLARE item_cursor CURSOR FOR
						SELECT [OrigID]
						FROM [dbo].[Items12]
						WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID];

					OPEN item_cursor;
					FETCH NEXT FROM item_cursor INTO @FileID;

					WHILE @@FETCH_STATUS = 0
						BEGIN
							DECLARE role_cursor CURSOR FOR
								SELECT [ControlID], [ControlFullName], [ControlType]
								FROM [dbo].[ControlLists]
								WHERE [ModuleID] = @ModuleID AND [OrigID] = @GroupID AND [CatID] = @CatID AND [IsGroup] = 1;

							OPEN role_cursor
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType

							WHILE @@FETCH_STATUS = 0
							BEGIN
								INSERT INTO [dbo].[ControlLists]([OrigID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
								VALUES (@FileID,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

								FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
							END
							
							CLOSE role_cursor
							DEALLOCATE role_cursor

							FETCH NEXT FROM item_cursor INTO @FileID;
						END;

					CLOSE item_cursor;
					DEALLOCATE item_cursor;
				END
		END
	ELSE
		BEGIN
			IF @ModuleID = 3
				BEGIN
					-- Get All Roles from parent folder
					DECLARE role_cursor CURSOR FOR
						SELECT [ControlID], [ControlFullName], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [OrigID] = @GroupID AND [IsGroup] = 1;
					OPEN role_cursor;
					FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- Apply to folder items
							DECLARE folder_items CURSOR FOR
								SELECT [OrigID]
								FROM [dbo].[Items3]
								WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
								GROUP BY [OrigID];
							OPEN folder_items;
							FETCH NEXT FROM folder_items INTO @FileID;							
							WHILE @@FETCH_STATUS = 0
								BEGIN
									-- Update role member for item
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@FileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
									FETCH NEXT FROM folder_items INTO @FileID;

									-- Update InsertFieldValues
									--EXEC [dbo].[v4_Document_Update_InsertFieldValues] @OrigID = @FileID, @CatID = @CatID;
								END
							CLOSE folder_items;
							DEALLOCATE folder_items;

							-- Apply to sub-folders and sub-items
							DECLARE sub_folders CURSOR FOR
								WITH cteGroups AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups3]
									WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups3] AS a
									INNER JOIN cteGroups AS b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
								)
								SELECT [GroupID] FROM cteGroups;
							OPEN sub_folders;
							FETCH NEXT FROM sub_folders INTO @SubGroupID;
							WHILE @@FETCH_STATUS = 0
								BEGIN
									-- Apply to sub-folder
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@SubGroupID,0,1,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

									-- Apply to sub-items
									DECLARE sub_items CURSOR FOR
										SELECT [OrigID]
										FROM [dbo].[Items3]
										WHERE [ParentGroupID] = @SubGroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
										GROUP BY [OrigID];
									OPEN sub_items
									FETCH NEXT FROM sub_items INTO @SubFileID;
									WHILE @@FETCH_STATUS = 0
										BEGIN
											-- Set role for item
											INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
											VALUES (@SubFileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

											-- Update InsertFieldValues
											--EXEC [dbo].[v4_Document_Update_InsertFieldValues] @OrigID = @SubFileID, @CatID = @CatID;

											FETCH NEXT FROM sub_items INTO @SubFileID;
										END
									CLOSE sub_items;
									DEALLOCATE sub_items;
									FETCH NEXT FROM sub_folders INTO @SubGroupID;
								END
							CLOSE sub_folders;
							DEALLOCATE sub_folders;
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
						END
					CLOSE role_cursor;
					DEALLOCATE role_cursor;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					-- Get All Roles from parent folder
					DECLARE role_cursor CURSOR FOR
						SELECT [ControlID], [ControlFullName], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [OrigID] = @GroupID AND [IsGroup] = 1;
					OPEN role_cursor;
					FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- Apply to folder items
							DECLARE folder_items CURSOR FOR
								SELECT [OrigID]
								FROM [dbo].[Items4]
								WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
								GROUP BY [OrigID];
							OPEN folder_items;
							FETCH NEXT FROM folder_items INTO @FileID;							
							WHILE @@FETCH_STATUS = 0
								BEGIN
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@FileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
									FETCH NEXT FROM folder_items INTO @FileID;
								END
							CLOSE folder_items;
							DEALLOCATE folder_items;

							-- Apply to sub-folders and sub-items
							DECLARE sub_folders CURSOR FOR
								WITH cteGroups AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups4]
									WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups4] AS a
									INNER JOIN cteGroups AS b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
								)
								SELECT [GroupID] FROM cteGroups;
							OPEN sub_folders;
							FETCH NEXT FROM sub_folders INTO @SubGroupID;
							WHILE @@FETCH_STATUS = 0
								BEGIN
									-- Apply to sub-folder
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@SubGroupID,0,1,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

									-- Apply to sub-items
									DECLARE sub_items CURSOR FOR
										SELECT [OrigID]
										FROM [dbo].[Items4]
										WHERE [ParentGroupID] = @SubGroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
										GROUP BY [OrigID];
									OPEN sub_items
									FETCH NEXT FROM sub_items INTO @SubFileID;
									WHILE @@FETCH_STATUS = 0
										BEGIN
											INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
											VALUES (@SubFileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
											FETCH NEXT FROM sub_items INTO @SubFileID;
										END
									CLOSE sub_items;
									DEALLOCATE sub_items;
									FETCH NEXT FROM sub_folders INTO @SubGroupID;
								END
							CLOSE sub_folders;
							DEALLOCATE sub_folders;
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
						END
					CLOSE role_cursor;
					DEALLOCATE role_cursor;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					-- Get All Roles from parent folder
					DECLARE role_cursor CURSOR FOR
						SELECT [ControlID], [ControlFullName], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [OrigID] = @GroupID AND [IsGroup] = 1;
					OPEN role_cursor;
					FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- Apply to folder items
							DECLARE folder_items CURSOR FOR
								SELECT [OrigID]
								FROM [dbo].[Items6]
								WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
								GROUP BY [OrigID];
							OPEN folder_items;
							FETCH NEXT FROM folder_items INTO @FileID;							
							WHILE @@FETCH_STATUS = 0
								BEGIN
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@FileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
									FETCH NEXT FROM folder_items INTO @FileID;
								END
							CLOSE folder_items;
							DEALLOCATE folder_items;

							-- Apply to sub-folders and sub-items
							DECLARE sub_folders CURSOR FOR
								WITH cteGroups AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups6]
									WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups6] AS a
									INNER JOIN cteGroups AS b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
								)
								SELECT [GroupID] FROM cteGroups;
							OPEN sub_folders;
							FETCH NEXT FROM sub_folders INTO @SubGroupID;
							WHILE @@FETCH_STATUS = 0
								BEGIN
									-- Apply to sub-folder
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@SubGroupID,0,1,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

									-- Apply to sub-items
									DECLARE sub_items CURSOR FOR
										SELECT [OrigID]
										FROM [dbo].[Items6]
										WHERE [ParentGroupID] = @SubGroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
										GROUP BY [OrigID];
									OPEN sub_items
									FETCH NEXT FROM sub_items INTO @SubFileID;
									WHILE @@FETCH_STATUS = 0
										BEGIN
											INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
											VALUES (@SubFileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
											FETCH NEXT FROM sub_items INTO @SubFileID;
										END
									CLOSE sub_items;
									DEALLOCATE sub_items;
									FETCH NEXT FROM sub_folders INTO @SubGroupID;
								END
							CLOSE sub_folders;
							DEALLOCATE sub_folders;
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
						END
					CLOSE role_cursor;
					DEALLOCATE role_cursor;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					-- Get All Roles from parent folder
					DECLARE role_cursor CURSOR FOR
						SELECT [ControlID], [ControlFullName], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [OrigID] = @GroupID AND [IsGroup] = 1;
					OPEN role_cursor;
					FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							-- Apply to folder items
							DECLARE folder_items CURSOR FOR
								SELECT [OrigID]
								FROM [dbo].[Items12]
								WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
								GROUP BY [OrigID];
							OPEN folder_items;
							FETCH NEXT FROM folder_items INTO @FileID;							
							WHILE @@FETCH_STATUS = 0
								BEGIN
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@FileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
									FETCH NEXT FROM folder_items INTO @FileID;
								END
							CLOSE folder_items;
							DEALLOCATE folder_items;

							-- Apply to sub-folders and sub-items
							DECLARE sub_folders CURSOR FOR
								WITH cteGroups AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups12]
									WHERE [ParentGroupID] = @GroupID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups12] AS a
									INNER JOIN cteGroups AS b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
								)
								SELECT [GroupID] FROM cteGroups;
							OPEN sub_folders;
							FETCH NEXT FROM sub_folders INTO @SubGroupID;
							WHILE @@FETCH_STATUS = 0
								BEGIN
									-- Apply to sub-folder
									INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
									VALUES (@SubGroupID,0,1,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());

									-- Apply to sub-items
									DECLARE sub_items CURSOR FOR
										SELECT [OrigID]
										FROM [dbo].[Items12]
										WHERE [ParentGroupID] = @SubGroupID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
										GROUP BY [OrigID];
									OPEN sub_items
									FETCH NEXT FROM sub_items INTO @SubFileID;
									WHILE @@FETCH_STATUS = 0
										BEGIN
											INSERT INTO [dbo].[ControlLists]([OrigID],[IsItemID],[IsGroup],[ListClass],[ModuleID],[CatID],[ControlID],[ControlFullName],[ControlType],[CreateBy],[CreatorID],[CreateDate])
											VALUES (@SubFileID,0,0,5,@ModuleID,@CatID,@ControlID,@ControlFullName,@ControlType,@CreateBy,@CreatorID,GETDATE());
											FETCH NEXT FROM sub_items INTO @SubFileID;
										END
									CLOSE sub_items;
									DEALLOCATE sub_items;
									FETCH NEXT FROM sub_folders INTO @SubGroupID;
								END
							CLOSE sub_folders;
							DEALLOCATE sub_folders;
							FETCH NEXT FROM role_cursor INTO @ControlID, @ControlFullName, @ControlType;
						END
					CLOSE role_cursor;
					DEALLOCATE role_cursor;
				END
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_EventDates]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <February 25, 2021>
-- Description:	<Get Event Date List for Properties>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_EventDates]
	@ModuleID int,
	@OrigID int,
	@IDType int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT a.[DateID], a.[CatID], b.[CatCaption] AS [DateName], CASE a.[SetType]
			WHEN 0 THEN 'not set'
			WHEN 1 THEN 'Set on the date: ' + CONVERT(VARCHAR(10), a.[DateValue], 101)
			WHEN 2 THEN 'Based on the status: ' + (SELECT CASE a.[DateType] 
				WHEN 9 THEN 'Current' 
				WHEN 7 THEN 'Pending' 
				WHEN 5 THEN 'Review'
				WHEN 4 THEN 'Ready'
				WHEN 3 THEN 'Collaborate'
				WHEN 2 THEN 'Draft'
				WHEN 0 THEN 'Obsolete'
				ELSE '' END)
		END AS [DateSettings], CASE a.[SetType]
			WHEN 2 THEN (SELECT DATEADD(YEAR, 2, c.[DateValue]))
			ELSE a.[DateValue]
			END AS [SetDate], a.[TriggerDate]
	FROM [dbo].[EventDate] AS a
	INNER JOIN [dbo].[CatDateSet] AS b ON a.[CatID] = b.[CatID]
	LEFT OUTER JOIN [dbo].[ItemsDate] AS c ON a.[OrigID] = c.[OrigID] AND c.[ModuleID] = @ModuleID AND c.[DateType] = 9
	WHERE a.[ModuleID] = @ModuleID AND a.[OrigID] = @OrigID AND a.[IDType] = @IDType;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_History]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 20, 2017>
-- Description:	<Retrieve Item History>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_History]
(
	@OrigID int,
	@ModuleID int,
	@IsGroup int
)
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @Type INT;

	IF (@IsGroup = 1)
		BEGIN
			SET @Type = 0;
		END
	ELSE
		BEGIN
			SET @Type = 1;
		END

	SELECT [MemoData]
	FROM [dbo].[HistoryMemo]
	WHERE [OrigID] = @OrigID AND [ModuleID] = @ModuleID AND [Type] = @Type;

	SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Info]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 20, 2017>
-- Description:	<Retrieve All Item Properties>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_Info]
(
	@ItemID int,
	@ModuleID int,
	@IsGroup int
)
AS

BEGIN
	SET NOCOUNT ON;

	IF @ModuleID = 1
		BEGIN
			IF (@IsGroup = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Groups1]
					WHERE [GroupID] = @ItemID;
				END
			ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items1]
					WHERE [UserID] = @ItemID;
				END
		END
	IF @ModuleID = 3
		BEGIN
			IF (@IsGroup = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Groups3]
					WHERE [GroupID] = @ItemID;
				END
			ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items3]
					WHERE [ItemID] = @ItemID;
				END
		END		
	ELSE IF @ModuleID = 4
		BEGIN
			IF (@IsGroup = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Groups4]
					WHERE [GroupID] = @ItemID;
				END
			ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items4]
					WHERE [ItemID] = @ItemID;
				END
		END		
	ELSE IF @ModuleID = 6
		BEGIN
			IF (@IsGroup = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Groups6]
					WHERE [GroupID] = @ItemID;
				END
			ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items6]
					WHERE [ItemID] = @ItemID;
				END			
		END		
	ELSE
		BEGIN
			IF (@IsGroup = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Groups12]
					WHERE [GroupID] = @ItemID;
				END
			ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items12]
					WHERE [ItemID] = @ItemID;
				END			
		END		
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_ItemCategories]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <February 26, 2021>
-- Description:	<Return all selected categories for an item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_ItemCategories] 
	@ModuleID int,
	@OrigID int,
	@IsGroup int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @IDType INT;
	IF @IsGroup = 1
		BEGIN
			SET @IDType = 0;
		END
	ELSE
		BEGIN
			SET @IDType = 1;
		END

    SELECT b.[CatID], a.[CatCaption]
	FROM [dbo].[CatDateSet] AS a
	INNER JOIN [dbo].[CatgryValues] AS b ON a.[CatID] = b.[CatID] and b.[ModuleID] = @ModuleID and b.[OrigID] = @OrigID AND b.[IDType] = @IDType
	WHERE a.[CatClass] = 0 AND a.[ModuleID] = @ModuleID
	ORDER BY a.[CatCaption];

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_OtherUserAIList]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 7, 2021>
-- Description:	<Get Other Users Action Items List for User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_OtherUserAIList]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [ControlID],[ControlFullName],[ControlType],CASE [ControlType]
		WHEN 1 THEN 'User'
		ELSE 'Entity'
		END AS [Type]
	FROM [dbo].[ControlLists]
	WHERE [ModuleID] = 1 AND [ListClass] = 19 AND [OrigID] = @UserID
	ORDER BY [ControlFullName];
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <February 27, 2020>
-- Description:	<Return all members of selected role>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_Role_Members] 
	@ModuleID int,
	@ID int,
	@CatID int,
	@IsGroup int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [ID], [ControlID], [ControlFullName], [ControlType]
	FROM [dbo].[ControlLists]
	WHERE [OrigID] = @ID AND [ModuleID] = @ModuleID AND [ListClass] = 5 AND [CatID] = @CatID AND [IsGroup] = @IsGroup

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Roles]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <February 27, 2020>
-- Description:	<Return Roles for Module>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_Roles] 
	@ModuleID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [CatID], [CatCaption]
	from [dbo].[CatDateSet]
	where [ModuleID] = @ModuleID and [CatClass] = 5
	order by [CatCaption]

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_Training]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 20, 2017>
-- Description:	<Retrieve All Item Related Training>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_Training]
(
	@ItemID int,
	@ModuleID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT a.[ItemID], a.[ToID], a.[ReqID], b.[ParentGroupID], b.[Name],
	CASE [Status]
		WHEN 0 THEN 'Complete' + ' (' + b.[Version] + ')'
		ELSE 'Open' + ' (' + b.[Version] + ')'
	END AS [Status],
	b.[VersionDate], c.[ObjTypeID]
	FROM [dbo].[TrainRelation] AS a
	INNER JOIN [dbo].[Items12] AS b ON a.[ItemID] = b.[ItemID] AND b.[IsDeleted] = 0 AND b.[IsWithdrawn] = 0
	INNER JOIN [dbo].[DefReq] AS c ON a.[ReqID] = c.[MyID]
	WHERE a.[ToModuleID] = @ModuleID AND a.[ToID] = @ItemID-- AND a.[ItemID] > 0
	ORDER BY b.[Name]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_UserMemberships]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 5, 2021>
-- Description:	<Return Memberships for User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_UserMemberships] 
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [GroupID],[Name]
	FROM [dbo].[Groups1]
	WHERE [GroupID] IN(SELECT [OrigID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlID] = @UserID)
	ORDER BY [Name];
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Get_UserTraining]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 7, 2021>
-- Description:	<Return All Training for User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Get_UserTraining] 
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT a.[ItemID],a.[OrigID],a.[ParentGroupID],a.[Name],a.[LabelName], CASE a.[Status]
		WHEN 0 THEN 'Complete'
		ELSE 'Open'
		END AS [Status],a.[Version],a.[VersionDate],b.[ObjTypeID]
	FROM [dbo].[Items12] AS a
	INNER JOIN [dbo].[Groups12] AS b ON a.[ParentGroupID] = b.[GroupID]
	WHERE a.[UserID] = @UserID
	GROUP BY a.[ItemID],a.[OrigID],a.[ParentGroupID],a.[Name],a.[LabelName],a.[Status],a.[Version],a.[VersionDate],b.[ObjTypeID]
	ORDER BY a.[Name],a.[OrigID];
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Has_Category_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 5, 2021>
-- Description:	<Return Edit Category Permissions on Item/Group for User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Has_Category_Permission]
	@ModuleID int,
	@OrigID int,
	@IsGroup int,
	@UserID int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelID INT, @UserStatus INT, @ParentOrigID INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);
	SET @ParentOrigID = @OrigID;

	IF @ModuleID = 3
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 3013;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 4013;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 6013;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items12] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 1213;
		END

	IF (@UserStatus IN (0,1))
		BEGIN
			DECLARE assigned_cursor CURSOR FOR
				SELECT [ControlID], [ControlType]
				FROM [dbo].[LevelAccess] 
				WHERE [ModuleID] = @ModuleID AND [GroupID] = @ParentOrigID AND [LevelID] = @LevelID AND [LevelValue] = 1 AND [IsDeleted] = 0;
			OPEN assigned_cursor;
			FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					IF @ControlType = 1 -- User
						BEGIN
							IF @UserID = @ControlID
								BEGIN
									INSERT INTO @TempTable
									SELECT @UserID;
								END
						END
					ELSE
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups1]
								WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups1] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
							)
							INSERT INTO @TempTable
							SELECT [ID]
							FROM [dbo].[ControlLists]
							WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte);
						END
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
				END
			CLOSE assigned_cursor;
			DEALLOCATE assigned_cursor;
		END

    SELECT [ID] 
	FROM @TempTable;

	SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Has_EventDate_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 5, 2021>
-- Description:	<Return Edit Event Date Permissions on Item/Group for User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Has_EventDate_Permission]
	@ModuleID int,
	@OrigID int,
	@IsGroup int,
	@UserID int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelID INT, @UserStatus INT, @ParentOrigID INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);
	SET @ParentOrigID = @OrigID;

	IF @ModuleID = 3
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 3038;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items4] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 4038;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items6] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 6038;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			IF @IsGroup = 0
				BEGIN
					SET @ParentOrigID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items12] WHERE [OrigID] = @OrigID);
				END
			SET @LevelID = 1238;
		END

	IF (@UserStatus IN (0,1))
		BEGIN
			DECLARE assigned_cursor CURSOR FOR
				SELECT [ControlID], [ControlType]
				FROM [dbo].[LevelAccess] 
				WHERE [ModuleID] = @ModuleID AND [GroupID] = @ParentOrigID AND [LevelID] = @LevelID AND [LevelValue] = 1 AND [IsDeleted] = 0;
			OPEN assigned_cursor;
			FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					IF @ControlType = 1 -- User
						BEGIN
							IF @UserID = @ControlID
								BEGIN
									INSERT INTO @TempTable
									SELECT @UserID;
								END
						END
					ELSE
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups1]
								WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups1] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
							)
							INSERT INTO @TempTable
							SELECT [ID]
							FROM [dbo].[ControlLists]
							WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte);
						END
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
				END
			CLOSE assigned_cursor;
			DEALLOCATE assigned_cursor;
		END

    SELECT [ID] 
	FROM @TempTable;

	SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Purge_Role_Members]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 7, 2020>
-- Description:	<Remove role members from all sub-items in a group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Purge_Role_Members]
	@Type int,
	@ModuleID int,
	@ID int,
	@CatID int
AS
BEGIN
	SET NOCOUNT ON;

	IF @Type = 0 -- Sub-items only
		BEGIN			
			IF @ModuleID = 3
				BEGIN
					-- Remove existing role members from sub-items
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					-- Remove entries from InsertFieldValues
					DELETE FROM [dbo].[InsertFieldValues]
					WHERE [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)
				END
			ELSE IF @ModuleID = 4
				BEGIN
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN 
						(
							SELECT [OrigID]
							FROM [dbo].[Items4]
							WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
							GROUP BY [OrigID]
						)
				END
			ELSE IF @ModuleID = 6
				BEGIN
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
						(
							SELECT [OrigID]
							FROM [dbo].[Items6]
							WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
							GROUP BY [OrigID]
						)
				END
			ELSE IF @ModuleID = 12
				BEGIN
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
						(
							SELECT [OrigID]
							FROM [dbo].[Items12]
							WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
							GROUP BY [OrigID]
						)
				END
		END
	ELSE -- Sub Groups and items
		BEGIN
			IF @ModuleID = 3
				BEGIN
					-- delete from items in selected folder
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					-- delete from items
					;WITH cteSubItems AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups3]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups3] AS a
						INNER JOIN cteSubItems AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cteSubItems) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					;WITH cteSubItems2 AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups3]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups3] AS a
						INNER JOIN cteSubItems2 AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					-- remove item entries from InsertFieldValues
					DELETE FROM [dbo].[InsertFieldValues]
					WHERE [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items3]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cteSubItems2) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					-- Delete from sub-groups
					;WITH cteSubGroups AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups3]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups3] AS a
						INNER JOIN cteSubGroups AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cteSubGroups)
				END
			ELSE IF @ModuleID = 4
				BEGIN
					-- delete from items in selected folder
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items4]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					;WITH cteSubGroups AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups4]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups4] AS a
						INNER JOIN cteSubGroups AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items4]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cteSubGroups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)
				END
			ELSE IF @ModuleID = 6
				BEGIN
					-- delete from items in selected folder
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items6]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					;WITH cteSubGroups AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups6]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups6] AS a
						INNER JOIN cteSubGroups AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items6]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cteSubGroups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)
				END
			ELSE IF @ModuleID = 12
				BEGIN
					-- delete from items in selected folder
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items12]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)

					;WITH cteSubGroups AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups12]
						WHERE [ParentGroupID] = @ID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups12] AS a
						INNER JOIN cteSubGroups AS b ON a.[ParentGroupID] = b.[GroupID]
						WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
					)
					DELETE FROM [dbo].[ControlLists]
					WHERE [ModuleID] = @ModuleID AND [CatID] = @CatID AND [IsGroup] = 0 AND [OrigID] IN
					(
						SELECT [OrigID]
						FROM [dbo].[Items12]
						WHERE [ParentGroupID] IN (SELECT [GroupID] FROM cteSubGroups) AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
						GROUP BY [OrigID]
					)
				END
		END
	
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Remove_Role_Member]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno Chris>
-- Create date: <February 27, 2020>
-- Description:	<Remove Selected Role Member>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Remove_Role_Member]
	@ID int,
	@ModuleID int,
	@OrigID int,
	@IsGroup int,
	@CatID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE FROM [dbo].[ControlLists]
	WHERE [ID] = @ID

	IF (@ModuleID = 3 AND @IsGroup = 0)
		BEGIN
			EXEC [dbo].[v4_Document_Update_InsertFieldValues] @OrigID = @OrigID, @CatID = @CatID
		END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Remove_UserMembership]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 17, 2021>
-- Description:	<Remove user from selected membership>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Remove_UserMembership] 
	@UserID int,
	@GroupID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [dbo].[ControlLists]
	WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [OrigID] = @GroupID AND [IsGroup] = 1 AND [ListClass] = 1 AND [ControlType] = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_Category]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 2, 2021>
-- Description:	<Update Category>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Update_Category] 
	@ModuleID int,
	@OrigID int,
	@CatID int,
	@IDType int,
	@IsChecked bit
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RowCount INT;
	SET @RowCount = (SELECT COUNT([OrigID]) FROM [dbo].[CatgryValues] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = @IDType);


	IF (@IsChecked = 1 AND @RowCount = 0)
		BEGIN
			INSERT INTO [dbo].[CatgryValues]([OrigID],[IDType],[ModuleID],[CatID])
			VALUES(@OrigID,@IDType,@ModuleID,@CatID);
		END
	ELSE IF @IsChecked = 0
		BEGIN
			DELETE FROM [dbo].[CatgryValues]
			WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [CatID] = @CatID AND [IDType] = @IDType;
		END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_History]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 3, 2021>
-- Description:	<Update History when applying changes to item from properties>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Update_History]
	@ModuleID int,
	@OrigID int,
	@Type int,
	@HistoryMemo nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TOrigID INT, @THistoryMemo NVARCHAR(MAX);
	SELECT @TOrigID=[OrigID], @THistoryMemo=[MemoData] FROM [dbo].[HistoryMemo] WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = @Type;

	IF @TOrigID IS NOT NULL
		BEGIN
			UPDATE [dbo].[HistoryMemo]
			SET [MemoData] = @HistoryMemo + CHAR(10) + @THistoryMemo + CHAR(10)
			WHERE [ModuleID] = @ModuleID AND [OrigID] = @OrigID AND [Type] = @Type;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[HistoryMemo]([OrigID],[Type],[ModuleID],[DataType],[MemoData])
			VALUES(@OrigID,@Type,@ModuleID,0,@HistoryMemo);
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_Notes]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 2, 2021>
-- Description:	<Update Item/Group notes>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Update_Notes] 
	@ModuleID int,
	@OrigID int,
	@IDType int,
	@Notes nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	IF @IDType = 1
		BEGIN
			IF @ModuleID = 3
				BEGIN
					UPDATE [dbo].[Items3]
					SET [Notes] = @Notes
					WHERE [OrigID] = @OrigID;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					UPDATE [dbo].[Items4]
					SET [Notes] = @Notes
					WHERE [OrigID] = @OrigID;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					UPDATE [dbo].[Items6]
					SET [Notes] = @Notes
					WHERE [OrigID] = @OrigID;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					UPDATE [dbo].[Items12]
					SET [Notes] = @Notes
					WHERE [OrigID] = @OrigID;
				END
		END
	ELSE
		BEGIN
			IF @ModuleID = 3
				BEGIN
					UPDATE [dbo].[Groups3]
					SET [Notes] = @Notes
					WHERE [GroupID] = @OrigID;
				END
			ELSE IF @ModuleID = 4
				BEGIN
					UPDATE [dbo].[Groups4]
					SET [Notes] = @Notes
					WHERE [GroupID] = @OrigID;
				END
			ELSE IF @ModuleID = 6
				BEGIN
					UPDATE [dbo].[Groups6]
					SET [Notes] = @Notes
					WHERE [GroupID] = @OrigID;
				END
			ELSE IF @ModuleID = 12
				BEGIN
					UPDATE [dbo].[Groups12]
					SET [Notes] = @Notes
					WHERE [GroupID] = @OrigID;
				END
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_OtherUserAIList]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 12, 2021>
-- Description:	<Add User/Entity to Other User AI list>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Update_OtherUserAIList]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@ControlID int,
	@ControlFullName nvarchar(255),
	@ControlType int,
	@CurrentUserID int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Exists INT,@UserName NVARCHAR(255),@DateStamp DATETIME,@CurrentUserName NVARCHAR(255);
	SET @Exists = (SELECT COUNT([ID]) FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ListClass] = 19 AND [ControlID] = @ControlID AND [ControlType] = @ControlType AND [OrigID] = @UserID);
	SET @UserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @UserID);
	SET @DateStamp = GETDATE();
	SET @CurrentUserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @CurrentUserID);

	if @Exists = 0
		BEGIN
			INSERT INTO [dbo].[ControlLists]([OrigID],[ModuleID],[ListClass],[ObjTypeID],[ControlID],[ControlFullName],[ControlType],
				[CreateBy],[CreatorID],[CreateDate],[LastModified],[ModifierID],[ModifiedBy])
			VALUES(@UserID,1,19,19,@ControlID,@ControlFullName,@ControlType,@CurrentUserName,@CurrentUserID,@DateStamp,@DateStamp,@CurrentUserID,@CurrentUserName);
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Properties_Update_UserMembershipList]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 14, 2021>
-- Description:	<Update Memberships for User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Properties_Update_UserMembershipList]
	@UserID int,
	@ControlID int,
	@ControlFullName nvarchar(255),
	@CurrentUserID int
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @Exists INT,@UserName NVARCHAR(255),@DateStamp DATETIME,@CurrentUserName NVARCHAR(255);
	SET @Exists = (SELECT COUNT([ID]) FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ListClass] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] = @ControlID);
	SET @UserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @UserID);
	SET @DateStamp = GETDATE();
	SET @CurrentUserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @CurrentUserID);

	if @Exists = 0
		BEGIN
			INSERT INTO [dbo].[ControlLists]([OrigID],[IsGroup],[ModuleID],[ListClass],[ObjTypeID],[ControlID],[ControlFullName],[ControlType],
				[CreateBy],[CreatorID],[CreateDate],[LastModified],[ModifierID],[ModifiedBy])
			VALUES(@ControlID,1,1,1,0,@UserID,@UserName,1,@CurrentUserName,@CurrentUserID,@DateStamp,@DateStamp,@CurrentUserID,@CurrentUserName);
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_AllResponsible]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/10/2017>
-- Description:	<Add Responsible to Record Tabs Control List>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Add_AllResponsible]
(
@NewItemID int,
@ParentGroupID int,
@ModuleID int
)
AS

BEGIN
	WITH cte
	AS(select [OrigID], [IsItemID], [IsGroup], [ListClass], [ModuleID], [ObjTypeID], [ControlID], [ControlFullName], [ControlType],
		[CreateBy], [CreatorID], [CreateDate], [LastModified], [ModifierID], [ModifiedBy]
		FROM [dbo].[ControlLists]
		WHERE [ModuleID] = @ModuleID AND [OrigID] = @ParentGroupID AND [ListClass] = 6 AND [IsGroup] = 1)
	INSERT INTO [dbo].[ControlLists]([OrigID], [IsItemID], [IsGroup], [ListClass], [ModuleID], [ObjTypeID], [ControlID], [ControlFullName],
		[ControlType], [CreateBy], [CreatorID], [CreateDate], [LastModified], [ModifierID], [ModifiedBy])
	SELECT @NewItemID, 0, 0, [ListClass], [ModuleID], [ObjTypeID], [ControlID], [ControlFullName], [ControlType], [CreateBy], [CreatorID], [CreateDate], [LastModified], [ModifierID], [ModifiedBy]
	FROM cte;
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_FieldValues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/9/2017>
-- Description:	<Add Field Values to RecordsData>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Add_FieldValues]
(
@FieldID int, 
@ItemID int, 
@ModuleID int, 
@NumData int, 
@TextData nvarchar(255),
@MemoData nvarchar(4000), 
@DateData datetime,
@BinaryData varbinary(max), 
@IsDeleted bit,
@ReqID int
)
AS

BEGIN
	INSERT INTO RecordsData
		(FieldID, ItemID, ModuleID, NumData, TextData, MemoData, DateData, BinaryData, IsDeleted, ReqID)
	VALUES
		(@FieldID, @ItemID, @ModuleID, @NumData, @TextData, @MemoData, @DateData, @BinaryData, @IsDeleted, @ReqID)
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_Responsible]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/10/2017>
-- Description:	<Add Responsible to Record Tabs Control List>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Add_Responsible]
(
@OrigID int, 
@IsItemID bit, 
@IsGroup bit, 
@ListClass int, 
@ModuleID int, 
@ObjTypeID int, 
@ControlID int, 
@ControlFullName nvarchar(255),
@ControlType int, 
@CreateBy nvarchar(255), 
@CreatorID int, 
@CreateDate datetime, 
@LastModified datetime, 
@ModifierID int, 
@ModifiedBy nvarchar(255)
)
AS

BEGIN
INSERT INTO ControlLists
	(OrigID, IsItemID, IsGroup, ListClass, ModuleID, ObjTypeID, ControlID, ControlFullName,
	ControlType, CreateBy, CreatorID, CreateDate, LastModified, ModifierID, ModifiedBy)
VALUES
	(@OrigID, @IsItemID, @IsGroup, @ListClass, @ModuleID, @ObjTypeID, @ControlID, @ControlFullName,
	@ControlType, @CreateBy, @CreatorID, @CreateDate, @LastModified, @ModifierID, @ModifiedBy)
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_StepResponsible]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <July 12, 2018>
-- Description:	<Insert added responsible persons to COntrolLists>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Add_StepResponsible] 
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@OrigID int,
	@ObjTypeID int,
	@ControlID int,
	@ControlFullName nvarchar(255),
	@ControlType int,
	@UserName nvarchar(255),
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ControlLists](OrigID,IsItemID,IsGroup,ListClass,ModuleID,CatID,ObjTypeID,ControlID,ControlFullName,ControlType,CreateBy,CreatorID,CreateDate,LastModified,ModifierID,ModifiedBy)
	VALUES(@OrigID,0,0,6,@ModuleID,0,@ObjTypeID,@ControlID,@ControlFullName,@ControlType,@UserName,@UserID,GETDATE(),GETDATE(),@UserID,@UserName)
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Add_TabDueDate]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <August 2, 2018>
-- Description:	<Add Step Due Date information>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Add_TabDueDate] 
	@ModuleID int,
	@ParentGroupID int,
	@ItemID int,
	@CreateBy nvarchar(255),
	@CreatorID int,
	@CreateDate DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[DueDate]
		([OrigID],[ModuleID],[IsGroup],[IsItemID],[ObjTypeID],[IsEnabled],[DayInterval],[DueDate],[CreateBy],[CreatorID],[CreateDate],[LastModified],[ModifierID],[ModifiedBy],
			[PopUpType],[IsEsEnabled],[EsDay],[IsPendingEnabled],[IsStepInapplicable],[HideAddBtnInPopUp],[CmpltStpWhnAICmplt])
		SELECT @ItemID,@ModuleID,0,0,[ObjTypeID],[IsEnabled],[DayInterval],[DueDate],@CreateBy,@CreatorID,@CreateDate,@CreateDate,@CreatorID,@CreateBy,
			[PopUpType],[IsEsEnabled],[EsDay],[IsPendingEnabled],[IsStepInapplicable],[HideAddBtnInPopUp],[CmpltStpWhnAICmplt]
		FROM [dbo].[DueDate]
		WHERE [ModuleID] = @ModuleID AND [OrigID] = @ParentGroupID AND [IsGroup] = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Complete_Item]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/5/2017>
-- Description:	<Complete Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Complete_Item]
	@ItemID int,
	@ModuleID int

AS

BEGIN
	IF @ModuleID = 4
		BEGIN
			UPDATE [dbo].[Items6]
			SET [Status] = 0
			WHERE [ItemID] = @ItemID
		END
	IF @ModuleID = 6
		BEGIN
			UPDATE [dbo].[Items6]
			SET [Status] = 0
			WHERE [ItemID] = @ItemID
		END
		
	ELSE
		UPDATE [dbo].[Items12]
		SET [Status] = 0
		WHERE [ItemID] = @ItemID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Complete_Tab]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/5/2017>
-- Description:	<Mark Record tab as "Finished">
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Complete_Tab]
	@UserFullName nvarchar (255),
	@CheckedDate datetime,
	@CheckerID int,
	@ModuleID int,
	@ItemID int,
	@ObjID int,
	@ReqID int
AS

BEGIN
	IF (@ModuleID = 12)
		BEGIN
			UPDATE ItemObj
			SET IsChecked = 1, CheckedBy = @UserFullName, CheckedDate = @CheckedDate, CheckerID = @CheckerID
			WHERE ModuleID = @ModuleID AND ItemID = @ItemID and ReqID = @ReqID
		END
	ELSE
		BEGIN
			UPDATE ItemObj
			SET IsChecked = 1, CheckedBy = @UserFullName, CheckedDate = @CheckedDate, CheckerID = @CheckerID
			WHERE ModuleID = @ModuleID AND ItemID = @ItemID and ObjID = @ObjID
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Create_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/9/2017>
-- Description:	<Create New Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Create_Record]
(
@ModuleID int,
@IsGroupRecord bit,
@ParentGroupID int,
@SerialID int,
@ControlType int,
@Name nvarchar(255),
@LabelName nvarchar(255),
@HasPLink bit,
@Status int,
@CreateBy nvarchar(255),
@CreateDate datetime,
@ModifiedBy nvarchar(255),
@LastModified datetime,
@IsDeleted bit,
@CreatorID int,
@ModifierID int, 
@DueDateEnabled bit,
@VersionDate datetime, 
@VersionedBy nvarchar(255), 
@VersionedByID int, 
@IsWithdrawn bit,
@PublishMode int,
@NeedPublish bit, 
@NeedPublishToSP bit, 
@IsLockedForPublish bit,
@PublishNow bit, 
@PublishToSPNow bit, 
@RemovedFromPublish bit,
@UserFullName nvarchar(255),
@UserID int
)
AS

BEGIN
	DECLARE @NewItemID INT, @RecordCount INT, @NewName NVARCHAR(255), @NewLabel NVARCHAR(255);
	DECLARE @Table TABLE ([OrigID] INT);

	IF (@ModuleID = 4)
		BEGIN
			INSERT INTO [dbo].[Items4]
				([ParentGroupID], [SerialID], [ControlType], [Name], [LabelName], [HasPLink], [Version], [Status], [CreateBy], [CreateDate], [ModifiedBy], 
				[LastModified], [IsDeleted], [CreatorID], [ModifierID], [DueDateEnabled], [VersionDate], [VersionedBy], [VersionedByID], [IsWithdrawn], [PublishMode], 
				[NeedPublish], [NeedPublishToSP], [IsLockedForPublish], [PublishNow], [PublishToSPNow], [RemovedFromPublish])
            OUTPUT INSERTED.ItemID
			VALUES
				(@ParentGroupID, @SerialID, @ControlType, @Name, @LabelName, @HasPLink, '1', @Status, @CreateBy, @CreateDate, @ModifiedBy, 
				@LastModified, @IsDeleted, @CreatorID, @ModifierID, @DueDateEnabled, @VersionDate, @VersionedBy, @VersionedByID, @IsWithdrawn, @PublishMode, 
				@NeedPublish, @NeedPublishToSP, @IsLockedForPublish, @PublishNow, @PublishToSPNow, @RemovedFromPublish)
			SET @NewItemID = SCOPE_IDENTITY();
			-- UPDATE OrigID
            UPDATE [dbo].[Items4]
			SET [OrigID] = @NewItemID
			WHERE [ItemID] = @NewItemID
			-- IF AUTONAME, UPDATE Name with autotext specifications
			IF @Name LIKE '%(*)%'
				BEGIN
					SET @NewName = (SELECT REPLACE(@Name, '(*)', (SELECT RIGHT('00000000' + CONVERT(VARCHAR, @NewItemID), 8))))
					UPDATE [dbo].[Items4]
					SET [Name] = @NewName
					WHERE [OrigID] = @NewItemID;
				END
			IF @Name LIKE '%(?)%'
				BEGIN					
					INSERT INTO @Table SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @ParentGroupID GROUP BY [OrigID];
					SET @RecordCount = (SELECT COUNT([OrigID]) FROM @Table);
					SET @NewName = (SELECT REPLACE(@Name, '(?)', CONVERT(VARCHAR, @RecordCount)));
					UPDATE [dbo].[Items4]
					SET [Name] = @NewName
					WHERE [OrigID] = @NewItemID;
					DELETE FROM @Table;
				END

			-- IF AUTOLABEL, UPDATE LabelName with autotext specifications
			IF @LabelName LIKE '%(*)%'
				BEGIN
					SET @NewLabel = (SELECT REPLACE(@LabelName, '(*)', (SELECT RIGHT('00000000' + CONVERT(VARCHAR, @NewItemID), 8))));
					UPDATE [dbo].[Items4]
					SET [LabelName] = @NewLabel
					WHERE [OrigID] = @NewItemID;
				END
			IF @LabelName LIKE '%(?)%'
				BEGIN
					INSERT INTO @Table SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @ParentGroupID GROUP BY [OrigID];
					SET @RecordCount = (SELECT COUNT([OrigID]) FROM @Table);
					SET @NewLabel = (SELECT REPLACE(@LabelName, '(?)', CONVERT(NVARCHAR(10), @RecordCount)));
					UPDATE [dbo].[Items4]
					SET [LabelName] = @NewLabel
					WHERE [OrigID] = @NewItemID;
					DELETE FROM @Table;
					PRINT 'Label'
				END
		END
	ELSE IF (@ModuleID = 6)
		BEGIN
			INSERT INTO [dbo].[Items6]
				([ParentGroupID], [SerialID], [ControlType], [Name], [LabelName], [HasPLink], [Version], [Status], [CreateBy], [CreateDate], [ModifiedBy], 
				[LastModified], [IsDeleted], [CreatorID], [ModifierID], [DueDateEnabled], [VersionDate], [VersionedBy], [VersionedByID], [IsWithdrawn], [PublishMode], 
				[NeedPublish], [NeedPublishToSP], [IsLockedForPublish], [PublishNow], [PublishToSPNow], [RemovedFromPublish])
            OUTPUT INSERTED.ItemID
            VALUES
				(@ParentGroupID, @SerialID, @ControlType, @Name, @LabelName, @HasPLink, '1', @Status, @CreateBy, @CreateDate, @ModifiedBy, 
				@LastModified, @IsDeleted, @CreatorID, @ModifierID, @DueDateEnabled, @VersionDate, @VersionedBy, @VersionedByID, @IsWithdrawn, @PublishMode, 
				@NeedPublish, @NeedPublishToSP, @IsLockedForPublish, @PublishNow, @PublishToSPNow, @RemovedFromPublish)
            SET @NewItemID = SCOPE_IDENTITY();
			UPDATE [dbo].[Items6]			
			SET [OrigID] = @NewItemID
			WHERE [ItemID] = @NewItemID;

			IF @Name LIKE '%(*)%'
				BEGIN
					SET @NewName = (SELECT REPLACE(@Name, '(*)', (SELECT RIGHT('00000000' + CONVERT(VARCHAR, @NewItemID), 8))))
					UPDATE [dbo].[Items6]
					SET [Name] = @NewName
					WHERE [OrigID] = @NewItemID;
				END
			IF @Name LIKE '%(?)%'
				BEGIN					
					INSERT INTO @Table SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @ParentGroupID GROUP BY [OrigID];
					SET @RecordCount = (SELECT COUNT([OrigID]) FROM @Table);
					SET @NewName = (SELECT REPLACE(@Name, '(?)', CONVERT(VARCHAR, @RecordCount)));
					UPDATE [dbo].[Items6]
					SET [Name] = @NewName
					WHERE [OrigID] = @NewItemID;
					DELETE FROM @Table;
				END

			-- IF AUTOLABEL, UPDATE LabelName with autotext specifications
			IF @LabelName LIKE '%(*)%'
				BEGIN
					SET @NewLabel = (SELECT REPLACE(@LabelName, '(*)', (SELECT RIGHT('00000000' + CONVERT(VARCHAR, @NewItemID), 8))));
					UPDATE [dbo].[Items6]
					SET [LabelName] = @NewLabel
					WHERE [OrigID] = @NewItemID;
				END
			IF @LabelName LIKE '%(?)%'
				BEGIN
					INSERT INTO @Table SELECT [OrigID] FROM [dbo].[Items4] WHERE [ParentGroupID] = @ParentGroupID GROUP BY [OrigID];
					SET @RecordCount = (SELECT COUNT([OrigID]) FROM @Table);
					SET @NewLabel = (SELECT REPLACE(@LabelName, '(?)', CONVERT(NVARCHAR(10), @RecordCount)));
					UPDATE [dbo].[Items6]
					SET [LabelName] = @NewLabel
					WHERE [OrigID] = @NewItemID;
					DELETE FROM @Table;
					PRINT 'Label'
				END
		END
	ELSE IF (@ModuleID = 12)
		BEGIN
			INSERT INTO [dbo].[Items12]
				([ParentGroupID], [SerialID], [IsGroupRecord], [RecordItemID], [RecordItemOrigID], [ControlType], [Name], [LabelName], [HasPLink], [Version], [Status], [CreateBy], [CreateDate], [ModifiedBy], 
				[LastModified], [IsDeleted], [CreatorID], [ModifierID], [DueDateEnabled], [VersionDate], [VersionedBy], [VersionedByID], [IsWithdrawn], [PublishMode], 
				[NeedPublish], [NeedPublishToSP], [IsLockedForPublish], [PublishNow], [PublishToSPNow], [RemovedFromPublish], [UserFullName], [UserID])
            OUTPUT INSERTED.ItemID
			VALUES
				(@ParentGroupID, @SerialID, @IsGroupRecord, 0, 0, @ControlType, @Name, @LabelName, @HasPlink, '1', @Status, @CreateBy, @CreateDate, @ModifiedBy, 
				@LastModified, @IsDeleted, @CreatorID, @ModifierID, @DueDateEnabled, @VersionDate, @VersionedBy, @VersionedByID, @IsWithDrawn, @PublishMode, 
				@NeedPublish, @NeedPublishToSP, @IsLockedForPublish, @PublishNow, @PublishToSPNow, @RemovedFromPublish, @UserFullName, @UserID)            
			UPDATE [dbo].[Items12]
			SET [OrigID] = SCOPE_IDENTITY()
			WHERE [ItemID] = SCOPE_IDENTITY()
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Create_Tabs]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/10/2017>
-- Description:	<Create Record Tabs>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Create_Tabs]
(
	@ItemID int,
	@ObjID int,
	@ModuleID int,
	@StepDueDate datetime,
	@DueStatus int,
	@DefID int,
	@ReqID int
)
AS

BEGIN
	IF (SELECT COUNT([ItemID]) FROM [dbo].[ItemObj] WHERE [ItemID] = @ItemID AND [ObjID] = @ObjID AND [ReqID] = @ReqID AND [IsDeleted] = 0) = 0
		BEGIN
			INSERT INTO [dbo].[ItemObj]([ItemID], [ObjID], [ModuleID], [StepDueDate], [DueStatus], [DefID], [ReqID])
			VALUES(@ItemID, @ObjID, @ModuleID, @StepDueDate, @DueStatus, @DefID, @ReqID);
		END
	ELSE
		BEGIN
			UPDATE [dbo].[ItemObj]
			SET [ItemID] = @ItemID, [ObjID] = @ObjID, [ModuleID] = @ModuleID, [StepDueDate] = @StepDueDate, [DueStatus] = @DueStatus, [DefID] = @DefID, [ReqID] = @ReqID
			WHERE [ItemID] = @ItemID AND [ObjID] = @ObjID AND [ReqID] = @ReqID AND [IsDeleted] = 0;
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Edit_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/2/2017>
-- Description:	<Edit Existing Record Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Edit_Record]
@LastModified datetime,
@ModifiedBy nvarchar (255),
@ModifierID int,
@ItemID int,
@ModuleID int

AS

BEGIN
	IF @ModuleID = 6
		BEGIN
			UPDATE [dbo].[Items6]
			SET [LastModified] = @LastModified, [ModifiedBy] = @ModifiedBy, [ModifierID] = @ModifierID
			WHERE [ItemID] = @ItemID
		END		
	ELSE IF @ModuleID = 4
		BEGIN
			UPDATE [dbo].[Items4]
			SET [LastModified] = @LastModified, [ModifiedBy] = @ModifiedBy, [ModifierID] = @ModifierID
			WHERE [ItemID] = @ItemID
		END
	ELSE
		BEGIN
			UPDATE [dbo].[Items12]
			SET [LastModified] = @LastModified, [ModifiedBy] = @ModifiedBy, [ModifierID] = @ModifierID
			WHERE [ItemID] = @ItemID
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_CalculatedType]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <February 25, 2019>
-- Description:	<Get result type for field>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_CalculatedType]
(
	@FieldID int
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [IsResult]
	FROM [dbo].[Calculation]
	WHERE [FieldID] = @FieldID
	GROUP BY [IsResult] 
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_CalculatedValue]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <February 25, 2019>
-- Description:	<Get result value for calculated field>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_CalculatedValue]
(
	@ItemID int,
	@FieldID int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CompOperator VARCHAR
	SET @CompOperator = (SELECT TOP 1 [CompOperator] FROM [dbo].[Calculation] WHERE [FieldID] = @FieldID)			

	IF @CompOperator LIKE 'NCAL'
		BEGIN
			DECLARE @CalcID int
			SET @CalcID = (SELECT [CalcID] FROM [dbo].[Calculation] WHERE [FieldID] = @FieldID)
			DECLARE @TypeID int
			SET @TypeID = (SELECT [FieldType] FROM [dbo].[ObjFields] WHERE [FieldID] = @FieldID)

			;WITH cte AS
			(
				SELECT ROW_NUMBER() OVER (ORDER BY a.[OptOrder]) AS RowNum, a.[CalcID], a.[FieldID], a.[CompOperator],
					CASE c.[FieldType]
						WHEN 0 THEN CONVERT(VARCHAR, b.[TextData])
						WHEN 1 THEN CONVERT(VARCHAR, b.[MemoData])
						WHEN 2 THEN CONVERT(VARCHAR, b.[NumData])
						WHEN 3 THEN CONVERT(VARCHAR, b.[TextData])
						WHEN 4 THEN CONVERT(VARCHAR, b.[DateData], 1)
						WHEN 5 THEN CONVERT(VARCHAR, b.[TextData])
						WHEN 6 THEN CONVERT(VARCHAR, b.[MemoData])
						WHEN 7 THEN CONVERT(VARCHAR, b.[TextData])
						WHEN 8 THEN CONVERT(VARCHAR, b.[NumData])
						WHEN 16 THEN CONVERT(VARCHAR, b.[DateData], 1)
						WHEN 18 THEN CONVERT(VARCHAR, b.[MemoData])
						WHEN 20 THEN CONVERT(VARCHAR, b.[MemoData])
						ELSE '0'
					END AS [FieldValue], c.[FieldType]
				FROM [dbo].[Calculation] AS a
				LEFT JOIN [dbo].[RecordsData] AS b ON a.[FieldID] = b.[FieldID] AND b.[ItemID] = @ItemID
				INNER JOIN [dbo].[ObjFields] AS c ON a.[FieldID] = c.[FieldID] AND c.[IsDisabled] = 0
				WHERE a.[CalcID] = @CalcID
			)
			SELECT *
			INTO #TempTable
			FROM cte

			DECLARE calc_cursor CURSOR FOR
			(
				SELECT [CompOperator], [FieldValue] FROM #TempTable
			)

			DECLARE @InitVal VARCHAR, @CompOp VARCHAR, @FVal VARCHAR, @FinalVal VARCHAR, @FinalDate DATETIME

			IF @TypeID = 4 OR @TypeID = 16
				BEGIN
					OPEN calc_cursor
					FETCH NEXT FROM calc_cursor
					INTO @CompOp, @FVal

					WHILE @@FETCH_STATUS = 0
					BEGIN
						IF @CompOp LIKE '='
							SET @InitVal = @FVal						
						ELSE IF @CompOp LIKE '+'
							SET @FinalDate = DATEADD(day, CONVERT(INT, @FVal), CONVERT(DATETIME, @InitVal))
						ELSE IF @CompOp LIKE '-'
							SET @FinalDate = DATEADD(day, -CONVERT(INT, @FVal), CONVERT(DATETIME, @InitVal))

						FETCH NEXT FROM calc_cursor INTO @CompOp, @FVal					
					END
				END
			ELSE
				BEGIN											
					OPEN calc_cursor
					FETCH NEXT FROM calc_cursor INTO @CompOp, @FVal
					WHILE @@FETCH_STATUS = 0
					BEGIN
						IF @CompOp LIKE '='
							SET @InitVal = @FVal						
						ELSE IF @CompOp LIKE '+'
							SET @InitVal = CONVERT(VARCHAR, (CONVERT(INT, @InitVal) + CONVERT(INT, @FVal)))								
						ELSE IF @CompOp LIKE '-'
							SET @InitVal = CONVERT(VARCHAR, (CONVERT(INT, @InitVal) - CONVERT(INT, @FVal)))
						ELSE IF @CompOp LIKE '*'
							SET @InitVal = CONVERT(VARCHAR, (CONVERT(INT, @InitVal) * CONVERT(INT, @FVal)))								
						ELSE IF @CompOp LIKE '/'
							SET @InitVal = CONVERT(VARCHAR, (CONVERT(INT, @InitVal) / CONVERT(INT, @FVal)))

						FETCH NEXT FROM calc_cursor INTO @CompOp, @FVal					
					END
					SET @FinalVal = @InitVal		
				END
			IF @TypeID = 4 OR @TypeID = 16
				BEGIN
					SELECT @FinalDate AS [FieldValue]
				END
			ELSE
				BEGIN
					SELECT @FinalVal AS [FieldValue]
				END
			CLOSE calc_cursor
			DEALLOCATE calc_cursor
			drop table #TempTable
		END
	ELSE
		BEGIN
			;WITH cte AS
			(
				SELECT CalcID
				FROM [dbo].[Calculation]
				WHERE [FieldID] = @FieldID
			)
			SELECT a.[CalcID],
				CASE a.[FieldID]
					WHEN @FieldID THEN a.[FieldValue]
					ELSE (SELECT CASE
							WHEN [TextData] LIKE a.[FieldValue]
							THEN [TextData]
							ELSE NULL
							END AS [TextData]
						FROM [dbo].[RecordsData]
					WHERE [FieldID] = a.[FieldID] AND [ItemID] = @ItemID)
					END AS [IsValid]
			INTO #TempTable1
			FROM [dbo].[Calculation] AS a
			INNER JOIN [dbo].[RecordsData] AS b ON a.[FieldID] = b.[FieldID] AND b.[ItemID] = @ItemID
			WHERE a.[CalcID] IN (SELECT [CalcID] FROM cte)
				
			SELECT [CalcID], COUNT([CalcID]) AS [dupes]
			INTO #TempTable2
			FROM #TempTable1
			WHERE [ISValid] IS NOT NULL
			GROUP BY [CalcID]
			
			SELECT [FieldValue]
			FROM [dbo].[Calculation]
			WHERE [FieldID] = @FieldID AND [CalcID] IN (SELECT TOP 1 [CalcID] FROM #TempTable2 ORDER BY [dupes] DESC)
			
			DROP TABLE #TempTable1
			DROP TABLE #TempTable2
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_DDLValues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/31/2017>
-- Description:	<Retrieve Improvement Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_DDLValues]
@FieldID int

AS

BEGIN
	SELECT ID, Caption
	FROM RefTable
	WHERE FieldID = @FieldID
	ORDER BY Caption
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_DefReq]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <06/13/2018>
-- Description:	<Retrieve All Training Course Requirements>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_DefReq]
(
@MyID int
)
AS

BEGIN
	SELECT [ObjTypeID]
	FROM [dbo].[DefReq]
	WHERE [ParentID] = @MyID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/2/2017>
-- Description:	<Retrieve Record Field Content Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_FieldData]
(
@ItemID int,
@FieldID int
)

AS

BEGIN
	SELECT *
	FROM RecordsData
	WHERE ItemID = @ItemID AND FieldID = @FieldID AND IsDeleted = 0
	ORDER BY ID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_FieldName]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <December 5, 2018>
-- Description:	<Return Field Name for Editor>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_FieldName] 
(
	@FieldID int
)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [FieldName]
	FROM [dbo].[ObjFields]
	WHERE [FieldID] = @FieldID
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Name_Formula]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 31, 2020>
-- Description:	<Get Name Formula for auto named folders>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_Name_Formula] 
	@ModuleID int,
	@GroupID int
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @ModuleID = 3
		BEGIN
			SELECT [NameFormula] 
			FROM [dbo].[Groups3]
			WHERE [GroupID] = @GroupID
		END
	IF @ModuleID = 4
		BEGIN
			SELECT [NameFormula] 
			FROM [dbo].[Groups4]
			WHERE [GroupID] = @GroupID
		END
	IF @ModuleID = 6
		BEGIN
			SELECT [NameFormula] 
			FROM [dbo].[Groups6]
			WHERE [GroupID] = @GroupID
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_NewRecordStructure]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/11/2011>
-- Description:	<Retrieve Record Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_NewRecordStructure]
(
@ObjTypeID int,
@ParentGroupID int,
@ModuleID int,
@DefID int
)
AS

BEGIN
	IF (@ModuleID = 12)
		BEGIN
			SELECT a.*, b.[ObjID]
			FROM [dbo].[DefReq] AS a
			INNER JOIN [dbo].[Objects] AS b ON a.[ObjTypeID] = b.[ObjTypeID]
			WHERE a.[ParentID] = @DefID AND a.[MyType] = 1
		END
	ELSE
		BEGIN
			SELECT DISTINCT a.[Caption], b.[ObjID], a.[ObjTypeID], a.[ListOrder], c.[PopUpType]
			FROM [dbo].[ObjType] AS a
			INNER JOIN [dbo].[Objects] AS b ON a.[ObjTypeID] = b.[ObjTypeID]
			LEFT OUTER JOIN [dbo].[DueDate] AS c ON a.[ObjTypeID] = c.[ObjTypeID] AND c.[IsGroup] = 1
			WHERE a.[ObjParentID] = @ObjTypeID AND a.[IsDeleted] = 0
			ORDER BY a.[ListOrder]
		END
	
	SELECT *
	FROM [dbo].[ControlLists]
	WHERE [ModuleID] = @ModuleID AND [OrigID] = @ParentGroupID AND [IsGroup] = 1 AND [ObjTypeID] > 0
	ORDER BY [ObjTypeID]

	IF (@ModuleID = 12)
		BEGIN
			SELECT a.[FieldID], a.[FieldName], a.[FieldType], a.[DefaultValue], d.[MyID], a.[ObjID]
			FROM [dbo].[ObjFields] AS a
			INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID]
			INNER JOIN [dbo].[DefReq] AS d ON b.[ObjTypeID] = d.[ObjTypeID] AND d.ParentID = @DefID
			WHERE a.[FieldType] <> 10
		END
	ELSE
		BEGIN
			SELECT a.[FieldID], a.[FieldName], a.[FieldType], a.[DefaultValue]
			FROM [dbo].[ObjFields] AS a
			INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID]
			INNER JOIN [dbo].[ObjType] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[ObjParentID] = @ObjTypeID
			WHERE a.[FieldType] <> 10
		END	

	SELECT *
	FROM [dbo].[AIEventSet]
	WHERE [RelatedID] = @ParentGroupID AND [RelatedModuleID] = @ModuleID AND [EventIndexID] = 1
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_ObjID]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <July 12, 2018>
-- Description:	<Retrieve ObjID for Current Step>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_ObjID]
(
	@ObjTypeID int
)
AS

BEGIN
	SELECT [ObjID]
	FROM [dbo].[Objects]
	WHERE [ObjTypeID] = @ObjTypeID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_ObjTypeID]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/1/2017>
-- Description:	<Retrieve ObjTypeID for Selected Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_ObjTypeID]
	@ModuleID int,
	@GroupID int	
AS

BEGIN
	IF @ModuleID = 1
		BEGIN
			SELECT [ObjTypeID]
			FROM [dbo].[Groups1]
			WHERE [GroupID] = @GroupID;
		END
	IF @ModuleID = 4
		BEGIN
			SELECT [ObjTypeID]
			FROM [dbo].[Groups4]
			WHERE [GroupID] = @GroupID;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SELECT [ObjTypeID]
			FROM [dbo].[Groups12]
			WHERE [GroupID] = @GroupID;
		END
	ELSE
		BEGIN
			SELECT [ObjTypeID]
			FROM [dbo].[Groups6]
			WHERE [GroupID] = @GroupID;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Record]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/31/2017>
-- Description:	<Retrieve Improvement Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_Record]
(
	@ItemID int,
	@ModuleID int,
	@ReqID int
)
AS

BEGIN

	-- Get record
	IF @ModuleID = 12
		SELECT *
		FROM [dbo].[Items12]
		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
	ELSE IF @ModuleID = 4
		SELECT *
		FROM [dbo].[Items4]
		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
	ELSE
		SELECT *
		FROM [dbo].[Items6]
		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0

	-- Record Tabs
	IF @ModuleID = 12
		SELECT a.*, c.[Caption], c.[Notes], c.[ObjTypeID]
		FROM [dbo].[ItemObj] AS a
		INNER JOIN [dbo].[Items12] AS b ON a.[ItemID] = b.[ItemID] AND b.[IsDeleted] = 0 AND b.[IsWithdrawn] = 0
		INNER JOIN [dbo].[DefReq] AS c on a.[ReqID] = c.[MyID]
		WHERE b.[ItemID] = @ItemID and a.[ModuleID] = 12 AND a.[IsDeleted] = 0
	ELSE
		SELECT a.[ObjID], c.[ObjTypeID], c.[Caption], c.[ListOrder], a.[IsChecked], a.[IsNotApplicable], a.[CheckedBy], MAX([CheckedDate]) AS [CheckedDate], a.[ReqID], d.[PopUpType]
		FROM [dbo].[ItemObj] AS a
		INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID] AND b.[IsDeleted] = 0
		INNER JOIN [dbo].[ObjType] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[IsDeleted] = 0
		LEFT OUTER JOIN [dbo].[DueDate] AS d ON c.[ObjTypeID] = d.[ObjTypeID] AND d.[OrigID] = @ItemID
		WHERE a.[ItemID] = @ItemID AND a.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0
		GROUP BY a.[ObjID], c.[ObjTypeID], c.[Caption], c.[ListOrder], a.[IsChecked], a.[IsNotApplicable], a.[CheckedBy], a.[ReqID], d.[PopUpType]
		ORDER BY c.[ListOrder]

	-- Item Fields
	IF @ModuleID = 12
		SELECT a.*, c.[ObjTypeID]
		FROM [dbo].[ObjFields] AS a
		INNER JOIN [dbo].[Objects] AS b ON b.[ObjID] = a.[ObjID]
		INNER JOIN [dbo].[ObjType] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[ModuleID] = 12 AND c.[IsDeleted] = 0
		INNER JOIN [dbo].[ItemObj] AS d ON a.[ObjID] = d.[ObjID] AND d.[ItemID] = @ItemID AND d.[IsDeleted] = 0 AND d.[ReqID] = @ReqID
		WHERE a.[IsDeleted] = 0
		ORDER BY a.[FieldID]
	ELSE
		SELECT a.*, c.[ObjTypeID]
		FROM [dbo].[ObjFields] AS a
		INNER JOIN [dbo].[Objects] AS b ON b.[ObjID] = a.[ObjID]
		INNER JOIN [dbo].[ObjType] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[ModuleID] = @ModuleID AND c.[IsDeleted] = 0
		INNER JOIN [dbo].[ItemObj] AS d ON a.[ObjID] = d.[ObjID] AND d.[ItemID] = @ItemID AND d.[IsDeleted] = 0
		WHERE a.[IsDeleted] = 0
		ORDER BY a.[FieldID]

	-- Item Data
	SELECT *
	FROM [dbo].[RecordsData]
	WHERE [ModuleID] = @ModuleID AND [ItemID] = @ItemID AND [IsDeleted] = 0
	ORDER BY [ID]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_RecordName]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <July 13, 2018>
-- Description:	<Retrieve Record Name from ID>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_RecordName]
(
	@ModuleID int,
	@ItemID int
)
AS

BEGIN
	IF @ModuleID = 12
		SELECT [Name]
		FROM Items12
		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
	ELSE IF @ModuleID = 4
		SELECT [Name]
		FROM Items4
		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
	ELSE
		SELECT [Name]
		FROM Items6
		WHERE [ItemID] = @ItemID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Responsible]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/1/2017>
-- Description:	<Retrieve Improvement Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_Responsible]
@ItemID int,
@ObjTypeID int,
@ModuleID int

AS

BEGIN
	SELECT *
	FROM [dbo].[ControlLists]
	WHERE [ModuleID] = @ModuleID AND [OrigID] = @ItemID AND [ObjTypeID] = @ObjTypeID AND ListClass = 6
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_SelListValues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/31/2017>
-- Description:	<Retrieve Users for SelectList type fields>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_SelListValues]
(
	@ItemID int,
	@FieldID int,
	@ModuleID int
)
AS

BEGIN
	SELECT [NumData], [TextData], [MemoData]
	FROM [dbo].[RecordsData]
	WHERE [ItemID] = @ItemID AND [FieldID] = @FieldID AND [NumData] > 0 AND [MemoData] IS NOT NULL AND [IsDeleted] = 0 AND [ModuleID] = @ModuleID
	ORDER BY [ID]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Step_DueInterval]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/10/2018>
-- Description:	<Retrieve Due Interval for current step>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_Step_DueInterval]
(
@ObjTypeID int,
@OrigID int
)
AS

BEGIN
	SELECT [DayInterval], [CreateDate]
	FROM [dbo].[DueDate]
	WHERE [ModuleID] = 6 AND [OrigID] = @OrigID AND [ObjTypeID] = @ObjTypeID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_StepName]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <July 13, 2018>
-- Description:	<Retrieve Step Name from ObjTypeID>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_StepName]
(
	@ObjTypeID int
)
AS

BEGIN
	SELECT [Caption]
	FROM [dbo].[ObjType]
	WHERE [ObjTypeID] = @ObjTypeID AND [IsDeleted] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_StepResponsible]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/9/2018>
-- Description:	<Retrieve Responsible for current step>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_StepResponsible]
(
@ObjTypeID int,
@ItemID int
)
AS

BEGIN
	SELECT a.[ItemID], c.[ControlID], c.[ControlFullName], c.[ListClass], CASE WHEN c.[ControlType] = 1 THEN 'User' ELSE 'Entity' END AS [ControlType]
	FROM [dbo].[ItemObj] AS a
	INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID]
	INNER JOIN [dbo].[ControlLists] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[ObjTypeID] = @ObjTypeID AND c.[OrigID] = @ItemID
	WHERE a.[ModuleID] = 6 AND a.ItemID = @ItemID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_SubGroups]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <06/12/2013>
-- Description:	<Retrieve All Groups for TreeViews>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_SubGroups]
(
@ModuleID int,
@ParentGroupID int
)
AS

BEGIN
	IF (@ModuleID = 4)
	BEGIN
		SELECT GroupID, Name
		FROM Groups4
		WHERE ParentGroupID = @ParentGroupID AND IsDeleted = 0
		ORDER BY Name
	END
	ELSE IF (@ModuleID = 6)
	BEGIN
		SELECT GroupID, Name
		FROM Groups6
		WHERE ParentGroupID = @ParentGroupID AND IsDeleted = 0
		ORDER BY Name
	END
	ELSE
	BEGIN
		SELECT GroupID, Name
		FROM Groups12
		WHERE ParentGroupID = @ParentGroupID AND IsDeleted = 0
		ORDER BY Name
	END
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TabAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/31/2017>
-- Description:	<Retrieve Improvement Record Tab Assignment>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_TabAssigned]
@ItemID int,
@ObjTypeID int,
@ModuleID int

AS

BEGIN
	SELECT DISTINCT b.[ControlID], b.[ControlFullName], b.[ControlType], b.[ListClass]
	FROM [dbo].[ObjType] AS a
	LEFT OUTER JOIN [dbo].[ControlLists] AS b ON a.[ObjTypeID] = b.[ObjTypeID] AND b.[OrigID] = @ItemID
	LEFT OUTER JOIN [dbo].[Objects] AS c ON a.[ObjTypeID] = c.[ObjTypeID] AND c.[ObjTypeID] = @ObjTypeID
	WHERE a.[ModuleID] = @ModuleID AND b.[ListClass] IS NOT NULL
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TabSettings]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <08/14/2014>
-- Description:	<Get Record Tab Settings from Database>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_TabSettings]
@ModuleID int,
@ObjTypeID int,
@ParentGroupID int

AS

BEGIN
	SELECT *
	FROM DueDate
	WHERE ModuleID = @ModuleID AND OrigID = @ParentGroupID AND ObjTypeID = @ObjTypeID AND IsGroup = 1
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TrainDefinitions]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <06/11/2018>
-- Description:	<Retrieve all Requirement Types for Training Definition>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_TrainDefinitions]
(
@GroupID int
)
AS

BEGIN
	SELECT a.[MyID], a.[Caption]
	FROM [dbo].[DefReq] AS a
	INNER JOIN [dbo].[GroupDef] AS b ON a.[MyID] = b.[DefID]
	WHERE [GroupID] = @GroupID
	ORDER BY [Caption]
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_Trainees]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <06/13/2018>
-- Description:	<Retrieve Trainees List>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_Trainees]

AS

BEGIN
	SELECT [UserID], ([LastName] +', ' + [FirstName]) AS [FullName]
	FROM [dbo].[Items1]
	WHERE [Status] != -1 AND [IsDeleted] = 0
	ORDER BY [LastName]
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TrainingSteps]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Dec 24, 2018>
-- Description:	<Return all steps for Training Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_TrainingSteps] 
(
	@ItemID int
)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT a.[IsChecked]
	FROM ItemObj AS a
	INNER JOIN Items12 AS b ON a.ItemID = b.ItemID AND b.IsDeleted = 0 AND b.IsWithdrawn = 0
	INNER JOIN DefReq AS c on a.ReqID = c.MyID
	WHERE b.ItemID = @ItemID and a.ModuleID = 12 AND a.IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_TrainRelation]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/12/2017>
-- Description:	<Retrieve All Training Links>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_TrainRelation]
(
@ItemID int
)
AS

BEGIN
	SELECT b.Name, b.OrigID, b.ParentGroupID, a.ToVersion
	FROM TrainRelation AS a
	INNER JOIN Items3 AS b ON a.ToID = b.ItemID
	WHERE a.ItemID = @ItemID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Get_UserResp]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/2/2017>
-- Description:	<Retrieve Responsible Users for Each Tab>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Get_UserResp]
@ModuleID int,
@OrigID int
AS

BEGIN
	SELECT * FROM ControlLists
	WHERE ModuleID = @ModuleID and OrigID = @OrigID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_HasAutoLabel]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <February 14, 2020>
-- Description:	<Check Group properties for Autolabel>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_HasAutoLabel]
	@ModuleID INT,
	@GroupID INT,
	@ItemID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF (@ModuleID = 3)
		BEGIN
			IF (CHARINDEX('1_6',(SELECT [OptionSet] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID)) > 0)
				BEGIN
					UPDATE [dbo].[Items3]
					SET [LabelName] = REPLACE((SELECT SUBSTRING([NameFormula], 2, 256) FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID), '*', @ItemID)
					WHERE [OrigID] = @ItemID
				END
		END
	ELSE IF (@ModuleID = 4)
		BEGIN
			--SELECT [OptionSet] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID
			IF (CHARINDEX('1_3',(SELECT [OptionSet] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID)) > 0)
				BEGIN
					UPDATE [dbo].[Items4]
					SET [LabelName] = REPLACE((SELECT SUBSTRING([NameFormula], 2, 256) FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID), '*', @ItemID)
					WHERE [OrigID] = @ItemID
				END
		END
	ELSE IF (@ModuleID = 6)
		BEGIN
			IF (CHARINDEX('1_3',(SELECT [OptionSet] FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID)) > 0)
				BEGIN
					UPDATE [dbo].[Items6]
					SET [LabelName] = REPLACE((SELECT SUBSTRING([NameFormula], 2, 256) FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID), '*', @ItemID)
					WHERE [OrigID] = @ItemID
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_HasPopup]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_HasPopup] 
	@ParentGroupID int,
	@ObjTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(1) AS [HasPopUp]
	FROM [dbo].[DueDate]
	WHERE [ModuleID] = 6 AND [OrigID] = @ParentGroupID AND [ObjTypeID] = @ObjTypeID AND [PopUpType] = 1
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Insert_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/2/2017>
-- Description:	<Insert Record Field Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Insert_FieldData]

@FieldID int,
@ItemID int,
@ModuleID int,
@NumData int,
@TextData nvarchar(255),
@MemoData nvarchar(4000),
@DateData datetime,
@IsDeleted bit

AS

BEGIN
	INSERT INTO RecordsData
		(FieldID, ItemID, ModuleID, NumData, TextData, MemoData, DateData, IsDeleted)
	VALUES
		(@FieldID, @ItemID, @ModuleID, @NumData, @TextData, @MemoData, @DateData, @IsDeleted)
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_InternalEvents]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/2/2017>
-- Description:	<Retrieve Internal Events>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_InternalEvents]
(
@FieldID int,
@ModuleID int
)
AS

BEGIN
	SELECT *
	FROM InterEvent
	WHERE FieldOrigID = @FieldID AND ModuleID = @ModuleID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_IsEntityMember]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <July 24, 2018>
-- Description:	<Check if user is a member of a position title>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_IsEntityMember]
	-- Add the parameters for the stored procedure here
	@OrigID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [ControlID], [ControlFullName]
	FROM [dbo].[ControlLists]
	WHERE OrigID = @OrigID AND [ListClass] = 1
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Load_FieldValues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <9/11/2017>
-- Description:	<Retrieve Record Field Values>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Load_FieldValues]
	@ItemID int,
	@FieldID int,
	@ReqID int
AS

BEGIN
	IF @ReqID = 0
		BEGIN
			SELECT *
			FROM [dbo].[RecordsData]
			WHERE [ItemID] = @ItemID AND [FieldID] = @FieldID
		END
	ELSE
		BEGIN
			SELECT *
			FROM [dbo].[RecordsData]
			WHERE [ItemID] = @ItemID AND [FieldID] = @FieldID AND [ReqID] = @ReqID
		END	
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Load_OnePane]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/31/2017>
-- Description:	<Retrieve Record Fields for Tab>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Load_OnePane]
@ItemID int,
@ObjID int,
@ModuleID int,
@ReqID int
AS

BEGIN
	IF @ModuleID = 12
		SELECT a.*, b.ItemID, b.ModuleID, c.ObjTypeID
		FROM ObjFields a
		INNER JOIN ItemObj AS b ON a.ObjID = b.ObjID AND b.ModuleID = @ModuleID AND b.ItemID = @ItemID AND b.ReqID = @ReqID AND b.IsDeleted = 0
		INNER JOIN Objects AS c ON a.ObjID = c.ObjID AND c.IsDeleted = 0
		WHERE a.ObjID = @ObjID AND a.IsDeleted = 0
		ORDER BY a.ObjID, a.FieldID
	ELSE
		SELECT a.*, b.ItemID, b.ModuleID, c.ObjTypeID
		FROM ObjFields a
		INNER JOIN ItemObj AS b ON a.ObjID = b.ObjID AND b.ModuleID = @ModuleID AND b.ItemID = @ItemID AND b.IsDeleted = 0
		INNER JOIN Objects AS c ON a.ObjID = c.ObjID AND c.IsDeleted = 0
		WHERE(a.ObjID = @ObjID AND a.IsDeleted = 0)
		ORDER BY a.ObjID, a.FieldID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_PositionAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/31/2017>
-- Description:	<Retrieve Assigned Users from Position Title>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_PositionAssigned]
(
@ControlID int
)
AS

BEGIN
	SELECT ControlID, ControlFullName, ControlType, ListClass
	FROM ControlLists
	WHERE ListClass = 1 AND OrigID = @ControlID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Purge_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/3/2017>
-- Description:	<Delete old RecordsData>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Purge_FieldData]

AS

BEGIN
	DELETE FROM RecordsData
	WHERE IsDeleted = 1
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_PurgeNull]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/11/2011>
-- Description:	<Purge RecordsData>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_PurgeNull]
@ItemID int,
@FieldID int,
@ModuleID int

AS

BEGIN
	DELETE FROM RecordsData
	WHERE ItemID = @ItemID AND FieldID = @FieldID AND NumData = 0 AND ModuleID = @ModuleID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_RolesAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/9/2017>
-- Description:	<Retrieve Assigned Roles for Record Event>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_RolesAssigned]
(
@GroupID int,
@ControlID int,
@ModuleID int
)
AS

BEGIN
	SELECT ControlID, ControlFullname, ControlType, CatID
	FROM ControlLists
	WHERE ModuleID = @ModuleID AND OrigID = @GroupID AND CatID = @ControlID AND IsGroup = 1
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Tab_NotApplicable]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/6/2017>
-- Description:	<Make Record Tab Not Applicable>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Tab_NotApplicable]
@ItemID int,
@ObjID int

AS

BEGIN
	UPDATE ItemObj
	SET IsNotApplicable = 1
	WHERE ItemID = @ItemID AND ObjID = @ObjID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Update_FieldData]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/2/2017>
-- Description:	<Update Record Field Content Data>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Update_FieldData]

@NumData int,
@TextData nvarchar(255),
@MemoData nvarchar(4000),
@DateData datetime,
@IsDeleted bit,
@ItemID int,
@FieldID int,
@ModuleID int

AS

BEGIN
	UPDATE RecordsData
	SET NumData = @NumData, TextData = @TextData, MemoData = @MemoData, DateData = @DateData, IsDeleted = @IsDeleted
	WHERE ItemID = @ItemID AND FieldID = @FieldID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Record_Update_UserField]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/6/2017>
-- Description:	<Update Data for User Select Field>

-- Updated <12/04/2018>
-- Description: <Streamlined query to check if record exists>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Record_Update_UserField]
(
	@ItemID int,
	@FieldID int,
	@UserID int, 
	@UserName nvarchar (255),
	@ModuleID int,
	@ReqID int,
	@Condition int
)
AS

BEGIN
	SET NOCOUNT ON;
	IF @Condition = 1
		BEGIN
			IF @UserID NOT IN (SELECT [NumData] FROM [dbo].[RecordsData] WHERE [ItemID] = @ItemID AND [FieldID] = @FieldID AND [NumData] IS NOT NULL)
				BEGIN
					INSERT INTO [dbo].[RecordsData]
						([FieldID], [ItemID], [ModuleID], [NumData], [TextData], [MemoData], [IsDeleted], [ReqID])
					VALUES
						(@FieldID, @ItemID, @ModuleID, @UserID, @UserName, '1', 0, @ReqID)
				END
		END
	ELSE
		BEGIN
			DELETE FROM [dbo].[RecordsData]
			WHERE [ItemID] = @ItemID AND [NumData] = @UserID AND [FieldID] = @FieldID
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_ActionItems]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/16/2017>
-- Description:	<Retrieve Related Action Items>
-- =============================================
CREATE PROCEDURE [dbo].[v4_RelatedActionItem_Get_ActionItems]
(
@OrigID int,
@ModuleID int,
@Version int
)
AS

BEGIN
IF @ModuleID = 3
	IF @Version = 0
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items3 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.OrigID = @OrigID AND b.ShowModuleID = 3 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
	ELSE
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items3 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.ItemID = @OrigID AND b.ShowModuleID = 3 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
ELSE IF @ModuleID = 4
	IF @Version = 0
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items4 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.OrigID = @OrigID AND b.ShowModuleID = 4 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
	ELSE
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items4 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.ItemID = @OrigID AND b.ShowModuleID = 4 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
ELSE IF @ModuleID = 6
	IF @Version = 0
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items6 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.OrigID = @OrigID AND b.ShowModuleID = 6 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
	ELSE
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items6 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.ItemID = @OrigID AND b.ShowModuleID = 6 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
ELSE
	IF @Version = 0
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items12 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.OrigID = @OrigID AND b.ShowModuleID = 12 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
	ELSE
		SELECT a.ItemID, a.OrigID, a.Name AS ItemName, b.*
		FROM Items12 a
		INNER JOIN Items14 b ON a.ItemID = b.ShowID
		WHERE a.ItemID = @OrigID AND b.ShowModuleID = 12 AND b.IsDeleted = 0
		ORDER BY b.AIID DESC
END


GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_ItemName]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================
-- Author:		<Chris Reyno>
-- Create date: <5/16/2017>
-- Description:	<Retrieve Item Name for Related Action Items>
-- ==============================================================
CREATE PROCEDURE [dbo].[v4_RelatedActionItem_Get_ItemName]
(
@OrigID int,
@ModuleID int
)
AS

BEGIN
	IF @ModuleID = 3
		SELECT TOP 1 Name
		FROM Items3
		WHERE OrigID = @OrigID
	ELSE IF @ModuleID = 4
		SELECT TOP 1 Name
		FROM Items4
		WHERE OrigID = @OrigID
	ELSE If	@ModuleID = 6
		SELECT TOP 1 Name
		FROM Items6
		WHERE OrigID = @OrigID
	ELSE
		SELECT TOP 1 Name
		FROM Items12
		WHERE OrigID = @OrigID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_OtherUsers]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 2, 2020>
-- Description:	<Return all user members for EntityID and subs>
-- =============================================
CREATE PROCEDURE [dbo].[v4_RelatedActionItem_Get_OtherUsers]
	@ControlID INT,
	@ControlType INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TControlID INT, @TControlFullName NVARCHAR(255), @TControlType INT;
	DECLARE @TempTable TABLE
	(
		[AIID] INT,
		[ParentGroupID] INT,
		[AIType] INT,
		[ParentID] INT,
		[Name] NVARCHAR(255),
		[Details] NVARCHAR(MAX),
		[Status] INT,
		[ModuleID] INT,
		[EventID] INT,
		[UserID] INT,
		[UserName] NVARCHAR(255),
		[SenderName] NVARCHAR(255),
		[SenderID] INT,
		[SendDate] DATETIME,
		[DateDue] DATETIME,
		[Priority] INT,
		[CompleteDate] DATETIME,
		[ResultID] INT,
		[ResultName] NVARCHAR(255),
		[Comments] NVARCHAR(MAX),
		[ShowMeEnabled] BIT,
		[ShowGroupID] INT,
		[ShowID] INT,
		[ShowIsItemID] BIT,
		[ShowType] INT,
		[ShowModuleID] INT,
		[ShowAction] INT,
		[DateSet] DATETIME,
		[IsRegReminder] BIT,
		[RegReminderDay] INT,
		[RegReminderDate] DATETIME,
		[IsFinalReminder] BIT,
		[FinalReminderDate] DATETIME,
		[NotifyOverdueEventID] BIT,
		[NotifyOverdueDate] DATETIME,
		[NotifyCompletedEventID] BIT,
		[Archive] BIT,
		[UrgentEmail] BIT,
		[SendEmailCmpltAI] BIT,
		[NextStartDate] DATETIME,
		[SchedRepeat] BIT,
		[SchedIntervalType] INT,
		[SchedRepeatNumber] INT,
		[SchedUntilDate] DATETIME,
		[SchedStatus] INT,
		[IsDeleted] BIT,
		[OptionSet] NVARCHAR(255),
		[NotifiedStatus] INT,
		[ModifiedBy] NVARCHAR(255),
		[LastModified] DATETIME,
		[ModifierID] INT,
		[EscalateStatus] INT,
		[EscalateDate] DATETIME,
		[IsDueComplete] BIT,
		[ShowObjID] INT,
		[OverDueEmail] BIT,
		[SendEmailStatus] INT,
		[AttFullPath] NVARCHAR(MAX),
		[AddEmailMsg] NVARCHAR(MAX),
		[SendSMSStatus] INT,
		[SMSMsg] NVARCHAR(MAX),
		[RptFileName] NVARCHAR(MAX)
	);

	IF @ControlType = 6
		BEGIN
			DECLARE users_cursor CURSOR FOR
				WITH cte AS
				(
					SELECT [GroupID]
					FROM [dbo].[Groups1]
					WHERE ([ParentGroupID] = @ControlID OR [GroupID] = @ControlID) AND [IsDeleted] = 0 AND [ObjTypeID] = 6 AND ISNULL([Name], '') <> ''
					UNION ALL
					SELECT a.[GroupID]
					FROM [dbo].[Groups1] AS a
					INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[IsDeleted] = 0 AND a.[ObjTypeID] = 6 AND ISNULL(a.[Name], '') <> ''
				)
				SELECT [ControlID], [ControlFullName], [ControlType]
				FROM [dbo].[ControlLists]
				WHERE [ModuleID] = 1 AND [ControlType] = 1 AND EXISTS (SELECT [GroupID] FROM cte WHERE [GroupID] = [OrigID]);

			OPEN users_cursor
			FETCH NEXT FROM users_cursor INTO @TControlID, @TControlFullName, @TControlType;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					INSERT INTO @TempTable([AIID],[ParentGroupID],[AIType],[ParentID],[Name],[Details],[Status],[ModuleID],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
						[Priority],[CompleteDate],[ResultID],[ResultName],[Comments],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowType],[ShowModuleID],[ShowAction],[DateSet],
						[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],[NotifyOverdueEventID],[NotifyOverdueDate],[NotifyCompletedEventID],[Archive],
						[UrgentEmail],[SendEmailCmpltAI],[NextStartDate],[SchedRepeat],[SchedIntervalType],[SchedRepeatNumber],[SchedUntilDate],[SchedStatus],[IsDeleted],[OptionSet],
						[NotifiedStatus],[ModifiedBy],[LastModified],[ModifierID],[EscalateStatus],[EscalateDate],[IsDueComplete],[ShowObjID],[OverDueEmail],[SendEmailStatus],[AttFullPath],
						[AddEmailMsg],[SendSMSStatus],[SMSMsg],[RptFileName])
					SELECT [AIID],[ParentGroupID],[AIType],[ParentID],[Name],[Details],[Status],[ModuleID],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
						[Priority],[CompleteDate],[ResultID],[ResultName],[Comments],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowType],[ShowModuleID],[ShowAction],[DateSet],
						[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],[NotifyOverdueEventID],[NotifyOverdueDate],[NotifyCompletedEventID],[Archive],
						[UrgentEmail],[SendEmailCmpltAI],[NextStartDate],[SchedRepeat],[SchedIntervalType],[SchedRepeatNumber],[SchedUntilDate],[SchedStatus],[IsDeleted],[OptionSet],
						[NotifiedStatus],[ModifiedBy],[LastModified],[ModifierID],[EscalateStatus],[EscalateDate],[IsDueComplete],[ShowObjID],[OverDueEmail],[SendEmailStatus],[AttFullPath],
						[AddEmailMsg],[SendSMSStatus],[SMSMsg],[RptFileName]
					FROM [dbo].[Items14]
					WHERE [UserID] = @TControlID AND [IsDeleted] = 0
					ORDER BY [SendDate] DESC;
					FETCH NEXT FROM users_cursor INTO @TControlID, @TControlFullName, @TControlType;
				END
			CLOSE users_cursor;
			DEALLOCATE users_cursor;
		END
	ELSE
		BEGIN
			INSERT INTO @TempTable([AIID],[ParentGroupID],[AIType],[ParentID],[Name],[Details],[Status],[ModuleID],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
				[Priority],[CompleteDate],[ResultID],[ResultName],[Comments],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowType],[ShowModuleID],[ShowAction],[DateSet],
				[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],[NotifyOverdueEventID],[NotifyOverdueDate],[NotifyCompletedEventID],[Archive],
				[UrgentEmail],[SendEmailCmpltAI],[NextStartDate],[SchedRepeat],[SchedIntervalType],[SchedRepeatNumber],[SchedUntilDate],[SchedStatus],[IsDeleted],[OptionSet],
				[NotifiedStatus],[ModifiedBy],[LastModified],[ModifierID],[EscalateStatus],[EscalateDate],[IsDueComplete],[ShowObjID],[OverDueEmail],[SendEmailStatus],[AttFullPath],
				[AddEmailMsg],[SendSMSStatus],[SMSMsg],[RptFileName])
			SELECT [AIID],[ParentGroupID],[AIType],[ParentID],[Name],[Details],[Status],[ModuleID],[EventID],[UserID],[UserName],[SenderName],[SenderID],[SendDate],[DateDue],
				[Priority],[CompleteDate],[ResultID],[ResultName],[Comments],[ShowMeEnabled],[ShowGroupID],[ShowID],[ShowIsItemID],[ShowType],[ShowModuleID],[ShowAction],[DateSet],
				[IsRegReminder],[RegReminderDay],[RegReminderDate],[IsFinalReminder],[FinalReminderDate],[NotifyOverdueEventID],[NotifyOverdueDate],[NotifyCompletedEventID],[Archive],
				[UrgentEmail],[SendEmailCmpltAI],[NextStartDate],[SchedRepeat],[SchedIntervalType],[SchedRepeatNumber],[SchedUntilDate],[SchedStatus],[IsDeleted],[OptionSet],
				[NotifiedStatus],[ModifiedBy],[LastModified],[ModifierID],[EscalateStatus],[EscalateDate],[IsDueComplete],[ShowObjID],[OverDueEmail],[SendEmailStatus],[AttFullPath],
				[AddEmailMsg],[SendSMSStatus],[SMSMsg],[RptFileName]
			FROM [dbo].[Items14]
			WHERE [UserID] = @ControlID AND [IsDeleted] = 0
			ORDER BY [SendDate] DESC;
		END		

	SELECT * 
	FROM @TempTable
	ORDER BY [SendDate] DESC;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_RelatedActionItem_Get_Versions]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================
-- Author:		<Chris Reyno>
-- Create date: <5/16/2017>
-- Description:	<Retrieve Item Versions for Related Action Items>
-- ==============================================================
CREATE PROCEDURE [dbo].[v4_RelatedActionItem_Get_Versions]
(
@OrigID int,
@ModuleID int
)
AS

BEGIN
	IF @ModuleID = 3
		SELECT ItemID, Status, Version
		FROM Items3
		WHERE OrigID = @OrigID
		ORDER BY ItemID DESC
	ELSE IF @ModuleID = 4
		SELECT ItemID, Status, Version
		FROM Items4
		WHERE OrigID = @OrigID
		ORDER BY ItemID DESC
	ELSE If	@ModuleID = 6
		SELECT ItemID, Status, Version
		FROM Items6
		WHERE OrigID = @OrigID ORDER BY ItemID DESC
	ELSE
		SELECT ItemID, Status, Version
		FROM Items12
		WHERE OrigID = @OrigID ORDER BY ItemID DESC
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_FieldType]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/23/2017>
-- Description:	<Return Field Type for Search Modifier>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_Get_FieldType]
(
	@FieldID int
)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT [FieldType]
	FROM [dbo].[ObjFields]
	WHERE [FieldID] = @FieldID AND [IsDeleted] = 0
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_ObjFields]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/23/2017>
-- Description:	<Retrieve Available fields to search a specific style>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_Get_ObjFields]
(
	@ModuleID int,
	@ObjTypeID int
)
AS

BEGIN
	IF @ModuleID = 12
		BEGIN
			SELECT a.[FieldID], a.[FieldName] + ' [' + c.[Caption] + ']' AS [FieldName]
			FROM [dbo].[ObjFields] AS a
			INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID]
			INNER JOIN [dbo].[DefReq] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[ParentID] = @ObjTypeID
			WHERE a.[FieldType] != 10 AND a.[IsDeleted] = 0
			ORDER BY c.[MyID], a.[FieldID]
		END
	ELSE
		BEGIN
			SELECT a.[FieldID], a.[FieldName] + ' [' + c.[Caption] + ']' AS [FieldName]
			FROM [dbo].[ObjFields] AS a 
			INNER JOIN [dbo].[Objects] AS b ON a.[ObjID] = b.[ObjID] AND b.[IsDeleted] = 0
			INNER JOIN [dbo].[ObjType] AS c ON b.[ObjTypeID] = c.[ObjTypeID] AND c.[ObjParentID] = @ObjTypeID AND c.[IsDeleted] = 0
			WHERE a.[FieldType] != 10 AND a.[IsDeleted] = 0
			ORDER BY c.[ObjTypeID], a.[FieldID]
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_RoleAssigned]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/5/2017>
-- Description:	<Get Role Members for Search>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_Get_RoleAssigned]
(
@CatID int
)
AS

BEGIN
	SELECT ControlID, ControlFullName, ControlType
	FROM ControlLists
	WHERE CatID = @CatID AND ListClass = 5
	GROUP BY ControlID, ControlFullName, ControlType
	ORDER BY ControlFullName
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_SearchVar]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/21/2017>
-- Description:	<Retrieve Searach Variables>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_Get_SearchVar]
(
	@ModuleID int
)
AS

BEGIN
	SET NOCOUNT ON;

	-- Get_EventDates
	SELECT [CatID], [CatCaption]
	FROM [dbo].[CatDateSet]
	WHERE [CatClass] = 1 AND [ModuleID] = @ModuleID
	ORDER BY [CatCaption];

	-- Get_ConvertedBy
	SELECT b.[FirstName], b.[LastName], a.[VersionedByID]
	FROM [dbo].[Items3] AS a
	INNER JOIN [dbo].[Items1] AS b ON a.[VersionedByID] = b.[UserID] AND b.IsDeleted = 0
	WHERE a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[TypeOfPublish] > 0 AND a.[IsDeleted] = 0
	GROUP BY b.[FirstName], b.[LastName], a.[VersionedByID]
	ORDER By b.[LastName];

	-- Get_Initiator
	SELECT DISTINCT [CreateBy]
	FROM [dbo].[Items3]
	WHERE [CreateBy] IS NOT NULL AND [IsDeleted] = 0 AND [Status] = 9 AND [TypeOfPublish] > 0
	ORDER BY [CreateBy];

	-- Get_Roles
	SELECT [CatID], [CatCaption]
	FROM [dbo].[CatDateSet]
	WHERE [CatClass] = 5 AND [ModuleID] = @ModuleID
	ORDER BY [CatCaption];

	-- Get_Categories                                      
	SELECT [CatID], [CatCaption]
	FROM [dbo].[CatDateSet]
	WHERE [CatClass] = 0 AND [ModuleID] = @ModuleID
	ORDER BY [CatCaption];

	SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_Get_Styles]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/23/2017>
-- Description:	<Retrive available style to search for specific module>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_Get_Styles]
(
	@ModuleID int
)
AS

BEGIN
	IF @ModuleID = 12
		BEGIN
			SELECT [MyID] AS [ObjTypeID], [Caption]
			FROM [dbo].[DefReq]
			WHERE [MyType] = 0 AND [ParentID] != 0
			ORDER BY [Caption]
		END
	ELSE
		BEGIN
			SELECT [ObjTypeID], [Caption]
			FROM [dbo].[ObjType]
			WHERE [ObjClass] = -1 AND [ModuleID] = @ModuleID AND [IsDeleted] = 0
			ORDER BY [Caption]
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItems]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <6/30/2017>
-- Description:	<Search Items>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_SearchItems]
(
	@ModuleID int,
	@ParentGroupID int,
	@SearchField nvarchar(255),
	@SearchText nvarchar(255),
	@SearchConvertedBy nvarchar(255),
	@sDate datetime,
	@eDate datetime,
	@GroupOrigID bit,
	@SearchSubGroups bit,
	@SearchWithdrawn bit,
	@UserID int,
	@UserStatus int,
	@SiteID nvarchar(100)
)
AS

BEGIN
	DECLARE @LevelID INT,@SiteIDVal nvarchar(100);
	DECLARE @TempTable TABLE
	(
		[GroupID] INT
	)
	IF (@ModuleID = 3)
	BEGIN
		SET @LevelID = 3001;
		IF @SearchField = 'Name'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
					AND a.[Name] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE);
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							IF @ParentGroupID = 1
								BEGIN
									IF ISNULL(@SiteID, '') = ''
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[WebEnabledFolders]
												WHERE [ModuleID] = @ModuleID
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[Name] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											DECLARE site_cursor CURSOR FOR
												SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
											OPEN site_cursor
											FETCH NEXT FROM site_cursor INTO @SiteIDVal
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO @TempTable
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE ([PrfrdFolderName] = @SiteIDVal OR ISNULL([PrfrdFolderName], '') = '')  AND [ModuleID] = @ModuleID
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
												END
											CLOSE site_cursor;
											DEALLOCATE site_cursor;

											;WITH cte AS
											(
												SELECT [GroupID]
												FROM @TempTable
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)												
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[Name] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE);													
										END									
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
									AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END							
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									--select * from cte
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT [GroupID] FROM cte WHERE [GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN								
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									--select * from cte
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE EXISTS(SELECT [GroupID] FROM cte WHERE [ControlType] = 0 AND [GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
									AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
						END
			END
		END
		ELSE IF @SearchField = 'LabelName'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
					AND a.[LabelName] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							IF @ParentGroupID = 1
								BEGIN
									IF ISNULL(@SiteID, '') = ''
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[WebEnabledFolders]
												WHERE [ModuleID] = @ModuleID
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[LabelName] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											DECLARE site_cursor CURSOR FOR
												SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
											OPEN site_cursor
											FETCH NEXT FROM site_cursor INTO @SiteIDVal
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO @TempTable
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
												END
											CLOSE site_cursor;
											DEALLOCATE site_cursor;

											;WITH cte AS
											(
												SELECT [GroupID]
												FROM @TempTable
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)												
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[LabelName] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0  AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
									AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[LabelName] OPTION(RECOMPILE);
								END
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'ItemID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
					AND a.[ItemID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							IF @ParentGroupID = 1
								BEGIN
									IF ISNULL(@SiteID, '') = ''
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[WebEnabledFolders]
												WHERE [ModuleID] = @ModuleID
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[ItemID] = CONVERT(INT, @SearchText)
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											DECLARE site_cursor CURSOR FOR
												SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
											OPEN site_cursor
											FETCH NEXT FROM site_cursor INTO @SiteIDVal
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO @TempTable
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
												END
											CLOSE site_cursor;
											DEALLOCATE site_cursor;

											;WITH cte AS
											(
												SELECT [GroupID]
												FROM @TempTable
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)												
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[ItemID] = CONVERT(INT, @SearchText)
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[ItemID] = CONVERT(INT, @SearchText)
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'OrigID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
						AND a.[OrigID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							IF @ParentGroupID = 1
								BEGIN
									IF ISNULL(@SiteID, '') = ''
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[WebEnabledFolders]
												WHERE [ModuleID] = @ModuleID
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[OrigID] = CONVERT(INT, @SearchText)
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											DECLARE site_cursor CURSOR FOR
												SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
											OPEN site_cursor
											FETCH NEXT FROM site_cursor INTO @SiteIDVal
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO @TempTable
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
												END
											CLOSE site_cursor;
											DEALLOCATE site_cursor;

											;WITH cte AS
											(
												SELECT [GroupID]
												FROM @TempTable
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)												
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[OrigID] = CONVERT(INT, @SearchText)
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[OrigID] = CONVERT(INT, @SearchText)
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
										AND a.[OrigID] = CONVERT(INT, @SearchText)
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LastModified'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
					AND a.[LastModified] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							IF @ParentGroupID = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[WebEnabledFolders]
										WHERE [ModuleID] = @ModuleID
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
									AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
									AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									IF ISNULL(@SiteID, '') = ''
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[WebEnabledFolders]
												WHERE [ModuleID] = @ModuleID
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[LastModified] BETWEEN @sDate AND @eDate
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											DECLARE site_cursor CURSOR FOR
												SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
											OPEN site_cursor
											FETCH NEXT FROM site_cursor INTO @SiteIDVal
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO @TempTable
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
												END
											CLOSE site_cursor;
											DEALLOCATE site_cursor;

											;WITH cte AS
											(
												SELECT [GroupID]
												FROM @TempTable
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)												
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[LastModified] BETWEEN @sDate AND @eDate
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END

									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'VersionDate'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
					AND a.[VersionDate] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							IF @ParentGroupID = 1
								BEGIN
									IF ISNULL(@SiteID, '') = ''
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[WebEnabledFolders]
												WHERE [ModuleID] = @ModuleID
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND a.[VersionDate] BETWEEN @sDate AND @eDate
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											DECLARE site_cursor CURSOR FOR
												SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
											OPEN site_cursor
											FETCH NEXT FROM site_cursor INTO @SiteIDVal
											WHILE @@FETCH_STATUS = 0
												BEGIN
													INSERT INTO @TempTable
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
												END
											CLOSE site_cursor;
											DEALLOCATE site_cursor;

											;WITH cte AS
											(
												SELECT [GroupID]
												FROM @TempTable
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
												WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
											)												
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[VersionDate] BETWEEN @sDate AND @eDate
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups3]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE);
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.*, b.[ObjTypeID]
									FROM [dbo].[Items3] a
									INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'Status'
		BEGIN
			IF @SearchConvertedBy LIKE '0'
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.*, b.[ObjTypeID]
							FROM [dbo].[Items3] a
							INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
							AND a.[VersionedBy] LIKE '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									IF @ParentGroupID = 1
										BEGIN
											IF ISNULL(@SiteID, '') = ''
												BEGIN
													;WITH cte AS
													(
														SELECT [GroupID]
														FROM [dbo].[WebEnabledFolders]
														WHERE [ModuleID] = @ModuleID
														UNION ALL
														SELECT a.[GroupID]
														FROM [dbo].[Groups3] AS a
														INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
														WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
													)
													SELECT a.*, b.[ObjTypeID]
													FROM [dbo].[Items3] a
													INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
														AND a.[VersionedBy] LIKE '%'
													ORDER BY a.[Name] OPTION(RECOMPILE);
												END
											ELSE
												BEGIN
													DECLARE site_cursor CURSOR FOR
														SELECT [Name] 
														FROM dbo.v4_SplitString(@SiteID)
													OPEN site_cursor
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
													WHILE @@FETCH_STATUS = 0
														BEGIN
															INSERT INTO @TempTable
															SELECT [GroupID]
															FROM [dbo].[WebEnabledFolders]
															WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
															FETCH NEXT FROM site_cursor INTO @SiteIDVal
														END
													CLOSE site_cursor;
													DEALLOCATE site_cursor;

													;WITH cte AS
													(
														SELECT [GroupID]
														FROM @TempTable
														UNION ALL
														SELECT a.[GroupID]
														FROM [dbo].[Groups3] AS a
														INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
														WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
													)												
													SELECT a.*, b.[ObjTypeID]
													FROM [dbo].[Items3] a
													INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
														AND a.[VersionedBy] LIKE '%'
													ORDER BY a.[Name] OPTION(RECOMPILE);
												END
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups3]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups3]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											--select * from cte
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
								END
					END
				END
			ELSE
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.*, b.[ObjTypeID]
							FROM [dbo].[Items3] a
							INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
								AND a.[VersionedByID] = @SearchConvertedBy
							ORDER BY a.[Name] OPTION(RECOMPILE);
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									IF @ParentGroupID = 1
										BEGIN
											IF ISNULL(@SiteID, '') = ''
												BEGIN
													;WITH cte AS
													(
														SELECT [GroupID]
														FROM [dbo].[WebEnabledFolders]
														WHERE [ModuleID] = @ModuleID
														UNION ALL
														SELECT a.[GroupID]
														FROM [dbo].[Groups3] AS a
														INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
														WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
													)
													SELECT a.*, b.[ObjTypeID]
													FROM [dbo].[Items3] a
													INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
														AND a.[VersionedBy] = @SearchConvertedBy
													ORDER BY a.[Name] OPTION(RECOMPILE);
												END
											ELSE
												BEGIN
													DECLARE site_cursor CURSOR FOR
														SELECT [Name] 
												FROM dbo.v4_SplitString(@SiteID)
													OPEN site_cursor
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
													WHILE @@FETCH_STATUS = 0
														BEGIN
															INSERT INTO @TempTable
															SELECT [GroupID]
															FROM [dbo].[WebEnabledFolders]
															WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
															FETCH NEXT FROM site_cursor INTO @SiteIDVal
														END
													CLOSE site_cursor;
													DEALLOCATE site_cursor;

													;WITH cte AS
													(
														SELECT [GroupID]
														FROM @TempTable
														UNION ALL
														SELECT a.[GroupID]
														FROM [dbo].[Groups3] AS a
														INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
														WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
													)												
													SELECT a.*, b.[ObjTypeID]
													FROM [dbo].[Items3] a
													INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
														AND a.[VersionedBy] = @SearchConvertedBy
													ORDER BY a.[Name] OPTION(RECOMPILE);
												END
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups3]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[VersionedBy] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups3]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											--select * from cte
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
												AND a.[VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
									END
								END
					END
				END
		ELSE IF @SearchField = 'Notes'
			BEGIN
				IF @SearchSubGroups = 0
						BEGIN
							SELECT a.*, b.[ObjTypeID]
							FROM [dbo].[Items3] a
							INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
							AND a.[Notes] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									IF @ParentGroupID = 1
										BEGIN
											IF ISNULL(@SiteID, '') = ''
												BEGIN
													;WITH cte AS
													(
														SELECT [GroupID]
														FROM [dbo].[WebEnabledFolders]
														WHERE [ModuleID] = @ModuleID
														UNION ALL
														SELECT a.[GroupID]
														FROM [dbo].[Groups3] AS a
														INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
														WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
													)
													SELECT a.*, b.[ObjTypeID]
													FROM [dbo].[Items3] a
													INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
														AND a.[Notes] LIKE '%' + @SearchText + '%'
													ORDER BY a.[Name] OPTION(RECOMPILE);
												END
											ELSE
												BEGIN
													DECLARE site_cursor CURSOR FOR
														SELECT [Name] 
														FROM dbo.v4_SplitString(@SiteID)
													OPEN site_cursor
													FETCH NEXT FROM site_cursor INTO @SiteIDVal
													WHILE @@FETCH_STATUS = 0
														BEGIN
															INSERT INTO @TempTable
															SELECT [GroupID]
															FROM [dbo].[WebEnabledFolders]
															WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
															FETCH NEXT FROM site_cursor INTO @SiteIDVal
														END
													CLOSE site_cursor;
													DEALLOCATE site_cursor;

													;WITH cte AS
													(
														SELECT [GroupID]
														FROM @TempTable
														UNION ALL
														SELECT a.[GroupID]
														FROM [dbo].[Groups3] AS a
														INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
														WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
													)												
													SELECT a.*, b.[ObjTypeID]
													FROM [dbo].[Items3] a
													INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE c.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
														AND a.[Notes] LIKE '%' + @SearchText + '%'
													ORDER BY a.[Name] OPTION(RECOMPILE);
												END
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups3]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND EXISTS (SELECT c.[GroupID] FROM cte AS c WHERE a.[ParentGroupID] = c.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[Notes] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE);
										END
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups3]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											--select * from cte
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
												AND a.[Notes] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.*, b.[ObjTypeID]
											FROM [dbo].[Items3] a
											INNER JOIN [dbo].[Groups3] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND a.[Notes] LIKE '%' + @SearchText + '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									END
								END
					END
			END
		ELSE IF @SearchField = 'MemoData'
			BEGIN
				IF @SearchSubGroups = 0
						BEGIN
							SELECT a.*, c.[ObjTypeID]
							FROM [dbo].[Items3] a
							INNER JOIN [dbo].[HistoryMemo] b ON a.OrigID = b.OrigID
							INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
							WHERE a.[Status] = 9 AND a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
							AND b.[MemoData] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
				ELSE
					BEGIN
						IF @UserID = 0
							BEGIN
								IF @ParentGroupID = 1
									BEGIN
										IF ISNULL(@SiteID, '') = ''
											BEGIN
												;WITH cte AS
												(
													SELECT [GroupID]
													FROM [dbo].[WebEnabledFolders]
													WHERE [ModuleID] = @ModuleID
													UNION ALL
													SELECT a.[GroupID]
													FROM [dbo].[Groups3] AS a
													INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
												)
												SELECT a.*, c.[ObjTypeID]
												FROM [dbo].[Items3] a
												INNER JOIN [dbo].[HistoryMemo] b ON a.OrigID = b.OrigID
												INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
												WHERE a.[Status] = 9 AND EXISTS (SELECT d.[GroupID] FROM cte AS d WHERE d.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
													AND b.[MemoData] LIKE '%' + @SearchText + '%'
												ORDER BY a.[Name] OPTION(RECOMPILE);
											END
										ELSE
											BEGIN
												DECLARE site_cursor CURSOR FOR
													SELECT [Name] 
													FROM dbo.v4_SplitString(@SiteID)
												OPEN site_cursor
												FETCH NEXT FROM site_cursor INTO @SiteIDVal
												WHILE @@FETCH_STATUS = 0
													BEGIN
														INSERT INTO @TempTable
														SELECT [GroupID]
														FROM [dbo].[WebEnabledFolders]
														WHERE [PrfrdFolderName] = @SiteIDVal AND [ModuleID] = @ModuleID
														FETCH NEXT FROM site_cursor INTO @SiteIDVal
													END
												CLOSE site_cursor;
												DEALLOCATE site_cursor;
												;WITH cte AS
												(
													SELECT [GroupID]
													FROM @TempTable
													UNION ALL
													SELECT a.[GroupID]
													FROM [dbo].[Groups3] AS a
													INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
													WHERE a.[IsDeleted] = 0 AND a.[ControlType] = 0 AND ISNULL(a.[Name], '') <> ''
												)
												SELECT a.*, c.[ObjTypeID]
												FROM [dbo].[Items3] a
												INNER JOIN [dbo].[HistoryMemo] b ON a.OrigID = b.OrigID AND b.[Type] = 1
												INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
												WHERE a.[Status] = 9 AND EXISTS (SELECT d.[GroupID] FROM cte AS d WHERE d.[GroupID] = a.[ParentGroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
													AND b.[MemoData] LIKE '%' + @SearchText + '%'
												ORDER BY a.[Name] OPTION(RECOMPILE);
											END
									END
								ELSE
									BEGIN
										;WITH cte AS
										(
											SELECT [GroupID]
											FROM [dbo].[Groups3]
											WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
											UNION ALL
											SELECT a.[GroupID]
											FROM [dbo].[Groups3] AS a
											INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
										)
										SELECT a.*, c.[ObjTypeID]
										FROM [dbo].[Items3] a
										INNER JOIN [dbo].[HistoryMemo] b ON a.OrigID = b.OrigID
										INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
										WHERE a.[Status] = 9 AND EXISTS (SELECT d.[GroupID] FROM cte AS d WHERE a.[ParentGroupID] = d.[GroupID]) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND b.[MemoData] LIKE '%' + @SearchText + '%'
										ORDER BY a.[Name] OPTION(RECOMPILE);
									END
							END
						ELSE
							BEGIN
								IF @UserStatus = 1
									BEGIN
										;WITH cte AS
										(
											SELECT [GroupID]
											FROM [dbo].[Groups3]
											WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
											UNION ALL
											SELECT a.[GroupID]
											FROM [dbo].[Groups3] AS a
											INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
										)
										--select * from cte
										SELECT a.*, c.[ObjTypeID]
										FROM [dbo].[Items3] a
										INNER JOIN [dbo].[HistoryMemo] b ON a.OrigID = b.OrigID
										INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
										WHERE a.[Status] = 9 AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn 
											AND b.[MemoData] LIKE '%' + @SearchText + '%'
										ORDER BY a.[Name] OPTION(RECOMPILE);
									END
								ELSE
									BEGIN
										;WITH cte AS
										(
											SELECT a.[GroupID], CASE [ControlType]
												WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
													(
														SELECT [ControlID] 
														FROM [dbo].[LevelAccess] 
														WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
													)
													THEN 0
													WHEN @UserID IN 
													(
														SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
														(
															SELECT [GroupID]
															FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
														)
													)
													THEN 0
													ELSE 1
													END)
												ELSE 0
												END AS [ControlType]
											FROM [dbo].[Groups3] AS a
											WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
											UNION ALL
											SELECT a.[GroupID], CASE a.[ControlType]
												WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
													(
														SELECT [ControlID] 
														FROM [dbo].[LevelAccess] 
														WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
													)
													THEN 0
													WHEN @UserID IN 
													(
														SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
														(
															SELECT [GroupID]
															FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
														)
													)
													THEN 0
													ELSE 1
													END)
												ELSE 0
												END AS [ControlType]
											FROM [dbo].[Groups3] AS a
											INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										)
										SELECT a.*, c.[ObjTypeID]
										FROM [dbo].[Items3] a
										INNER JOIN [dbo].[HistoryMemo] b ON a.OrigID = b.OrigID
										INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
										WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [controltype] = 0) AND a.[IsDeleted] = 0 AND a.[Status] = 9 AND a.[IsWithdrawn] = @SearchWithdrawn
											AND b.[MemoData] LIKE '%' + @SearchText + '%'
										ORDER BY a.[Name] OPTION(RECOMPILE);
									END
								END
					END
		END
	ELSE IF (@ModuleID = 4)
	BEGIN
		SET @LevelID = 4001;
		IF @SearchField = 'Name'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[Name] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[Name] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LabelName'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[LabelName] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[LabelName] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'ItemID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[ItemID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[ItemID] = CAST(@SearchText AS INT)
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'OrigID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[OrigID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[OrigID] = CAST(@SearchText AS INT)
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LastModified'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[LastModified] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[LastModified] BETWEEN @sDate AND @eDate
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'VersionDate'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[VersionDate] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[VersionDate] BETWEEN @sDate AND @eDate
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'Status'
		BEGIN
			IF @SearchConvertedBy LIKE '0'
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
								WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[VersionedBy] LIKE '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionedBy] LIKE '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups4]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups4] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items4] AS a
											INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items4] AS a
											INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
								END
						END
				END
			ELSE
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND [VersionedByID] = @SearchConvertedBy
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND [VersionedByID] = @SearchConvertedBy
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups4]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups4] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items4] AS a
											INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND [VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items4] AS a
											INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND [VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									END
								END
					END
		END
		ELSE IF @SearchField = 'Notes'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[Notes] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[Notes] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Notes] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[Groups4] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Notes] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
				END
		END
		ELSE IF @SearchField = 'MemoData'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], c.[ObjTypeID]
					FROM [dbo].[Items4] AS a
					INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND b.[MemoData] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups4]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups4] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], c.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
							INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND b.[MemoData] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups4]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups4] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], c.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
									INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND b.[MemoData] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], c.[ObjTypeID]
									FROM [dbo].[Items4] AS a
									INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
									INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND b.[MemoData] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
				END
		END
	END
	ELSE IF (@ModuleID = 6)
	BEGIN
		SET @LevelID = 6001;
		IF @SearchField = 'Name'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[Name] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[Name] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LabelName'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[LabelName] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[LabelName] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'ItemID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[ItemID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[ItemID] = CAST(@SearchText AS INT)
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'OrigID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[OrigID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[OrigID] = CAST(@SearchText AS INT)
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LastModified'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[LastModified] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[LastModified] BETWEEN @sDate AND @eDate
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'VersionDate'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[VersionDate] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[VersionDate] BETWEEN @sDate AND @eDate
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'Status'
		BEGIN
			IF @SearchConvertedBy LIKE '0'
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
								WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[VersionedBy] LIKE '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionedBy] LIKE '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups6]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups6] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items6] AS a
											INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items6] AS a
											INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
								END
						END
				END
			ELSE
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND [VersionedByID] = @SearchConvertedBy
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND [VersionedByID] = @SearchConvertedBy
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups6]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups6] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items6] AS a
											INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND [VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items6] AS a
											INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND [VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									END
								END
					END
		END
		ELSE IF @SearchField = 'Notes'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[Notes] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[Notes] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Notes] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[Groups6] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Notes] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
				END
		END
		ELSE IF @SearchField = 'MemoData'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], c.[ObjTypeID]
					FROM [dbo].[Items6] AS a
					INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND b.[MemoData] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups6]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups6] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], c.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
							INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND b.[MemoData] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups6]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups6] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], c.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
									INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND b.[MemoData] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], c.[ObjTypeID]
									FROM [dbo].[Items6] AS a
									INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
									INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND b.[MemoData] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
				END
		END
	END
	ELSE IF (@ModuleID = 12)
	BEGIN
		SET @LevelID = 12001;
		IF @SearchField = 'Name'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[Name] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[Name] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Name] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LabelName'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[LabelName] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[LabelName] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LabelName] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'ItemID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[ItemID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[ItemID] = CAST(@SearchText AS INT)
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[ItemID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'OrigID'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[OrigID] = CAST(@SearchText AS INT)
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[OrigID] = CAST(@SearchText AS INT)
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[OrigID] = CAST(@SearchText AS INT)
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'LastModified'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[LastModified] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[LastModified] BETWEEN @sDate AND @eDate
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[LastModified] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'VersionDate'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[VersionDate] BETWEEN @sDate AND @eDate
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[VersionDate] BETWEEN @sDate AND @eDate
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte WHERE [ControlType] = 0) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionDate] BETWEEN @sDate AND @eDate
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
			END
		END
		ELSE IF @SearchField = 'Status'
		BEGIN
			IF @SearchConvertedBy LIKE '0'
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
								WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[VersionedBy] LIKE '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[VersionedBy] LIKE '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups12]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups12] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items12] AS a
											INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items12] AS a
											INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND a.[VersionedBy] LIKE '%'
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
								END
						END
				END
			ELSE
				BEGIN
					IF @SearchSubGroups = 0
						BEGIN
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND [VersionedByID] = @SearchConvertedBy
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserID = 0
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND [VersionedByID] = @SearchConvertedBy
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									IF @UserStatus = 1
										BEGIN
											;WITH cte AS
											(
												SELECT [GroupID]
												FROM [dbo].[Groups12]
												WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
												UNION ALL
												SELECT a.[GroupID]
												FROM [dbo].[Groups12] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items12] AS a
											INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND [VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									ELSE
										BEGIN
											;WITH cte AS
											(
												SELECT a.[GroupID], CASE [ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
												UNION ALL
												SELECT a.[GroupID], CASE a.[ControlType]
													WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
														(
															SELECT [ControlID] 
															FROM [dbo].[LevelAccess] 
															WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
														)
														THEN 0
														WHEN @UserID IN 
														(
															SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
															(
																SELECT [GroupID]
																FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
															)
														)
														THEN 0
														ELSE 1
														END)
													ELSE 0
													END AS [ControlType]
												FROM [dbo].[Groups3] AS a
												INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
											)
											SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
												CASE a.[Status]
													WHEN 0 THEN 'Complete'
													ELSE 'Open (' + [Version] + ')'
												END AS [Status],
												a.[FileExtension], b.[ObjTypeID]
											FROM [dbo].[Items12] AS a
											INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
											WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
												AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
												AND [VersionedByID] = @SearchConvertedBy
											ORDER BY a.[Name] OPTION(RECOMPILE)
										END
									END
								END
					END
		END
		ELSE IF @SearchField = 'Notes'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], b.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND a.[Notes] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], b.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND a.[Notes] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Notes] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], b.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[Groups12] b ON a.[ParentGroupID] = b.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND a.[Notes] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
				END
		END
		ELSE IF @SearchField = 'MemoData'
		BEGIN
			IF @SearchSubGroups = 0
				BEGIN
					SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
						CASE a.[Status]
							WHEN 0 THEN 'Complete'
							ELSE 'Open (' + [Version] + ')'
						END AS [Status],
						a.[FileExtension], c.[ObjTypeID]
					FROM [dbo].[Items12] AS a
					INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
						AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
						AND b.[MemoData] LIKE '%' + @SearchText + '%'
					ORDER BY a.[Name] OPTION(RECOMPILE)
				END
			ELSE
				BEGIN
					IF @UserID = 0
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups12]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups12] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
							)
							SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
								CASE a.[Status]
									WHEN 0 THEN 'Complete'
									ELSE 'Open (' + [Version] + ')'
								END AS [Status],
								a.[FileExtension], c.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
							INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
							WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
								AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
								AND b.[MemoData] LIKE '%' + @SearchText + '%'
							ORDER BY a.[Name] OPTION(RECOMPILE)
						END
					ELSE
						BEGIN
							IF @UserStatus = 1
								BEGIN
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups12]
										WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups12] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], c.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
									INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND b.[MemoData] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
							ELSE
								BEGIN
									;WITH cte AS
									(
										SELECT a.[GroupID], CASE [ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										WHERE (a.[ParentGroupID] = @ParentGroupID OR a.[GroupID] = @ParentGroupID) AND a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID], CASE a.[ControlType]
											WHEN 1 THEN (SELECT CASE WHEN @UserID IN 
												(
													SELECT [ControlID] 
													FROM [dbo].[LevelAccess] 
													WHERE [LevelID] = @LevelID AND [LevelValue] = 1 AND [ModuleID] = @ModuleID AND [ControlType] = 1 AND [GroupID] = a.[GroupID]
												)
												THEN 0
												WHEN @UserID IN 
												(
													SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [ControlType] = 1 AND [ControlID] = @UserID AND [OrigID] IN
													(
														SELECT [GroupID]
														FROM dbo.v4_SecurityCheck(@ModuleID,a.[GroupID],@LevelID)
													)
												)
												THEN 0
												ELSE 1
												END)
											ELSE 0
											END AS [ControlType]
										FROM [dbo].[Groups3] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
									)
									SELECT a.[Name], a.[LabelName], a.[OrigID], a.[ItemID], a.[ParentGroupID], [Version],
										CASE a.[Status]
											WHEN 0 THEN 'Complete'
											ELSE 'Open (' + [Version] + ')'
										END AS [Status],
										a.[FileExtension], c.[ObjTypeID]
									FROM [dbo].[Items12] AS a
									INNER JOIN [dbo].[HistoryMemo] b ON a.[OrigID] = b.[OrigID]
									INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
									WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @SearchWithdrawn
										AND [ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC)
										AND b.[MemoData] LIKE '%' + @SearchText + '%'
									ORDER BY a.[Name] OPTION(RECOMPILE)
								END
						END
				END
		END
	END
	ELSE IF (@ModuleID = 14)
	BEGIN
		IF (@SearchField = 'Name')
		BEGIN
			IF (@UserID > 0)
			BEGIN
				IF (@UserStatus = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [Name] LIKE '%' + @SearchText + '%' AND [IsDeleted] = 0
					ORDER BY [Name]
				END
				ELSE
				BEGIN
					SELECT * 
					FROM [dbo].[Items14]
					WHERE [Name] LIKE '%' + @SearchText + '%' AND [IsDeleted] = 0 AND [UserID] = @UserID
					ORDER BY [Name]
				END
			END				
		END
		ELSE IF (@SearchField = 'Status')
		BEGIN
			IF (@UserID > 0)
			BEGIN
				IF (@UserStatus = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [ParentGroupID] = @SearchText AND [IsDeleted] = 0
					ORDER BY [Name]
				END
				ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [ParentGroupID] = @SearchText AND [IsDeleted] = 0 AND [UserID] = @UserID
					ORDER BY [Name]
				END
			END
		END
		ELSE IF (@SearchField = 'Due Date')
		BEGIN
			IF (@UserID > 0)
			BEGIN
				IF (@UserStatus = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [DateDue] BETWEEN  @sDate AND @eDate AND [IsDeleted] = 0
					ORDER BY [Name]
				END
				ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [DateDue] BETWEEN  @sDate AND @eDate AND [IsDeleted] = 0 AND [UserID] = @UserID
					ORDER BY [Name]
				END
			END			
		END
		ELSE IF (@SearchField = 'Details')
		BEGIN
			IF (@UserID > 0)
			BEGIN
				IF (@UserStatus = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [Details] LIKE '%' + @SearchText + '%' AND [IsDeleted] = 0
					ORDER BY [Name]
				END
				ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [Details] LIKE '%' + @SearchText + '%' AND [IsDeleted] = 0 AND [UserID] = @UserID
					ORDER BY [Name]
				END
			END
		END
		ELSE IF (@SearchField = 'Sent Date')
		BEGIN
			IF (@UserID > 0)
			BEGIN
				IF (@UserStatus = 1)
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [SendDate] BETWEEN  @sDate AND @eDate AND [IsDeleted] = 0
					ORDER BY [Name]
				END
				ELSE
				BEGIN
					SELECT *
					FROM [dbo].[Items14]
					WHERE [SendDate] BETWEEN  @sDate AND @eDate AND [IsDeleted] = 0 AND [UserID] = @UserID
					ORDER BY [Name]
				END
			END
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByCategory]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/6/2017>
-- Description:	<Search Items by Category>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_SearchItemsByCategory]
(
	@ModuleID int,
	@ParentGroupID int,
	@CatID int,
	@IsSubGroup int,
	@IsWithdrawn int,
	@UserID int,
	@SiteID nvarchar(500)
)
AS

BEGIN
	DECLARE @UserStatus INT
	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID)

	IF (@ModuleID = 3)
		BEGIN
			IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, c.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND b.[CatID] = @CatID AND a.[Status] = 9 AND b.[ModuleID] = @ModuleID
						AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups3]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups3] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, c.[ObjTypeID]
						FROM [dbo].[Items3] a
						INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
						INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID AND a.[Status] = 9 AND b.[ModuleID] = @ModuleID
							AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups3]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups3] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items3] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID AND a.[Status] = 9 AND b.[ModuleID] = @ModuleID
									AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 3001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups3]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 3001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups3] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items3] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups3] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID AND a.[Status] = 9 AND b.[ModuleID] = @ModuleID
									AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
					END
			END
		ELSE IF (@ModuleID = 4)
			BEGIN
				IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, c.[ObjTypeID]
					FROM [dbo].[Items4] a
					INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND b.[CatID] = @CatID 
						AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
						AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups4]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups4] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, c.[ObjTypeID]
						FROM [dbo].[Items4] a
						INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
						INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
							AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
							AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups4]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups4] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items4] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
									AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 4001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups4]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ([Name] IS NOT NULL OR [Name] <> '')
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 4001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups4] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items4] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups4] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
									AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
					END
			END
		ELSE IF (@ModuleID = 6)
			BEGIN
				IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, c.[ObjTypeID]
					FROM [dbo].[Items6] a
					INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND b.[CatID] = @CatID 
						AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
						AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups6]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups6] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, c.[ObjTypeID]
						FROM [dbo].[Items6] a
						INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
						INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
							AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
							AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups6]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups6] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items6] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
									AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 6001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups6]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ([Name] IS NOT NULL OR [Name] <> '')
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 6001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups6] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items6] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups6] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
									AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
					END
			END
		ELSE
			BEGIN
				IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, c.[ObjTypeID]
					FROM [dbo].[Items12] a
					INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
					INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND b.[CatID] = @CatID 
						AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
						AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups12]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups12] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, c.[ObjTypeID]
						FROM [dbo].[Items12] a
						INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
						INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
							AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
							AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups12]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups12] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items12] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
									AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 6001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups12]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ([Name] IS NOT NULL OR [Name] <> '')
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 6001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups12] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, c.[ObjTypeID]
								FROM [dbo].[Items12] a
								INNER JOIN [dbo].[CatgryValues] b ON a.[OrigID] = b.[OrigID]
								INNER JOIN [dbo].[Groups12] c ON a.[ParentGroupID] = c.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND b.[CatID] = @CatID 
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] AND [IsDeleted] = 0 ORDER BY [ItemID] DESC)) 
									AND b.[ModuleID] = @ModuleID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
								ORDER BY a.[Name]
							END
					END
			END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByRole]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/6/2017>
-- Description:	<Search Items by Role Assigned>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_SearchItemsByRole]
(
	@ModuleID int,
	@ParentGroupID int,
	@AssignedID int,
	@RoleID int,
	@IsSubGroup bit,
	@IsWithdrawn bit,
	@UserID int,
	@SiteID nvarchar(500)
)
AS

BEGIN

	DECLARE @UserStatus INT
	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID)

	IF (@ModuleID = 3)
		BEGIN
			IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, d.[ObjTypeID]
					FROM [dbo].[Items3] a
					INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
					INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
					INNER JOIN [dbo].[Groups3] d ON a.[ParentGroupID] = d.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = 0
						 AND (b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID])))
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups3]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups3] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, d.[ObjTypeID]
						FROM [dbo].[Items3] a
						INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
						INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
						INNER JOIN [dbo].[Groups3] d ON a.[ParentGroupID] = d.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
							 AND (b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID])))
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups3]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups3] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items3] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups3] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
									AND (b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID])))
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 3001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups3]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 3001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups3] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items3] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups3] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
									AND (b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID])))
								ORDER BY a.[Name]
							END
					END
			END
		ELSE IF (@ModuleID = 4)
			BEGIN
				IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, d.[ObjTypeID]
					FROM [dbo].[Items4] a
					INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
					INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
					INNER JOIN [dbo].[Groups4] d ON a.[ParentGroupID] = d.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
						AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
						AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups4]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups4] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, d.[ObjTypeID]
						FROM [dbo].[Items4] a
						INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
						INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
						INNER JOIN [dbo].[Groups4] d ON a.[ParentGroupID] = d.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
							AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
							AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups4]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups4] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items4] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups4] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
									AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 4001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups4]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ([Name] IS NOT NULL OR [Name] <> '')
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 4001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups4] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items4] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups4] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
									AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
								ORDER BY a.[Name]
							END
					END
			END
		ELSE IF (@ModuleID = 6)
			BEGIN
				IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, d.[ObjTypeID]
					FROM [dbo].[Items6] a
					INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
					INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
					INNER JOIN [dbo].[Groups6] d ON a.[ParentGroupID] = d.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
						AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
						AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups6]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups6] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, d.[ObjTypeID]
						FROM [dbo].[Items6] a
						INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
						INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
						INNER JOIN [dbo].[Groups6] d ON a.[ParentGroupID] = d.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
							AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
							AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups6]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups6] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items6] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups6] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
									AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 6001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups6]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ([Name] IS NOT NULL OR [Name] <> '')
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 6001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups6] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items6] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups6] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
									AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
								ORDER BY a.[Name]
							END
					END
			END
		ELSE
			BEGIN
				IF @IsSubGroup = 0
				BEGIN
					SELECT a.*, d.[ObjTypeID]
					FROM [dbo].[Items12] a
					INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
					INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
					INNER JOIN [dbo].[Groups12] d ON a.[ParentGroupID] = d.[GroupID]
					WHERE a.[ParentGroupID] = @ParentGroupID AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
						AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
						AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
					ORDER BY a.[Name]
				END
			ELSE
				IF @UserID = 0
					BEGIN
						;WITH cte AS
						(
							SELECT [GroupID]
							FROM [dbo].[Groups12]
							WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
							UNION ALL
							SELECT a.[GroupID]
							FROM [dbo].[Groups12] AS a
							INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
						)
						SELECT a.*, d.[ObjTypeID]
						FROM [dbo].[Items12] a
						INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
						INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
						INNER JOIN [dbo].[Groups12] d ON a.[ParentGroupID] = d.[GroupID]
						WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
							AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
							AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
						ORDER BY a.[Name]
					END
				ELSE
					BEGIN
						IF @UserStatus = 1
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID]
									FROM [dbo].[Groups12]
									WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
									UNION ALL
									SELECT a.[GroupID]
									FROM [dbo].[Groups12] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items12] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups12] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
									AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
								ORDER BY a.[Name]
							END
						ELSE
							BEGIN
								;WITH cte AS
								(
									SELECT [GroupID],
										CASE WHEN [ControlType] = 1
											THEN (SELECT CASE
												WHEN [GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 12001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												)
												THEN 0
												ELSE 1
											END)
										WHEN [ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups12]
									WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ([Name] IS NOT NULL OR [Name] <> '')
									UNION ALL
									SELECT a.[GroupID],
										CASE WHEN a.[ControlType] = 1
											THEN (SELECT CASE
												WHEN a.[GroupID] IN
												(
													SELECT [GroupID]
													FROM [dbo].[LevelAccess]
													WHERE [ModuleID] = @ModuleID AND [LevelID] = 12001 and [LevelValue] = 1 AND [ControlID] in 
													(
														SELECT [OrigID]
														FROM [dbo].[ControlLists] 
														WHERE [ControlID] = @UserID and [ModuleID] = 1
													)
												) THEN 0
												ELSE 1
											END)
										WHEN a.[ControlType] = 0
											THEN 0
											ELSE 1
										END AS [ControlType]
									FROM [dbo].[Groups12] AS a
									INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								)
								SELECT a.*, d.[ObjTypeID]
								FROM [dbo].[Items12] a
								INNER JOIN [dbo].[ControlLists] b ON a.[OrigID] = b.[OrigID] AND b.[IsGroup] = 0
								INNER JOIN [dbo].[CatDateSet] c ON b.[CatID] = c.[CatID] AND c.[CatID] = @RoleID AND c.[ModuleID] = @ModuleID
								INNER JOIN [dbo].[Groups12] d ON a.[ParentGroupID] = d.[GroupID]
								WHERE a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn									
									AND ([ItemID] IN (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID] ORDER BY [ItemID] DESC))
									AND b.[ControlID] = @AssignedID OR (@AssignedID IN (SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] = b.[ControlID]))
								ORDER BY a.[Name]
							END
					END
			END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByStyle]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Dec 14, 2018>
-- Description:	<Get Search Results by Form Style and Field Value>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_SearchItemsByStyle]
(
	@ModuleID int,
	@FieldID int,
	@FieldType int,
	@Modifier int,
	@SearchString nvarchar(255),
	@NumStart int,
	@NumEnd int,
	@DateStart datetime,
	@DateEnd datetime,
	@SiteID nvarchar(500)
)
AS
BEGIN
	SET NOCOUNT ON;

    IF @ModuleID = 4
		BEGIN
			IF (@FieldType = 0 OR @FieldType = 3 OR @FieldType = 7)
				BEGIN
					IF (@Modifier = 1)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID] AND b.[ModuleID] = @ModuleID
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[TextData] LIKE @SearchString AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[TextData] LIKE '%' + @SearchString + '%' AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END					
				END
			ELSE IF (@FieldType = 1 OR @FieldType = 6 OR @FieldType = 18 OR @FieldType = 20)
				BEGIN
					IF (@Modifier = 1)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[MemoData] LIKE @SearchString AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[MemoData] LIKE '%' + @SearchString + '%' AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END			
				END
			ELSE IF (@FieldType = 2)
				BEGIN
					IF (@Modifier = 3)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = 1 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
			ELSE IF (@FieldType = 8)
				BEGIN
					IF @Modifier = 1
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = CAST(@SearchString AS INT) AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 4
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] BETWEEN @NumStart AND @NumEnd AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 5
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] > @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 6
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] >= @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 7
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] < @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 8
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] <= @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
			ELSE IF (@FieldType = 4 OR @FieldType = 16)
				BEGIN					
					IF @Modifier = 1
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[DateData] BETWEEN @DateStart AND DATEADD(HOUR, 24, @DateStart) AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 4
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] BETWEEN @DateStart AND @DateEnd AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 5
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] > @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 6
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] >= @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 7
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] < @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 8
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items4] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items4] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items4] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups4] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] <= @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF (@FieldType = 0 OR @FieldType = 3 OR @FieldType = 7)
				BEGIN
					IF (@Modifier = 1)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID] AND b.[ModuleID] = @ModuleID
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[TextData] LIKE @SearchString AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[TextData] LIKE '%' + @SearchString + '%' AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END					
				END
			ELSE IF (@FieldType = 1 OR @FieldType = 6 OR @FieldType = 18 OR @FieldType = 20)
				BEGIN
					IF (@Modifier = 1)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[MemoData] LIKE @SearchString AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[MemoData] LIKE '%' + @SearchString + '%' AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END			
				END
			ELSE IF (@FieldType = 2)
				BEGIN
					IF (@Modifier = 3)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = 1 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
			ELSE IF (@FieldType = 8)
				BEGIN
					IF @Modifier = 1
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = CAST(@SearchString AS INT) AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 4
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] BETWEEN @NumStart AND @NumEnd AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 5
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] > @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 6
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] >= @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 7
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] < @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 8
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] <= @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
			ELSE IF (@FieldType = 4 OR @FieldType = 16)
				BEGIN					
					IF @Modifier = 1
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[DateData] BETWEEN @DateStart AND DATEADD(HOUR, 24, @DateStart) AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 4
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] BETWEEN @DateStart AND @DateEnd AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 5
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] > @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 6
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] >= @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 7
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] < @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 8
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items6] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items6] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items6] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups6] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] <= @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
		END
	ELSE
		BEGIN
			IF (@FieldType = 0 OR @FieldType = 3 OR @FieldType = 7)
				BEGIN
					IF (@Modifier = 1)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID] AND b.[ModuleID] = @ModuleID
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[TextData] LIKE @SearchString AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[TextData] LIKE '%' + @SearchString + '%' AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END					
				END
			ELSE IF (@FieldType = 1 OR @FieldType = 6 OR @FieldType = 18 OR @FieldType = 20)
				BEGIN
					IF (@Modifier = 1)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[MemoData] LIKE @SearchString AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[MemoData] LIKE '%' + @SearchString + '%' AND a.IsDeleted = 0 AND a.IsWithdrawn = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END			
				END
			ELSE IF (@FieldType = 2)
				BEGIN
					IF (@Modifier = 3)
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = 1 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = 0 AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
			ELSE IF (@FieldType = 8)
				BEGIN
					IF @Modifier = 1
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] = CAST(@SearchString AS INT) AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 4
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] BETWEEN @NumStart AND @NumEnd AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 5
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] > @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 6
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] >= @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 7
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] < @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 8
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] <= @NumStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
			ELSE IF (@FieldType = 4 OR @FieldType = 16)
				BEGIN					
					IF @Modifier = 1
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[DateData] BETWEEN @DateStart AND DATEADD(HOUR, 24, @DateStart) AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 4
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] BETWEEN @DateStart AND @DateEnd AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 5
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] > @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 6
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] >= @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 7
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] < @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
					ELSE IF @Modifier = 8
						BEGIN
							SELECT (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID]) AS [ItemID],
								a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName],
								(SELECT [Status] FROM [dbo].[Items12] WHERE [ItemID] = (SELECT MAX([ItemID]) FROM [dbo].[Items12] WHERE [OrigID] = a.[OrigID])) AS [Status],
								a.[FileExtension], d.[ObjTypeID]
							FROM [dbo].[Items12] AS a
							INNER JOIN [dbo].[RecordsData] AS b ON a.[ItemID] = b.[ItemID]
							INNER JOIN [dbo].[Groups12] AS d ON a.[ParentGroupID] = d.[GroupID]
							WHERE b.[NumData] <= @DateStart AND b.[FieldID] = @FieldID
							GROUP BY a.[OrigID], a.[ParentGroupID], a.[Name], a.[LabelName], a.[FileExtension], d.[ObjTypeID]
							ORDER BY a.[Name]
						END
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Search_SearchItemsByText]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <07/6/2017>
-- Description:	<Search for Items Containing Text>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Search_SearchItemsByText]
(
	@OrigID int,
	@ParentGroupID int,
	@IncludeSubGroup bit,
	@IsWithDrawn bit,
	@UserID int,
	@SiteID nvarchar(500)
)
AS

BEGIN

	DECLARE @UserStatus INT
	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID)
	
	IF @IncludeSubGroup = 0
		BEGIN
			SELECT a.*, b.[ObjTypeID]
			FROM [dbo].[Items3] AS a
			INNER JOIN [dbo].[Groups3] AS b ON a.[ParentGroupID] = b.[GroupID]
			WHERE a.[OrigID] = @OrigID AND a.[ParentGroupID] = @ParentGroupID AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
			ORDER BY a.[Name]
		END
	ELSE
		BEGIN
			IF @UserID = 0
				BEGIN
					;WITH cte AS
					(
						SELECT [GroupID]
						FROM [dbo].[Groups3]
						WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0 AND [ControlType] = 0
						UNION ALL
						SELECT a.[GroupID]
						FROM [dbo].[Groups3] AS a
						INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0 AND [ControlType] = 0
					)
					SELECT a.*, b.[ObjTypeID]
					FROM [dbo].[Items3] AS a
					INNER JOIN [dbo].[Groups3] AS b ON a.[ParentGroupID] = b.[GroupID]
					WHERE a.[OrigID] = @OrigID AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
					ORDER BY a.[Name]
				END
			ELSE
				BEGIN
					IF @UserStatus = 1
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups3]
								WHERE ([GroupID] = @ParentGroupID OR [ParentGroupID] = @ParentGroupID) AND [IsDeleted] = 0
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups3] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID] AND a.[IsDeleted] = 0
							)
							SELECT a.*, b.[ObjTypeID]
							FROM [dbo].[Items3] AS a
							INNER JOIN [dbo].[Groups3] AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[OrigID] = @OrigID AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
							ORDER BY a.[Name]
						END
					ELSE
						BEGIN
							;WITH cte AS
							(
								SELECT [GroupID],
									CASE WHEN [ControlType] = 1
										THEN (SELECT CASE
											WHEN [GroupID] IN
											(
												SELECT [GroupID]
												FROM [dbo].[LevelAccess]
												WHERE [ModuleID] = 3 AND [LevelID] = 3001 and [LevelValue] = 1 AND [ControlID] in 
												(
													SELECT [OrigID]
													FROM [dbo].[ControlLists] 
													WHERE [ControlID] = @UserID and [ModuleID] = 1
												)
											)
											THEN 0
											ELSE 1
										END)
									WHEN [ControlType] = 0
										THEN 0
										ELSE 1
									END AS [ControlType]
								FROM [dbo].[Groups3]
								WHERE [ParentGroupID] = @ParentGroupID AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
								UNION ALL
								SELECT a.[GroupID],
									CASE WHEN a.[ControlType] = 1
										THEN (SELECT CASE
											WHEN a.[GroupID] IN
											(
												SELECT [GroupID]
												FROM [dbo].[LevelAccess]
												WHERE [ModuleID] = 3 AND [LevelID] = 3001 and [LevelValue] = 1 AND [ControlID] in 
												(
													SELECT [OrigID]
													FROM [dbo].[ControlLists] 
													WHERE [ControlID] = @UserID and [ModuleID] = 1
												)
											) THEN 0
											ELSE 1
										END)
									WHEN a.[ControlType] = 0
										THEN 0
										ELSE 1
									END AS [ControlType]
								FROM [dbo].[Groups3] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
							)
							SELECT a.*, b.[ObjTypeID]
							FROM [dbo].[Items3] AS a
							INNER JOIN [dbo].[Groups3] AS b ON a.[ParentGroupID] = b.[GroupID]
							WHERE a.[OrigID] = @OrigID AND a.[ParentGroupID] IN (SELECT [GroupID] FROM cte) AND a.[Status] = 9 AND a.[IsDeleted] = 0 AND a.[IsWithdrawn] = @IsWithdrawn
							ORDER BY a.[Name]
						END
				END
		END
END


GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Convert_Status]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <12/11/2017>
-- Description:	<Convert Item Status in Paradigm 3>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Status_Convert_Status] 
	@ModuleID INT,
	@ItemID INT,
	@OrigID INT,
	@Version NVARCHAR(255),
	@StatusFrom INT,
	@StatusTo INT,
	@EffectiveDate DATETIME,
	@UserID INT,
	@UserName NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE
		@Date DATETIME,
		@CurrentID INT,
		@CurrentRecID INT,
		@CurrentImpID INT,
		@CurrentTrainID INT,
		@NewVersion DECIMAL,
		@NewVersion2 INT

	SET @Date = GETDATE();
	SET @CurrentID = (SELECT [ItemID] FROM Items3 WHERE [status] = @StatusFrom AND [OrigID] = @OrigID);

	IF @ModuleID = 3 -- DOCUMENTS
		BEGIN
			-- If converting to CURRENT
			IF @StatusTo = 9 
				BEGIN
					-- IF A CURRENT VERSION ALREADY EXISTS
					IF 9 IN (SELECT [Status] FROM Items3 WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
						BEGIN
							-- GET THE OLD CURRENT ITEMID AND CONVERT THE OLD CURRENT VERSION TO OBSOLETE
							DECLARE @CurrID INT
							SET @CurrID = (SELECT TOP 1 [ItemID] FROM Items3 WHERE [OrigID] = @OrigID AND [Status] = 9)
							Update Items3
							SET [Status] = 0, [LastModified] = @Date, [ModifiedBy] = @UserName, [ModifierID] = @UserID
							WHERE [ItemID] = @CurrID
						END
					-- CONVERT FROM XXX TO CURRENT
					UPDATE Items3
					SET [Status] = 9, [Version] = @Version, [VersionDate] = @Date, [VersionedBy] = @UserName, [VersionedByID] = @UserID, [EffectDate] = @EffectiveDate, [ModifiedBy] = @UserName, 
						[LastModified] = @Date, [ModifierID] = @UserID, [IsCheckedOut] = 0, [CheckedOutBy] = NULL, [CheckedOutDate] = NULL, [NeedPublish] =
							CASE 
								WHEN [TypeOfPublish] > 0 THEN 1
								ELSE 0
							END,
						[PublishNow] = 
							CASE
								WHEN [TypeOfPublish] > 0 THEN 1
								ELSE 0
							END
					WHERE OrigID = @OrigID AND [Status] NOT IN (0, 7, 9)

					-- LOOP THROUGH ALL ROLES AND INSERT FIELD VALUES
					DECLARE @MyCursor CURSOR;
					DECLARE @RoleCatID INT;
					SET @MyCursor = CURSOR FOR
						SELECT CatID
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = 3 AND [ListClass] = 5 AND [OrigID] = @OrigID
					OPEN @MyCursor
					FETCH NEXT FROM @MyCursor
					INTO @RoleCatID
					WHILE @@FETCH_STATUS = 0
					BEGIN
						-- INSERT POSITION TITLE ROLE MEMBERS
						;WITH ctePT
							AS(SELECT c.ItemID, a.OrigID, STUFF((SELECT ',' + b.ControlFullName
								FROM ControlLists AS b		  
								WHERE b.OrigID = a.OrigID and b.CatID = @RoleCatID and b.listclass = 5 and b.ModuleID = 3 and b.IsGroup = 0
								ORDER BY b.ControlFullName
								FOR XML PATH('')), 1, 1, '') [AllMembers]
							FROM ControlLists AS a
							INNER JOIN Items3 AS c ON a.OrigID = c.OrigID AND c.IsDeleted = 0 AND c.IsWithdrawn = 0
							WHERE a.ModuleID = 3 and a.CatID = @RoleCatID AND a.ListClass = 5 AND a.IsGroup = 0 AND a.ControlType = 6 AND a.OrigID = @OrigID AND c.[Status] = 9
							GROUP BY a.OrigID, c.ItemID)
							--select ItemID, @RoleCatID AS RoleCatID, 1 AS SubType, OrigID, AllMembers AS FieldValues from ctePT
							INSERT INTO InsertFieldValues(ItemId, RoleCatID, SubType, OrigID, FieldValues)
							SELECT ItemID, @RoleCatID, 1, OrigID, AllMembers FROM ctePT WHERE ItemID NOT IN
								(SELECT ItemID FROM InsertFieldValues WHERE OrigID = @OrigID AND RoleCatID = @RoleCatID)
						
						-- INSERT USER ROLE MEMBERS
						;WITH cteU
							AS(SELECT c.ItemID, a.OrigID, STUFF((SELECT ',' + b.ControlFullName
								FROM ControlLists AS b		  
								WHERE b.OrigID = a.OrigID and b.CatID = @RoleCatID and b.listclass = 5 and b.ModuleID = 3 and b.IsGroup = 0
								ORDER BY b.ControlFullName
								FOR XML PATH('')), 1, 1, '') [AllMembers]
							FROM ControlLists AS a
							INNER JOIN Items3 AS c ON a.OrigID = c.OrigID AND c.IsDeleted = 0 AND c.IsWithdrawn = 0
							WHERE a.ModuleID = 3 and a.CatID = @RoleCatID AND a.ListClass = 5 AND a.IsGroup = 0 AND a.ControlType = 1 AND a.OrigID = @OrigID AND c.[Status] = 9
							GROUP BY a.OrigID, c.ItemID)
							--select ItemID, @RoleCatID AS RoleCatID, 2 AS SubType, OrigID, AllMembers AS FieldValues from cteU
							INSERT INTO InsertFieldValues(ItemId, RoleCatID, SubType, OrigID, FieldValues)
							SELECT ItemID, @RoleCatID, 2, OrigID, AllMembers FROM cteU WHERE ItemID NOT IN
								(SELECT ItemID FROM InsertFieldValues WHERE OrigID = @OrigID AND RoleCatID = @RoleCatID)
						
						FETCH NEXT FROM @MyCursor
						INTO @RoleCatID
					END

				END
			-- If Converting from CURRENT or PENDING
			ELSE IF @StatusFrom = 9 OR @StatusFrom = 7
				BEGIN
					-- CREATE NEW DRAFT ROW
					INSERT INTO Items3([OrigID], [ParentGroupID], [Name], [LabelName], [FileExtension], [HasPLink], [Status], [Version], [NumPages], [IsCheckedOut], [CheckedOutBy], [CheckedOutDate],
						[TypeOfPublish], [NeedPublish], [NeedPublishToSP], [VersionDate], [VersionedBy], [VersionedByID], [EffectDate], [CreateBy], [CreateDate], [ModifiedBy], [LastModified],
						[CreatorID], [ModifierID], [PublishNow], [SPLocation])
					(SELECT [OrigID], [ParentGroupID], [Name], [LabelName], [FileExtension],
						CASE
							WHEN [HasPLink] IS NULL THEN 0
							ELSE [HasPLink] END AS [HasPLink],
						@StatusTo, [Version], 
						CASE
							WHEN [NumPages] IS NULL THEN 0
							ELSE [NumPages] END AS [NumPages],
						0, NULL, NULL, [TypeOfPublish], [NeedPublish], [NeedPublishToSP], @Date, @UserName, @UserID, @Date, @UserName, @Date, @UserName, @Date, @UserID, @UserID, [PublishNow], [SPLocation]
					FROM [dbo].[Items3]
					WHERE [ItemID] = @CurrentID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
				END
			ELSE
				BEGIN
					-- CONVERT FROM XXX TO XXX
					UPDATE Items3
					SET Status = @StatusTo, VersionDate = @Date, VersionedBy = @UserName, VersionedByID = @UserID, ModifiedBy = @UserName, LastModified = @Date, [NeedPublish] = 
						CASE 
							WHEN (@StatusTo = 5 OR @StatusTo = 6) AND [TypeOfPublish] > 0 THEN 1
							ELSE 0
						END,
						[PublishNow] = 
							CASE 
							WHEN (@StatusTo = 5 OR @StatusTo = 6) AND [TypeOfPublish] > 0 THEN 1
							ELSE 0
						END
					WHERE ItemID = @CurrentID	
				END
		END
	ELSE IF @ModuleID = 4
		BEGIN
			IF @StatusFrom = 0
				BEGIN
					-- SET NEW VERSION INCREMENT
					SET @NewVersion = (SELECT TOP 1 CONVERT(INT, [Version]) + 1 FROM [dbo].[Items4] WHERE [status] = 0 AND [OrigID] = @OrigID ORDER BY [ItemID] DESC)
					-- GET ID OF OPEN RECORD
					SET @CurrentRecID = (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [status] = 0 AND [OrigID] = @OrigID)
					-- CREATE NEW DRAFT ROW
					INSERT INTO [dbo].[Items4]([OrigID],[ParentGroupID],[Name],[LabelName],[FileExtension],[HasPLink],[Status],[Version],[TypeOfPublish],[NeedPublish],[NeedPublishToSP],
						[VersionDate],[VersionedBy],[VersionedByID],[CreateBy],[CreateDate],[ModifiedBy],[LastModified],[CreatorID],[ModifierID])
					(SELECT [OrigID],[ParentGroupID],[Name],[LabelName],[FileExtension],[HasPLink],2,CONVERT(NVARCHAR(255), @NewVersion),[TypeOfPublish],0,0,@Date,@UserName,@UserID,@UserName,@Date,@UserName,@Date,@UserID,@UserID
						FROM [dbo].[Items4]
						WHERE [ItemID] = @CurrentRecID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
					-- CREATE TABS FOR NEW RECORD
					DECLARE @NewRecID INT
					SET @NewRecID = SCOPE_IDENTITY()
					INSERT INTO [dbo].[ItemObj]([ItemID],[ObjID],[ModuleID],[CheckedBy],[CheckedDate],[IsDeleted],[CheckerID],[StepDueDate],[IsNotApplicable],[HasAttachment],[DefID],[ReqID],[DueStatus],[IsPending],[PendingDate],[TrigrdPndngAI])
					(SELECT @NewRecID,[ObjID],@ModuleID,'','1900-01-01',[IsDeleted],NULL,NULL,0,[HasAttachment],0,0,NULL,0,NULL,0 
						FROM [dbo].[ItemObj]
						WHERE [ItemID] = @CurrentRecID AND [ModuleID] = @ModuleID AND [IsDeleted] = 0)
					--CREATE RECORDS DATA ROWS
					INSERT INTO [dbo].[RecordsData]([FieldID],[ItemID],[ModuleID],[NumData],[TextData],[DateData],[MemoData],[BinaryData],[IsDeleted],[ReqID])
					(SELECT [FieldID],@NewRecID,@ModuleID,[NumData],[TextData],[DateData],[MemoData],[BinaryData],0,0
						FROM [dbo].[RecordsData]
						WHERE [ItemID] = @CurrentRecID AND [ModuleID] = @ModuleID AND [IsDeleted] = 0)
				END
			ELSE
				BEGIN
					-- GET ID OF RECORD
					SET @CurrentRecID  = (SELECT TOP 1 [ItemID] FROM [dbo].[Items4] WHERE [status] = 2 AND [OrigID] = @OrigID)
					-- CONVERT FROM DRAFT TO COMPLETE
					UPDATE [dbo].[Items4]
					SET [Status] = 0, [VersionDate] = @Date, [VersionedBy] = @UserName, [VersionedByID] = @UserID, [ModifiedBy] = @UserName, [LastModified] = @Date
					WHERE [ItemID] = @CurrentRecID
				END
		END
	ELSE IF @ModuleID = 6
		BEGIN
			IF @StatusFrom = 0
				BEGIN
					-- SET NEW VERSION INCREMENT
					SET @NewVersion = (SELECT TOP 1 CONVERT(INT, [Version]) + 1 FROM [dbo].[Items6] WHERE [status] = 0 AND [OrigID] = @OrigID ORDER BY [ItemID] DESC)
					-- GET ID OF OPEN RECORD
					SET @CurrentImpID  = (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [status] = 0 AND [OrigID] = @OrigID)
					-- CREATE NEW DRAFT ROW
					INSERT INTO Items6([OrigID],[ParentGroupID],[Name],[LabelName],[FileExtension],[Status],[Version],[TypeOfPublish],[NeedPublish],[NeedPublishToSP],[VersionDate],[VersionedBy],
						[VersionedByID],[CreateBy],[CreateDate],[ModifiedBy],[LastModified],[CreatorID],[ModifierID])
					(SELECT [OrigID],[ParentGroupID],[Name],[LabelName],[FileExtension],2,CONVERT(NVARCHAR(255), @NewVersion) AS [Version],[TypeOfPublish],0,0,@Date,@UserName,@UserID,@UserName,@Date,@UserName,@Date,@UserID,@UserID 
						FROM Items6 
						WHERE [ItemID] = @CurrentImpID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
					-- CREATE TABS FOR NEW RECORD
					DECLARE @NewImpID INT 
					SET @NewImpID = SCOPE_IDENTITY()
					INSERT INTO [dbo].[ItemObj]([ItemID],[ObjID],[ModuleID],[CheckedBy],[CheckedDate],[IsDeleted],[CheckerID],[StepDueDate],[IsNotApplicable],[HasAttachment],[DefID],[ReqID],
						[DueStatus],[IsPending],[PendingDate],[TrigrdPndngAI])
					(SELECT @NewImpID,[ObjID],@ModuleID,'','1900-01-01',[IsDeleted],NULL,NULL,0,[HasAttachment],0,0,NULL,0,NULL,0 
						FROM [dbo].[ItemObj]
						WHERE [ItemID] = @CurrentImpID AND [ModuleID] = @ModuleID AND [IsDeleted] = 0)
					-- SET DUE DATE FOR TABS
					IF @CurrentImpID NOT IN (SELECT [OrigID] FROM [dbo].[DueDate] WHERE [OrigID] = @CurrentImpID AND [ModuleID] = 6)
						BEGIN
							INSERT INTO [dbo].[DueDate]([OrigID],[ModuleID],[IsGroup],[IsItemID],[ObjTypeID],[IsEnabled],[DayInterval],[DueDate],[CreateBy],[CreatorID],[CreateDate],[LastModified],
								[ModifierID],[ModifiedBy],[PopUpType],[IsEsEnabled],[EsDay],[IsPendingEnabled],[IsStepInapplicable])
							(SELECT @CurrentImpID,@ModuleID,[IsGroup],1,[ObjTypeID],[IsEnabled],[DayInterval],[DueDate],[CreateBy],[CreatorID],GETDATE(),GETDATE(),0,NULL,
								[PopUpType],[IsEsEnabled],[EsDay],[IsPendingEnabled],[IsStepInapplicable]
							FROM [dbo].[DueDate]
							WHERE[ModuleID] = @ModuleID AND [OrigID] = @CurrentImpID AND [IsGroup] = 0)
						END
					ELSE
						BEGIN
							UPDATE [dbo].[DueDate]
							SET [DueDate] = DATEADD(DAY, [DayInterval], GETDATE()), [CreateDate] = GETDATE(), [LastModified] = GETDATE(), [CreatorID] = @UserID, [ModifierID] = @UserID, [ModifiedBy] = @UserName
							WHERE [OrigID] = @OrigID AND [ModuleID] = 6 AND [IsGroup] = 0
						END
					--CREATE RECORDS DATA ROWS
					INSERT INTO [dbo].[RecordsData]([FieldID],[ItemID],[ModuleID],[NumData],[TextData],[DateData],[MemoData],[BinaryData],[IsDeleted],[ReqID])
					(SELECT [FieldID],@NewImpID,@ModuleID,[NumData],[TextData],[DateData],[MemoData],[BinaryData],0,0
						FROM [dbo].[RecordsData]
						WHERE [ItemID] = @CurrentImpID AND [ModuleID] = @ModuleID AND [IsDeleted] = 0)
				END
			ELSE
				BEGIN
					-- GET ID OF RECORD
					SET @CurrentImpID  = (SELECT TOP 1 [ItemID] FROM [dbo].[Items6] WHERE [status] = 2 AND [OrigID] = @OrigID)
					-- CONVERT FROM DRAFT TO COMPLETE
					UPDATE [dbo].[Items6]
					SET [Status] = 0, [VersionDate] = @Date, [VersionedBy] = @UserName, [VersionedByID] = @UserID, [ModifiedBy] = @UserName, [LastModified] = @Date
					WHERE [ItemID] = @CurrentImpID
				END
		END
	ELSE IF @ModuleID = 12
		BEGIN
			IF @StatusFrom = 0
				BEGIN
					-- SET NEW VERSION INCREMENT
					SET @NewVersion = (SELECT TOP 1 CONVERT(INT, [Version]) + 1 FROM [dbo].[Items12] WHERE [status] = @StatusFrom AND [OrigID] = @OrigID ORDER BY [ItemID] DESC)
					-- GET ID OF OPEN RECORD
					SET @CurrentTrainID  = (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [status] = @StatusFrom AND [OrigID] = @OrigID)
					-- CREATE NEW DRAFT ROW
					INSERT INTO [dbo].[Items12]([OrigID],[ParentGroupID],[Name],[LabelName],[FileExtension],[Status],[Version],[TypeOfPublish],[NeedPublish],[NeedPublishToSP],[VersionDate],[VersionedBy],
						[VersionedByID],[CreateBy],[CreateDate],[ModifiedBy],[LastModified],[CreatorID],[ModifierID],[UserFullName],[UserID])
					(SELECT [OrigID],[ParentGroupID],[Name],[LabelName],[FileExtension],2,CONVERT(NVARCHAR(255), @NewVersion),[TypeOfPublish],0,0,@Date,@UserName,@UserID,@UserName,@Date,@UserName,@Date,@UserID,@UserID ,@UserName,@UserID
						FROM [dbo].[Items12]
						WHERE [ItemID] = @CurrentTrainID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
					-- CREATE TABS FOR NEW RECORD
					DECLARE @NewTrainID INT
					SET @NewTrainID = SCOPE_IDENTITY()
					INSERT INTO [dbo].[ItemObj]([ItemID],[ObjID],[ModuleID],[CheckedBy],[CheckedDate],[IsDeleted],[CheckerID],[StepDueDate],[IsNotApplicable],[HasAttachment],[DefID],[ReqID],[DueStatus],[IsPending],[PendingDate],[TrigrdPndngAI])
					(SELECT @NewTrainID,[ObjID],@ModuleID,'','1900-01-01',[IsDeleted],NULL,NULL,0,[HasAttachment],[DefID],[ReqID],NULL,0,NULL,0 
						FROM [dbo].[ItemObj]
						WHERE [ItemID] = @CurrentTrainID AND [ModuleID] = @ModuleID AND [IsDeleted] = 0)
					--CREATE RECORDS DATA ROWS
					INSERT INTO [dbo].[RecordsData]([FieldID],[ItemID],[ModuleID],[NumData],[TextData],[DateData],[MemoData],[BinaryData],[IsDeleted],[ReqID])
					(SELECT [FieldID],@NewTrainID,@ModuleID,[NumData],[TextData],[DateData],[MemoData],[BinaryData],0,0
						FROM [dbo].[RecordsData]
						WHERE [ItemID] = @CurrentTrainID AND [ModuleID] = @ModuleID AND [IsDeleted] = 0)
				END
			ELSE
				BEGIN
					-- GET ID OF RECORD
					SET @CurrentTrainID  = (SELECT TOP 1 [ItemID] FROM [dbo].[Items12] WHERE [status] = 2 AND [OrigID] = @OrigID)
					-- CONVERT FROM DRAFT TO COMPLETE
					UPDATE [dbo].[Items12]
					SET [Status] = 0, [VersionDate] = @Date, [VersionedBy] = @UserName, [VersionedByID] = @UserID, [ModifiedBy] = @UserName, [LastModified] = @Date
					WHERE [ItemID] = @CurrentTrainID
				END
		END
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_AvailableOptions]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <January 22, 2021>
-- Description:	<Return List of all permitted status control options for user>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Status_Get_AvailableOptions]
	@ModuleID int,
	@OrigID int,
	@UserID int,
	@CanEdit bit
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @ParentID INT;
	IF @ModuleID = 3
		BEGIN
			SET @ParentID = 42;
		END
	ELSE
		BEGIN
			SET @ParentID = 40;
		END

	DECLARE @RoleTable TABLE ([RoleID] INT);
	DECLARE @CheckTable TABLE ([UserID] INT);
	DECLARE @UserStatus INT, @RoleID INT, @RoleMemberID INT, @RoleMemberType INT, @RoleHasPermission BIT;

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @UserStatus IN (0,1) OR @UserStatus = -1 AND @CanEdit = 1
		BEGIN
			DECLARE role_cursor CURSOR FOR
				SELECT a.[ControlID]
				FROM [dbo].[LevelAccess] AS a
				INNER JOIN [dbo].[LevelSet] AS b ON a.LevelID = b.[LevelID] AND b.[ParentID] = @ParentID
				WHERE a.[ModuleID] = 3 AND a.[GroupID] = 0 AND [LevelValue] = 1
				GROUP BY a.[ControlID];
			OPEN role_cursor;
			FETCH NEXT FROM role_cursor INTO @RoleID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					DECLARE rolemember_cursor CURSOR FOR
						SELECT [ControlID], [ControlType]
						FROM [dbo].[ControlLists]
						WHERE [ModuleID] = 3 AND [ListClass] = 5 AND [IsGroup] = 0 AND [OrigID] = @OrigID AND [CatID] = @RoleID;
					OPEN rolemember_cursor
					FETCH NEXT FROM rolemember_cursor INTO @RoleMemberID, @RoleMemberType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							IF @RoleMemberType = 1
								BEGIN
									INSERT INTO @RoleTable
									SELECT @RoleID
								END
							ELSE
								BEGIN
									WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups1]
										WHERE ([ParentGroupID] = @RoleMemberID OR [GroupID] = @RoleMemberID) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> ''
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups1] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										WHERE a.[IsDeleted] = 0 AND ISNULL(a.[Name], '') <> ''
									)
									INSERT INTO @CheckTable
									SELECT [ControlID] FROM [dbo].[ControlLists] WHERE [ModuleID] = 1 AND [OrigID] IN (SELECT * FROM cte) AND [ControlID] = @UserID
						
									IF (SELECT COUNT(*) FROM @CheckTable) > 0
										BEGIN
											INSERT INTO @RoleTable
											SELECT @RoleID;
										END
									DELETE FROM @CheckTable;
								END					
							FETCH NEXT FROM rolemember_cursor INTO @RoleMemberID, @RoleMemberType;
						END
					CLOSE rolemember_cursor;
					DEALLOCATE rolemember_cursor;
					FETCH NEXT FROM role_cursor INTO @RoleID;
				END
			CLOSE role_cursor;
			DEALLOCATE role_cursor;

			SELECT a.[LevelID], b.[LevelCaption]
			FROM [dbo].[LevelAccess] AS a
			INNER JOIN [dbo].[LevelSet] AS b ON a.[LevelID] = b.[LevelID] AND b.[ParentID] = @ParentID
			WHERE a.[ControlID] IN (SELECT * FROM @RoleTable) AND a.[LevelValue] = 1 AND a.[ModuleID] = 3
			GROUP BY a.[LevelID], b.[LevelCaption]
			ORDER BY a.[LevelID];
		END
	ELSE
		BEGIN
			SELECT [LevelID], [LevelCaption]
			FROM [dbo].[LevelSet]
			WHERE [ModuleID] = 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_ControlType]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <March 12, 2019>
-- Description:	<Get Group Status Control Type>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Status_Get_ControlType] 
(
	@ModuleID int,
	@OrigID int
)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @GroupID INT
	SET @GroupID = (SELECT TOP 1 [ParentGroupID] FROM [dbo].[Items3] WHERE [OrigID] = @OrigID);

	SELECT CASE 
		WHEN [OptionSet] LIKE '%1_3%' THEN 1
		ELSE 0
		END AS [IsSimpleControl]
	FROM [dbo].[Groups3]
	WHERE [GroupID] = @GroupID AND [IsDeleted] = 0

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_CurrentItemID]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <12/22/2017>
-- Description:	<Returns ItemID of CURRENT Version>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Status_Get_CurrentItemID]
	@OrigID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT ItemID
	FROM Items3
	WHERE OrigID = @OrigID AND Status = 9 AND IsDeleted = 0 AND IsWithdrawn = 0
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Get_CurrentVersionStatus]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <11/20/2017>
-- Description:	<Return version of latest available item>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Status_Get_CurrentVersionStatus]
	@ModuleID INT,
	@OrigID INT
AS
BEGIN
	SET NOCOUNT ON;
	IF @ModuleID = 3
		BEGIN
			SELECT TOP 1 [ItemID], [Status], [Version]
			FROM Items3
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			ORDER BY [ItemID] DESC
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SELECT TOP 1 [ItemID], [Status], [Version]
			FROM Items4
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			ORDER BY [ItemID] DESC
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SELECT TOP 1 [ItemID], [Status], [Version]
			FROM Items6
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			ORDER BY [ItemID] DESC
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SELECT TOP 1 [ItemID], [Status], [Version]
			FROM Items12
			WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
			ORDER BY [ItemID] DESC
		END
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Status_Has_Current]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <Dec 22, 2017>
-- Description:	<Checks if CURRENT version of document exists>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Status_Has_Current]
(
	@OrigID INT
)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT TOP 1
		CASE WHEN EXISTS (SELECT [Status] FROM [dbo].[Items3] WHERE [Status] = 9 AND [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0)
			THEN 'TRUE' 
			ELSE 'FALSE'
		END AS [HasCurrent]  
	FROM [dbo].[Items3]
	WHERE [OrigID] = @OrigID AND [IsDeleted] = 0 AND [IsWithdrawn] = 0
END

GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Add_AssessmentAnswer]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Dec 21, 2018>
-- Description:	<Add individual answers from assessment>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Add_AssessmentAnswer]
(
	@AttemptID int,
	@QuesID int,
	@QuesText nvarchar(255),
	@AnsText nvarchar(255),
	@AnsIsCorrect bit,
	@Time float
)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO [dbo].[QuesAttemptAnswers]
		([AttemptID], [QuesID], [QuesText], [AnsText], [AnsIsCorrect], [ReAns], [AnsStartTime], [AnsFinishTime]) 
	VALUES
		(@AttemptID, @QuesID, @QuesText, @AnsText, @AnsIsCorrect, 0, @Time, @Time)

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Add_AssessmentResult]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Dec 21, 2018>
-- Description:	<Add Assessment Record to Database>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Add_AssessmentResult] 
(
	@UserID int,
	@ItemID int,
	@ReqID int,
	@QuesSetID int,
	@TotalQuestions int,
	@TotalToPass int,
	@TotalCorrect int,
	@ResultID int,
	@Time float
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @AttemptNo INT
	SET @AttemptNo = (SELECT [AttemptNo] FROM [dbo].[QuesAttemptDetails] WHERE [ItemID] = @ItemID AND [ReqID] = @ReqID AND [QuesSetID] = @QuesSetID)

    INSERT INTO [dbo].[QuesAttemptDetails]([UserID], [ModuleID], [ItemID], [ReqID], [QuesSetID], [AttemptNo], [OfrdNoOfQues], [NoOfQuesToPass], [TtlQuesAnswrd], [NoOfCrctAnswer],
		[AttemptStatus], [ResultID], [AllowReattempt], [AnsStartTime], [AnsFinishTime])
	OUTPUT INSERTED.[AttemptID]
	VALUES(@UserID, 12, @ItemID, @ReqID, @QuesSetID,
		CASE
			WHEN @AttemptNo > 0
			THEN @AttemptNo + 1
			ELSE 1
		END,
		@TotalQuestions, @TotalToPass, @TotalQuestions, @TotalCorrect,
		1, @ResultID, 0, @Time, @Time)
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_Assessment]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <June 21, 2018>
-- Description:	<Return all Assessment Questions and answers>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Get_Assessment] 
(
	@QuesSetID int,
	@OfrdNoOfQues int
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP (@OfrdNoOfQues) a.[QuesSetName], a.[TotalNoOfQues], a.[ExamTimeInMin], a.[OfrdNoOfQues], b.[QuesID], b.[AnswerType], b.[QuesText], b.[QuesDscrptn], b.[CrctAnswrs], a.[NoOfQuesToPass]
	FROM [dbo].[QuesSet] AS a
	INNER JOIN [dbo].[QuesDtls] AS b ON a.[QuesSetID] = b.[QuesSetID]
	WHERE a.[QuesSetID] = @QuesSetID
	ORDER BY NewID()

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_AssessmentResult]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Dec 21, 2018>
-- Description:	<Return Assessment Attempt Results for Summary>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Get_AssessmentResult] 
(
	@AttemptID int
)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM [dbo].[QuesAttemptDetails]
	WHERE [AttemptID] = @AttemptID

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_OfrdNoOfQues]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <June 28, 2018>
-- Description:	<Retrieve number of offered questions for a training assessment>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Get_OfrdNoOfQues] 
(
	@QuesSetID int
)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [OfrdNoOfQues]
	FROM [dbo].[QuesSet]
	WHERE [QuesSetID] = @QuesSetID

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_QuesSetID]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <June 21, 2018>
-- Description:	<Return the Question Set ID for a Requirement>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Get_QuesSetID]
	-- Add the parameters for the stored procedure here
	@ReqID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [QuesSetID]
	FROM [dbo].[DefReq]
	WHERE MyID = @ReqID
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_QuesText]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Dec 21, 2018>
-- Description:	<Return Assessment Question Text>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Get_QuesText] 
(
	@QuesID int
)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [QuesText]
	FROM [dbo].[QuesDtls]
	WHERE [QuesID] = @QuesID
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Get_Question_Possible_Answers]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <June 25, 2018>
-- Description:	<Return all possible answers for a question>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Get_Question_Possible_Answers] 
	-- Add the parameters for the stored procedure here
	@QuesID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AnsIndex], [AnsText]
	FROM [dbo].[QuesPsbleAnswrs]
	WHERE [QuesID] = @QuesID
	ORDER BY [AnsIndex]
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Has_Assessment]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <June 19, 2018>
-- Description:	<Check if Requirement has an assessment attached>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Has_Assessment]
	-- Add the parameters for the stored procedure here
	@ReqID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [QuesSetID]
	FROM [dbo].[DefReq]
	WHERE [MyID] = @ReqID
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Training_Passed_Assessment]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Reyno, Chris>
-- Create date: <June 19, 2018>
-- Description:	<Check if an assessment has been passed>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Training_Passed_Assessment] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@ItemID int,
	@ReqID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 [ResultID]
	FROM [dbo].[QuesAttemptDetails]
	WHERE [UserID] = @UserID AND [ReqID] = @ReqID AND [ItemID] = @ItemID
	ORDER BY [AnsFinishTime] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_AllGroups]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Modified date: <March 2, 2021>
-- Description:	<Retrieve Groups TreeView>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_AllGroups]
(
	@ModuleID int,
	@GroupID int,
	@UserID int
)
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @TModuleID INT, @TGroupID INT, @TUserID INT, @UserStatus INT, @LevelID INT;
	SET @TModuleID = @ModuleID;
	SET @TGroupID = @GroupID;
	SET @TUserID = @UserID;
	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @TUserID AND [IsDeleted] = 0);

	DECLARE @TempTable TABLE
	(
		[GroupID] INT NOT NULL PRIMARY KEY,
		[ParentGroupID] INT,
		[Name] NVARCHAR(500),
		[ControlType] INT,
		[ObjTypeID] INT,
		[childnodecount] INT
	);

	DECLARE @CursorGroupID INT, @CursorParentGroupID INT, @CursorName NVARCHAR(500), @CursorControlType INT, @CursorObjTypeID INT, @CursorChildNodeCount INT, 
		@EntityID INT, @IsPermitted BIT;
	
		IF @TModuleID = 3
		BEGIN
			SET @LevelID = 3001;
			INSERT INTO @TempTable
			SELECT [GroupId], [ParentGroupID], [Name], 0 AS [ControlType], [ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups3] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups3] AS sc
			WHERE [GroupID] = @TGroupID AND ISNULL([Name], '') <> '';

			IF @UserStatus = 1
				BEGIN		
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups3] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups3] AS sc
					WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
			ELSE IF @UserStatus IN (-1, 0)
				BEGIN
					DECLARE folder_cursor CURSOR FOR
						SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
							(SELECT [GroupID] FROM [dbo].[Groups3] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
							THEN 1
							ELSE 0
							END AS [childnodecount]
						FROM [dbo].[Groups3] AS sc
						WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
					OPEN folder_cursor
					FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @IsPermitted = 0;
							
							IF @CursorControlType = 0
								BEGIN
									SET @IsPermitted = 1
								END
							ELSE
								BEGIN
									IF @UserID IN (SELECT [ControlID] FROM [dbo].[LevelAccess] WHERE [ModuleID] = @ModuleID AND [GroupID] = @CursorGroupID AND [ControlType] = 1)
										BEGIN
											SET @IsPermitted = 1
										END
									ELSE
										BEGIN
											DECLARE security_cursor CURSOR FOR
												SELECT [OrigID]
												FROM [dbo].[ControlLists]
												WHERE [ModuleID] = 1 AND [ControlID] = @TUserID AND [ControlType] = 1;
											OPEN security_cursor
											FETCH NEXT FROM security_cursor INTO @EntityID
											WHILE @@FETCH_STATUS = 0
												BEGIN
													IF @EntityID IN (SELECT [GroupID] FROM [dbo].[v4_SecurityCheck](@TModuleID,@CursorGroupID,@LevelID))
														BEGIN
															SET @IsPermitted = 1;
														END
													FETCH NEXT FROM security_cursor INTO @EntityID;
												END
											CLOSE security_cursor;
											DEALLOCATE security_cursor;
										END									
								END
							IF @IsPermitted = 1
								BEGIN
									INSERT INTO @TempTable
									SELECT @CursorGroupID,@CursorParentGroupID,@CursorName,0,@CursorObjTypeID,@CursorChildNodeCount;
								END
							FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
						END
					CLOSE folder_cursor;
					DEALLOCATE folder_cursor;
				END
			ELSE
				BEGIN
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups3] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') 
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups3] AS sc
					WHERE [ControlType] = 0 AND [ParentGroupID] = @TGroupID AND [GroupID] NOT IN (15,50) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
		END
	IF @TModuleID = 4
		BEGIN
			SET @LevelID = 4001;
			INSERT INTO @TempTable
			SELECT [GroupId], [ParentGroupID], [Name], 0 AS [ControlType], [ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups4] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups4] AS sc
			WHERE [GroupID] = @TGroupID AND ISNULL([Name], '') <> '';

			IF @UserStatus = 1
				BEGIN		
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups4] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups4] AS sc
					WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
			ELSE IF @UserStatus IN (-1, 0)
				BEGIN
					DECLARE folder_cursor CURSOR FOR
						SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
							(SELECT [GroupID] FROM [dbo].[Groups4] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
							THEN 1
							ELSE 0
							END AS [childnodecount]
						FROM [dbo].[Groups4] AS sc
						WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
					OPEN folder_cursor
					FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @IsPermitted = 0;
							
							IF @CursorControlType = 0
								BEGIN
									SET @IsPermitted = 1
								END
							ELSE
								BEGIN
									IF @UserID IN (SELECT [ControlID] FROM [dbo].[LevelAccess] WHERE [ModuleID] = @ModuleID AND [GroupID] = @CursorGroupID AND [ControlType] = 1)
										BEGIN
											SET @IsPermitted = 1
										END
									ELSE
										BEGIN
											DECLARE security_cursor CURSOR FOR
												SELECT [OrigID]
												FROM [dbo].[ControlLists]
												WHERE [ModuleID] = 1 AND [ControlID] = @TUserID AND [ControlType] = 1;
											OPEN security_cursor
											FETCH NEXT FROM security_cursor INTO @EntityID
											WHILE @@FETCH_STATUS = 0
												BEGIN
													IF @EntityID IN (SELECT [GroupID] FROM [dbo].[v4_SecurityCheck](@TModuleID,@CursorGroupID,@LevelID))
														BEGIN
															SET @IsPermitted = 1;
														END
													FETCH NEXT FROM security_cursor INTO @EntityID;
												END
											CLOSE security_cursor;
											DEALLOCATE security_cursor;
										END									
								END
							IF @IsPermitted = 1
								BEGIN
									INSERT INTO @TempTable
									SELECT @CursorGroupID,@CursorParentGroupID,@CursorName,0,@CursorObjTypeID,@CursorChildNodeCount;
								END
							FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
						END
					CLOSE folder_cursor;
					DEALLOCATE folder_cursor;
				END
			ELSE
				BEGIN
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups4] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') 
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups4] AS sc
					WHERE [ControlType] = 0 AND [ParentGroupID] = @TGroupID AND [GroupID] NOT IN (15,50) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
		END
	IF @TModuleID = 6
		BEGIN
			SET @LevelID = 6001;
			INSERT INTO @TempTable
			SELECT [GroupId], [ParentGroupID], [Name], 0 AS [ControlType], [ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups6] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups6] AS sc
			WHERE [GroupID] = @TGroupID AND ISNULL([Name], '') <> '';

			IF @UserStatus = 1
				BEGIN		
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups6] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups6] AS sc
					WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
			ELSE IF @UserStatus IN (-1, 0)
				BEGIN
					DECLARE folder_cursor CURSOR FOR
						SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
							(SELECT [GroupID] FROM [dbo].[Groups6] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
							THEN 1
							ELSE 0
							END AS [childnodecount]
						FROM [dbo].[Groups6] AS sc
						WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
					OPEN folder_cursor
					FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @IsPermitted = 0;
							
							IF @CursorControlType = 0
								BEGIN
									SET @IsPermitted = 1
								END
							ELSE
								BEGIN
									IF @UserID IN (SELECT [ControlID] FROM [dbo].[LevelAccess] WHERE [ModuleID] = @ModuleID AND [GroupID] = @CursorGroupID AND [ControlType] = 1)
										BEGIN
											SET @IsPermitted = 1
										END
									ELSE
										BEGIN
											DECLARE security_cursor CURSOR FOR
												SELECT [OrigID]
												FROM [dbo].[ControlLists]
												WHERE [ModuleID] = 1 AND [ControlID] = @TUserID AND [ControlType] = 1;
											OPEN security_cursor
											FETCH NEXT FROM security_cursor INTO @EntityID
											WHILE @@FETCH_STATUS = 0
												BEGIN
													IF @EntityID IN (SELECT [GroupID] FROM [dbo].[v4_SecurityCheck](@TModuleID,@CursorGroupID,@LevelID))
														BEGIN
															SET @IsPermitted = 1;
														END
													FETCH NEXT FROM security_cursor INTO @EntityID;
												END
											CLOSE security_cursor;
											DEALLOCATE security_cursor;
										END									
								END
							IF @IsPermitted = 1
								BEGIN
									INSERT INTO @TempTable
									SELECT @CursorGroupID,@CursorParentGroupID,@CursorName,0,@CursorObjTypeID,@CursorChildNodeCount;
								END
							FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
						END
					CLOSE folder_cursor;
					DEALLOCATE folder_cursor;
				END
			ELSE
				BEGIN
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups6] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') 
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups6] AS sc
					WHERE [ControlType] = 0 AND [ParentGroupID] = @TGroupID AND [GroupID] NOT IN (15,50) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
		END
	IF @TModuleID = 12
		BEGIN
			SET @LevelID = 12001;
			INSERT INTO @TempTable
			SELECT [GroupId], [ParentGroupID], [Name], 0 AS [ControlType], [ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups12] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups12] AS sc
			WHERE [GroupID] = @TGroupID AND ISNULL([Name], '') <> '';

			IF @UserStatus = 1
				BEGIN		
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups12] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups12] AS sc
					WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
			ELSE IF @UserStatus IN (-1, 0)
				BEGIN
					DECLARE folder_cursor CURSOR FOR
						SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
							(SELECT [GroupID] FROM [dbo].[Groups12] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
							THEN 1
							ELSE 0
							END AS [childnodecount]
						FROM [dbo].[Groups12] AS sc
						WHERE [ParentGroupID] = @TGroupID AND [GroupID] <> 15 AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
					OPEN folder_cursor
					FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @IsPermitted = 0;
							
							IF @CursorControlType = 0
								BEGIN
									SET @IsPermitted = 1
								END
							ELSE
								BEGIN
									IF @UserID IN (SELECT [ControlID] FROM [dbo].[LevelAccess] WHERE [ModuleID] = @ModuleID AND [GroupID] = @CursorGroupID AND [ControlType] = 1)
										BEGIN
											SET @IsPermitted = 1
										END
									ELSE
										BEGIN
											DECLARE security_cursor CURSOR FOR
												SELECT [OrigID]
												FROM [dbo].[ControlLists]
												WHERE [ModuleID] = 1 AND [ControlID] = @TUserID AND [ControlType] = 1;
											OPEN security_cursor
											FETCH NEXT FROM security_cursor INTO @EntityID
											WHILE @@FETCH_STATUS = 0
												BEGIN
													IF @EntityID IN (SELECT [GroupID] FROM [dbo].[v4_SecurityCheck](@TModuleID,@CursorGroupID,@LevelID))
														BEGIN
															SET @IsPermitted = 1;
														END
													FETCH NEXT FROM security_cursor INTO @EntityID;
												END
											CLOSE security_cursor;
											DEALLOCATE security_cursor;
										END									
								END
							IF @IsPermitted = 1
								BEGIN
									INSERT INTO @TempTable
									SELECT @CursorGroupID,@CursorParentGroupID,@CursorName,0,@CursorObjTypeID,@CursorChildNodeCount;
								END
							FETCH NEXT FROM folder_cursor INTO @CursorGroupID, @CursorParentGroupID, @CursorName, @CursorControlType, @CursorObjTypeID, @CursorChildNodeCount;
						END
					CLOSE folder_cursor;
					DEALLOCATE folder_cursor;
				END
			ELSE
				BEGIN
					INSERT INTO @TempTable
					SELECT [GroupId], [ParentGroupID], [Name], [ControlType], [ObjTypeID], CASE WHEN EXISTS
						(SELECT [GroupID] FROM [dbo].[Groups12] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') 
						THEN 1
						ELSE 0
						END AS [childnodecount]
					FROM [dbo].[Groups12] AS sc
					WHERE [ControlType] = 0 AND [ParentGroupID] = @TGroupID AND [GroupID] NOT IN (15,50) AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '';
				END
		END
	IF @TModuleID = 14
		BEGIN			
			INSERT INTO @TempTable
			SELECT [GroupId], [ParentGroupID], [Name], 0, [ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups14] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '')
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups14] AS sc
			WHERE [GroupID] = @TGroupID AND ISNULL([Name], '') <> '';

			INSERT INTO @TempTable
			SELECT [GroupId], [ParentGroupID], [Name], 0, [ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups14] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') 
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups14] sc
			WHERE [IsDeleted] = 0 AND [ParentGroupID] = @TGroupID AND ISNULL([Name], '') <> '';
		END	
	IF @TModuleID = 1
		BEGIN
			INSERT INTO @TempTable
			SELECT sc.[GroupId], sc.[ParentGroupID], sc.[Name], sc.[ControlType],sc.[ObjTypeID], CASE WHEN EXISTS
				(SELECT [GroupID] FROM [dbo].[Groups1] WHERE [ParentGroupID] = sc.[GroupID] AND [IsDeleted] = 0 AND ISNULL([Name], '') <> '') 
				THEN 1
				ELSE 0
				END AS [childnodecount]
			FROM [dbo].[Groups1] AS sc
			WHERE (sc.[ParentGroupID] = @TGroupID OR sc.[GroupID] = @TGroupID) AND sc.[IsDeleted] = 0 AND ISNULL(sc.[Name], '') <> '';
		END

	IF @TModuleID IN (1,14)
		BEGIN
			IF (@TModuleID = 1)
				BEGIN
					IF (@GroupID = 1)
						BEGIN
							SELECT * 
							FROM @TempTable
							ORDER BY [GroupID];
						END
					ELSE
						BEGIN
							SELECT * 
							FROM @TempTable
							ORDER BY [Name];
						END
				END
			ELSE
				BEGIN
					SELECT * 
					FROM @TempTable
					ORDER BY [GroupID];
				END			
		END
	ELSE
		BEGIN
			SELECT * 
			FROM @TempTable
			ORDER BY [Name];
		END	
END
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_DirectLinks]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <Nov 28, 2018>
-- Description:	<Retrieve Direct Links>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_DirectLinks]
(
	@SiteID NVARCHAR(500)
)
AS

BEGIN 
	SET NOCOUNT ON;

	DECLARE @Value NVARCHAR(500);
	DECLARE @TempTable TABLE
	(
		[ModuleID] INT,
		[GroupID] INT,
		[Name] NVARCHAR(500),
		[SiteID] NVARCHAR(500)
	)

	DECLARE string_cursor CURSOR FOR
		SELECT [Name]
		FROM dbo.v4_SplitString(@SiteID)

	OPEN string_cursor;
	FETCH NEXT FROM string_cursor INTO @Value;
	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO @TempTable
			SELECT a.[ModuleID], a.[GroupID],
				CASE a.[ModuleID]
					WHEN 3 THEN b.[Name]
					WHEN 4 THEN c.[Name]
					WHEN 6 THEN d.[Name]
					ELSE e.[Name]
				END AS [Name], [PrfrdFolderName] AS [SiteID]
			FROM [dbo].[WebEnabledFolders] AS a
			LEFT JOIN [dbo].[Groups3] AS b ON a.[GroupID] = b.[GroupID]
			LEFT JOIN [dbo].[Groups4] AS c ON a.[GroupID] = c.[GroupID]
			LEFT JOIN [dbo].[Groups6] AS d ON a.[GroupID] = d.[GroupID]
			LEFT JOIN [dbo].[Groups12] AS e ON a.[GroupID] = e.[GroupID]
			WHERE a.[PrfrdFolderName] LIKE '%' + @Value + '%';
			FETCH NEXT FROM string_cursor INTO @Value;
		END
	CLOSE string_cursor;
	DEALLOCATE string_cursor;

	INSERT INTO @TempTable
	SELECT a.[ModuleID], a.[GroupID],
		CASE a.[ModuleID]
			WHEN 3 THEN b.[Name]
			WHEN 4 THEN c.[Name]
			WHEN 6 THEN d.[Name]
			ELSE e.[Name]
		END AS [Name], [PrfrdFolderName] AS [SiteID]
	FROM [dbo].[WebEnabledFolders] AS a
	LEFT JOIN [dbo].[Groups3] AS b ON a.[GroupID] = b.[GroupID]
	LEFT JOIN [dbo].[Groups4] AS c ON a.[GroupID] = c.[GroupID]
	LEFT JOIN [dbo].[Groups6] AS d ON a.[GroupID] = d.[GroupID]
	LEFT JOIN [dbo].[Groups12] AS e ON a.[GroupID] = e.[GroupID]
	WHERE ISNULL(a.[PrfrdFolderName], '') = '';
	
	SELECT * FROM @TempTable
	GROUP BY [ModuleID],[GroupID],[Name],[SiteID]
	ORDER BY [Name]; 
END

GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_GroupName]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/20/2017>
-- Modified date: <July 31, 2020>
-- Description:	<Retrieve Group Folder Name>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_GroupName]
(
	@ModuleID int,
	@GroupID int
)
AS

BEGIN

	SET NOCOUNT ON;

	SELECT CASE @ModuleID
		WHEN 1 THEN (SELECT [Name] FROM [dbo].[Groups1] where [GroupID] = @GroupID)
		WHEN 3 THEN (SELECT [Name] FROM [dbo].[Groups3] where [GroupID] = @GroupID)
		WHEN 4 THEN (SELECT [Name] FROM [dbo].[Groups4] where [GroupID] = @GroupID)
		WHEN 6 THEN (SELECT [Name] FROM [dbo].[Groups6] where [GroupID] = @GroupID)
		WHEN 12 THEN (SELECT [Name] FROM [dbo].[Groups12] where [GroupID] = @GroupID)
		ELSE (SELECT [Name] FROM [dbo].[Groups14] where [GroupID] = @GroupID)
		END AS [Name];

END


GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_GroupOptionSet]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Option Set Value for a Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_GroupOptionSet]
(
	@ModuleID int,
	@GroupID int
)

AS

BEGIN

	SET NOCOUNT ON;

	SELECT CASE @ModuleID
		WHEN 1 THEN (SELECT [OptionSet] FROM [dbo].[Groups1] where [GroupID] = @GroupID)
		WHEN 3 THEN (SELECT [OptionSet] FROM [dbo].[Groups3] where [GroupID] = @GroupID)
		WHEN 4 THEN (SELECT [OptionSet] FROM [dbo].[Groups4] where [GroupID] = @GroupID)
		WHEN 6 THEN (SELECT [OptionSet] FROM [dbo].[Groups6] where [GroupID] = @GroupID)
		WHEN 12 THEN (SELECT [OptionSet] FROM [dbo].[Groups12] where [GroupID] = @GroupID)
		ELSE ''
		END AS [OptionSet];

END


GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_GroupPermitted]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Security Role Members for Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_GroupPermitted]
(
	@GroupID INT,
	@ModuleID INT
)
AS

UPDATE Items1
SET ControlType = 0
WHERE ControlType IS NULL

DECLARE @ControlID INT
DECLARE @ControlType INT

DECLARE Permitted_Cursor CURSOR READ_ONLY FOR
	SELECT DISTINCT [ControlID], [ControlType]
	FROM [dbo].[LevelAccess]
	WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] = 30

CREATE TABLE #TempTable
(
	ControlID INT,
	ControlFullName NVARCHAR(255),
	ControlType INT
)

OPEN Permitted_Cursor
FETCH NEXT FROM Permitted_Cursor
INTO @ControlID, @ControlType

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @ControlType = 1
		INSERT INTO #TempTable
		SELECT [UserID], [FullName], [ControlType]
		FROM [dbo].[Items1]
		WHERE [UserID] = @ControlID
	ELSE IF @ControlType = 6
		INSERT INTO #TempTable
		SELECT [GroupID] AS [ControlID], [Name] AS [ControlFullName], [ObjTypeID] AS ControlType
		FROM [dbo].[Groups1]
		WHERE [GroupID] = @ControlID
	FETCH NEXT FROM Permitted_Cursor
	INTO @ControlID, @ControlType
END

CLOSE Permitted_Cursor
DEALLOCATE Permitted_Cursor

SELECT * FROM #TempTable
DROP TABLE #TempTable


GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_PermittedPositions]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/4/2017>
-- Description:	<Retrieve Permitted Users for Selected Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_PermittedPositions]
(
@ParentGroupID int
)
AS

BEGIN
	WITH Positions (GroupID, ParentGroupID, [Name]) AS
	(
		SELECT parentGroups.GroupID, parentGroups.ParentGroupID, parentGroups.[Name]
		FROM Groups1 parentGroups
		WHERE ParentGroupID = @ParentGroupID AND ObjTypeID = 6 AND IsDeleted = 0
		UNION ALL
		SELECT childGroups.GroupID, childGroups.ParentGroupID, childGroups.[Name]
		FROM Groups1 childGroups
		JOIN Positions ON childGroups.ParentGroupID = positions.GroupID
	)
	SELECT GroupID AS ControlID, Name AS ControlFullname
	FROM Positions
	ORDER BY ControlID
END


GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_PermittedUsers]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <5/3/2017>
-- Description:	<Retrieve Permitted Users for Selected Group>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_PermittedUsers]
(
	@ParentGroupID int
)
AS

BEGIN
	SELECT ControlID, ControlFullName
	FROM ControlLists
	WHERE ModuleID = 1 AND OrigID = @ParentGroupID AND IsGroup = 1
END


GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Get_UsersForNode]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Get_UsersForNode]
	@NodeID INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [UserID] AS [ControlID],[FullName] AS [ControlFullName],1 AS [ControlType]
	FROM [dbo].[Items1]
	WHERE [ParentGroupID] = @NodeID AND ([IsDeleted] = 0 OR [Status] <> 9);
END
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_Delete_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 9, 2020>
-- Description:	<Check that user has move permission for selected folder>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Has_Delete_Permission]
	@ModuleID int,
	@GroupID int,
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelIDItem INT, @LevelIDFolder INT, @UserStatus INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @ModuleID = 3
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 3005;
			SET @LevelIDFolder = 3006;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 4005;
			SET @LevelIDFolder = 4006;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 6005;
			SET @LevelIDFolder = 6006;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups12] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 12005;
			SET @LevelIDFolder = 12006;
		END

	IF (@ModuleID = 1 AND @UserStatus = 1)
		BEGIN
			INSERT INTO @TempTable
			SELECT @UserID AS [ID];
		END
	ELSE
		BEGIN
			IF @UserStatus IN (0,1)
				BEGIN
					DECLARE assigned_cursor CURSOR FOR
						SELECT [ControlID], [ControlType]
						FROM [dbo].[LevelAccess] 
						WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] IN (@LevelIDItem, @LevelIDFolder) AND [LevelValue] = 1 AND [IsDeleted] = 0; -- Add Item
					OPEN assigned_cursor;
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							IF @ControlType = 1 -- User
								BEGIN
									IF @UserID = @ControlID
										BEGIN
											INSERT INTO @TempTable
											SELECT @UserID;
										END
								END
							ELSE IF @ControlType = 6 -- Entity
								BEGIN					
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups1]
										WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups1] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
									)
									INSERT INTO @TempTable
									SELECT [ID]
									FROM [dbo].[ControlLists]
									WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte)
								END
							FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
						END
					CLOSE assigned_cursor;
					DEALLOCATE assigned_cursor;
				END
		END

	SELECT [ID] 
	FROM @TempTable;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_Move_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 9, 2020>
-- Description:	<Check that user has move permission for selected folder>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Has_Move_Permission]
	@ModuleID int,
	@GroupID int,
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelIDItem INT, @LevelIDFolder INT, @UserStatus INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @ModuleID = 3
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 3009;
			SET @LevelIDFolder = 3010;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 4009;
			SET @LevelIDFolder = 4010;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 6009;
			SET @LevelIDFolder = 6010;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups12] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 12009;
			SET @LevelIDFolder = 12010;
		END

	IF (@ModuleID = 1 AND @UserStatus = 1)
		BEGIN
			INSERT INTO @TempTable
			SELECT @UserID AS [ID];
		END
	ELSE
		BEGIN
			IF @UserStatus IN (0,1)
				BEGIN
					DECLARE assigned_cursor CURSOR FOR
						SELECT [ControlID], [ControlType]
						FROM [dbo].[LevelAccess] 
						WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] IN (@LevelIDItem, @LevelIDFolder) AND [LevelValue] = 1 AND [IsDeleted] = 0; -- Add Item
					OPEN assigned_cursor;
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							IF @ControlType = 1 -- User
								BEGIN
									IF @UserID = @ControlID
										BEGIN
											INSERT INTO @TempTable
											SELECT @UserID;
										END
								END
							ELSE IF @ControlType = 6 -- Entity
								BEGIN					
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups1]
										WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups1] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
									)
									INSERT INTO @TempTable
									SELECT [ID]
									FROM [dbo].[ControlLists]
									WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte)
								END
							FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
						END
					CLOSE assigned_cursor;
					DEALLOCATE assigned_cursor;
				END
		END

	SELECT [ID] 
	FROM @TempTable;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_Rename_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <October 7, 2020>
-- Description:	<Check that user has rename permission for selected folder>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Has_Rename_Permission]
	@ModuleID int,
	@GroupID int,
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelIDItem INT, @LevelIDFolder INT, @UserStatus INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @ModuleID = 3
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups3] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 3007;
			SET @LevelIDFolder = 3008;
		END
	ELSE IF @ModuleID = 4
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups4] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 4007;
			SET @LevelIDFolder = 4008;
		END
	ELSE IF @ModuleID = 6
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups6] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 6007;
			SET @LevelIDFolder = 6008;
		END
	ELSE IF @ModuleID = 12
		BEGIN
			SET @ControlType = (SELECT [ControlType] FROM [dbo].[Groups12] WHERE [GroupID] = @GroupID);
			SET @LevelIDItem = 12007;
			SET @LevelIDFolder = 12008;
		END

	IF (@ModuleID = 1 AND @UserStatus = 1)
		BEGIN
			INSERT INTO @TempTable
			SELECT @UserID AS [ID];
		END
	ELSE
		BEGIN
			IF @UserStatus IN (0,1)
				BEGIN
					DECLARE assigned_cursor CURSOR FOR
						SELECT [ControlID], [ControlType]
						FROM [dbo].[LevelAccess] 
						WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] IN (@LevelIDItem, @LevelIDFolder) AND [LevelValue] = 1 AND [IsDeleted] = 0; -- Add Item
					OPEN assigned_cursor;
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							IF @ControlType = 1 -- User
								BEGIN
									IF @UserID = @ControlID
										BEGIN
											INSERT INTO @TempTable
											SELECT @UserID;
										END
								END
							ELSE IF @ControlType = 6 -- Entity
								BEGIN					
									;WITH cte AS
									(
										SELECT [GroupID]
										FROM [dbo].[Groups1]
										WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
										UNION ALL
										SELECT a.[GroupID]
										FROM [dbo].[Groups1] AS a
										INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
										WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
									)
									INSERT INTO @TempTable
									SELECT [ID]
									FROM [dbo].[ControlLists]
									WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte)
								END
							FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
						END
					CLOSE assigned_cursor;
					DEALLOCATE assigned_cursor;
				END
		END
		
	SELECT [ID] 
	FROM @TempTable;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_TreeView_Has_SetRepublish_Permission]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 28, 2021>
-- Description:	<Check that user has 'set republish' permission for selected folder>
-- =============================================
CREATE PROCEDURE [dbo].[v4_TreeView_Has_SetRepublish_Permission]
	@ModuleID int,
	@GroupID int,
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @ControlID INT, @ControlType INT, @GroupControlType INT, @LevelID INT, @UserStatus INT;
	DECLARE @TempTable AS TABLE([ID] INT);

	SET @LevelID = 3045;
	SET @UserStatus = (SELECT [Status] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @UserStatus IN (0,1)
		BEGIN
			DECLARE assigned_cursor CURSOR FOR
				SELECT [ControlID], [ControlType]
				FROM [dbo].[LevelAccess] 
				WHERE [ModuleID] = @ModuleID AND [GroupID] = @GroupID AND [LevelID] = @LevelID AND [LevelValue] = 1 AND [IsDeleted] = 0;
			OPEN assigned_cursor;
			FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					IF @ControlType = 1 -- User
						BEGIN
							IF @UserID = @ControlID
								BEGIN
									INSERT INTO @TempTable
									SELECT @UserID;
								END
						END
					ELSE IF @ControlType = 6 -- Entity
						BEGIN					
							;WITH cte AS
							(
								SELECT [GroupID]
								FROM [dbo].[Groups1]
								WHERE [ParentGroupID] = @ControlID OR [GroupID] = @ControlID AND [IsDeleted] = 0 AND [Name] IS NOT NULL
								UNION ALL
								SELECT a.[GroupID]
								FROM [dbo].[Groups1] AS a
								INNER JOIN cte AS b ON a.[ParentGroupID] = b.[GroupID]
								WHERE a.[IsDeleted] = 0 AND a.[Name] IS NOT NULL
							)
							INSERT INTO @TempTable
							SELECT [ID]
							FROM [dbo].[ControlLists]
							WHERE [ModuleID] = 1 AND [ControlID] = @UserID AND [ControlType] = 1 AND [OrigID] IN (SELECT [GroupID] FROM cte)
						END
					FETCH NEXT FROM assigned_cursor INTO @ControlID, @ControlType;
				END
			CLOSE assigned_cursor;
			DEALLOCATE assigned_cursor;
		END
		
	SELECT [ID] 
	FROM @TempTable;

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Users_Add_New_User]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 19, 2021>
-- Description:	<Insert New User>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Users_Add_New_User]
	@Name nvarchar(255),
	@ParentGroupID int,
	@FirstName nvarchar(255),
	@LastName nvarchar(255),
	@Password nvarchar(255),
	@Email nvarchar(255),
	@Mobile nvarchar(255),
	@Spare01 nvarchar(255),
	@Spare02 nvarchar(255),
	@Spare03 datetime,
	@Spare04 datetime,
	@Description nvarchar(max),
	@Status int,
	@ModuleAccess nvarchar(255),
	@OptionSet nvarchar(255),
	@Language nvarchar(255),
	@CreatorID int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CreatorFullName NVARCHAR(255),@Date DATETIME,@NewUserID INT;
	SET @CreatorFullName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @CreatorID);
	SET @Date = GETDATE();

	INSERT INTO [dbo].[Items1]([Name],[ParentGroupID],[FirstName],[LastName],[FullName],[PWord],[Email],[MobileNumber],[SpareField01],[SpareField02],[SpareField03],[SpareField04],
		[Description],[Status],[ModuleAccess],[OptionSet],[MyLanguage],[CreatorID],[CreateBy],[CreateDate],[LastModified],[ModifiedBy],[ModifierID])
	VALUES(@Name,@ParentGroupID,@FirstName,@LastName,@FirstName + ' ' + @LastName,@Password,@Email,@Mobile,@Spare01,@Spare02,@Spare03,@Spare04,
		@Description,@Status,@ModuleAccess,@OptionSet,@Language,@CreatorID,@CreatorFullName,@Date,@Date,@CreatorFullName,@CreatorID);
	SET @NewUserID = SCOPE_IDENTITY();
	UPDATE [dbo].[Items1]
	SET [OrigID] = @NewUserID
	WHERE [UserID] = @NewUserID;
END
GO
/****** Object:  StoredProcedure [dbo].[v4_Users_Update_User]    Script Date: 5/28/2021 12:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Chris Reyno>
-- Create date: <May 20, 2021>
-- Description:	<Update User Record>
-- =============================================
CREATE PROCEDURE [dbo].[v4_Users_Update_User]
	@UserID int,
	@FirstName nvarchar(255),
	@LastName nvarchar(255),
	@Password nvarchar(255),
	@Email nvarchar(255),
	@Mobile nvarchar(255),
	@Spare01 nvarchar(255),
	@Spare02 nvarchar(255),
	@Spare03 datetime,
	@Spare04 datetime,
	@Description nvarchar(max),
	@Status int,
	@ModuleAccess nvarchar(255),
	@OptionSet nvarchar(255),
	@Language nvarchar(255),
	@ModifierID int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CurrentUserName NVARCHAR(255),@Date DATETIME,@OrigPW NVARCHAR(255);
	SET @CurrentUserName = (SELECT [FullName] FROM [dbo].[Items1] WHERE [UserID] = @ModifierID);
	SET @Date = GETDATE();
	SET @OrigPW = (SELECT [PWord] FROM [dbo].[Items1] WHERE [UserID] = @UserID);

	IF @Password = 'JunkPassword01'
		BEGIN
			SET @Password = @OrigPW;
		END

    UPDATE [dbo].[Items1]
	SET [FirstName]=@FirstName,[LastName]=@LastName,[FullName]=@FirstName + ' ' + @LastName,[PWord]=@Password,[Email]=@Email,[MobileNumber]=@Mobile,
		[SpareField01]=@Spare01,[SpareField02]=@Spare02,[SpareField03]=@Spare03,[SpareField04]=@Spare04,[Description]=@Description,[Status]=@Status,
		[ModuleAccess]=@ModuleAccess,[OptionSet]=@OptionSet,[MyLanguage]=@Language,[LastModified]=@Date,[ModifiedBy]=@CurrentUserName,[ModifierID]=@ModifierID
	WHERE [UserID] = @UserID;
END
GO

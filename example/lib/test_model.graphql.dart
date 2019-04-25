// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GraphQLGenerator
// **************************************************************************

abstract class TTurtleEvent {
  String id;

  String requestId;

  String time;

  factory TTurtleEvent.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "AccountTransfer":
        return TAccountTransfer.fromJson(json);
      case "CardAssigned":
        return TCardAssigned.fromJson(json);
      case "CardBudgetDecreased":
        return TCardBudgetDecreased.fromJson(json);
      case "CardBudgetIncreased":
        return TCardBudgetIncreased.fromJson(json);
      case "CardBudgetSet":
        return TCardBudgetSet.fromJson(json);
      case "CardBudgetUnset":
        return TCardBudgetUnset.fromJson(json);
      case "CardCompleted":
        return TCardCompleted.fromJson(json);
      case "CardCreated":
        return TCardCreated.fromJson(json);
      case "CardDueDateSet":
        return TCardDueDateSet.fromJson(json);
      case "CardDueDateUnset":
        return TCardDueDateUnset.fromJson(json);
      case "CardEstimateSet":
        return TCardEstimateSet.fromJson(json);
      case "CardEstimateUnset":
        return TCardEstimateUnset.fromJson(json);
      case "CardMemberAdded":
        return TCardMemberAdded.fromJson(json);
      case "CardMemberRemoved":
        return TCardMemberRemoved.fromJson(json);
      case "CardMoved":
        return TCardMoved.fromJson(json);
      case "CardRenamed":
        return TCardRenamed.fromJson(json);
      case "CardUnassigned":
        return TCardUnassigned.fromJson(json);
      case "CardUncompleted":
        return TCardUncompleted.fromJson(json);
      case "FeedMessageDeleted":
        return TFeedMessageDeleted.fromJson(json);
      case "FeedMessageEdited":
        return TFeedMessageEdited.fromJson(json);
      case "FeedMessagePosted":
        return TFeedMessagePosted.fromJson(json);
      case "PayoutRecorded":
        return TPayoutRecorded.fromJson(json);
      case "ReactionAdded":
        return TReactionAdded.fromJson(json);
      case "ReactionRemoved":
        return TReactionRemoved.fromJson(json);
      case "StripeChargeCreated":
        return TStripeChargeCreated.fromJson(json);
      case "TimeEntryCreated":
        return TTimeEntryCreated.fromJson(json);
      case "TimeEntryDeleted":
        return TTimeEntryDeleted.fromJson(json);
      case "TimeEntryEdited":
        return TTimeEntryEdited.fromJson(json);
      case "UserReadFeedEvent":
        return TUserReadFeedEvent.fromJson(json);
      case "UserUnreadFeedEvent":
        return TUserUnreadFeedEvent.fromJson(json);
    }
    return null;
  }
}

abstract class TAccountSource {
  factory TAccountSource.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return TCard.fromJson(json);
      case "User":
        return TUser.fromJson(json);
    }
    return null;
  }
}

abstract class TDocumentToken {
  factory TDocumentToken.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return TCard.fromJson(json);
      case "DateObject":
        return TDateObject.fromJson(json);
      case "DurationRange":
        return TDurationRange.fromJson(json);
      case "File":
        return TFile.fromJson(json);
      case "Link":
        return TLink.fromJson(json);
      case "StringObject":
        return TStringObject.fromJson(json);
      case "TimeEntry":
        return TTimeEntry.fromJson(json);
      case "User":
        return TUser.fromJson(json);
    }
    return null;
  }
}

abstract class TFeedSource {
  factory TFeedSource.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return TCard.fromJson(json);
      case "User":
        return TUser.fromJson(json);
    }
    return null;
  }
}

class TSendLowBalanceReminderInput {
  String projectId;

  String userId;

  TSendLowBalanceReminderInput({this.projectId, this.userId});

  factory TSendLowBalanceReminderInput.fromJson(Map<String, dynamic> json) {
    return TSendLowBalanceReminderInput(
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
    );
  }
}

class TCardRemoveMemberInput {
  String cardId;

  String memberId;

  TCardRemoveMemberInput({this.cardId, this.memberId});

  factory TCardRemoveMemberInput.fromJson(Map<String, dynamic> json) {
    return TCardRemoveMemberInput(
      cardId: json['cardId'] as String,
      memberId: json['memberId'] as String,
    );
  }
}

class TKv {
  String k;

  String v;

  TKv({this.k, this.v});

  factory TKv.fromJson(Map<String, dynamic> json) {
    return TKv(
      k: json['k'] as String,
      v: json['v'] as String,
    );
  }
}

class TCardMoveInput {
  String afterId;

  String beforeId;

  String cardId;

  String toId;

  TCardMoveInput({this.afterId, this.beforeId, this.cardId, this.toId});

  factory TCardMoveInput.fromJson(Map<String, dynamic> json) {
    return TCardMoveInput(
      afterId: json['afterId'] as String,
      beforeId: json['beforeId'] as String,
      cardId: json['cardId'] as String,
      toId: json['toId'] as String,
    );
  }
}

class TCardAddMemberInput {
  String cardId;

  String memberId;

  TCardAddMemberInput({this.cardId, this.memberId});

  factory TCardAddMemberInput.fromJson(Map<String, dynamic> json) {
    return TCardAddMemberInput(
      cardId: json['cardId'] as String,
      memberId: json['memberId'] as String,
    );
  }
}

class TProfileNameSetInput {
  String name;

  TProfileNameSetInput({this.name});

  factory TProfileNameSetInput.fromJson(Map<String, dynamic> json) {
    return TProfileNameSetInput(
      name: json['name'] as String,
    );
  }
}

class TAddReactionInput {
  String feedEventId;

  String reaction;

  TAddReactionInput({this.feedEventId, this.reaction});

  factory TAddReactionInput.fromJson(Map<String, dynamic> json) {
    return TAddReactionInput(
      feedEventId: json['feedEventId'] as String,
      reaction: json['reaction'] as String,
    );
  }
}

class TTimeEntryEditInput {
  String entryDate;

  int entryDuration;

  String entryId;

  String entryMemo;

  TTimeEntryEditInput(
      {this.entryDate, this.entryDuration, this.entryId, this.entryMemo});

  factory TTimeEntryEditInput.fromJson(Map<String, dynamic> json) {
    return TTimeEntryEditInput(
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as int,
      entryId: json['entryId'] as String,
      entryMemo: json['entryMemo'] as String,
    );
  }
}

class TCardEstimateUnsetInput {
  String cardId;

  TCardEstimateUnsetInput({this.cardId});

  factory TCardEstimateUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardEstimateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardUnassignInput {
  String cardId;

  TCardUnassignInput({this.cardId});

  factory TCardUnassignInput.fromJson(Map<String, dynamic> json) {
    return TCardUnassignInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardDueDateUnsetInput {
  String cardId;

  TCardDueDateUnsetInput({this.cardId});

  factory TCardDueDateUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardDueDateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardMetaSetInput {
  String cardId;

  String metaKey;

  String metaValue;

  TCardMetaSetInput({this.cardId, this.metaKey, this.metaValue});

  factory TCardMetaSetInput.fromJson(Map<String, dynamic> json) {
    return TCardMetaSetInput(
      cardId: json['cardId'] as String,
      metaKey: json['metaKey'] as String,
      metaValue: json['metaValue'] as String,
    );
  }
}

class TCardBudgetDecreaseInput {
  int budgetDuration;

  String cardId;

  TCardBudgetDecreaseInput({this.budgetDuration, this.cardId});

  factory TCardBudgetDecreaseInput.fromJson(Map<String, dynamic> json) {
    return TCardBudgetDecreaseInput(
      budgetDuration: json['budgetDuration'] as int,
      cardId: json['cardId'] as String,
    );
  }
}

class TFeedPostMessageInput {
  String feedId;

  String messageBody;

  TFeedPostMessageInput({this.feedId, this.messageBody});

  factory TFeedPostMessageInput.fromJson(Map<String, dynamic> json) {
    return TFeedPostMessageInput(
      feedId: json['feedId'] as String,
      messageBody: json['messageBody'] as String,
    );
  }
}

class TProfileTimezoneSetInput {
  String timezone;

  TProfileTimezoneSetInput({this.timezone});

  factory TProfileTimezoneSetInput.fromJson(Map<String, dynamic> json) {
    return TProfileTimezoneSetInput(
      timezone: json['timezone'] as String,
    );
  }
}

class TUserSetRolesInput {
  List<TRole> roles;

  String userId;

  TUserSetRolesInput({this.roles, this.userId});

  factory TUserSetRolesInput.fromJson(Map<String, dynamic> json) {
    return TUserSetRolesInput(
      roles: (json['roles'] as List)?.map((e) => TRoleValues[e])?.toList(),
      userId: json['userId'] as String,
    );
  }
}

class TCardDeleteInput {
  String cardId;

  TCardDeleteInput({this.cardId});

  factory TCardDeleteInput.fromJson(Map<String, dynamic> json) {
    return TCardDeleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardRenameInput {
  String cardId;

  String cardName;

  TCardRenameInput({this.cardId, this.cardName});

  factory TCardRenameInput.fromJson(Map<String, dynamic> json) {
    return TCardRenameInput(
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
    );
  }
}

class TCardLinkDeleteInput {
  String fromId;

  String linkType;

  String toId;

  TCardLinkDeleteInput({this.fromId, this.linkType, this.toId});

  factory TCardLinkDeleteInput.fromJson(Map<String, dynamic> json) {
    return TCardLinkDeleteInput(
      fromId: json['fromId'] as String,
      linkType: json['linkType'] as String,
      toId: json['toId'] as String,
    );
  }
}

class TCardTagsSetInput {
  String cardId;

  String tagGroup;

  List<String> tags;

  TCardTagsSetInput({this.cardId, this.tagGroup, this.tags});

  factory TCardTagsSetInput.fromJson(Map<String, dynamic> json) {
    return TCardTagsSetInput(
      cardId: json['cardId'] as String,
      tagGroup: json['tagGroup'] as String,
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    );
  }
}

class TCardUndeleteInput {
  String cardId;

  TCardUndeleteInput({this.cardId});

  factory TCardUndeleteInput.fromJson(Map<String, dynamic> json) {
    return TCardUndeleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TTimeEntryCreateInput {
  String cardId;

  String entryDate;

  int entryDuration;

  String entryId;

  String entryMemo;

  TTimeEntryCreateInput({this.cardId,
    this.entryDate,
    this.entryDuration,
    this.entryId,
    this.entryMemo});

  factory TTimeEntryCreateInput.fromJson(Map<String, dynamic> json) {
    return TTimeEntryCreateInput(
      cardId: json['cardId'] as String,
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as int,
      entryId: json['entryId'] as String,
      entryMemo: json['entryMemo'] as String,
    );
  }
}

class TUpdateAvailabilityInput {
  String endDate;

  String projectId;

  String startDate;

  int timePerWeek;

  String userId;

  TUpdateAvailabilityInput({this.endDate,
    this.projectId,
    this.startDate,
    this.timePerWeek,
    this.userId});

  factory TUpdateAvailabilityInput.fromJson(Map<String, dynamic> json) {
    return TUpdateAvailabilityInput(
      endDate: json['endDate'] as String,
      projectId: json['projectId'] as String,
      startDate: json['startDate'] as String,
      timePerWeek: json['timePerWeek'] as int,
      userId: json['userId'] as String,
    );
  }
}

class TAccountOpenInput {
  String accountId;

  TAccountOpenInput({this.accountId});

  factory TAccountOpenInput.fromJson(Map<String, dynamic> json) {
    return TAccountOpenInput(
      accountId: json['accountId'] as String,
    );
  }
}

class TFeedDeleteMessageInput {
  String feedEventId;

  TFeedDeleteMessageInput({this.feedEventId});

  factory TFeedDeleteMessageInput.fromJson(Map<String, dynamic> json) {
    return TFeedDeleteMessageInput(
      feedEventId: json['feedEventId'] as String,
    );
  }
}

class TRemoveReactionInput {
  String feedEventId;

  String reaction;

  TRemoveReactionInput({this.feedEventId, this.reaction});

  factory TRemoveReactionInput.fromJson(Map<String, dynamic> json) {
    return TRemoveReactionInput(
      feedEventId: json['feedEventId'] as String,
      reaction: json['reaction'] as String,
    );
  }
}

class TCardInviteUserInput {
  String cardId;

  String email;

  TCardInviteUserInput({this.cardId, this.email});

  factory TCardInviteUserInput.fromJson(Map<String, dynamic> json) {
    return TCardInviteUserInput(
      cardId: json['cardId'] as String,
      email: json['email'] as String,
    );
  }
}

class TTimeEntryDeleteInput {
  String entryId;

  TTimeEntryDeleteInput({this.entryId});

  factory TTimeEntryDeleteInput.fromJson(Map<String, dynamic> json) {
    return TTimeEntryDeleteInput(
      entryId: json['entryId'] as String,
    );
  }
}

class TCardBudgetUnsetInput {
  String cardId;

  TCardBudgetUnsetInput({this.cardId});

  factory TCardBudgetUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardBudgetUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardDueDateSetInput {
  String cardId;

  String dueDate;

  TCardDueDateSetInput({this.cardId, this.dueDate});

  factory TCardDueDateSetInput.fromJson(Map<String, dynamic> json) {
    return TCardDueDateSetInput(
      cardId: json['cardId'] as String,
      dueDate: json['dueDate'] as String,
    );
  }
}

class TUserSetSkillsInput {
  List<String> skills;

  String userId;

  TUserSetSkillsInput({this.skills, this.userId});

  factory TUserSetSkillsInput.fromJson(Map<String, dynamic> json) {
    return TUserSetSkillsInput(
      skills: (json['skills'] as List)?.map((e) => e as String)?.toList(),
      userId: json['userId'] as String,
    );
  }
}

class TCardCreateInput {
  String afterId;

  String assigneeId;

  String beforeId;

  String cardId;

  String cardName;

  String meta;

  String parentId;

  bool quickAdd;

  TCardCreateInput({this.afterId,
    this.assigneeId,
    this.beforeId,
    this.cardId,
    this.cardName,
    this.meta,
    this.parentId,
    this.quickAdd});

  factory TCardCreateInput.fromJson(Map<String, dynamic> json) {
    return TCardCreateInput(
      afterId: json['afterId'] as String,
      assigneeId: json['assigneeId'] as String,
      beforeId: json['beforeId'] as String,
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
      meta: json['meta'] as String,
      parentId: json['parentId'] as String,
      quickAdd: json['quickAdd'] as bool,
    );
  }
}

class TCardAssignInput {
  String assigneeId;

  String cardId;

  TCardAssignInput({this.assigneeId, this.cardId});

  factory TCardAssignInput.fromJson(Map<String, dynamic> json) {
    return TCardAssignInput(
      assigneeId: json['assigneeId'] as String,
      cardId: json['cardId'] as String,
    );
  }
}

class TCardUncompleteInput {
  String cardId;

  TCardUncompleteInput({this.cardId});

  factory TCardUncompleteInput.fromJson(Map<String, dynamic> json) {
    return TCardUncompleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardBudgetIncreaseInput {
  int budgetDuration;

  String cardId;

  TCardBudgetIncreaseInput({this.budgetDuration, this.cardId});

  factory TCardBudgetIncreaseInput.fromJson(Map<String, dynamic> json) {
    return TCardBudgetIncreaseInput(
      budgetDuration: json['budgetDuration'] as int,
      cardId: json['cardId'] as String,
    );
  }
}

class TProjectAddBalanceWithStripeInput {
  String amount;

  String cardToken;

  String creditCardId;

  String projectId;

  TProjectAddBalanceWithStripeInput(
      {this.amount, this.cardToken, this.creditCardId, this.projectId});

  factory TProjectAddBalanceWithStripeInput.fromJson(
      Map<String, dynamic> json) {
    return TProjectAddBalanceWithStripeInput(
      amount: json['amount'] as String,
      cardToken: json['cardToken'] as String,
      creditCardId: json['creditCardId'] as String,
      projectId: json['projectId'] as String,
    );
  }
}

class TFeedEditMessageInput {
  String feedEventId;

  String messageBody;

  TFeedEditMessageInput({this.feedEventId, this.messageBody});

  factory TFeedEditMessageInput.fromJson(Map<String, dynamic> json) {
    return TFeedEditMessageInput(
      feedEventId: json['feedEventId'] as String,
      messageBody: json['messageBody'] as String,
    );
  }
}

class TContractStartInput {
  String contractId;

  String contractorHourlyRate;

  String contractorId;

  String customerHourlyRate;

  String projectId;

  TContractStartInput({this.contractId,
    this.contractorHourlyRate,
    this.contractorId,
    this.customerHourlyRate,
    this.projectId});

  factory TContractStartInput.fromJson(Map<String, dynamic> json) {
    return TContractStartInput(
      contractId: json['contractId'] as String,
      contractorHourlyRate: json['contractorHourlyRate'] as String,
      contractorId: json['contractorId'] as String,
      customerHourlyRate: json['customerHourlyRate'] as String,
      projectId: json['projectId'] as String,
    );
  }
}

class TContractEndInput {
  String contractId;

  TContractEndInput({this.contractId});

  factory TContractEndInput.fromJson(Map<String, dynamic> json) {
    return TContractEndInput(
      contractId: json['contractId'] as String,
    );
  }
}

class TCardCompleteInput {
  String cardId;

  TCardCompleteInput({this.cardId});

  factory TCardCompleteInput.fromJson(Map<String, dynamic> json) {
    return TCardCompleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardLinkCreateInput {
  String fromId;

  String linkType;

  String toId;

  TCardLinkCreateInput({this.fromId, this.linkType, this.toId});

  factory TCardLinkCreateInput.fromJson(Map<String, dynamic> json) {
    return TCardLinkCreateInput(
      fromId: json['fromId'] as String,
      linkType: json['linkType'] as String,
      toId: json['toId'] as String,
    );
  }
}

class TRecordPayoutInput {
  String amount;

  String date;

  String fee;

  String memo;

  String method;

  String payoutId;

  String userId;

  TRecordPayoutInput({this.amount,
    this.date,
    this.fee,
    this.memo,
    this.method,
    this.payoutId,
    this.userId});

  factory TRecordPayoutInput.fromJson(Map<String, dynamic> json) {
    return TRecordPayoutInput(
      amount: json['amount'] as String,
      date: json['date'] as String,
      fee: json['fee'] as String,
      memo: json['memo'] as String,
      method: json['method'] as String,
      payoutId: json['payoutId'] as String,
      userId: json['userId'] as String,
    );
  }
}

class TFeedMarkAsReadInput {
  String feedId;

  TFeedMarkAsReadInput({this.feedId});

  factory TFeedMarkAsReadInput.fromJson(Map<String, dynamic> json) {
    return TFeedMarkAsReadInput(
      feedId: json['feedId'] as String,
    );
  }
}

class TCardEstimateSetInput {
  String cardId;

  String estimate;

  TCardEstimateSetInput({this.cardId, this.estimate});

  factory TCardEstimateSetInput.fromJson(Map<String, dynamic> json) {
    return TCardEstimateSetInput(
      cardId: json['cardId'] as String,
      estimate: json['estimate'] as String,
    );
  }
}

class TAccountTransferInput {
  String amount;

  String destAccount;

  String memo;

  String sourceAccount;

  TAccountTransferInput(
      {this.amount, this.destAccount, this.memo, this.sourceAccount});

  factory TAccountTransferInput.fromJson(Map<String, dynamic> json) {
    return TAccountTransferInput(
      amount: json['amount'] as String,
      destAccount: json['destAccount'] as String,
      memo: json['memo'] as String,
      sourceAccount: json['sourceAccount'] as String,
    );
  }
}

/// A user edited a time entry that they have already tracked.
/// The editable fields of a time entry are the duration, memo, and date.
/// If a memo and date was edited, it's just a simple edit of those attributes.
/// If the duration was edited, this generates an adjustment transaction to account for this change.
///
class TTimeEntryEdited implements TTurtleEvent {
  /// The user that edited the time. (It's possible that this may be different from the user who did the work.)
  TUser actor;

  /// The user that edited the time entry. (It's possible that this may be different from the user who did the work.)
  String actorId;

  /// The card (task) that the use did work on.
  TCard card;

  /// The card (task) that the use did work on.
  String cardId;

  /// The associated contract under which the work was done. Of note is the customer rate and freelancer rate.
  /// If a time entry is edited, this same contract will be used to avoid situations of a contract being edited retroactively.
  ///
  TContract contract;

  /// The user that did the work. The generated transaction will transfer money into this users account.
  TUser contractor;

  /// The modified date of the time entry. Can be null if it was unmodified.
  String entryDate;

  /// The modified duration of the time entry. Can be null if it was unmodified.
  int entryDuration;

  /// The modified memo of the time entry. Can be null if it was unmodified.
  String entryMemo;

  String id;

  /// The duration of the time entry before the time entry was edited.
  int prevEntryDuration;

  /// The project the card belongs to.
  TCard project;

  String requestId;

  String time;

  /// A reference to the latest time entry.
  /// Note that this points to the most recent one so its attributes will include all past edits.
  ///
  TTimeEntry timeEntry;

  /// The id of the time entry that was edited
  String timeEntryId;

  TTimeEntryEdited({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.contract,
    this.contractor,
    this.entryDate,
    this.entryDuration,
    this.entryMemo,
    this.id,
    this.prevEntryDuration,
    this.project,
    this.requestId,
    this.time,
    this.timeEntry,
    this.timeEntryId});

  factory TTimeEntryEdited.fromJson(Map<String, dynamic> json) {
    return TTimeEntryEdited(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      contract: json['contract'] == null
          ? null
          : TContract.fromJson(json['contract'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : TUser.fromJson(json['contractor'] as Map<String, dynamic>),
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as int,
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as String,
      prevEntryDuration: json['prevEntryDuration'] as int,
      project: json['project'] == null
          ? null
          : TCard.fromJson(json['project'] as Map<String, dynamic>),
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      timeEntry: json['timeEntry'] == null
          ? null
          : TTimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      timeEntryId: json['timeEntryId'] as String,
    );
  }
}

/// A user edited the content of an existing message in a feed.
class TFeedMessageEdited implements TTurtleEvent {
  /// The user that edited the message
  TUser actor;

  /// The user that edited the message
  String actorId;

  /// The feed the edited message belongs to
  TFeed feed;

  /// The id of the edited message
  String feedEventId;

  /// The feed the edited message belongs to
  String feedId;

  String id;

  /// The new body of the message
  String messageBody;

  /// The project the feed belongs to.
  /// (Direct messages don't belong to projects so it will be null for direct messages.)
  ///
  String projectId;

  String requestId;

  String time;

  TFeedMessageEdited({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.messageBody,
    this.projectId,
    this.requestId,
    this.time});

  factory TFeedMessageEdited.fromJson(Map<String, dynamic> json) {
    return TFeedMessageEdited(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      messageBody: json['messageBody'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class THubspotContact {
  List<String> coreSkills;

  String githubUsername;

  TMoney hourlyRate;

  String id;

  THubspotDealStage recruitingStage;

  THubspotContact({this.coreSkills,
    this.githubUsername,
    this.hourlyRate,
    this.id,
    this.recruitingStage});

  factory THubspotContact.fromJson(Map<String, dynamic> json) {
    return THubspotContact(
      coreSkills:
      (json['coreSkills'] as List)?.map((e) => e as String)?.toList(),
      githubUsername: json['githubUsername'] as String,
      hourlyRate: json['hourlyRate'] == null
          ? null
          : TMoney.fromJson(json['hourlyRate'] as Map<String, dynamic>),
      id: json['id'] as String,
      recruitingStage: json['recruitingStage'] == null
          ? null
          : THubspotDealStage.fromJson(
          json['recruitingStage'] as Map<String, dynamic>),
    );
  }
}

/// A single instance of a video conference meeting. Has a start time, end time, participants and so on.
///
class TMeeting {
  /// The time the meeting took. Does not have a value until the meeting has ended.
  int duration;

  String endedAt;

  String id;

  /// The users currently in the meeting.
  List<TUser> participants;

  /// The video recording of the meeting. Only applies to meetings that have happened in the past with recording enabled.
  TMeetingRecording recording;

  /// The room the meeting belongs to. For example project:27637534222268650867953431281664
  /// A room may only have one meeting going on at a time and all meetings belong to a room.
  ///
  String roomId;

  String startedAt;

  TMeetingStatus status;

  TMeeting({this.duration,
    this.endedAt,
    this.id,
    this.participants,
    this.recording,
    this.roomId,
    this.startedAt,
    this.status});

  factory TMeeting.fromJson(Map<String, dynamic> json) {
    return TMeeting(
      duration: json['duration'] as int,
      endedAt: json['endedAt'] as String,
      id: json['id'] as String,
      participants: (json['participants'] as List)
          ?.map((e) =>
      e == null ? null : TUser.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      recording: json['recording'] == null
          ? null
          : TMeetingRecording.fromJson(
          json['recording'] as Map<String, dynamic>),
      roomId: json['roomId'] as String,
      startedAt: json['startedAt'] as String,
      status: TMeetingStatusValues[json['status']],
    );
  }
}

/// An hourly contract between a project and user. Used in generating transactions when a user tracks time.
/// It is worth noting that contracts are immutable. They can only be started and ended. (This is to avoid complications which we don't get into here.)
///
class TContract {
  /// Whether the contract is currently ongoing. Becomes false once a contract is ended.
  bool active;

  /// The user who earns money for doing hourly work.
  TUser contractor;

  /// The amount of money the contractor earns for each hour billed.
  TMoney contractorHourlyRate;

  /// The amount of money the customer spends for each hour the contractor bills.
  TMoney customerHourlyRate;

  /// The time the contract was ended. Empty if the contract is currently active.
  String endedAt;

  String id;

  /// The project the contractor does work for.
  TProject project;

  /// The time the contract was started.
  String startedAt;

  TContract({this.active,
    this.contractor,
    this.contractorHourlyRate,
    this.customerHourlyRate,
    this.endedAt,
    this.id,
    this.project,
    this.startedAt});

  factory TContract.fromJson(Map<String, dynamic> json) {
    return TContract(
      active: json['active'] as bool,
      contractor: json['contractor'] == null
          ? null
          : TUser.fromJson(json['contractor'] as Map<String, dynamic>),
      contractorHourlyRate: json['contractorHourlyRate'] == null
          ? null
          : TMoney.fromJson(
          json['contractorHourlyRate'] as Map<String, dynamic>),
      customerHourlyRate: json['customerHourlyRate'] == null
          ? null
          : TMoney.fromJson(json['customerHourlyRate'] as Map<String, dynamic>),
      endedAt: json['endedAt'] as String,
      id: json['id'] as String,
      project: json['project'] == null
          ? null
          : TProject.fromJson(json['project'] as Map<String, dynamic>),
      startedAt: json['startedAt'] as String,
    );
  }
}

/// When a user has read an event, this event is generated.
/// This, in combination with [UserUnreadFeedEvent], can be used to generate unread counts per feed.
/// Note: UserReadFeedEvent is guaranteed to be unique and may not be balanced with [UserReadFeedEvent].
/// So make sure you process the events in an idempotent way. We intend to change this behavior in the future.
/// The meaning of "read" is determined by the client.
/// For example, it could be when a user clicks on an activity feed. Or when could be a user scrolls to see the message.
///
class TUserReadFeedEvent implements TTurtleEvent {
  /// The user that read the event
  String actorId;

  /// The event itself that was read by the user
  String feedEventId;

  /// The feed the event belongs to
  String feedId;

  String id;

  String requestId;

  String time;

  TUserReadFeedEvent({this.actorId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.requestId,
    this.time});

  factory TUserReadFeedEvent.fromJson(Map<String, dynamic> json) {
    return TUserReadFeedEvent(
      actorId: json['actorId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// The name property of a card was changed
class TCardRenamed implements TTurtleEvent {
  /// The user who renamed the card
  TUser actor;

  /// The user who renamed the card
  String actorId;

  /// The card that was renamed
  TCard card;

  /// The card that was renamed
  String cardId;

  /// The new name the card was renamed to
  String cardName;

  String id;

  /// The project of the card that was renamed
  String projectId;

  String requestId;

  String time;

  TCardRenamed({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.cardName,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardRenamed.fromJson(Map<String, dynamic> json) {
    return TCardRenamed(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TCardBudgetDecreased implements TTurtleEvent {
  TUser actor;

  String actorId;

  TCardBudget budget;

  TCard card;

  String cardId;

  String id;

  String projectId;

  String requestId;

  String time;

  TCardBudgetDecreased({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardBudgetDecreased.fromJson(Map<String, dynamic> json) {
    return TCardBudgetDecreased(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      budget: json['budget'] == null
          ? null
          : TCardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Wrapper for a string scalar
class TStringObject implements TDocumentToken {
  String value;

  TStringObject({this.value});

  factory TStringObject.fromJson(Map<String, dynamic> json) {
    return TStringObject(
      value: json['value'] as String,
    );
  }
}

class TReactionAdded implements TTurtleEvent {
  String actorId;

  String cardId;

  String feedEventId;

  String feedId;

  String id;

  String projectId;

  String reaction;

  String receiverId;

  String requestId;

  String time;

  TReactionAdded({this.actorId,
    this.cardId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.reaction,
    this.receiverId,
    this.requestId,
    this.time});

  factory TReactionAdded.fromJson(Map<String, dynamic> json) {
    return TReactionAdded(
      actorId: json['actorId'] as String,
      cardId: json['cardId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      reaction: json['reaction'] as String,
      receiverId: json['receiverId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card was assigned to a user
class TCardAssigned implements TTurtleEvent {
  /// The user who assigned the card
  TUser actor;

  /// The user who assigned the card
  String actorId;

  /// The user the card was assigned to
  TUser assignee;

  /// The user the card was assigned to
  String assigneeId;

  /// The card that was assigned
  TCard card;

  /// The card that was assigned
  String cardId;

  String id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  TCardAssigned({this.actor,
    this.actorId,
    this.assignee,
    this.assigneeId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardAssigned.fromJson(Map<String, dynamic> json) {
    return TCardAssigned(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      assignee: json['assignee'] == null
          ? null
          : TUser.fromJson(json['assignee'] as Map<String, dynamic>),
      assigneeId: json['assigneeId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A contrator tracks logs for work that they have done.
/// Generates a transaction that deducts from customer account, adds to the contractor's account, and puts the rest in a turtle: account
///
class TTimeEntryCreated implements TTurtleEvent {
  /// The user that logged the time. (It's possible that this may be different from the user who did the work.)
  TUser actor;

  /// The user that logged the time. (It's possible that this may be different from the user who did the work.)
  String actorId;

  /// The card (task) that the use did work on.
  TCard card;

  /// The card (task) that the use did work on.
  String cardId;

  /// The associated contract under which the work was done. Of note is the customer rate and freelancer rate.
  /// If a time entry is edited, this same contract will be used to avoid situations of a contract being edited retroactively.
  ///
  TContract contract;

  /// The user that did the work. The generated transaction will transfer money into this users account.
  TUser contractor;

  /// The date the work was done. This is self-reported by the contractor.
  String entryDate;

  /// The amount of time that was worked
  int entryDuration;

  /// An optional memo where a contractor can describe what they were working on.
  /// This may not be necessary if the associated card to this time entry has enough information.
  ///
  String entryMemo;

  String id;

  /// The project the card belongs to.
  TCard project;

  /// The project the card belongs to.
  String projectId;

  String requestId;

  String time;

  /// The time entry that was created.
  /// Note that this is a reference to the latest time entry, so if it was edited after this event, you will see the latest properties.
  ///
  TTimeEntry timeEntry;

  /// The id of the time entry that was created
  String timeEntryId;

  TTimeEntryCreated({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.contract,
    this.contractor,
    this.entryDate,
    this.entryDuration,
    this.entryMemo,
    this.id,
    this.project,
    this.projectId,
    this.requestId,
    this.time,
    this.timeEntry,
    this.timeEntryId});

  factory TTimeEntryCreated.fromJson(Map<String, dynamic> json) {
    return TTimeEntryCreated(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      contract: json['contract'] == null
          ? null
          : TContract.fromJson(json['contract'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : TUser.fromJson(json['contractor'] as Map<String, dynamic>),
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as int,
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as String,
      project: json['project'] == null
          ? null
          : TCard.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      timeEntry: json['timeEntry'] == null
          ? null
          : TTimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      timeEntryId: json['timeEntryId'] as String,
    );
  }
}

/// A completed card was marked as incomplete
class TCardUncompleted implements TTurtleEvent {
  /// The user that marked the card as incomplete
  TUser actor;

  /// The user that marked the card as incomplete
  String actorId;

  /// The card that was marked incomplete
  TCard card;

  /// The card that was marked incomplete
  String cardId;

  String id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  TCardUncompleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardUncompleted.fromJson(Map<String, dynamic> json) {
    return TCardUncompleted(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A credit card that customers pay with. Currently all credit cards are from Stripe.
class TCreditCard {
  /// The brand of credit card. For ex: MasterCard, American Express, Visa
  String brand;

  /// Month the credit card expires (number from 1-12)
  int expMonth;

  /// Year the credit card expires
  int expYear;

  /// The unique identifier of the credit card. This will match whatever is on the Stripe account.
  String id;

  /// Last 4 digits of a credit card
  String last4;

  /// The user who owns the credit card. Meaning the user who entered the credit card into the system.
  TUser owner;

  TCreditCard({this.brand,
    this.expMonth,
    this.expYear,
    this.id,
    this.last4,
    this.owner});

  factory TCreditCard.fromJson(Map<String, dynamic> json) {
    return TCreditCard(
      brand: json['brand'] as String,
      expMonth: json['expMonth'] as int,
      expYear: json['expYear'] as int,
      id: json['id'] as String,
      last4: json['last4'] as String,
      owner: json['owner'] == null
          ? null
          : TUser.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }
}

/// Money was transferred between two accounts
class TAccountTransfer implements TTurtleEvent {
  /// The user that performed the action
  TUser actor;

  /// The user that performed the action
  String actorId;

  /// The amount of money transferred
  TMoney amount;

  /// The account the money was deposited to
  String destAccountId;

  String id;

  /// An optional memo the preson doing the transfer can write in
  String memo;

  String requestId;

  /// The account the money was withdrawn from
  String sourceAccountId;

  String time;

  TAccountTransfer({this.actor,
    this.actorId,
    this.amount,
    this.destAccountId,
    this.id,
    this.memo,
    this.requestId,
    this.sourceAccountId,
    this.time});

  factory TAccountTransfer.fromJson(Map<String, dynamic> json) {
    return TAccountTransfer(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      amount: json['amount'] == null
          ? null
          : TMoney.fromJson(json['amount'] as Map<String, dynamic>),
      destAccountId: json['destAccountId'] as String,
      id: json['id'] as String,
      memo: json['memo'] as String,
      requestId: json['requestId'] as String,
      sourceAccountId: json['sourceAccountId'] as String,
      time: json['time'] as String,
    );
  }
}

class TCardBudgetSet implements TTurtleEvent {
  TUser actor;

  String actorId;

  TCardBudget budget;

  TCard card;

  String cardId;

  String id;

  String projectId;

  String requestId;

  String time;

  TCardBudgetSet({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardBudgetSet.fromJson(Map<String, dynamic> json) {
    return TCardBudgetSet(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      budget: json['budget'] == null
          ? null
          : TCardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TAccountEntry {
  TMoney balanceSnapshot;

  String createdAt;

  TMoney delta;

  String memo;

  TTurtleEvent sourceEvent;

  String type;

  TAccountEntry({this.balanceSnapshot,
    this.createdAt,
    this.delta,
    this.memo,
    this.sourceEvent,
    this.type});

  factory TAccountEntry.fromJson(Map<String, dynamic> json) {
    return TAccountEntry(
      balanceSnapshot: json['balanceSnapshot'] == null
          ? null
          : TMoney.fromJson(json['balanceSnapshot'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      delta: json['delta'] == null
          ? null
          : TMoney.fromJson(json['delta'] as Map<String, dynamic>),
      memo: json['memo'] as String,
      sourceEvent: json['sourceEvent'] == null
          ? null
          : TTurtleEvent.fromJson(json['sourceEvent'] as Map<String, dynamic>),
      type: json['type'] as String,
    );
  }
}

/// A user marked a card as completed.
class TCardCompleted implements TTurtleEvent {
  /// The user that marked the card as completed
  TUser actor;

  /// The user that marked the card as completed
  String actorId;

  /// The card that was completed
  TCard card;

  /// The card that was completed
  String cardId;

  String id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  TCardCompleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardCompleted.fromJson(Map<String, dynamic> json) {
    return TCardCompleted(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user posted a message to an activity feed.
class TFeedMessagePosted implements TTurtleEvent {
  /// The user that posted the message
  TUser actor;

  /// The user posted the message
  String actorId;

  /// The feed the message was posted to
  TFeed feed;

  /// The id of the message (also known as a feed event)
  String feedEventId;

  /// The feed the message was posted to
  String feedId;

  String id;

  /// The content of the message
  String messageBody;

  /// The project the feed belongs to.
  /// (Direct messages don't belong to projects so it will be null for direct messages.)
  ///
  String projectId;

  String requestId;

  String time;

  TFeedMessagePosted({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.messageBody,
    this.projectId,
    this.requestId,
    this.time});

  factory TFeedMessagePosted.fromJson(Map<String, dynamic> json) {
    return TFeedMessagePosted(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      messageBody: json['messageBody'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A new card was created.
/// If the card is a project (root card), then parentId will be null and the projectId will equal to the cardId.
///
class TCardCreated implements TTurtleEvent {
  /// The user that created the card
  TUser actor;

  /// The user that created the card
  String actorId;

  /// The card that was created.
  /// Note that this is the latest reference to the card. It's not a snapshot of the card when it was created.
  ///
  TCard card;

  /// The id of the newly created card
  String cardId;

  /// The name of the card. This is what shows up in a tree view of a task manager.
  String cardName;

  String id;

  /// The parent card it was created under. This is null if a root project-card was created.
  /// Note that this is the latest reference to the parent. It's not a snapshot of the card when it was created.
  ///
  TCard parent;

  /// The parent card it was created under. This is null if a root project-card was created.
  String parentId;

  /// The project that the card was created in. If a project-card was created, this is equal to the id of the card.
  String projectId;

  String requestId;

  String time;

  TCardCreated({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.cardName,
    this.id,
    this.parent,
    this.parentId,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardCreated.fromJson(Map<String, dynamic> json) {
    return TCardCreated(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
      id: json['id'] as String,
      parent: json['parent'] == null
          ? null
          : TCard.fromJson(json['parent'] as Map<String, dynamic>),
      parentId: json['parentId'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TReaction {
  /// The emoji of the reaction like "🐢"
  String emoji;

  String reaction;

  /// The id of the user that added the reaction
  String userId;

  TReaction({this.emoji, this.reaction, this.userId});

  factory TReaction.fromJson(Map<String, dynamic> json) {
    return TReaction(
      emoji: json['emoji'] as String,
      reaction: json['reaction'] as String,
      userId: json['userId'] as String,
    );
  }
}

class TCardBudgetUnset implements TTurtleEvent {
  TUser actor;

  String actorId;

  TCard card;

  String cardId;

  String id;

  String projectId;

  String requestId;

  String time;

  TCardBudgetUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardBudgetUnset.fromJson(Map<String, dynamic> json) {
    return TCardBudgetUnset(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Represents hourly work done by a contrator.
/// Whenever they do work, the contractor logs how much time was spent, the associated task, some notes about the work.
///
class TTimeEntry implements TDocumentToken {
  /// The date the entry was logged
  String addedAt;

  /// The card (task) the work was done for.
  TCard card;

  /// The contract id the time was billed under.
  /// This lets us understand the rates and conditions of the time.
  /// If a time entry is edited, the rate for the time entry's contract is used. (Not the currently active contract.)
  ///
  String contractId;

  /// The date the work was done.
  String date;

  /// Whether the time entry was deleted.
  /// Deleted time entries result in transaction reversals. This means customer is refunded.
  ///
  bool deleted;

  int duration;

  /// Whether the time entry was edited
  bool edited;

  String id;

  String memo;

  /// The user who did the work
  TUser user;

  TTimeEntry({this.addedAt,
    this.card,
    this.contractId,
    this.date,
    this.deleted,
    this.duration,
    this.edited,
    this.id,
    this.memo,
    this.user});

  factory TTimeEntry.fromJson(Map<String, dynamic> json) {
    return TTimeEntry(
      addedAt: json['addedAt'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      contractId: json['contractId'] as String,
      date: json['date'] as String,
      deleted: json['deleted'] as bool,
      duration: json['duration'] as int,
      edited: json['edited'] as bool,
      id: json['id'] as String,
      memo: json['memo'] as String,
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

/// A user was removed from a project
class TCardMemberRemoved implements TTurtleEvent {
  /// The user performing the action. The one who added the user to the project.
  TUser actor;

  /// The user performing the action. The one who added the user to the project.
  String actorId;

  /// The project the user was removed from
  TCard card;

  /// The id of the card
  String cardId;

  String id;

  /// The user that was removed from the project
  TUser member;

  String projectId;

  String requestId;

  String time;

  TCardMemberRemoved({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.member,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardMemberRemoved.fromJson(Map<String, dynamic> json) {
    return TCardMemberRemoved(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      member: json['member'] == null
          ? null
          : TUser.fromJson(json['member'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TCardBudgetIncreased implements TTurtleEvent {
  TUser actor;

  String actorId;

  TCardBudget budget;

  TCard card;

  String cardId;

  String id;

  String projectId;

  String requestId;

  String time;

  TCardBudgetIncreased({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardBudgetIncreased.fromJson(Map<String, dynamic> json) {
    return TCardBudgetIncreased(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      budget: json['budget'] == null
          ? null
          : TCardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TReactionRemoved implements TTurtleEvent {
  String actorId;

  String cardId;

  String feedEventId;

  String feedId;

  String id;

  String projectId;

  String reaction;

  String receiverId;

  String requestId;

  String time;

  TReactionRemoved({this.actorId,
    this.cardId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.reaction,
    this.receiverId,
    this.requestId,
    this.time});

  factory TReactionRemoved.fromJson(Map<String, dynamic> json) {
    return TReactionRemoved(
      actorId: json['actorId'] as String,
      cardId: json['cardId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      reaction: json['reaction'] as String,
      receiverId: json['receiverId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A range of duration, such as 1.5-2h.
class TDurationRange implements TDocumentToken {
  /// The upper bound of the range. If max is the same as min, then it represents a single value like 2h.
  int max;

  /// The lower bound of the range
  int min;

  TDurationRange({this.max, this.min});

  factory TDurationRange.fromJson(Map<String, dynamic> json) {
    return TDurationRange(
      max: json['max'] as int,
      min: json['min'] as int,
    );
  }
}

/// Object that namespaces data related to the current user
class TMe {
  /// All of the users reachable by the current user based on projects they've been on, users they have interacted with, etc.
  ///         Usually used if you want to give the user autocomplete.
  List<TUser> accessibleUsers;

  List<TTurtleEvent> events;

  int eventsCount;

  /// A list of conversations private/public current user is involved in. Sorted by last activity descending.
  List<TFeed> feeds;

  List<TPermission> permissions;

  /// The projects the current user is a member of
  List<TProject> projects;

  /// The number of messages unread by the current user
  int unreadCount;

  /// The current user object
  TUser user;

  TMe({this.accessibleUsers,
    this.events,
    this.eventsCount,
    this.feeds,
    this.permissions,
    this.projects,
    this.unreadCount,
    this.user});

  factory TMe.fromJson(Map<String, dynamic> json) {
    return TMe(
      accessibleUsers: (json['accessibleUsers'] as List)
          ?.map((e) =>
      e == null ? null : TUser.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      events: (json['events'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TTurtleEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventsCount: json['eventsCount'] as int,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
      e == null ? null : TFeed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      permissions: (json['permissions'] as List)
          ?.map((e) => TPermissionValues[e])
          ?.toList(),
      projects: (json['projects'] as List)
          ?.map((e) =>
      e == null ? null : TProject.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      unreadCount: json['unreadCount'] as int,
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

/// Represents the budget for a card. Currently only supports a time-based (not money-based) budget.
class TCardBudget {
  /// The max number of hours allocated
  int duration;

  TCardBudget({this.duration});

  factory TCardBudget.fromJson(Map<String, dynamic> json) {
    return TCardBudget(
      duration: json['duration'] as int,
    );
  }
}

class TCardEstimateSet implements TTurtleEvent {
  TUser actor;

  String actorId;

  TCard card;

  String cardId;

  TDurationRange estimate;

  String id;

  String projectId;

  String requestId;

  String time;

  TCardEstimateSet({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.estimate,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardEstimateSet.fromJson(Map<String, dynamic> json) {
    return TCardEstimateSet(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      estimate: json['estimate'] == null
          ? null
          : TDurationRange.fromJson(json['estimate'] as Map<String, dynamic>),
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TMoney {
  int amount;

  String currency;

  TMoney({this.amount, this.currency});

  factory TMoney.fromJson(Map<String, dynamic> json) {
    return TMoney(
      amount: json['amount'] as int,
      currency: json['currency'] as String,
    );
  }
}

class TCardDueDateUnset implements TTurtleEvent {
  /// The user that cleared the due date
  TUser actor;

  /// The user that cleared the due date
  String actorId;

  /// The card the due date was cleared for.
  /// Note that this is the latest reference to the card. It's not a snapshot of the card at the time of this event.
  ///
  TCard card;

  /// The card the due date was cleared for
  String cardId;

  String id;

  /// The project of the card
  String projectId;

  String requestId;

  String time;

  TCardDueDateUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardDueDateUnset.fromJson(Map<String, dynamic> json) {
    return TCardDueDateUnset(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// After paying someone, a manager recorded a payment in the accounting system.
/// Generates a transaction.
///
class TPayoutRecorded implements TTurtleEvent {
  /// The user that recorded the payout
  TUser actor;

  /// The user that recorded the payout
  String actorId;

  /// The amount of money paid to the freelancer
  TMoney amount;

  /// The date the payment was made
  String date;

  /// The transaction fee that was paid to the 3rd party provider.
  TMoney fee;

  String id;

  /// Any notes about the payment
  String memo;

  /// The type of payment. For example, ach, paypal, adjustment.
  String method;

  /// The 3rd party identifier for the payout. For example, with Payoneer, this would be the payment id you find by logging into Payoneer.
  ///
  String payoutId;

  String requestId;

  String time;

  /// The user that was paid
  TUser user;

  /// The user that was paid
  String userId;

  TPayoutRecorded({this.actor,
    this.actorId,
    this.amount,
    this.date,
    this.fee,
    this.id,
    this.memo,
    this.method,
    this.payoutId,
    this.requestId,
    this.time,
    this.user,
    this.userId});

  factory TPayoutRecorded.fromJson(Map<String, dynamic> json) {
    return TPayoutRecorded(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      amount: json['amount'] == null
          ? null
          : TMoney.fromJson(json['amount'] as Map<String, dynamic>),
      date: json['date'] as String,
      fee: json['fee'] == null
          ? null
          : TMoney.fromJson(json['fee'] as Map<String, dynamic>),
      id: json['id'] as String,
      memo: json['memo'] as String,
      method: json['method'] as String,
      payoutId: json['payoutId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['userId'] as String,
    );
  }
}

/// A card was move from one parent to another
class TCardMoved implements TTurtleEvent {
  /// The user who moved the card
  TUser actor;

  /// The user who moved the card
  String actorId;

  /// The card that was moved
  TCard card;

  /// The card that was moved
  String cardId;

  String id;

  /// The project the card was moved within. Currently cards can only be moved within a project.
  String projectId;

  String requestId;

  String time;

  /// The new parent the card was moved under
  TCard to;

  /// The new parent the card was moved under
  String toId;

  TCardMoved({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time,
    this.to,
    this.toId});

  factory TCardMoved.fromJson(Map<String, dynamic> json) {
    return TCardMoved(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      to: json['to'] == null
          ? null
          : TCard.fromJson(json['to'] as Map<String, dynamic>),
      toId: json['toId'] as String,
    );
  }
}

class TTwilioAuth {
  String token;

  TTwilioAuth({this.token});

  factory TTwilioAuth.fromJson(Map<String, dynamic> json) {
    return TTwilioAuth(
      token: json['token'] as String,
    );
  }
}

class TCardEstimateUnset implements TTurtleEvent {
  TUser actor;

  String actorId;

  TCard card;

  String cardId;

  String id;

  String projectId;

  String requestId;

  String time;

  TCardEstimateUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardEstimateUnset.fromJson(Map<String, dynamic> json) {
    return TCardEstimateUnset(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TFeedEvent {
  /// The user that posted the message or performed the action which generated the event.
  TUser actor;

  /// A string that represents the message that was posted or a text-summary of the event.
  /// Such as "set due date to @date"
  ///
  String body;

  /// An array of tokens used when rendering a message body.
  /// It may look like types of [string, date, file, ...]
  /// On the client, you could map over the array and convert each item to a widget that is rendered from left to right.
  ///
  List<TDocumentToken> bodyTokens;

  /// The time the feed event was posted if it was a message or the time the event was generated.
  String createdAt;

  /// Whether the message was edited. Also applies to other edits like time entries.
  bool edited;

  /// The time of the edit if edited=true
  String editedAt;

  /// The domain event that corresponds to this feed event.
  TTurtleEvent event;

  /// The feed id this belongs to
  String feedId;

  /// Unique identifier of the feed event. It is time-ordered so sorting by ids results in order of creation.
  String id;

  /// An array of individual reactions to messages. Multiple users reacting with the same emoji results in distinct records.
  List<TReaction> reactions;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  TFeedEvent({this.actor,
    this.body,
    this.bodyTokens,
    this.createdAt,
    this.edited,
    this.editedAt,
    this.event,
    this.feedId,
    this.id,
    this.reactions,
    this.version});

  factory TFeedEvent.fromJson(Map<String, dynamic> json) {
    return TFeedEvent(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      body: json['body'] as String,
      bodyTokens: (json['bodyTokens'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TDocumentToken.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      createdAt: json['createdAt'] as String,
      edited: json['edited'] as bool,
      editedAt: json['editedAt'] as String,
      event: json['event'] == null
          ? null
          : TTurtleEvent.fromJson(json['event'] as Map<String, dynamic>),
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      reactions: (json['reactions'] as List)
          ?.map((e) =>
      e == null ? null : TReaction.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      version: json['version'] as String,
    );
  }
}

/// Every time a notifition is delivered, delivery record is created to keep track of information about the delivery.
/// Used for debugging when (and if) a user is receiving notifiations.
///
class TNotificationDelivery {
  /// When the message about the notification was delivered
  String deliveredAt;

  /// The activity feed that the notification originated from
  TFeed feed;

  /// The exact feed event (message) the notification originated from
  TFeedEvent feedEvent;

  String id;

  /// The user the notification was delivered to.
  TUser recipient;

  /// The medium of delivery. Currently can be push or email.
  TNotificationDeliveryType type;

  TNotificationDelivery({this.deliveredAt,
    this.feed,
    this.feedEvent,
    this.id,
    this.recipient,
    this.type});

  factory TNotificationDelivery.fromJson(Map<String, dynamic> json) {
    return TNotificationDelivery(
      deliveredAt: json['deliveredAt'] as String,
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEvent: json['feedEvent'] == null
          ? null
          : TFeedEvent.fromJson(json['feedEvent'] as Map<String, dynamic>),
      id: json['id'] as String,
      recipient: json['recipient'] == null
          ? null
          : TUser.fromJson(json['recipient'] as Map<String, dynamic>),
      type: TNotificationDeliveryTypeValues[json['type']],
    );
  }
}

class TCardDueDateSet implements TTurtleEvent {
  /// The user that set the due date
  TUser actor;

  /// The user that set the due date
  String actorId;

  /// The card the due date was set for.
  /// Note that this is the latest reference to the card. It's not a snapshot of the card at the time of this event.
  ///
  TCard card;

  /// The card the due date was set for
  String cardId;

  String dueDate;

  String id;

  /// The project of the card
  String projectId;

  String requestId;

  String time;

  TCardDueDateSet({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.dueDate,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardDueDateSet.fromJson(Map<String, dynamic> json) {
    return TCardDueDateSet(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      dueDate: json['dueDate'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user edited deleted an existing message in a feed.
class TFeedMessageDeleted implements TTurtleEvent {
  /// The user that deleted the message
  TUser actor;

  /// The user that deleted the message
  String actorId;

  /// The feed the edited message belongs to
  TFeed feed;

  /// The id of the deleted message
  String feedEventId;

  /// The feed the edited message belongs to
  String feedId;

  String id;

  /// The project the feed belongs to.
  /// (Direct messages don't belong to projects so it will be null for direct messages.)
  ///
  String projectId;

  String requestId;

  String time;

  TFeedMessageDeleted({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TFeedMessageDeleted.fromJson(Map<String, dynamic> json) {
    return TFeedMessageDeleted(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Wrapper for a date scalar
class TDateObject implements TDocumentToken {
  ///
  String value;

  TDateObject({this.value});

  factory TDateObject.fromJson(Map<String, dynamic> json) {
    return TDateObject(
      value: json['value'] as String,
    );
  }
}

/// A user was added to a project.
class TCardMemberAdded implements TTurtleEvent {
  /// The user performing the action. The one who added the user to the project.
  TUser actor;

  /// The user performing the action. The one who added the user to the project.
  String actorId;

  /// The project the user was added to
  TCard card;

  /// The id of the card
  String cardId;

  String id;

  /// The user that was added to the project
  TUser member;

  /// The project the user was added to
  String projectId;

  String requestId;

  String time;

  TCardMemberAdded({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.member,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardMemberAdded.fromJson(Map<String, dynamic> json) {
    return TCardMemberAdded(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      member: json['member'] == null
          ? null
          : TUser.fromJson(json['member'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class THubspotPipeline {
  String id;

  String label;

  List<THubspotDealStage> stages;

  THubspotPipeline({this.id, this.label, this.stages});

  factory THubspotPipeline.fromJson(Map<String, dynamic> json) {
    return THubspotPipeline(
      id: json['id'] as String,
      label: json['label'] as String,
      stages: (json['stages'] as List)
          ?.map((e) =>
      e == null
          ? null
          : THubspotDealStage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

class TMeetingRecording {
  /// A CDN link to the video file for downloading/playing the video.
  String downloadUrl;

  /// The duration of the video recording.
  int duration;

  /// The file size in bytes.
  int fileSize;

  /// The file format of the video. For example mp4
  String format;

  String id;

  /// The resolution of the video. For example 640x480
  String resolution;

  TMeetingRecording({this.downloadUrl,
    this.duration,
    this.fileSize,
    this.format,
    this.id,
    this.resolution});

  factory TMeetingRecording.fromJson(Map<String, dynamic> json) {
    return TMeetingRecording(
      downloadUrl: json['downloadUrl'] as String,
      duration: json['duration'] as int,
      fileSize: json['fileSize'] as int,
      format: json['format'] as String,
      id: json['id'] as String,
      resolution: json['resolution'] as String,
    );
  }
}

/// A directional link between two cards in Turtle. Kind of like a hyperlink.
/// Used for things like tying an internal management project to a customer project.
///
class TCardLink {
  /// The card the link is coming from
  TCard from;

  /// The card the link is going to
  TCard to;

  /// The type of link. For example management or turtle_support.
  String type;

  TCardLink({this.from, this.to, this.type});

  factory TCardLink.fromJson(Map<String, dynamic> json) {
    return TCardLink(
      from: json['from'] == null
          ? null
          : TCard.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : TCard.fromJson(json['to'] as Map<String, dynamic>),
      type: json['type'] as String,
    );
  }
}

class THubspotDealStage {
  bool active;

  String closedWon;

  int displayOrder;

  String id;

  String label;

  double probability;

  THubspotDealStage({this.active,
    this.closedWon,
    this.displayOrder,
    this.id,
    this.label,
    this.probability});

  factory THubspotDealStage.fromJson(Map<String, dynamic> json) {
    return THubspotDealStage(
      active: json['active'] as bool,
      closedWon: json['closedWon'] as String,
      displayOrder: json['displayOrder'] as int,
      id: json['id'] as String,
      label: json['label'] as String,
      probability: json['probability'] as double,
    );
  }
}

/// A bank-account-like entity that is used for keeping track of balances for projects, contractors, and turtle itself.
///
class TAccount {
  /// The current balance of the account. Kind of like a Venmo/PayPal balance. It's the sum of all ledger in the account.
  TMoney balance;

  TMoney balancePending;

  TMoney balanceSettled;

  /// List of transaction entries for this account.
  List<TAccountEntry> entries;

  /// A unique identifier for the account of the form type:id
  /// For example turtle:management external:customer_deposits user:27981359507659557423658059497472, project:27157007491395523176927665389568
  /// For user and project accounts, it the second part is the identifier (user or project id) the account refers to.
  ///
  String id;

  /// The entity this account is associated with. Currently only applies to users or projects.
  TAccountSource source;

  TAccountType type;

  TAccount({this.balance,
    this.balancePending,
    this.balanceSettled,
    this.entries,
    this.id,
    this.source,
    this.type});

  factory TAccount.fromJson(Map<String, dynamic> json) {
    return TAccount(
      balance: json['balance'] == null
          ? null
          : TMoney.fromJson(json['balance'] as Map<String, dynamic>),
      balancePending: json['balancePending'] == null
          ? null
          : TMoney.fromJson(json['balancePending'] as Map<String, dynamic>),
      balanceSettled: json['balanceSettled'] == null
          ? null
          : TMoney.fromJson(json['balanceSettled'] as Map<String, dynamic>),
      entries: (json['entries'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TAccountEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      id: json['id'] as String,
      source: json['source'] == null
          ? null
          : TAccountSource.fromJson(json['source'] as Map<String, dynamic>),
      type: TAccountTypeValues[json['type']],
    );
  }
}

class TRootMutationType {
  String timeEntryDelete;

  TCard cardComplete;

  String userSetSkills;

  String projectAddBalanceWithStripe;

  /// Link or create HubSpot contact
  THubspotContact linkOrCreateHubSpotContact;

  String feedDeleteMessage;

  TCard cardUnassign;

  TUser cardInviteUser;

  String addReaction;

  String cardAddMember;

  TCard cardAssign;

  TCard cardBudgetDecrease;

  String updateAvailability;

  TCard cardUncomplete;

  String profileNameSet;

  String recordPayout;

  TCard cardDueDateSet;

  String timeEntryCreate;

  String feedMarkAsRead;

  TCard cardEstimateUnset;

  String removeReaction;

  String feedEditMessage;

  TCard cardDelete;

  String sendLowBalanceReminder;

  String timeEntryEdit;

  TCard cardDueDateUnset;

  TCard cardMove;

  String contractEnd;

  String profileTimezoneSet;

  TCard cardEstimateSet;

  String cardRemoveMember;

  String feedPostMessage;

  TCard cardBudgetUnset;

  TCard cardRename;

  String cardLinkCreate;

  TTwilioAuth meetingRoomJoin;

  String cardTagsSet;

  String accountOpen;

  String accountTransfer;

  String cardMetaSet;

  String contractStart;

  String cardLinkDelete;

  String userSetRoles;

  TCard cardBudgetIncrease;

  TCard cardCreate;

  TCard cardUndelete;

  TRootMutationType({this.timeEntryDelete,
    this.cardComplete,
    this.userSetSkills,
    this.projectAddBalanceWithStripe,
    this.linkOrCreateHubSpotContact,
    this.feedDeleteMessage,
    this.cardUnassign,
    this.cardInviteUser,
    this.addReaction,
    this.cardAddMember,
    this.cardAssign,
    this.cardBudgetDecrease,
    this.updateAvailability,
    this.cardUncomplete,
    this.profileNameSet,
    this.recordPayout,
    this.cardDueDateSet,
    this.timeEntryCreate,
    this.feedMarkAsRead,
    this.cardEstimateUnset,
    this.removeReaction,
    this.feedEditMessage,
    this.cardDelete,
    this.sendLowBalanceReminder,
    this.timeEntryEdit,
    this.cardDueDateUnset,
    this.cardMove,
    this.contractEnd,
    this.profileTimezoneSet,
    this.cardEstimateSet,
    this.cardRemoveMember,
    this.feedPostMessage,
    this.cardBudgetUnset,
    this.cardRename,
    this.cardLinkCreate,
    this.meetingRoomJoin,
    this.cardTagsSet,
    this.accountOpen,
    this.accountTransfer,
    this.cardMetaSet,
    this.contractStart,
    this.cardLinkDelete,
    this.userSetRoles,
    this.cardBudgetIncrease,
    this.cardCreate,
    this.cardUndelete});

  factory TRootMutationType.fromJson(Map<String, dynamic> json) {
    return TRootMutationType(
      timeEntryDelete: json['timeEntryDelete'] as String,
      cardComplete: json['cardComplete'] == null
          ? null
          : TCard.fromJson(json['cardComplete'] as Map<String, dynamic>),
      userSetSkills: json['userSetSkills'] as String,
      projectAddBalanceWithStripe:
      json['projectAddBalanceWithStripe'] as String,
      linkOrCreateHubSpotContact: json['linkOrCreateHubSpotContact'] == null
          ? null
          : THubspotContact.fromJson(
          json['linkOrCreateHubSpotContact'] as Map<String, dynamic>),
      feedDeleteMessage: json['feedDeleteMessage'] as String,
      cardUnassign: json['cardUnassign'] == null
          ? null
          : TCard.fromJson(json['cardUnassign'] as Map<String, dynamic>),
      cardInviteUser: json['cardInviteUser'] == null
          ? null
          : TUser.fromJson(json['cardInviteUser'] as Map<String, dynamic>),
      addReaction: json['addReaction'] as String,
      cardAddMember: json['cardAddMember'] as String,
      cardAssign: json['cardAssign'] == null
          ? null
          : TCard.fromJson(json['cardAssign'] as Map<String, dynamic>),
      cardBudgetDecrease: json['cardBudgetDecrease'] == null
          ? null
          : TCard.fromJson(json['cardBudgetDecrease'] as Map<String, dynamic>),
      updateAvailability: json['updateAvailability'] as String,
      cardUncomplete: json['cardUncomplete'] == null
          ? null
          : TCard.fromJson(json['cardUncomplete'] as Map<String, dynamic>),
      profileNameSet: json['profileNameSet'] as String,
      recordPayout: json['recordPayout'] as String,
      cardDueDateSet: json['cardDueDateSet'] == null
          ? null
          : TCard.fromJson(json['cardDueDateSet'] as Map<String, dynamic>),
      timeEntryCreate: json['timeEntryCreate'] as String,
      feedMarkAsRead: json['feedMarkAsRead'] as String,
      cardEstimateUnset: json['cardEstimateUnset'] == null
          ? null
          : TCard.fromJson(json['cardEstimateUnset'] as Map<String, dynamic>),
      removeReaction: json['removeReaction'] as String,
      feedEditMessage: json['feedEditMessage'] as String,
      cardDelete: json['cardDelete'] == null
          ? null
          : TCard.fromJson(json['cardDelete'] as Map<String, dynamic>),
      sendLowBalanceReminder: json['sendLowBalanceReminder'] as String,
      timeEntryEdit: json['timeEntryEdit'] as String,
      cardDueDateUnset: json['cardDueDateUnset'] == null
          ? null
          : TCard.fromJson(json['cardDueDateUnset'] as Map<String, dynamic>),
      cardMove: json['cardMove'] == null
          ? null
          : TCard.fromJson(json['cardMove'] as Map<String, dynamic>),
      contractEnd: json['contractEnd'] as String,
      profileTimezoneSet: json['profileTimezoneSet'] as String,
      cardEstimateSet: json['cardEstimateSet'] == null
          ? null
          : TCard.fromJson(json['cardEstimateSet'] as Map<String, dynamic>),
      cardRemoveMember: json['cardRemoveMember'] as String,
      feedPostMessage: json['feedPostMessage'] as String,
      cardBudgetUnset: json['cardBudgetUnset'] == null
          ? null
          : TCard.fromJson(json['cardBudgetUnset'] as Map<String, dynamic>),
      cardRename: json['cardRename'] == null
          ? null
          : TCard.fromJson(json['cardRename'] as Map<String, dynamic>),
      cardLinkCreate: json['cardLinkCreate'] as String,
      meetingRoomJoin: json['meetingRoomJoin'] == null
          ? null
          : TTwilioAuth.fromJson(
          json['meetingRoomJoin'] as Map<String, dynamic>),
      cardTagsSet: json['cardTagsSet'] as String,
      accountOpen: json['accountOpen'] as String,
      accountTransfer: json['accountTransfer'] as String,
      cardMetaSet: json['cardMetaSet'] as String,
      contractStart: json['contractStart'] as String,
      cardLinkDelete: json['cardLinkDelete'] as String,
      userSetRoles: json['userSetRoles'] as String,
      cardBudgetIncrease: json['cardBudgetIncrease'] == null
          ? null
          : TCard.fromJson(json['cardBudgetIncrease'] as Map<String, dynamic>),
      cardCreate: json['cardCreate'] == null
          ? null
          : TCard.fromJson(json['cardCreate'] as Map<String, dynamic>),
      cardUndelete: json['cardUndelete'] == null
          ? null
          : TCard.fromJson(json['cardUndelete'] as Map<String, dynamic>),
    );
  }
}

class TCard implements TAccountSource, TDocumentToken, TFeedSource {
  /// The user this card is assigned to
  TUser assignee;

  /// The id of the user this card is assigned to
  String assigneeId;

  /// Budgets specific to this card.
  /// For example a customer may set a 150h budget for a feature.
  /// Does not include budgets of child cards.
  ///
  TCardBudget budget;

  bool completed;

  /// The time when the card was most recently marked completed.
  String completedAt;

  /// The time the card was reated
  String createdAt;

  /// Whether the card is marked deleted or not. If a card is deleted, its children are also marked deleted.
  bool deleted;

  /// Child cards, grandchild cards, and so on. Can control depth and filters.
  List<TCard> descendants;

  String dueDate;

  /// Estimate for how long a developer this this task will take. For example 10-15h.
  /// Does not include estimates of child cards.
  ///
  TDurationRange estimate;

  /// The associated feed for this card. Every card has an activity feed.
  TFeed feed;

  /// The associated feed id for this card. Every card has an activity feed.
  String feedId;

  String id;

  /// The users that are members of the current card. Only applies to root project cards.
  List<TUser> members;

  String meta;

  /// The title of the card. This is what is usually rendered in a task list.
  String name;

  /// Card links that point from this card to another card.
  List<TCardLink> outgoingLinks;

  /// The id of the parent card. The root project card will not have this set.
  String parentId;

  /// An integer representing the order of this card with respect to its siblings.
  /// Frontend should sort children of a card by this propertly. There may be spaces like [1, 10, 15]
  ///
  int position;

  /// The project the card belongs to. The root card itself is a project. In this case projectId and id will be equal.
  TProject project;

  /// The id of the project the card belongs to. The root card itself is a project. In this case projectId and id will be equal.
  String projectId;

  /// All time entries tracked for this card.
  List<TTimeEntry> timeEntries;

  /// The total time tracked with time entries this card. Does not include time tracked on children.
  int timeTracked;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  TCard({this.assignee,
    this.assigneeId,
    this.budget,
    this.completed,
    this.completedAt,
    this.createdAt,
    this.deleted,
    this.descendants,
    this.dueDate,
    this.estimate,
    this.feed,
    this.feedId,
    this.id,
    this.members,
    this.meta,
    this.name,
    this.outgoingLinks,
    this.parentId,
    this.position,
    this.project,
    this.projectId,
    this.timeEntries,
    this.timeTracked,
    this.version});

  factory TCard.fromJson(Map<String, dynamic> json) {
    return TCard(
      assignee: json['assignee'] == null
          ? null
          : TUser.fromJson(json['assignee'] as Map<String, dynamic>),
      assigneeId: json['assigneeId'] as String,
      budget: json['budget'] == null
          ? null
          : TCardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      completed: json['completed'] as bool,
      completedAt: json['completedAt'] as String,
      createdAt: json['createdAt'] as String,
      deleted: json['deleted'] as bool,
      descendants: (json['descendants'] as List)
          ?.map((e) =>
      e == null ? null : TCard.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      dueDate: json['dueDate'] as String,
      estimate: json['estimate'] == null
          ? null
          : TDurationRange.fromJson(json['estimate'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      members: (json['members'] as List)
          ?.map((e) =>
      e == null ? null : TUser.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      meta: json['meta'] as String,
      name: json['name'] as String,
      outgoingLinks: (json['outgoingLinks'] as List)
          ?.map((e) =>
      e == null ? null : TCardLink.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      parentId: json['parentId'] as String,
      position: json['position'] as int,
      project: json['project'] == null
          ? null
          : TProject.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
      e == null ? null : TTimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timeTracked: json['timeTracked'] as int,
      version: json['version'] as String,
    );
  }
}

class TCommand {
  TUser actor;

  String executedAt;

  String id;

  String input;

  String requestId;

  String type;

  TCommand({this.actor,
    this.executedAt,
    this.id,
    this.input,
    this.requestId,
    this.type});

  factory TCommand.fromJson(Map<String, dynamic> json) {
    return TCommand(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      executedAt: json['executedAt'] as String,
      id: json['id'] as String,
      input: json['input'] as String,
      requestId: json['requestId'] as String,
      type: json['type'] as String,
    );
  }
}

/// A user deleted a time entry that they have already tracked.
/// The editable fields of a time entry are the duration, memo, and date.
/// This generates an adjustment for the contractor to refund Turtle and Turtle to refund the customer.
///
class TTimeEntryDeleted implements TTurtleEvent {
  /// The user that deleted the time entry. (It's possible that this may be different from the user who did the work.)
  TUser actor;

  /// The user that deleted the time entry. (It's possible that this may be different from the user who did the work.)
  String actorId;

  /// The card (task) that the use did work on.
  TCard card;

  /// The card (task) that the use did work on.
  String cardId;

  /// The associated contract under which the work was done. Of note is the customer rate and freelancer rate.
  /// If a time entry is deleted, this same contract will be used to avoid edge cases.
  ///
  TContract contract;

  /// The user that did the work. The generated transaction will transfer money into this users account.
  TUser contractor;

  String id;

  /// The duration (time worked) of the time entry before it was deleted
  int prevEntryDuration;

  /// The project the card belongs to.
  TCard project;

  /// The project the card belongs to.
  String projectId;

  String requestId;

  String time;

  /// A reference to the latest time entry.
  /// Note that this points to the most recent one so its attributes will include all past edits.
  ///
  TTimeEntry timeEntry;

  /// The id of the time entry that was edited
  String timeEntryId;

  TTimeEntryDeleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.contract,
    this.contractor,
    this.id,
    this.prevEntryDuration,
    this.project,
    this.projectId,
    this.requestId,
    this.time,
    this.timeEntry,
    this.timeEntryId});

  factory TTimeEntryDeleted.fromJson(Map<String, dynamic> json) {
    return TTimeEntryDeleted(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      contract: json['contract'] == null
          ? null
          : TContract.fromJson(json['contract'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : TUser.fromJson(json['contractor'] as Map<String, dynamic>),
      id: json['id'] as String,
      prevEntryDuration: json['prevEntryDuration'] as int,
      project: json['project'] == null
          ? null
          : TCard.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      timeEntry: json['timeEntry'] == null
          ? null
          : TTimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      timeEntryId: json['timeEntryId'] as String,
    );
  }
}

class TRootSubscriptionType {
  /// One or more attributes of a feed was updated.
  ///
  TFeedSubscription feedSubscriptionUpdated;

  /// One or more attributes of a feed was updated
  TFeed feedUpdated;

  /// The current user's number of unread messages has changed
  TMe unreadCountUpdated;

  TRootSubscriptionType({this.feedSubscriptionUpdated,
    this.feedUpdated,
    this.unreadCountUpdated});

  factory TRootSubscriptionType.fromJson(Map<String, dynamic> json) {
    return TRootSubscriptionType(
      feedSubscriptionUpdated: json['feedSubscriptionUpdated'] == null
          ? null
          : TFeedSubscription.fromJson(
          json['feedSubscriptionUpdated'] as Map<String, dynamic>),
      feedUpdated: json['feedUpdated'] == null
          ? null
          : TFeed.fromJson(json['feedUpdated'] as Map<String, dynamic>),
      unreadCountUpdated: json['unreadCountUpdated'] == null
          ? null
          : TMe.fromJson(json['unreadCountUpdated'] as Map<String, dynamic>),
    );
  }
}

class TProject {
  TMoney balance;

  TMoney budget;

  List<TContract> contracts;

  TMoney estimatedHourlyRate;

  List<TFeed> feeds;

  String id;

  String lastActivity;

  TCreditCard lastChargedCard;

  List<TCard> managerOverdueCards;

  List<TUser> managers;

  List<TUser> members;

  String meta;

  String name;

  List<String> projectStatusTags;

  TCard rootCard;

  List<TTimeEntry> timeEntries;

  TProject({this.balance,
    this.budget,
    this.contracts,
    this.estimatedHourlyRate,
    this.feeds,
    this.id,
    this.lastActivity,
    this.lastChargedCard,
    this.managerOverdueCards,
    this.managers,
    this.members,
    this.meta,
    this.name,
    this.projectStatusTags,
    this.rootCard,
    this.timeEntries});

  factory TProject.fromJson(Map<String, dynamic> json) {
    return TProject(
      balance: json['balance'] == null
          ? null
          : TMoney.fromJson(json['balance'] as Map<String, dynamic>),
      budget: json['budget'] == null
          ? null
          : TMoney.fromJson(json['budget'] as Map<String, dynamic>),
      contracts: (json['contracts'] as List)
          ?.map((e) =>
      e == null ? null : TContract.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      estimatedHourlyRate: json['estimatedHourlyRate'] == null
          ? null
          : TMoney.fromJson(
          json['estimatedHourlyRate'] as Map<String, dynamic>),
      feeds: (json['feeds'] as List)
          ?.map((e) =>
      e == null ? null : TFeed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      id: json['id'] as String,
      lastActivity: json['lastActivity'] as String,
      lastChargedCard: json['lastChargedCard'] == null
          ? null
          : TCreditCard.fromJson(
          json['lastChargedCard'] as Map<String, dynamic>),
      managerOverdueCards: (json['managerOverdueCards'] as List)
          ?.map((e) =>
      e == null ? null : TCard.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      managers: (json['managers'] as List)
          ?.map((e) =>
      e == null ? null : TUser.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      members: (json['members'] as List)
          ?.map((e) =>
      e == null ? null : TUser.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      meta: json['meta'] as String,
      name: json['name'] as String,
      projectStatusTags: (json['projectStatusTags'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      rootCard: json['rootCard'] == null
          ? null
          : TCard.fromJson(json['rootCard'] as Map<String, dynamic>),
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
      e == null ? null : TTimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// An entry representing how many hours/week a contractor wants to work.
/// This can be used to compare their desired workload with actual workload from time entries.
/// To simplify things, start and end dates currently must line up on a US calendar.
///
class TAvailabilityEntry {
  /// The user that logged the entry.  Might be a manager or the user self-reporting.
  TUser author;

  /// The user id that logged the entry. Might be a manager or the user self-reporting.
  String authorId;

  /// End of the time period (inclusive). Currently must be a Saturday, US end of the week.
  String endDate;

  /// The project in question.
  /// Contractors can report the total amount of time they'd like to work. (This field will be empty)
  /// Or contractors can report how much they would like to work specific to a project. (This field will refer to the project)
  ///
  TProject project;

  /// The project id in question.
  /// Contractors can report the total amount of time they'd like to work. (This field will be empty)
  /// Or contractors can report how much they would like to work specific to a project. (This field will refer to the project)
  ///
  String projectId;

  /// Start of the time period (inclusive). Currently must be a Sunday, US start of the week.
  String startDate;

  /// The amount of time during the startDate - endDate (inclusive) that the contractor wants to work
  int timePerWeek;

  /// The last time the entry was updated. If it was never edited, this is equal to the time of creation.
  String updatedAt;

  /// The contractor doing the work.
  TUser user;

  /// The contractor id doing the work
  String userId;

  TAvailabilityEntry({this.author,
    this.authorId,
    this.endDate,
    this.project,
    this.projectId,
    this.startDate,
    this.timePerWeek,
    this.updatedAt,
    this.user,
    this.userId});

  factory TAvailabilityEntry.fromJson(Map<String, dynamic> json) {
    return TAvailabilityEntry(
      author: json['author'] == null
          ? null
          : TUser.fromJson(json['author'] as Map<String, dynamic>),
      authorId: json['authorId'] as String,
      endDate: json['endDate'] as String,
      project: json['project'] == null
          ? null
          : TProject.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      startDate: json['startDate'] as String,
      timePerWeek: json['timePerWeek'] as int,
      updatedAt: json['updatedAt'] as String,
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['userId'] as String,
    );
  }
}

/// An activity feed that may be associated with a number of things.
/// Currently supports private 1-on-1 conversations and task-level conversations.
/// Contains user written messages and also activity-related messages like time tracking and task completion.
///
class TFeed {
  TCard card;

  /// List of feed events that belong to the activity feed. Sorted by time created ascending.
  List<TFeedEvent> feedEvents;

  /// The current user's subscription of this activity feed.
  TFeedSubscription feedSubscription;

  /// Unique identifier for an activity feed.
  ///     Generated based on what it is attached to like conversation-123-987, card-556, or meeting-abc
  String id;

  /// The most recent event/message in the activity feed
  TFeedEvent lastFeedEvent;

  TUser otherUser;

  /// If the feed is attached to a task, this is the project the task belongs to.
  ///       Useful if you want to show which project a message belong to.
  TCard project;

  /// The entity the activity feed is attached to.
  ///         It's either the other user in the conversation if it's a private message.
  ///         Or it's the card it's attached to.
  TFeedSource source;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  TFeed({this.card,
    this.feedEvents,
    this.feedSubscription,
    this.id,
    this.lastFeedEvent,
    this.otherUser,
    this.project,
    this.source,
    this.version});

  factory TFeed.fromJson(Map<String, dynamic> json) {
    return TFeed(
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      feedEvents: (json['feedEvents'] as List)
          ?.map((e) =>
      e == null ? null : TFeedEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedSubscription: json['feedSubscription'] == null
          ? null
          : TFeedSubscription.fromJson(
          json['feedSubscription'] as Map<String, dynamic>),
      id: json['id'] as String,
      lastFeedEvent: json['lastFeedEvent'] == null
          ? null
          : TFeedEvent.fromJson(json['lastFeedEvent'] as Map<String, dynamic>),
      otherUser: json['otherUser'] == null
          ? null
          : TUser.fromJson(json['otherUser'] as Map<String, dynamic>),
      project: json['project'] == null
          ? null
          : TCard.fromJson(json['project'] as Map<String, dynamic>),
      source: json['source'] == null
          ? null
          : TFeedSource.fromJson(json['source'] as Map<String, dynamic>),
      version: json['version'] as String,
    );
  }
}

/// A file stored on S3 that was uploaded by a user.
class TFile implements TDocumentToken {
  /// The mime content type
  String contentType;

  /// The url for downloading a file to the users local computer. Used on the client when a download link is necessary.
  String downloadUri;

  String id;

  /// The name of the file
  String name;

  /// The file path on S3 such as 'prod/uploads/27609051001642272405679805693952/somevid.mp4'
  String path;

  /// Size of the file in bytes
  int size;

  /// If the file is an image, this will be set to a url that lets you resize it to a thumbnail size.
  /// The client can append parameters to dynamically resize the image such as ?w=400&h=400&fit=fillmax
  /// See https://docs.imgix.com/apis/url for more information.
  ///
  String thumbnailUri;

  /// The CDN url to the file. Can link to here, for example, if a video player needs to point to the file's url.
  String uri;

  /// The user id that uploaded the file
  String userId;

  TFile({this.contentType,
    this.downloadUri,
    this.id,
    this.name,
    this.path,
    this.size,
    this.thumbnailUri,
    this.uri,
    this.userId});

  factory TFile.fromJson(Map<String, dynamic> json) {
    return TFile(
      contentType: json['contentType'] as String,
      downloadUri: json['downloadUri'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      size: json['size'] as int,
      thumbnailUri: json['thumbnailUri'] as String,
      uri: json['uri'] as String,
      userId: json['userId'] as String,
    );
  }
}

class TRootQueryType {
  /// Fetch an account by its id
  TAccount account;

  List<TAccount> accounts;

  List<TProject> activeProjects;

  String apiVersion;

  List<TAvailabilityEntry> availabilityEntries;

  /// Fetch a card by its id
  TCard card;

  /// All cards current user has access to.
  ///
  List<TCard> cards;

  TCommand command;

  /// Fetch a feed by its id
  TFeed feed;

  /// Fetch a feed event by id
  TFeedEvent feedEvent;

  /// All feed events the current user has access to.
  ///
  List<TFeedEvent> feedEvents;

  /// Feed subscriptions for the current user.
  ///
  List<TFeedSubscription> feedSubscriptions;

  /// All feeds the current user has access to.
  ///
  List<TFeed> feeds;

  THubspotPipeline hubspotPipeline;

  TMe me;

  TMeeting meeting;

  List<TMeeting> meetings;

  List<TNotificationDelivery> notificationDeliveries;

  TProject project;

  List<TProject> projects;

  List<TTimeEntry> timeEntries;

  /// Fetch a time entry by its id
  TTimeEntry timeEntry;

  /// Fetch a user by id
  TUser user;

  List<TUser> users;

  TRootQueryType({this.account,
    this.accounts,
    this.activeProjects,
    this.apiVersion,
    this.availabilityEntries,
    this.card,
    this.cards,
    this.command,
    this.feed,
    this.feedEvent,
    this.feedEvents,
    this.feedSubscriptions,
    this.feeds,
    this.hubspotPipeline,
    this.me,
    this.meeting,
    this.meetings,
    this.notificationDeliveries,
    this.project,
    this.projects,
    this.timeEntries,
    this.timeEntry,
    this.user,
    this.users});

  factory TRootQueryType.fromJson(Map<String, dynamic> json) {
    return TRootQueryType(
      account: json['account'] == null
          ? null
          : TAccount.fromJson(json['account'] as Map<String, dynamic>),
      accounts: (json['accounts'] as List)
          ?.map((e) =>
      e == null ? null : TAccount.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      activeProjects: (json['activeProjects'] as List)
          ?.map((e) =>
      e == null ? null : TProject.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      apiVersion: json['apiVersion'] as String,
      availabilityEntries: (json['availabilityEntries'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TAvailabilityEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cards: (json['cards'] as List)
          ?.map((e) =>
      e == null ? null : TCard.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      command: json['command'] == null
          ? null
          : TCommand.fromJson(json['command'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEvent: json['feedEvent'] == null
          ? null
          : TFeedEvent.fromJson(json['feedEvent'] as Map<String, dynamic>),
      feedEvents: (json['feedEvents'] as List)
          ?.map((e) =>
      e == null ? null : TFeedEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedSubscriptions: (json['feedSubscriptions'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TFeedSubscription.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feeds: (json['feeds'] as List)
          ?.map((e) =>
      e == null ? null : TFeed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      hubspotPipeline: json['hubspotPipeline'] == null
          ? null
          : THubspotPipeline.fromJson(
          json['hubspotPipeline'] as Map<String, dynamic>),
      me: json['me'] == null
          ? null
          : TMe.fromJson(json['me'] as Map<String, dynamic>),
      meeting: json['meeting'] == null
          ? null
          : TMeeting.fromJson(json['meeting'] as Map<String, dynamic>),
      meetings: (json['meetings'] as List)
          ?.map((e) =>
      e == null ? null : TMeeting.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      notificationDeliveries: (json['notificationDeliveries'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TNotificationDelivery.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      project: json['project'] == null
          ? null
          : TProject.fromJson(json['project'] as Map<String, dynamic>),
      projects: (json['projects'] as List)
          ?.map((e) =>
      e == null ? null : TProject.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
      e == null ? null : TTimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timeEntry: json['timeEntry'] == null
          ? null
          : TTimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
      users: (json['users'] as List)
          ?.map((e) =>
      e == null ? null : TUser.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// Link to an internet webpage or an internal turtle link (like card or user)
class TLink implements TDocumentToken {
  /// The title of the link. It's either the name of the entity or left blank.
  String title;

  /// The type of entity that is linked to. It can be user, card, or link (default).
  String type;

  /// The http://... url this goes to
  String uri;

  TLink({this.title, this.type, this.uri});

  factory TLink.fromJson(Map<String, dynamic> json) {
    return TLink(
      title: json['title'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }
}

/// When new events are generated, a notification service decides which users should be notified of the event.
/// This could include events like users posting messages, tasks getting completed, and so on.
/// When a user should be notified of an event, this event is generated.
/// This, in combination with [UserReadFeedEvent], can be used to generate unread counts per feed.
///
class TUserUnreadFeedEvent implements TTurtleEvent {
  /// The user that should be notified of this event
  String actorId;

  /// The event itself that the user should be notified about
  String feedEventId;

  /// The feed the event belongs to
  String feedId;

  String id;

  String requestId;

  String time;

  TUserUnreadFeedEvent({this.actorId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.requestId,
    this.time});

  factory TUserUnreadFeedEvent.fromJson(Map<String, dynamic> json) {
    return TUserUnreadFeedEvent(
      actorId: json['actorId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TUser implements TAccountSource, TDocumentToken, TFeedSource {
  /// The number of contracts the user currently has active.
  int activeContractsCount;

  /// Active contracts the user currently has
  List<TContract> contracts;

  String email;

  /// Activity feeds the user currently has access to. Sorted by most recently active first.
  List<TFeed> feeds;

  THubspotContact hubspotContact;

  /// Unique identifier for the user. A user may have multiple identies connected to a single user.
  String id;

  /// The full name of the user. Will be taken from their Google account on initial login. Can be overridden in their profile.
  String name;

  String photo;

  /// Projects the user is currently a member of.
  List<TProject> projects;

  /// The system-wide rules a user has.
  List<TRole> roles;

  /// The registration status of the user. Can currently be either invited or active.
  String status;

  /// The time entries tracked by the current user
  List<TTimeEntry> timeEntries;

  /// The timezone of the user related currently based on what we read from the browser.
  String timezone;

  TUser({this.activeContractsCount,
    this.contracts,
    this.email,
    this.feeds,
    this.hubspotContact,
    this.id,
    this.name,
    this.photo,
    this.projects,
    this.roles,
    this.status,
    this.timeEntries,
    this.timezone});

  factory TUser.fromJson(Map<String, dynamic> json) {
    return TUser(
      activeContractsCount: json['activeContractsCount'] as int,
      contracts: (json['contracts'] as List)
          ?.map((e) =>
      e == null ? null : TContract.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      email: json['email'] as String,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
      e == null ? null : TFeed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      hubspotContact: json['hubspotContact'] == null
          ? null
          : THubspotContact.fromJson(
          json['hubspotContact'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      projects: (json['projects'] as List)
          ?.map((e) =>
      e == null ? null : TProject.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      roles: (json['roles'] as List)?.map((e) => TRoleValues[e])?.toList(),
      status: json['status'] as String,
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
      e == null ? null : TTimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timezone: json['timezone'] as String,
    );
  }
}

/// A user was charged on their credit card.
/// Generates a transaction.
///
class TStripeChargeCreated implements TTurtleEvent {
  /// The user that charged the credit card.
  /// Currently only used when a customer refills their balance using a credit card
  /// May not necessarily be the owner of the credit card. Could be a manager.
  ///
  TUser actor;

  /// The credit card that was charged
  TCreditCard creditCard;

  String id;

  String last4;

  /// The project the charge was associated wtih.
  TCard project;

  String requestId;

  String time;

  TStripeChargeCreated({this.actor,
    this.creditCard,
    this.id,
    this.last4,
    this.project,
    this.requestId,
    this.time});

  factory TStripeChargeCreated.fromJson(Map<String, dynamic> json) {
    return TStripeChargeCreated(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      creditCard: json['creditCard'] == null
          ? null
          : TCreditCard.fromJson(json['creditCard'] as Map<String, dynamic>),
      id: json['id'] as String,
      last4: json['last4'] as String,
      project: json['project'] == null
          ? null
          : TCard.fromJson(json['project'] as Map<String, dynamic>),
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card's assignee was removed
class TCardUnassigned implements TTurtleEvent {
  /// The user that removed the assignee
  TUser actor;

  /// The user that removed the assignee
  String actorId;

  /// The card that the assignee was removed for
  TCard card;

  /// The card that the assignee was removed for
  String cardId;

  String id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  TCardUnassigned({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory TCardUnassigned.fromJson(Map<String, dynamic> json) {
    return TCardUnassigned(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// The subscription for a specific user and feed.
/// Contains user-specific info like unread counts.
///
class TFeedSubscription {
  /// The feed being subscribed to
  String feedId;

  String id;

  TFeedSubscriptionStatus status;

  /// The number of unread messages in the feed for the user
  int unreadCount;

  /// The user subscribed to the feed
  String userId;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  TFeedSubscription({this.feedId,
    this.id,
    this.status,
    this.unreadCount,
    this.userId,
    this.version});

  factory TFeedSubscription.fromJson(Map<String, dynamic> json) {
    return TFeedSubscription(
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      status: TFeedSubscriptionStatusValues[json['status']],
      unreadCount: json['unreadCount'] as int,
      userId: json['userId'] as String,
      version: json['version'] as String,
    );
  }
}

class T__EnumValue {
  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  T__EnumValue(
      {this.deprecationReason, this.description, this.isDeprecated, this.name});

  factory T__EnumValue.fromJson(Map<String, dynamic> json) {
    return T__EnumValue(
      deprecationReason: json['deprecationReason'] as String,
      description: json['description'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      name: json['name'] as String,
    );
  }
}

/// Represents a directive
class T__Directive {
  List<T__InputValue> args;

  String description;

  List<T__DirectiveLocation> locations;

  String name;

  bool onField;

  bool onFragment;

  bool onOperation;

  T__Directive({this.args,
    this.description,
    this.locations,
    this.name,
    this.onField,
    this.onFragment,
    this.onOperation});

  factory T__Directive.fromJson(Map<String, dynamic> json) {
    return T__Directive(
      args: (json['args'] as List)
          ?.map((e) =>
      e == null
          ? null
          : T__InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      locations: (json['locations'] as List)
          ?.map((e) => T__DirectiveLocationValues[e])
          ?.toList(),
      name: json['name'] as String,
      onField: json['onField'] as bool,
      onFragment: json['onFragment'] as bool,
      onOperation: json['onOperation'] as bool,
    );
  }
}

class T__InputValue {
  String defaultValue;

  String description;

  String name;

  T__Type type;

  T__InputValue({this.defaultValue, this.description, this.name, this.type});

  factory T__InputValue.fromJson(Map<String, dynamic> json) {
    return T__InputValue(
      defaultValue: json['defaultValue'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      type: json['type'] == null
          ? null
          : T__Type.fromJson(json['type'] as Map<String, dynamic>),
    );
  }
}

class T__Field {
  List<T__InputValue> args;

  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  T__Type type;

  T__Field({this.args,
    this.deprecationReason,
    this.description,
    this.isDeprecated,
    this.name,
    this.type});

  factory T__Field.fromJson(Map<String, dynamic> json) {
    return T__Field(
      args: (json['args'] as List)
          ?.map((e) =>
      e == null
          ? null
          : T__InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      deprecationReason: json['deprecationReason'] as String,
      description: json['description'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      name: json['name'] as String,
      type: json['type'] == null
          ? null
          : T__Type.fromJson(json['type'] as Map<String, dynamic>),
    );
  }
}

/// Represents scalars, interfaces, object types, unions, enums in the system
class T__Type {
  String description;

  List<T__EnumValue> enumValues;

  List<T__Field> fields;

  List<T__InputValue> inputFields;

  List<T__Type> interfaces;

  String kind;

  String name;

  T__Type ofType;

  List<T__Type> possibleTypes;

  T__Type({this.description,
    this.enumValues,
    this.fields,
    this.inputFields,
    this.interfaces,
    this.kind,
    this.name,
    this.ofType,
    this.possibleTypes});

  factory T__Type.fromJson(Map<String, dynamic> json) {
    return T__Type(
      description: json['description'] as String,
      enumValues: (json['enumValues'] as List)
          ?.map((e) =>
      e == null
          ? null
          : T__EnumValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      fields: (json['fields'] as List)
          ?.map((e) =>
      e == null ? null : T__Field.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      inputFields: (json['inputFields'] as List)
          ?.map((e) =>
      e == null
          ? null
          : T__InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      interfaces: (json['interfaces'] as List)
          ?.map((e) =>
      e == null ? null : T__Type.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      kind: json['kind'] as String,
      name: json['name'] as String,
      ofType: json['ofType'] == null
          ? null
          : T__Type.fromJson(json['ofType'] as Map<String, dynamic>),
      possibleTypes: (json['possibleTypes'] as List)
          ?.map((e) =>
      e == null ? null : T__Type.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// Represents a schema
class T__Schema {
  List<T__Directive> directives;

  T__Type mutationType;

  T__Type queryType;

  T__Type subscriptionType;

  List<T__Type> types;

  T__Schema({this.directives,
    this.mutationType,
    this.queryType,
    this.subscriptionType,
    this.types});

  factory T__Schema.fromJson(Map<String, dynamic> json) {
    return T__Schema(
      directives: (json['directives'] as List)
          ?.map((e) =>
      e == null
          ? null
          : T__Directive.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      mutationType: json['mutationType'] == null
          ? null
          : T__Type.fromJson(json['mutationType'] as Map<String, dynamic>),
      queryType: json['queryType'] == null
          ? null
          : T__Type.fromJson(json['queryType'] as Map<String, dynamic>),
      subscriptionType: json['subscriptionType'] == null
          ? null
          : T__Type.fromJson(json['subscriptionType'] as Map<String, dynamic>),
      types: (json['types'] as List)
          ?.map((e) =>
      e == null ? null : T__Type.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

enum TReadStatus {
  ALL,
  READ,
  SUBSCRIBED,
  UNREAD,
}

final TReadStatusValues = {
  "ALL": TReadStatus.ALL,
  "READ": TReadStatus.READ,
  "SUBSCRIBED": TReadStatus.SUBSCRIBED,
  "UNREAD": TReadStatus.UNREAD,
};
enum TMeetingStatus {
  COMPLETED,
  FAILED,
  IN_PROGRESS,
}

final TMeetingStatusValues = {
  "COMPLETED": TMeetingStatus.COMPLETED,
  "FAILED": TMeetingStatus.FAILED,
  "IN_PROGRESS": TMeetingStatus.IN_PROGRESS,
};
enum TNotificationDeliveryType {
  EMAIL,
  PUSH,
}

final TNotificationDeliveryTypeValues = {
  "EMAIL": TNotificationDeliveryType.EMAIL,
  "PUSH": TNotificationDeliveryType.PUSH,
};
enum TFeedSubscriptionStatus {
  DELETED,
  FOLLOWING,
  MUTED,
}

final TFeedSubscriptionStatusValues = {
  "DELETED": TFeedSubscriptionStatus.DELETED,
  "FOLLOWING": TFeedSubscriptionStatus.FOLLOWING,
  "MUTED": TFeedSubscriptionStatus.MUTED,
};
enum TRole {
  ADMIN,
  CONTRACTOR,
  CUSTOMER,
  MANAGER,
}

final TRoleValues = {
  "ADMIN": TRole.ADMIN,
  "CONTRACTOR": TRole.CONTRACTOR,
  "CUSTOMER": TRole.CUSTOMER,
  "MANAGER": TRole.MANAGER,
};
enum TAccountType {
  EXTERNAL,
  PROJECT,
  TURTLE,
  USER,
}

final TAccountTypeValues = {
  "EXTERNAL": TAccountType.EXTERNAL,
  "PROJECT": TAccountType.PROJECT,
  "TURTLE": TAccountType.TURTLE,
  "USER": TAccountType.USER,
};
enum TPermission {
  ADMIN_VIEW,
  MY_ACCOUNTING_VIEW,
  PROJECT_ACCOUNTING_VIEW,
  PROJECT_MEMBERS_MANAGE,
}

final TPermissionValues = {
  "ADMIN_VIEW": TPermission.ADMIN_VIEW,
  "MY_ACCOUNTING_VIEW": TPermission.MY_ACCOUNTING_VIEW,
  "PROJECT_ACCOUNTING_VIEW": TPermission.PROJECT_ACCOUNTING_VIEW,
  "PROJECT_MEMBERS_MANAGE": TPermission.PROJECT_MEMBERS_MANAGE,
};
enum T__DirectiveLocation {
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  MUTATION,
  QUERY,
  SUBSCRIPTION,
}

final T__DirectiveLocationValues = {
  "FIELD": T__DirectiveLocation.FIELD,
  "FRAGMENT_DEFINITION": T__DirectiveLocation.FRAGMENT_DEFINITION,
  "FRAGMENT_SPREAD": T__DirectiveLocation.FRAGMENT_SPREAD,
  "INLINE_FRAGMENT": T__DirectiveLocation.INLINE_FRAGMENT,
  "MUTATION": T__DirectiveLocation.MUTATION,
  "QUERY": T__DirectiveLocation.QUERY,
  "SUBSCRIPTION": T__DirectiveLocation.SUBSCRIPTION,
};

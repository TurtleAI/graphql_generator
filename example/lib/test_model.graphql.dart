// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GraphQLGenerator
// **************************************************************************

import 'package:meta/meta.dart';

abstract class TTurtleEvent {
  int id;

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

class TCardEstimateSetInput {
  TCardEstimateSetInput({@required this.cardId, @required this.estimate});

  String cardId;

  String estimate;

  factory TCardEstimateSetInput.fromJson(Map<String, dynamic> json) {
    return TCardEstimateSetInput(
      cardId: json['cardId'] as String,
      estimate: json['estimate'] as String,
    );
  }
}

class TFeedDeleteMessageInput {
  TFeedDeleteMessageInput({this.feedEventId});

  String feedEventId;

  factory TFeedDeleteMessageInput.fromJson(Map<String, dynamic> json) {
    return TFeedDeleteMessageInput(
      feedEventId: json['feedEventId'] as String,
    );
  }
}

class TCardInviteUserInput {
  TCardInviteUserInput({this.cardId, @required this.email});

  String cardId;

  String email;

  factory TCardInviteUserInput.fromJson(Map<String, dynamic> json) {
    return TCardInviteUserInput(
      cardId: json['cardId'] as String,
      email: json['email'] as String,
    );
  }
}

class TKv {
  TKv({this.k, this.v});

  String k;

  String v;

  factory TKv.fromJson(Map<String, dynamic> json) {
    return TKv(
      k: json['k'] as String,
      v: json['v'] as String,
    );
  }
}

class TProfileNameSetInput {
  TProfileNameSetInput({this.name});

  String name;

  factory TProfileNameSetInput.fromJson(Map<String, dynamic> json) {
    return TProfileNameSetInput(
      name: json['name'] as String,
    );
  }
}

class TCardUncompleteInput {
  TCardUncompleteInput({@required this.cardId});

  String cardId;

  factory TCardUncompleteInput.fromJson(Map<String, dynamic> json) {
    return TCardUncompleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardUndeleteInput {
  TCardUndeleteInput({@required this.cardId});

  String cardId;

  factory TCardUndeleteInput.fromJson(Map<String, dynamic> json) {
    return TCardUndeleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TTimeEntryEditInput {
  TTimeEntryEditInput({this.entryDate,
    this.entryDuration,
    @required this.entryId,
    this.entryMemo});

  String entryDate;

  bool entryDuration;

  String entryId;

  String entryMemo;

  factory TTimeEntryEditInput.fromJson(Map<String, dynamic> json) {
    return TTimeEntryEditInput(
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as bool,
      entryId: json['entryId'] as String,
      entryMemo: json['entryMemo'] as String,
    );
  }
}

class TAccountTransferInput {
  TAccountTransferInput({@required this.amount,
    @required this.destAccount,
    this.memo,
    @required this.sourceAccount});

  /// The amount of money to tarnsfer
  String amount;

  /// The account to put money in
  String destAccount;

  /// Some notes about the transaction. A customer may see this in their transactions screen.
  String memo;

  /// The account to take money from
  String sourceAccount;

  factory TAccountTransferInput.fromJson(Map<String, dynamic> json) {
    return TAccountTransferInput(
      amount: json['amount'] as String,
      destAccount: json['destAccount'] as String,
      memo: json['memo'] as String,
      sourceAccount: json['sourceAccount'] as String,
    );
  }
}

class TCardBudgetIncreaseInput {
  TCardBudgetIncreaseInput(
      {@required this.budgetDuration, @required this.cardId});

  bool budgetDuration;

  String cardId;

  factory TCardBudgetIncreaseInput.fromJson(Map<String, dynamic> json) {
    return TCardBudgetIncreaseInput(
      budgetDuration: json['budgetDuration'] as bool,
      cardId: json['cardId'] as String,
    );
  }
}

class TAccountOpenInput {
  TAccountOpenInput({@required this.accountId});

  /// Identifier for the account. Must be of the form like turtle:idofacct or external:idofacct
  String accountId;

  factory TAccountOpenInput.fromJson(Map<String, dynamic> json) {
    return TAccountOpenInput(
      accountId: json['accountId'] as String,
    );
  }
}

class TCardCreateInput {
  TCardCreateInput({this.afterId,
    this.assigneeId,
    this.beforeId,
    this.cardId,
    @required this.cardName,
    this.meta,
    this.parentId,
    this.quickAdd});

  /// The sibling card to place the new card after.
  String afterId;

  /// The user to assign the task to.
  String assigneeId;

  /// The sibling card to place the new card before.
  String beforeId;

  /// The id of the card. This is server-generated so pass in 'new' as the paramter.
  String cardId;

  /// The name to give the card. This is what will show up in task lists.
  ///
  String cardName;

  /// General purpose meta data for keeping track of anything you desire. For example, the source of the task.
  String meta;

  /// The parent id of the card to place the card under. Omit if you are creating a project.
  String parentId;

  bool quickAdd;

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

class TTimeEntryCreateInput {
  TTimeEntryCreateInput({@required this.cardId,
    @required this.entryDate,
    @required this.entryDuration,
    this.entryId,
    this.entryMemo});

  String cardId;

  String entryDate;

  bool entryDuration;

  String entryId;

  String entryMemo;

  factory TTimeEntryCreateInput.fromJson(Map<String, dynamic> json) {
    return TTimeEntryCreateInput(
      cardId: json['cardId'] as String,
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as bool,
      entryId: json['entryId'] as String,
      entryMemo: json['entryMemo'] as String,
    );
  }
}

class TCardTagsSetInput {
  TCardTagsSetInput({@required this.cardId, this.tagGroup, this.tags});

  String cardId;

  String tagGroup;

  List<String> tags;

  factory TCardTagsSetInput.fromJson(Map<String, dynamic> json) {
    return TCardTagsSetInput(
      cardId: json['cardId'] as String,
      tagGroup: json['tagGroup'] as String,
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    );
  }
}

class TCardLinkDeleteInput {
  TCardLinkDeleteInput(
      {@required this.fromId, @required this.linkType, @required this.toId});

  String fromId;

  String linkType;

  String toId;

  factory TCardLinkDeleteInput.fromJson(Map<String, dynamic> json) {
    return TCardLinkDeleteInput(
      fromId: json['fromId'] as String,
      linkType: json['linkType'] as String,
      toId: json['toId'] as String,
    );
  }
}

class TContractStartInput {
  TContractStartInput({this.contractId,
    @required this.contractorHourlyRate,
    @required this.contractorId,
    @required this.customerHourlyRate,
    @required this.projectId});

  /// Pass in 'new' on the client. The server will replace with a generated id.
  String contractId;

  /// How much the contractor earns per hour when they track time
  String contractorHourlyRate;

  /// The contractor the contract is tied to
  String contractorId;

  /// How much the customer gets billed per hour when the contractor tracks time
  String customerHourlyRate;

  /// The project the contract is tied to
  String projectId;

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

class TCardBudgetDecreaseInput {
  TCardBudgetDecreaseInput(
      {@required this.budgetDuration, @required this.cardId});

  bool budgetDuration;

  String cardId;

  factory TCardBudgetDecreaseInput.fromJson(Map<String, dynamic> json) {
    return TCardBudgetDecreaseInput(
      budgetDuration: json['budgetDuration'] as bool,
      cardId: json['cardId'] as String,
    );
  }
}

class TCardAssignInput {
  TCardAssignInput({@required this.assigneeId, @required this.cardId});

  /// The user to assign the card to. Self-assign by passing in the current user id.
  String assigneeId;

  /// The card to assign
  String cardId;

  factory TCardAssignInput.fromJson(Map<String, dynamic> json) {
    return TCardAssignInput(
      assigneeId: json['assigneeId'] as String,
      cardId: json['cardId'] as String,
    );
  }
}

class TUserSetRolesInput {
  TUserSetRolesInput({this.roles, @required this.userId});

  List<TRole> roles;

  String userId;

  factory TUserSetRolesInput.fromJson(Map<String, dynamic> json) {
    return TUserSetRolesInput(
      roles: (json['roles'] as List)?.map((e) => TRoleValues[e])?.toList(),
      userId: json['userId'] as String,
    );
  }
}

class TCardBudgetUnsetInput {
  TCardBudgetUnsetInput({@required this.cardId});

  String cardId;

  factory TCardBudgetUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardBudgetUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardUnassignInput {
  TCardUnassignInput({@required this.cardId});

  String cardId;

  factory TCardUnassignInput.fromJson(Map<String, dynamic> json) {
    return TCardUnassignInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TFeedPostMessageInput {
  TFeedPostMessageInput({@required this.feedId, @required this.messageBody});

  String feedId;

  String messageBody;

  factory TFeedPostMessageInput.fromJson(Map<String, dynamic> json) {
    return TFeedPostMessageInput(
      feedId: json['feedId'] as String,
      messageBody: json['messageBody'] as String,
    );
  }
}

class TCardDueDateSetInput {
  TCardDueDateSetInput({@required this.cardId, @required this.dueDate});

  /// The card to set the due date of
  String cardId;

  /// The due date to set it to
  String dueDate;

  factory TCardDueDateSetInput.fromJson(Map<String, dynamic> json) {
    return TCardDueDateSetInput(
      cardId: json['cardId'] as String,
      dueDate: json['dueDate'] as String,
    );
  }
}

class TCardMoveInput {
  TCardMoveInput({this.afterId,
    this.beforeId,
    @required this.cardId,
    @required this.toId});

  /// The sibling to move the card right after.
  /// Can't pass in beforeId and afterId together.
  ///
  String afterId;

  /// The sibling to move the card right before.
  /// Can't pass in beforeId and afterId together.
  ///
  String beforeId;

  /// The card to move
  String cardId;

  /// The new parent to move the card under.
  /// If you're just reordering the list relative to siblings, set this to the current parent.
  ///
  String toId;

  factory TCardMoveInput.fromJson(Map<String, dynamic> json) {
    return TCardMoveInput(
      afterId: json['afterId'] as String,
      beforeId: json['beforeId'] as String,
      cardId: json['cardId'] as String,
      toId: json['toId'] as String,
    );
  }
}

class TProjectAddBalanceWithStripeInput {
  TProjectAddBalanceWithStripeInput({@required this.amount,
    this.cardToken,
    this.creditCardId,
    @required this.projectId});

  String amount;

  String cardToken;

  String creditCardId;

  String projectId;

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

class TProfileTimezoneSetInput {
  TProfileTimezoneSetInput({this.timezone});

  String timezone;

  factory TProfileTimezoneSetInput.fromJson(Map<String, dynamic> json) {
    return TProfileTimezoneSetInput(
      timezone: json['timezone'] as String,
    );
  }
}

class TContractEndInput {
  TContractEndInput({@required this.contractId});

  String contractId;

  factory TContractEndInput.fromJson(Map<String, dynamic> json) {
    return TContractEndInput(
      contractId: json['contractId'] as String,
    );
  }
}

class TCardRenameInput {
  TCardRenameInput({@required this.cardId, @required this.cardName});

  /// The card to rename
  String cardId;

  /// The new name to give the card
  String cardName;

  factory TCardRenameInput.fromJson(Map<String, dynamic> json) {
    return TCardRenameInput(
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
    );
  }
}

class TCardDueDateUnsetInput {
  TCardDueDateUnsetInput({@required this.cardId});

  /// The card of the due date to clear
  String cardId;

  factory TCardDueDateUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardDueDateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TRecordPayoutInput {
  TRecordPayoutInput({@required this.amount,
    @required this.date,
    @required this.fee,
    this.memo,
    @required this.method,
    this.payoutId,
    @required this.userId});

  String amount;

  String date;

  String fee;

  String memo;

  String method;

  String payoutId;

  String userId;

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

class TCardDeleteInput {
  TCardDeleteInput({@required this.cardId});

  /// The id of the project/task to delete
  String cardId;

  factory TCardDeleteInput.fromJson(Map<String, dynamic> json) {
    return TCardDeleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TUpdateAvailabilityInput {
  TUpdateAvailabilityInput({@required this.endDate,
    this.projectId,
    @required this.startDate,
    @required this.timePerWeek,
    this.userId});

  String endDate;

  String projectId;

  String startDate;

  bool timePerWeek;

  String userId;

  factory TUpdateAvailabilityInput.fromJson(Map<String, dynamic> json) {
    return TUpdateAvailabilityInput(
      endDate: json['endDate'] as String,
      projectId: json['projectId'] as String,
      startDate: json['startDate'] as String,
      timePerWeek: json['timePerWeek'] as bool,
      userId: json['userId'] as String,
    );
  }
}

class TFeedEditMessageInput {
  TFeedEditMessageInput({this.feedEventId, this.messageBody});

  String feedEventId;

  String messageBody;

  factory TFeedEditMessageInput.fromJson(Map<String, dynamic> json) {
    return TFeedEditMessageInput(
      feedEventId: json['feedEventId'] as String,
      messageBody: json['messageBody'] as String,
    );
  }
}

class TRemoveReactionInput {
  TRemoveReactionInput({this.feedEventId, this.reaction});

  String feedEventId;

  String reaction;

  factory TRemoveReactionInput.fromJson(Map<String, dynamic> json) {
    return TRemoveReactionInput(
      feedEventId: json['feedEventId'] as String,
      reaction: json['reaction'] as String,
    );
  }
}

class TCardEstimateUnsetInput {
  TCardEstimateUnsetInput({@required this.cardId});

  String cardId;

  factory TCardEstimateUnsetInput.fromJson(Map<String, dynamic> json) {
    return TCardEstimateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TCardRemoveMemberInput {
  TCardRemoveMemberInput({@required this.cardId, @required this.memberId});

  /// The project to remove the user from
  String cardId;

  /// The user to remove from the project
  String memberId;

  factory TCardRemoveMemberInput.fromJson(Map<String, dynamic> json) {
    return TCardRemoveMemberInput(
      cardId: json['cardId'] as String,
      memberId: json['memberId'] as String,
    );
  }
}

class TFeedMarkAsReadInput {
  TFeedMarkAsReadInput({this.feedId});

  String feedId;

  factory TFeedMarkAsReadInput.fromJson(Map<String, dynamic> json) {
    return TFeedMarkAsReadInput(
      feedId: json['feedId'] as String,
    );
  }
}

class TTimeEntryDeleteInput {
  TTimeEntryDeleteInput({@required this.entryId});

  String entryId;

  factory TTimeEntryDeleteInput.fromJson(Map<String, dynamic> json) {
    return TTimeEntryDeleteInput(
      entryId: json['entryId'] as String,
    );
  }
}

class TUserSetSkillsInput {
  TUserSetSkillsInput({this.skills, @required this.userId});

  List<String> skills;

  String userId;

  factory TUserSetSkillsInput.fromJson(Map<String, dynamic> json) {
    return TUserSetSkillsInput(
      skills: (json['skills'] as List)?.map((e) => e as String)?.toList(),
      userId: json['userId'] as String,
    );
  }
}

class TAddReactionInput {
  TAddReactionInput({this.feedEventId, this.reaction});

  String feedEventId;

  String reaction;

  factory TAddReactionInput.fromJson(Map<String, dynamic> json) {
    return TAddReactionInput(
      feedEventId: json['feedEventId'] as String,
      reaction: json['reaction'] as String,
    );
  }
}

class TCardLinkCreateInput {
  TCardLinkCreateInput(
      {@required this.fromId, @required this.linkType, @required this.toId});

  String fromId;

  String linkType;

  String toId;

  factory TCardLinkCreateInput.fromJson(Map<String, dynamic> json) {
    return TCardLinkCreateInput(
      fromId: json['fromId'] as String,
      linkType: json['linkType'] as String,
      toId: json['toId'] as String,
    );
  }
}

class TCardAddMemberInput {
  TCardAddMemberInput({@required this.cardId, @required this.memberId});

  /// The id of the project
  String cardId;

  /// The id of the user to add to the project
  String memberId;

  factory TCardAddMemberInput.fromJson(Map<String, dynamic> json) {
    return TCardAddMemberInput(
      cardId: json['cardId'] as String,
      memberId: json['memberId'] as String,
    );
  }
}

class TCardCompleteInput {
  TCardCompleteInput({@required this.cardId});

  /// The card to mark as complete
  String cardId;

  factory TCardCompleteInput.fromJson(Map<String, dynamic> json) {
    return TCardCompleteInput(
      cardId: json['cardId'] as String,
    );
  }
}

class TSendLowBalanceReminderInput {
  TSendLowBalanceReminderInput({this.projectId, this.userId});

  String projectId;

  String userId;

  factory TSendLowBalanceReminderInput.fromJson(Map<String, dynamic> json) {
    return TSendLowBalanceReminderInput(
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
    );
  }
}

class TCardMetaSetInput {
  TCardMetaSetInput({@required this.cardId,
    @required this.metaKey,
    @required this.metaValue});

  String cardId;

  String metaKey;

  String metaValue;

  factory TCardMetaSetInput.fromJson(Map<String, dynamic> json) {
    return TCardMetaSetInput(
      cardId: json['cardId'] as String,
      metaKey: json['metaKey'] as String,
      metaValue: json['metaValue'] as String,
    );
  }
}

/// A user added a reaction to a feed event (message) in an activity feed.
/// Very similar to reactions work in popular work apps like Slack/Hipchat.
///
class TReactionAdded implements TTurtleEvent {
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

  /// The user that left the reaction
  String actorId;

  /// The card associated with a feed (if it's a task-level card-... type feed)
  String cardId;

  /// The feed event that the user reacted to
  String feedEventId;

  /// The feed that contains the feed event (message)
  String feedId;

  int id;

  /// The project the card belongs to (if it's a task-level card-... type feed)
  String projectId;

  /// The string that represents the reaction such as '🐢' 'OK' or '👍'
  String reaction;

  /// The other user in the private chat (if it's a private conversation-... feed)
  String receiverId;

  String requestId;

  String time;

  factory TReactionAdded.fromJson(Map<String, dynamic> json) {
    return TReactionAdded(
      actorId: json['actorId'] as String,
      cardId: json['cardId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      reaction: json['reaction'] as String,
      receiverId: json['receiverId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Every time a notifition is delivered, delivery record is created to keep track of information about the delivery.
/// Used for debugging when (and if) a user is receiving notifiations.
///
class TNotificationDelivery {
  TNotificationDelivery({this.deliveredAt,
    this.feed,
    this.feedEvent,
    this.id,
    this.recipient,
    this.type});

  /// When the message about the notification was delivered
  String deliveredAt;

  /// The activity feed that the notification originated from
  TFeed feed;

  /// The exact feed event (message) the notification originated from
  TFeedEvent feedEvent;

  int id;

  /// The user the notification was delivered to.
  TUser recipient;

  /// The medium of delivery. Currently can be push or email.
  TNotificationDeliveryType type;

  factory TNotificationDelivery.fromJson(Map<String, dynamic> json) {
    return TNotificationDelivery(
      deliveredAt: json['deliveredAt'] as String,
      feed: json['feed'] == null
          ? null
          : TFeed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEvent: json['feedEvent'] == null
          ? null
          : TFeedEvent.fromJson(json['feedEvent'] as Map<String, dynamic>),
      id: json['id'] as int,
      recipient: json['recipient'] == null
          ? null
          : TUser.fromJson(json['recipient'] as Map<String, dynamic>),
      type: TNotificationDeliveryTypeValues[json['type']],
    );
  }
}

/// After paying someone, a manager recorded a payment in the accounting system.
/// Generates a transaction.
///
class TPayoutRecorded implements TTurtleEvent {
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

  int id;

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
      id: json['id'] as int,
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

/// A card's assignee was removed
class TCardUnassigned implements TTurtleEvent {
  TCardUnassigned({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that removed the assignee
  TUser actor;

  /// The user that removed the assignee
  String actorId;

  /// The card that the assignee was removed for
  TCard card;

  /// The card that the assignee was removed for
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TRootSubscriptionType {
  TRootSubscriptionType({this.feedSubscriptionUpdated,
    this.feedUpdated,
    this.unreadCountUpdated});

  /// One or more attributes of a feed was updated.
  ///
  TFeedSubscription feedSubscriptionUpdated;

  /// One or more attributes of a feed was updated
  TFeed feedUpdated;

  /// The current user's number of unread messages has changed
  TMe unreadCountUpdated;

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

/// A user edited a time entry that they have already tracked.
/// The editable fields of a time entry are the duration, memo, and date.
/// If a memo and date was edited, it's just a simple edit of those attributes.
/// If the duration was edited, this generates an adjustment transaction to account for this change.
///
class TTimeEntryEdited implements TTurtleEvent {
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
  bool entryDuration;

  /// The modified memo of the time entry. Can be null if it was unmodified.
  String entryMemo;

  int id;

  /// The duration of the time entry before the time entry was edited.
  bool prevEntryDuration;

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
      entryDuration: json['entryDuration'] as bool,
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as int,
      prevEntryDuration: json['prevEntryDuration'] as bool,
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

/// A bank-account-like entity that is used for keeping track of balances for projects, contractors, and turtle itself.
///
class TAccount {
  TAccount({this.balance,
    this.balancePending,
    this.balanceSettled,
    this.entries,
    this.id,
    this.source,
    this.type});

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
  int id;

  /// The entity this account is associated with. Currently only applies to users or projects.
  TAccountSource source;

  TAccountType type;

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
      id: json['id'] as int,
      source: json['source'] == null
          ? null
          : TAccountSource.fromJson(json['source'] as Map<String, dynamic>),
      type: TAccountTypeValues[json['type']],
    );
  }
}

/// A user was added to a project.
class TCardMemberAdded implements TTurtleEvent {
  TCardMemberAdded({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.member,
    this.projectId,
    this.requestId,
    this.time});

  /// The user performing the action. The one who added the user to the project.
  TUser actor;

  /// The user performing the action. The one who added the user to the project.
  String actorId;

  /// The project the user was added to
  TCard card;

  /// The id of the card
  @Deprecated(
      'Use projectId instead since cardId will always point to a project.')
  String cardId;

  int id;

  /// The user that was added to the project
  TUser member;

  /// The project the user was added to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      member: json['member'] == null
          ? null
          : TUser.fromJson(json['member'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Wrapper for a date scalar
class TDateObject implements TDocumentToken {
  TDateObject({this.value});

  ///
  String value;

  factory TDateObject.fromJson(Map<String, dynamic> json) {
    return TDateObject(
      value: json['value'] as String,
    );
  }
}

/// A single accounting entry (event) for an account.
/// Whenever a transaction is generated, it has 2+ accounting entries.
///
class TAccountEntry {
  TAccountEntry({this.balanceSnapshot,
    this.createdAt,
    this.delta,
    this.memo,
    this.sourceEvent});

  /// The total balance at this moment. (Includes the delta applied.)
  TMoney balanceSnapshot;

  /// The time the account entry and its transaction were generated.
  String createdAt;

  /// The change in balance at this moment
  TMoney delta;

  /// If a memo was entered, the contents of the memo.
  String memo;

  /// The associated domain event that was used to generate this accounting entry and transaction.
  TTurtleEvent sourceEvent;

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
    );
  }
}

/// A user removed the estimate for a card (task)
class TCardEstimateUnset implements TTurtleEvent {
  TCardEstimateUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that set the estimate
  TUser actor;

  /// The user that removed the estimate
  String actorId;

  /// The card the estimate was removed for
  TCard card;

  /// The card the estimate was removed for
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user deleted a time entry that they have already tracked.
/// The editable fields of a time entry are the duration, memo, and date.
/// This generates an adjustment for the contractor to refund Turtle and Turtle to refund the customer.
///
class TTimeEntryDeleted implements TTurtleEvent {
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

  int id;

  /// The duration (time worked) of the time entry before it was deleted
  bool prevEntryDuration;

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
      id: json['id'] as int,
      prevEntryDuration: json['prevEntryDuration'] as bool,
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

/// A user edited deleted an existing message in a feed.
class TFeedMessageDeleted implements TTurtleEvent {
  TFeedMessageDeleted({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

  int id;

  /// The project the feed belongs to.
  /// (Direct messages don't belong to projects so it will be null for direct messages.)
  ///
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card was move from one parent to another
class TCardMoved implements TTurtleEvent {
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

  /// The user who moved the card
  TUser actor;

  /// The user who moved the card
  String actorId;

  /// The card that was moved
  TCard card;

  /// The card that was moved
  String cardId;

  int id;

  /// The project the card was moved within. Currently cards can only be moved within a project.
  String projectId;

  String requestId;

  String time;

  /// The new parent the card was moved under
  TCard to;

  /// The new parent the card was moved under
  String toId;

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
      id: json['id'] as int,
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

class TReaction {
  TReaction({this.emoji, this.reaction, this.userId});

  /// The emoji of the reaction like "🐢"
  String emoji;

  @Deprecated('Internal use')
  String reaction;

  /// The id of the user that added the reaction
  String userId;

  factory TReaction.fromJson(Map<String, dynamic> json) {
    return TReaction(
      emoji: json['emoji'] as String,
      reaction: json['reaction'] as String,
      userId: json['userId'] as String,
    );
  }
}

/// A user estimated how long a card (task) will take. For example 5-10h.
/// Also includes situtations when a user revises their estimate.
///
class TCardEstimateSet implements TTurtleEvent {
  TCardEstimateSet({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.estimate,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that set the estimate. Usually done by the person doing the work, but can be done by anyone.
  TUser actor;

  /// The user that set the estimate. Usually done by the person doing the work, but can be done by anyone.
  String actorId;

  /// The card the estimate was set for
  TCard card;

  /// The card the estimate was set for
  String cardId;

  /// The value the cards estimate was set to
  TDurationRange estimate;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A single instance of a video conference meeting. Has a start time, end time, participants and so on.
///
class TMeeting {
  TMeeting({this.duration,
    this.endedAt,
    this.id,
    this.participants,
    this.recording,
    this.roomId,
    this.startedAt,
    this.status});

  /// The time the meeting took. Does not have a value until the meeting has ended.
  bool duration;

  /// The time the meeting ended.
  /// Same as when the last parcipant left. When a room has been empty for 5 minutes, it is considered ended.
  ///
  String endedAt;

  String id;

  /// The users currently in the meeting.
  List<TUser> participants;

  /// The video recording of the meeting.
  /// Only applies to meetings that have happened in the past with recording enabled.
  ///
  TMeetingRecording recording;

  /// The room the meeting belongs to. For example project:27637534222268650867953431281664
  /// A room may only have one meeting going on at a time and all meetings belong to a room.
  ///
  String roomId;

  /// The time the meeting started.
  /// Same as when the first parcipant joined.
  ///
  String startedAt;

  TMeetingStatus status;

  factory TMeeting.fromJson(Map<String, dynamic> json) {
    return TMeeting(
      duration: json['duration'] as bool,
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

/// When a user has read an event, this event is generated.
/// This, in combination with [UserUnreadFeedEvent], can be used to generate unread counts per feed.
/// Note: UserReadFeedEvent is guaranteed to be unique and may not be balanced with [UserReadFeedEvent].
/// So make sure you process the events in an idempotent way. We intend to change this behavior in the future.
/// The meaning of "read" is determined by the client.
/// For example, it could be when a user clicks on an activity feed. Or when could be a user scrolls to see the message.
///
class TUserReadFeedEvent implements TTurtleEvent {
  TUserReadFeedEvent({this.actorId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.requestId,
    this.time});

  /// The user that read the event
  String actorId;

  /// The event itself that was read by the user
  String feedEventId;

  /// The feed the event belongs to
  String feedId;

  int id;

  String requestId;

  String time;

  factory TUserReadFeedEvent.fromJson(Map<String, dynamic> json) {
    return TUserReadFeedEvent(
      actorId: json['actorId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card was assigned to a user
class TCardAssigned implements TTurtleEvent {
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

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TMutation {
  sendLowBalanceReminder(TSendLowBalanceReminderInput input) async {
    return await query(document: """
	mutation sendLowBalanceReminder(\$input: TSendLowBalanceReminderInput! ){
	sendLowBalanceReminder(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  profileNameSet(TProfileNameSetInput input) async {
    return await query(document: """
	mutation profileNameSet(\$input: TProfileNameSetInput! ){
	profileNameSet(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  accountOpen(TAccountOpenInput input) async {
    return await query(document: """
	mutation accountOpen(\$input: TAccountOpenInput! ){
	accountOpen(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  profileTimezoneSet(TProfileTimezoneSetInput input) async {
    return await query(document: """
	mutation profileTimezoneSet(\$input: TProfileTimezoneSetInput! ){
	profileTimezoneSet(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardRemoveMember(TCardRemoveMemberInput input) async {
    return await query(document: """
	mutation cardRemoveMember(\$input: TCardRemoveMemberInput! ){
	cardRemoveMember(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  timeEntryDelete(TTimeEntryDeleteInput input) async {
    return await query(document: """
	mutation timeEntryDelete(\$input: TTimeEntryDeleteInput! ){
	timeEntryDelete(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardBudgetUnset(TCardBudgetUnsetInput input) async {
    return await query(document: """
	mutation cardBudgetUnset(\$input: TCardBudgetUnsetInput! ){
	cardBudgetUnset(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardUndelete(TCardUndeleteInput input) async {
    return await query(document: """
	mutation cardUndelete(\$input: TCardUndeleteInput! ){
	cardUndelete(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  userSetSkills(TUserSetSkillsInput input) async {
    return await query(document: """
	mutation userSetSkills(\$input: TUserSetSkillsInput! ){
	userSetSkills(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardRename(TCardRenameInput input) async {
    return await query(document: """
	mutation cardRename(\$input: TCardRenameInput! ){
	cardRename(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardDelete(TCardDeleteInput input) async {
    return await query(document: """
	mutation cardDelete(\$input: TCardDeleteInput! ){
	cardDelete(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardLinkCreate(TCardLinkCreateInput input) async {
    return await query(document: """
	mutation cardLinkCreate(\$input: TCardLinkCreateInput! ){
	cardLinkCreate(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardBudgetDecrease(TCardBudgetDecreaseInput input) async {
    return await query(document: """
	mutation cardBudgetDecrease(\$input: TCardBudgetDecreaseInput! ){
	cardBudgetDecrease(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  feedMarkAsRead(TFeedMarkAsReadInput input) async {
    return await query(document: """
	mutation feedMarkAsRead(\$input: TFeedMarkAsReadInput! ){
	feedMarkAsRead(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  updateAvailability(TUpdateAvailabilityInput input) async {
    return await query(document: """
	mutation updateAvailability(\$input: TUpdateAvailabilityInput! ){
	updateAvailability(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardDueDateSet(TCardDueDateSetInput input) async {
    return await query(document: """
	mutation cardDueDateSet(\$input: TCardDueDateSetInput! ){
	cardDueDateSet(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  recordPayout(TRecordPayoutInput input) async {
    return await query(document: """
	mutation recordPayout(\$input: TRecordPayoutInput! ){
	recordPayout(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  contractStart(TContractStartInput input) async {
    return await query(document: """
	mutation contractStart(\$input: TContractStartInput! ){
	contractStart(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardBudgetIncrease(TCardBudgetIncreaseInput input) async {
    return await query(document: """
	mutation cardBudgetIncrease(\$input: TCardBudgetIncreaseInput! ){
	cardBudgetIncrease(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  feedPostMessage(TFeedPostMessageInput input) async {
    return await query(document: """
	mutation feedPostMessage(\$input: TFeedPostMessageInput! ){
	feedPostMessage(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardLinkDelete(TCardLinkDeleteInput input) async {
    return await query(document: """
	mutation cardLinkDelete(\$input: TCardLinkDeleteInput! ){
	cardLinkDelete(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  linkOrCreateHubSpotContact(String userId) async {
    return await query(document: """
	mutation linkOrCreateHubSpotContact(\$userId: String! ){
	linkOrCreateHubSpotContact(userId:\$userId){FIELDS}
	}
	""", variables: {"userId": userId});
  }

  cardCreate(TCardCreateInput input) async {
    return await query(document: """
	mutation cardCreate(\$input: TCardCreateInput! ){
	cardCreate(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  feedEditMessage(TFeedEditMessageInput input) async {
    return await query(document: """
	mutation feedEditMessage(\$input: TFeedEditMessageInput! ){
	feedEditMessage(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  timeEntryEdit(TTimeEntryEditInput input) async {
    return await query(document: """
	mutation timeEntryEdit(\$input: TTimeEntryEditInput! ){
	timeEntryEdit(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardMetaSet(TCardMetaSetInput input) async {
    return await query(document: """
	mutation cardMetaSet(\$input: TCardMetaSetInput! ){
	cardMetaSet(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  feedDeleteMessage(TFeedDeleteMessageInput input) async {
    return await query(document: """
	mutation feedDeleteMessage(\$input: TFeedDeleteMessageInput! ){
	feedDeleteMessage(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardMove(TCardMoveInput input) async {
    return await query(document: """
	mutation cardMove(\$input: TCardMoveInput! ){
	cardMove(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  contractEnd(TContractEndInput input) async {
    return await query(document: """
	mutation contractEnd(\$input: TContractEndInput! ){
	contractEnd(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  timeEntryCreate(TTimeEntryCreateInput input) async {
    return await query(document: """
	mutation timeEntryCreate(\$input: TTimeEntryCreateInput! ){
	timeEntryCreate(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  removeReaction(TRemoveReactionInput input) async {
    return await query(document: """
	mutation removeReaction(\$input: TRemoveReactionInput! ){
	removeReaction(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardComplete(TCardCompleteInput input) async {
    return await query(document: """
	mutation cardComplete(\$input: TCardCompleteInput! ){
	cardComplete(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardDueDateUnset(TCardDueDateUnsetInput input) async {
    return await query(document: """
	mutation cardDueDateUnset(\$input: TCardDueDateUnsetInput! ){
	cardDueDateUnset(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardUncomplete(TCardUncompleteInput input) async {
    return await query(document: """
	mutation cardUncomplete(\$input: TCardUncompleteInput! ){
	cardUncomplete(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  projectAddBalanceWithStripe(TProjectAddBalanceWithStripeInput input) async {
    return await query(document: """
	mutation projectAddBalanceWithStripe(\$input: TProjectAddBalanceWithStripeInput! ){
	projectAddBalanceWithStripe(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  addReaction(TAddReactionInput input) async {
    return await query(document: """
	mutation addReaction(\$input: TAddReactionInput! ){
	addReaction(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  accountTransfer(TAccountTransferInput input) async {
    return await query(document: """
	mutation accountTransfer(\$input: TAccountTransferInput! ){
	accountTransfer(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardAssign(TCardAssignInput input) async {
    return await query(document: """
	mutation cardAssign(\$input: TCardAssignInput! ){
	cardAssign(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardInviteUser(TCardInviteUserInput input) async {
    return await query(document: """
	mutation cardInviteUser(\$input: TCardInviteUserInput! ){
	cardInviteUser(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardEstimateSet(TCardEstimateSetInput input) async {
    return await query(document: """
	mutation cardEstimateSet(\$input: TCardEstimateSetInput! ){
	cardEstimateSet(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  userSetRoles(TUserSetRolesInput input) async {
    return await query(document: """
	mutation userSetRoles(\$input: TUserSetRolesInput! ){
	userSetRoles(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardEstimateUnset(TCardEstimateUnsetInput input) async {
    return await query(document: """
	mutation cardEstimateUnset(\$input: TCardEstimateUnsetInput! ){
	cardEstimateUnset(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardAddMember(TCardAddMemberInput input) async {
    return await query(document: """
	mutation cardAddMember(\$input: TCardAddMemberInput! ){
	cardAddMember(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  cardTagsSet(TCardTagsSetInput input) async {
    return await query(document: """
	mutation cardTagsSet(\$input: TCardTagsSetInput! ){
	cardTagsSet(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }

  meetingRoomJoin(String projectId) async {
    return await query(document: """
	mutation meetingRoomJoin(\$projectId: String! ){
	meetingRoomJoin(projectId:\$projectId){FIELDS}
	}
	""", variables: {"projectId": projectId});
  }

  cardUnassign(TCardUnassignInput input) async {
    return await query(document: """
	mutation cardUnassign(\$input: TCardUnassignInput! ){
	cardUnassign(input:\$input){FIELDS}
	}
	""", variables: {"input": input});
  }
}

class TRootMutationType {
  TRootMutationType({this.sendLowBalanceReminder,
    this.profileNameSet,
    this.accountOpen,
    this.profileTimezoneSet,
    this.cardRemoveMember,
    this.timeEntryDelete,
    this.cardBudgetUnset,
    this.cardUndelete,
    this.userSetSkills,
    this.cardRename,
    this.cardDelete,
    this.cardLinkCreate,
    this.cardBudgetDecrease,
    this.feedMarkAsRead,
    this.updateAvailability,
    this.cardDueDateSet,
    this.recordPayout,
    this.contractStart,
    this.cardBudgetIncrease,
    this.feedPostMessage,
    this.cardLinkDelete,
    this.linkOrCreateHubSpotContact,
    this.cardCreate,
    this.feedEditMessage,
    this.timeEntryEdit,
    this.cardMetaSet,
    this.feedDeleteMessage,
    this.cardMove,
    this.contractEnd,
    this.timeEntryCreate,
    this.removeReaction,
    this.cardComplete,
    this.cardDueDateUnset,
    this.cardUncomplete,
    this.projectAddBalanceWithStripe,
    this.addReaction,
    this.accountTransfer,
    this.cardAssign,
    this.cardInviteUser,
    this.cardEstimateSet,
    this.userSetRoles,
    this.cardEstimateUnset,
    this.cardAddMember,
    this.cardTagsSet,
    this.meetingRoomJoin,
    this.cardUnassign});

  String sendLowBalanceReminder;

  String profileNameSet;

  /// Open an account if one doesn't already exist
  String accountOpen;

  String profileTimezoneSet;

  /// Remove a user from a project.
  /// They will lose access to everything in the project.
  ///
  String cardRemoveMember;

  String timeEntryDelete;

  TCard cardBudgetUnset;

  TCard cardUndelete;

  String userSetSkills;

  /// Change the name of a card (or project)
  TCard cardRename;

  /// Delete a card (project/task)
  TCard cardDelete;

  String cardLinkCreate;

  TCard cardBudgetDecrease;

  String feedMarkAsRead;

  String updateAvailability;

  /// Set the due date of a card.
  /// Use CardDueDateUnset to remove the due date.
  ///
  TCard cardDueDateSet;

  String recordPayout;

  /// Start a contract between a person and a project.
  /// This is required for a contractor to start billing time and working on a project so the accounting system can generate the proper transactions when time is tracked.
  /// Note: contracts are immutable. To change a contractor's rate, you must end a contract and start a new one.
  ///
  String contractStart;

  TCard cardBudgetIncrease;

  String feedPostMessage;

  String cardLinkDelete;

  /// Link or create HubSpot contact
  THubspotContact linkOrCreateHubSpotContact;

  /// Create a new card. This could either mean creating a project or a task.
  ///
  TCard cardCreate;

  String feedEditMessage;

  String timeEntryEdit;

  String cardMetaSet;

  String feedDeleteMessage;

  /// Move a card (task) from one location to another.
  /// Currently only possible to move cards that belong to a project within their own project.
  ///
  TCard cardMove;

  /// End a contract.
  /// This means time can no longer be tracked by a contractor to this project without a new contract being started.
  ///
  String contractEnd;

  String timeEntryCreate;

  String removeReaction;

  /// Mark a card as complete
  TCard cardComplete;

  /// Clear the due date of a card
  TCard cardDueDateUnset;

  TCard cardUncomplete;

  String projectAddBalanceWithStripe;

  String addReaction;

  /// Transfer money from one account to another.
  ///
  String accountTransfer;

  /// Assign a card to a user
  TCard cardAssign;

  TUser cardInviteUser;

  TCard cardEstimateSet;

  String userSetRoles;

  TCard cardEstimateUnset;

  /// Add a user to a project.
  String cardAddMember;

  String cardTagsSet;

  TTwilioAuth meetingRoomJoin;

  TCard cardUnassign;

  factory TRootMutationType.fromJson(Map<String, dynamic> json) {
    return TRootMutationType(
      sendLowBalanceReminder: json['sendLowBalanceReminder'] as String,
      profileNameSet: json['profileNameSet'] as String,
      accountOpen: json['accountOpen'] as String,
      profileTimezoneSet: json['profileTimezoneSet'] as String,
      cardRemoveMember: json['cardRemoveMember'] as String,
      timeEntryDelete: json['timeEntryDelete'] as String,
      cardBudgetUnset: json['cardBudgetUnset'] == null
          ? null
          : TCard.fromJson(json['cardBudgetUnset'] as Map<String, dynamic>),
      cardUndelete: json['cardUndelete'] == null
          ? null
          : TCard.fromJson(json['cardUndelete'] as Map<String, dynamic>),
      userSetSkills: json['userSetSkills'] as String,
      cardRename: json['cardRename'] == null
          ? null
          : TCard.fromJson(json['cardRename'] as Map<String, dynamic>),
      cardDelete: json['cardDelete'] == null
          ? null
          : TCard.fromJson(json['cardDelete'] as Map<String, dynamic>),
      cardLinkCreate: json['cardLinkCreate'] as String,
      cardBudgetDecrease: json['cardBudgetDecrease'] == null
          ? null
          : TCard.fromJson(json['cardBudgetDecrease'] as Map<String, dynamic>),
      feedMarkAsRead: json['feedMarkAsRead'] as String,
      updateAvailability: json['updateAvailability'] as String,
      cardDueDateSet: json['cardDueDateSet'] == null
          ? null
          : TCard.fromJson(json['cardDueDateSet'] as Map<String, dynamic>),
      recordPayout: json['recordPayout'] as String,
      contractStart: json['contractStart'] as String,
      cardBudgetIncrease: json['cardBudgetIncrease'] == null
          ? null
          : TCard.fromJson(json['cardBudgetIncrease'] as Map<String, dynamic>),
      feedPostMessage: json['feedPostMessage'] as String,
      cardLinkDelete: json['cardLinkDelete'] as String,
      linkOrCreateHubSpotContact: json['linkOrCreateHubSpotContact'] == null
          ? null
          : THubspotContact.fromJson(
          json['linkOrCreateHubSpotContact'] as Map<String, dynamic>),
      cardCreate: json['cardCreate'] == null
          ? null
          : TCard.fromJson(json['cardCreate'] as Map<String, dynamic>),
      feedEditMessage: json['feedEditMessage'] as String,
      timeEntryEdit: json['timeEntryEdit'] as String,
      cardMetaSet: json['cardMetaSet'] as String,
      feedDeleteMessage: json['feedDeleteMessage'] as String,
      cardMove: json['cardMove'] == null
          ? null
          : TCard.fromJson(json['cardMove'] as Map<String, dynamic>),
      contractEnd: json['contractEnd'] as String,
      timeEntryCreate: json['timeEntryCreate'] as String,
      removeReaction: json['removeReaction'] as String,
      cardComplete: json['cardComplete'] == null
          ? null
          : TCard.fromJson(json['cardComplete'] as Map<String, dynamic>),
      cardDueDateUnset: json['cardDueDateUnset'] == null
          ? null
          : TCard.fromJson(json['cardDueDateUnset'] as Map<String, dynamic>),
      cardUncomplete: json['cardUncomplete'] == null
          ? null
          : TCard.fromJson(json['cardUncomplete'] as Map<String, dynamic>),
      projectAddBalanceWithStripe:
      json['projectAddBalanceWithStripe'] as String,
      addReaction: json['addReaction'] as String,
      accountTransfer: json['accountTransfer'] as String,
      cardAssign: json['cardAssign'] == null
          ? null
          : TCard.fromJson(json['cardAssign'] as Map<String, dynamic>),
      cardInviteUser: json['cardInviteUser'] == null
          ? null
          : TUser.fromJson(json['cardInviteUser'] as Map<String, dynamic>),
      cardEstimateSet: json['cardEstimateSet'] == null
          ? null
          : TCard.fromJson(json['cardEstimateSet'] as Map<String, dynamic>),
      userSetRoles: json['userSetRoles'] as String,
      cardEstimateUnset: json['cardEstimateUnset'] == null
          ? null
          : TCard.fromJson(json['cardEstimateUnset'] as Map<String, dynamic>),
      cardAddMember: json['cardAddMember'] as String,
      cardTagsSet: json['cardTagsSet'] as String,
      meetingRoomJoin: json['meetingRoomJoin'] == null
          ? null
          : TTwilioAuth.fromJson(
          json['meetingRoomJoin'] as Map<String, dynamic>),
      cardUnassign: json['cardUnassign'] == null
          ? null
          : TCard.fromJson(json['cardUnassign'] as Map<String, dynamic>),
    );
  }
}

/// The name property of a card was changed
class TCardRenamed implements TTurtleEvent {
  TCardRenamed({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.cardName,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

  int id;

  /// The project of the card that was renamed
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Money was transferred between two accounts
class TAccountTransfer implements TTurtleEvent {
  TAccountTransfer({this.actor,
    this.actorId,
    this.amount,
    this.destAccountId,
    this.id,
    this.memo,
    this.requestId,
    this.sourceAccountId,
    this.time});

  /// The user that performed the action
  TUser actor;

  /// The user that performed the action
  String actorId;

  /// The amount of money transferred
  TMoney amount;

  /// The account the money was deposited to
  String destAccountId;

  int id;

  /// An optional memo the preson doing the transfer can write in
  String memo;

  String requestId;

  /// The account the money was withdrawn from
  String sourceAccountId;

  String time;

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
      id: json['id'] as int,
      memo: json['memo'] as String,
      requestId: json['requestId'] as String,
      sourceAccountId: json['sourceAccountId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card had its budget increased or set for the first time.
/// Every card can have a budget. This is used for budgeting a feature.
/// For example, a customer could limit the cost of a feature to 100h.
///
class TCardBudgetIncreased implements TTurtleEvent {
  TCardBudgetIncreased({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that increased the budget
  TUser actor;

  /// The user that increased the budget
  String actorId;

  /// The amount the card's budget was increased by
  TCardBudget budget;

  /// The card which had its budget increased
  TCard card;

  /// The card which had its budget increased
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// The authentication result after joining a twilio meeting room.
class TTwilioAuth {
  TTwilioAuth({this.token});

  /// The token used for requests related to a twilio meeting room
  String token;

  factory TTwilioAuth.fromJson(Map<String, dynamic> json) {
    return TTwilioAuth(
      token: json['token'] as String,
    );
  }
}

class TCardDueDateUnset implements TTurtleEvent {
  TCardDueDateUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user marked a card as completed.
class TCardCompleted implements TTurtleEvent {
  TCardCompleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that marked the card as completed
  TUser actor;

  /// The user that marked the card as completed
  String actorId;

  /// The card that was completed
  TCard card;

  /// The card that was completed
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// An activity feed that may be associated with a number of things.
/// Currently supports private 1-on-1 conversations and task-level conversations.
/// Contains user written messages and also activity-related messages like time tracking and task completion.
///
class TFeed {
  TFeed({this.card,
    this.feedEvents,
    this.feedSubscription,
    this.id,
    this.lastFeedEvent,
    this.otherUser,
    this.project,
    this.source,
    this.version});

  @Deprecated('use source instead')
  TCard card;

  /// List of feed events that belong to the activity feed. Sorted by time created ascending.
  List<TFeedEvent> feedEvents;

  /// The current user's subscription of this activity feed.
  TFeedSubscription feedSubscription;

  /// Unique identifier for an activity feed.
  ///     Generated based on what it is attached to like conversation-123-987, card-556, or meeting-abc
  int id;

  /// The most recent event/message in the activity feed
  TFeedEvent lastFeedEvent;

  @Deprecated('use source instead')
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
      id: json['id'] as int,
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

/// When new events are generated, a notification service decides which users should be notified of the event.
/// This could include events like users posting messages, tasks getting completed, and so on.
/// When a user should be notified of an event, this event is generated.
/// This, in combination with [UserReadFeedEvent], can be used to generate unread counts per feed.
///
class TUserUnreadFeedEvent implements TTurtleEvent {
  TUserUnreadFeedEvent({this.actorId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.requestId,
    this.time});

  /// The user that should be notified of this event
  String actorId;

  /// The event itself that the user should be notified about
  String feedEventId;

  /// The feed the event belongs to
  String feedId;

  int id;

  String requestId;

  String time;

  factory TUserUnreadFeedEvent.fromJson(Map<String, dynamic> json) {
    return TUserUnreadFeedEvent(
      actorId: json['actorId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A range of duration, such as 1.5-2h.
class TDurationRange implements TDocumentToken {
  TDurationRange({this.max, this.min});

  /// The upper bound of the range. If max is the same as min, then it represents a single value like 2h.
  bool max;

  /// The lower bound of the range
  bool min;

  factory TDurationRange.fromJson(Map<String, dynamic> json) {
    return TDurationRange(
      max: json['max'] as bool,
      min: json['min'] as bool,
    );
  }
}

class TCard implements TAccountSource, TDocumentToken, TFeedSource {
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

  /// The user this card is assigned to
  TUser assignee;

  /// The id of the user this card is assigned to
  String assigneeId;

  /// The budget specific to this card.
  /// For example a customer may set a 150h budget for a feature.
  /// Does not include budgets of child cards. For reporting, aggregations must be done on the client.
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

  int id;

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
  bool timeTracked;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

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
      id: json['id'] as int,
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
      timeTracked: json['timeTracked'] as bool,
      version: json['version'] as String,
    );
  }
}

/// Object that namespaces data related to the current user
class TMe {
  TMe({this.accessibleUsers,
    this.events,
    this.eventsCount,
    this.feeds,
    this.permissions,
    this.projects,
    this.unreadCount,
    this.user});

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

class THubspotContact {
  THubspotContact({this.coreSkills,
    this.githubUsername,
    this.hourlyRate,
    this.id,
    this.recruitingStage});

  List<String> coreSkills;

  String githubUsername;

  TMoney hourlyRate;

  int id;

  THubspotDealStage recruitingStage;

  factory THubspotContact.fromJson(Map<String, dynamic> json) {
    return THubspotContact(
      coreSkills:
      (json['coreSkills'] as List)?.map((e) => e as String)?.toList(),
      githubUsername: json['githubUsername'] as String,
      hourlyRate: json['hourlyRate'] == null
          ? null
          : TMoney.fromJson(json['hourlyRate'] as Map<String, dynamic>),
      id: json['id'] as int,
      recruitingStage: json['recruitingStage'] == null
          ? null
          : THubspotDealStage.fromJson(
          json['recruitingStage'] as Map<String, dynamic>),
    );
  }
}

class TMoney {
  TMoney({this.amount, this.currency});

  int amount;

  String currency;

  factory TMoney.fromJson(Map<String, dynamic> json) {
    return TMoney(
      amount: json['amount'] as int,
      currency: json['currency'] as String,
    );
  }
}

/// A credit card that customers pay with. Currently all credit cards are from Stripe.
class TCreditCard {
  TCreditCard({this.brand,
    this.expMonth,
    this.expYear,
    this.id,
    this.last4,
    this.owner});

  /// The brand of credit card. For ex: MasterCard, American Express, Visa
  String brand;

  /// Month the credit card expires (number from 1-12)
  int expMonth;

  /// Year the credit card expires
  int expYear;

  /// The unique identifier of the credit card. This will match whatever is on the Stripe account.
  int id;

  /// Last 4 digits of a credit card
  String last4;

  /// The user who owns the credit card. Meaning the user who entered the credit card into the system.
  TUser owner;

  factory TCreditCard.fromJson(Map<String, dynamic> json) {
    return TCreditCard(
      brand: json['brand'] as String,
      expMonth: json['expMonth'] as int,
      expYear: json['expYear'] as int,
      id: json['id'] as int,
      last4: json['last4'] as String,
      owner: json['owner'] == null
          ? null
          : TUser.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }
}

/// A user posted a message to an activity feed.
class TFeedMessagePosted implements TTurtleEvent {
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

  int id;

  /// The content of the message
  String messageBody;

  /// The project the feed belongs to.
  /// (Direct messages don't belong to projects so it will be null for direct messages.)
  ///
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
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

  int id;

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
      id: json['id'] as int,
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

class THubspotPipeline {
  THubspotPipeline({this.id, this.label, this.stages});

  int id;

  String label;

  List<THubspotDealStage> stages;

  factory THubspotPipeline.fromJson(Map<String, dynamic> json) {
    return THubspotPipeline(
      id: json['id'] as int,
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

class TFeedEvent {
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

  /// The user that posted the message or performed the action which generated the event.
  TUser actor;

  /// A string that represents the message that was posted or a text-summary of the event.
  /// Such as "set due date to @date"
  ///
  @Deprecated(
      'It is recommended to use the event field when rendering domain events in the activity feed.It is recommended to use body_tokens when rendering messages')
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
  int id;

  /// An array of individual reactions to messages. Multiple users reacting with the same emoji results in distinct records.
  List<TReaction> reactions;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

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
      id: json['id'] as int,
      reactions: (json['reactions'] as List)
          ?.map((e) =>
      e == null ? null : TReaction.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      version: json['version'] as String,
    );
  }
}

class TMeetingRecording {
  TMeetingRecording({this.downloadUrl,
    this.duration,
    this.fileSize,
    this.format,
    this.id,
    this.resolution,
    this.status});

  /// A CDN link to the video file for downloading/playing the video.
  String downloadUrl;

  /// The duration of the video recording.
  bool duration;

  /// The file size in bytes.
  int fileSize;

  /// The file format of the video. For example mp4
  String format;

  String id;

  /// The resolution of the video. For example 640x480
  String resolution;

  /// The status of this recording. For example if the recording is ready or still processing.
  TMeetingRecordingStatus status;

  factory TMeetingRecording.fromJson(Map<String, dynamic> json) {
    return TMeetingRecording(
      downloadUrl: json['downloadUrl'] as String,
      duration: json['duration'] as bool,
      fileSize: json['fileSize'] as int,
      format: json['format'] as String,
      id: json['id'] as String,
      resolution: json['resolution'] as String,
      status: TMeetingRecordingStatusValues[json['status']],
    );
  }
}

/// A completed card was marked as incomplete
class TCardUncompleted implements TTurtleEvent {
  TCardUncompleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that marked the card as incomplete
  TUser actor;

  /// The user that marked the card as incomplete
  String actorId;

  /// The card that was marked incomplete
  TCard card;

  /// The card that was marked incomplete
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TCardDueDateSet implements TTurtleEvent {
  TCardDueDateSet({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.dueDate,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

  /// The value the due date was set to.
  String dueDate;

  int id;

  /// The project of the card
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card had its budget decreased.
/// Every card can have a budget. This is used for budgeting a feature.
/// For example, a customer could limit the cost of a feature to 100h.
///
class TCardBudgetDecreased implements TTurtleEvent {
  TCardBudgetDecreased({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that increased the budget
  TUser actor;

  /// The user that increased the budget
  String actorId;

  /// The amount the card's budget was decreased by
  TCardBudget budget;

  /// The card which had its budget decreased
  TCard card;

  /// The card which had its budget decreased
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class THubspotDealStage {
  THubspotDealStage({this.active,
    this.closedWon,
    this.displayOrder,
    this.id,
    this.label,
    this.probability});

  bool active;

  String closedWon;

  int displayOrder;

  int id;

  String label;

  double probability;

  factory THubspotDealStage.fromJson(Map<String, dynamic> json) {
    return THubspotDealStage(
      active: json['active'] as bool,
      closedWon: json['closedWon'] as String,
      displayOrder: json['displayOrder'] as int,
      id: json['id'] as int,
      label: json['label'] as String,
      probability: json['probability'] as double,
    );
  }
}

/// Wrapper for a string scalar
class TStringObject implements TDocumentToken {
  TStringObject({this.value});

  String value;

  factory TStringObject.fromJson(Map<String, dynamic> json) {
    return TStringObject(
      value: json['value'] as String,
    );
  }
}

/// The subscription for a specific user and feed.
/// Contains user-specific info like unread counts.
///
class TFeedSubscription {
  TFeedSubscription({this.feedId,
    this.id,
    this.status,
    this.unreadCount,
    this.userId,
    this.version});

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

/// Represents hourly work done by a contrator.
/// Whenever they do work, the contractor logs how much time was spent, the associated task, some notes about the work.
///
class TTimeEntry implements TDocumentToken {
  TTimeEntry({this.addedAt,
    this.card,
    this.contractId,
    this.date,
    this.deleted,
    this.duration,
    this.edited,
    this.id,
    this.memo,
    this.user,
    this.version});

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

  /// The amount of time that was worked.
  bool duration;

  /// Whether the time entry was edited
  bool edited;

  int id;

  /// Some notes about the work done. (Optional)
  String memo;

  /// The user who did the work
  TUser user;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  factory TTimeEntry.fromJson(Map<String, dynamic> json) {
    return TTimeEntry(
      addedAt: json['addedAt'] as String,
      card: json['card'] == null
          ? null
          : TCard.fromJson(json['card'] as Map<String, dynamic>),
      contractId: json['contractId'] as String,
      date: json['date'] as String,
      deleted: json['deleted'] as bool,
      duration: json['duration'] as bool,
      edited: json['edited'] as bool,
      id: json['id'] as int,
      memo: json['memo'] as String,
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
      version: json['version'] as String,
    );
  }
}

class TCommand {
  TCommand({this.actor,
    this.executedAt,
    this.id,
    this.input,
    this.requestId,
    this.type});

  TUser actor;

  String executedAt;

  int id;

  String input;

  String requestId;

  String type;

  factory TCommand.fromJson(Map<String, dynamic> json) {
    return TCommand(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      executedAt: json['executedAt'] as String,
      id: json['id'] as int,
      input: json['input'] as String,
      requestId: json['requestId'] as String,
      type: json['type'] as String,
    );
  }
}

/// A user was charged on their credit card.
/// Generates a transaction.
///
class TStripeChargeCreated implements TTurtleEvent {
  TStripeChargeCreated({this.actor,
    this.creditCard,
    this.id,
    this.last4,
    this.project,
    this.requestId,
    this.time});

  /// The user that charged the credit card.
  /// Currently only used when a customer refills their balance using a credit card
  /// May not necessarily be the owner of the credit card. Could be a manager.
  ///
  TUser actor;

  /// The credit card that was charged
  TCreditCard creditCard;

  int id;

  @Deprecated('use creditCard instead')
  String last4;

  /// The project the charge was associated wtih.
  TCard project;

  String requestId;

  String time;

  factory TStripeChargeCreated.fromJson(Map<String, dynamic> json) {
    return TStripeChargeCreated(
      actor: json['actor'] == null
          ? null
          : TUser.fromJson(json['actor'] as Map<String, dynamic>),
      creditCard: json['creditCard'] == null
          ? null
          : TCreditCard.fromJson(json['creditCard'] as Map<String, dynamic>),
      id: json['id'] as int,
      last4: json['last4'] as String,
      project: json['project'] == null
          ? null
          : TCard.fromJson(json['project'] as Map<String, dynamic>),
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TProject {
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

  TMoney balance;

  @Deprecated('use balance which is more appropriately named')
  TMoney budget;

  List<TContract> contracts;

  TMoney estimatedHourlyRate;

  List<TFeed> feeds;

  int id;

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
      id: json['id'] as int,
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

/// A card had its budget removed.
/// Usually means that a customer decided they didn't want a budget for a card.
///
class TCardBudgetUnset implements TTurtleEvent {
  TCardBudgetUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  /// The user that removed the cards budget
  TUser actor;

  /// The user that removed the cards budget
  String actorId;

  /// The card which had its budget removed
  TCard card;

  /// The card which had its budget removed
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// Represents the budget for a card. Currently only supports a time-based (not money-based) budget.
class TCardBudget {
  TCardBudget({this.duration});

  /// The max number of hours allocated
  bool duration;

  factory TCardBudget.fromJson(Map<String, dynamic> json) {
    return TCardBudget(
      duration: json['duration'] as bool,
    );
  }
}

/// An entry representing how many hours/week a contractor wants to work.
/// This can be used to compare their desired workload with actual workload from time entries.
/// To simplify things, start and end dates currently must line up on a US calendar.
///
class TAvailabilityEntry {
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
  bool timePerWeek;

  /// The last time the entry was updated. If it was never edited, this is equal to the time of creation.
  String updatedAt;

  /// The contractor doing the work.
  TUser user;

  /// The contractor id doing the work
  String userId;

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
      timePerWeek: json['timePerWeek'] as bool,
      updatedAt: json['updatedAt'] as String,
      user: json['user'] == null
          ? null
          : TUser.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['userId'] as String,
    );
  }
}

/// A file stored on S3 that was uploaded by a user.
class TFile implements TDocumentToken {
  TFile({this.contentType,
    this.downloadUri,
    this.id,
    this.name,
    this.path,
    this.size,
    this.thumbnailUri,
    this.uri,
    this.userId});

  /// The mime content type
  String contentType;

  /// The url for downloading a file to the users local computer. Used on the client when a download link is necessary.
  String downloadUri;

  int id;

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

  factory TFile.fromJson(Map<String, dynamic> json) {
    return TFile(
      contentType: json['contentType'] as String,
      downloadUri: json['downloadUri'] as String,
      id: json['id'] as int,
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
  TRootQueryType({this.account,
    this.accounts,
    this.activeProjects,
    this.apiVersion,
    this.availabilityEntries,
    this.card,
    this.cards,
    this.cardsCount,
    this.command,
    this.feed,
    this.feedEvent,
    this.feedEvents,
    this.feedEventsCount,
    this.feedSubscriptions,
    this.feedSubscriptionsCount,
    this.feeds,
    this.feedsCount,
    this.hubspotPipeline,
    this.me,
    this.meeting,
    this.meetings,
    this.notificationDeliveries,
    this.project,
    this.projects,
    this.timeEntries,
    this.timeEntriesCount,
    this.timeEntry,
    this.user,
    this.users});

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

  /// All cards current user has access to.
  ///
  int cardsCount;

  TCommand command;

  /// Fetch a feed by its id
  TFeed feed;

  /// Fetch a feed event by id
  TFeedEvent feedEvent;

  /// All feed events the current user has access to.
  ///
  List<TFeedEvent> feedEvents;

  /// All feed events the current user has access to.
  ///
  int feedEventsCount;

  /// Feed subscriptions for the current user.
  ///
  List<TFeedSubscription> feedSubscriptions;

  /// Feed subscriptions for the current user.
  ///
  int feedSubscriptionsCount;

  /// All feeds the current user has access to.
  ///
  List<TFeed> feeds;

  /// All feeds the current user has access to.
  ///
  int feedsCount;

  THubspotPipeline hubspotPipeline;

  TMe me;

  /// Fetch a meeting by its id
  TMeeting meeting;

  /// Fetch the meetings for a given project
  List<TMeeting> meetings;

  List<TNotificationDelivery> notificationDeliveries;

  TProject project;

  List<TProject> projects;

  /// Time entries for a given user. Defaults to current user.
  ///
  List<TTimeEntry> timeEntries;

  /// Time entries for a given user. Defaults to current user.
  ///
  int timeEntriesCount;

  /// Fetch a time entry by its id
  TTimeEntry timeEntry;

  /// Fetch a user by id
  TUser user;

  List<TUser> users;

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
      cardsCount: json['cardsCount'] as int,
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
      feedEventsCount: json['feedEventsCount'] as int,
      feedSubscriptions: (json['feedSubscriptions'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TFeedSubscription.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedSubscriptionsCount: json['feedSubscriptionsCount'] as int,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
      e == null ? null : TFeed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedsCount: json['feedsCount'] as int,
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
      timeEntriesCount: json['timeEntriesCount'] as int,
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
  TLink({this.title, this.type, this.uri});

  /// The title of the link. It's either the name of the entity or left blank.
  String title;

  /// The type of entity that is linked to. It can be user, card, or link (default).
  String type;

  /// The http://... url this goes to
  String uri;

  factory TLink.fromJson(Map<String, dynamic> json) {
    return TLink(
      title: json['title'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }
}

/// A contrator tracks logs for work that they have done.
/// Generates a transaction that deducts from customer account, adds to the contractor's account, and puts the rest in a turtle: account
///
class TTimeEntryCreated implements TTurtleEvent {
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
  bool entryDuration;

  /// An optional memo where a contractor can describe what they were working on.
  /// This may not be necessary if the associated card to this time entry has enough information.
  ///
  String entryMemo;

  int id;

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
      entryDuration: json['entryDuration'] as bool,
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as int,
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

class TUser implements TAccountSource, TDocumentToken, TFeedSource {
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

  /// The number of contracts the user currently has active.
  int activeContractsCount;

  /// Active contracts the user currently has
  List<TContract> contracts;

  String email;

  /// Activity feeds the user currently has access to. Sorted by most recently active first.
  List<TFeed> feeds;

  THubspotContact hubspotContact;

  /// Unique identifier for the user. A user may have multiple identies connected to a single user.
  int id;

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
      id: json['id'] as int,
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

/// A user edited the content of an existing message in a feed.
class TFeedMessageEdited implements TTurtleEvent {
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

  int id;

  /// The new body of the message
  String messageBody;

  /// The project the feed belongs to.
  /// (Direct messages don't belong to projects so it will be null for direct messages.)
  ///
  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      messageBody: json['messageBody'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class TReactionRemoved implements TTurtleEvent {
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

  /// The user that removed the reaction
  String actorId;

  /// The card associated with a feed (if it's a task-level card-... type feed)
  String cardId;

  /// The feed event that the user removed the reaction from
  String feedEventId;

  /// The feed that contains the feed event (message)
  String feedId;

  int id;

  /// The project the card belongs to (if it's a task-level card-... type feed)
  String projectId;

  /// The string that represents the reaction such as '🐢' 'OK' or '👍'
  String reaction;

  /// The other user in the private chat (if it's a private conversation-... feed)
  String receiverId;

  String requestId;

  String time;

  factory TReactionRemoved.fromJson(Map<String, dynamic> json) {
    return TReactionRemoved(
      actorId: json['actorId'] as String,
      cardId: json['cardId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      reaction: json['reaction'] as String,
      receiverId: json['receiverId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user was removed from a project
class TCardMemberRemoved implements TTurtleEvent {
  TCardMemberRemoved({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.member,
    this.projectId,
    this.requestId,
    this.time});

  /// The user performing the action. The one who added the user to the project.
  TUser actor;

  /// The user performing the action. The one who added the user to the project.
  String actorId;

  /// The project the user was removed from
  TCard card;

  /// The id of the card
  @Deprecated(
      'Use projectId instead since cardId will always point to a project.')
  String cardId;

  int id;

  /// The user that was removed from the project
  TUser member;

  String projectId;

  String requestId;

  String time;

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
      id: json['id'] as int,
      member: json['member'] == null
          ? null
          : TUser.fromJson(json['member'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A directional link between two cards in Turtle. Kind of like a hyperlink.
/// Used for things like tying an internal management project to a customer project.
///
class TCardLink {
  TCardLink({this.from, this.to, this.type});

  /// The card the link is coming from
  TCard from;

  /// The card the link is going to
  TCard to;

  /// The type of link. For example management or turtle_support.
  String type;

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

/// An hourly contract between a project and user. Used in generating transactions when a user tracks time.
/// It is worth noting that contracts are immutable. They can only be started and ended. (This is to avoid complications which we don't get into here.)
///
class TContract {
  TContract({this.active,
    this.contractor,
    this.contractorHourlyRate,
    this.customerHourlyRate,
    this.endedAt,
    this.id,
    this.project,
    this.startedAt});

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

  int id;

  /// The project the contractor does work for.
  TProject project;

  /// The time the contract was started.
  String startedAt;

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
      id: json['id'] as int,
      project: json['project'] == null
          ? null
          : TProject.fromJson(json['project'] as Map<String, dynamic>),
      startedAt: json['startedAt'] as String,
    );
  }
}

/// Represents a schema
class T__Schema {
  T__Schema({this.directives,
    this.mutationType,
    this.queryType,
    this.subscriptionType,
    this.types});

  List<T__Directive> directives;

  T__Type mutationType;

  T__Type queryType;

  T__Type subscriptionType;

  List<T__Type> types;

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

class T__Field {
  T__Field({this.args,
    this.deprecationReason,
    this.description,
    this.isDeprecated,
    this.name,
    this.type});

  List<T__InputValue> args;

  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  T__Type type;

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
  T__Type({this.description,
    this.enumValues,
    this.fields,
    this.inputFields,
    this.interfaces,
    this.kind,
    this.name,
    this.ofType,
    this.possibleTypes});

  String description;

  List<T__EnumValue> enumValues;

  List<T__Field> fields;

  List<T__InputValue> inputFields;

  List<T__Type> interfaces;

  String kind;

  String name;

  T__Type ofType;

  List<T__Type> possibleTypes;

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

class T__InputValue {
  T__InputValue({this.defaultValue, this.description, this.name, this.type});

  String defaultValue;

  String description;

  String name;

  T__Type type;

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

/// Represents a directive
class T__Directive {
  T__Directive({this.args,
    this.description,
    this.locations,
    this.name,
    this.onField,
    this.onFragment,
    this.onOperation});

  List<T__InputValue> args;

  String description;

  List<T__DirectiveLocation> locations;

  String name;

  @Deprecated('Check `locations` field for enum value FIELD')
  bool onField;

  @Deprecated('Check `locations` field for enum value FRAGMENT_SPREAD')
  bool onFragment;

  @Deprecated('Check `locations` field for enum value OPERATION')
  bool onOperation;

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

class T__EnumValue {
  T__EnumValue(
      {this.deprecationReason, this.description, this.isDeprecated, this.name});

  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  factory T__EnumValue.fromJson(Map<String, dynamic> json) {
    return T__EnumValue(
      deprecationReason: json['deprecationReason'] as String,
      description: json['description'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      name: json['name'] as String,
    );
  }
}

enum TNotificationDeliveryType {
  EMAIL,
  PUSH,
}
final TNotificationDeliveryTypeValues = {
  "EMAIL": TNotificationDeliveryType.EMAIL,
  "PUSH": TNotificationDeliveryType.PUSH,
};
enum TMeetingRecordingStatus {
  COMPLETED,
  DELETED,
  PROCESSING,
}
final TMeetingRecordingStatusValues = {
  "COMPLETED": TMeetingRecordingStatus.COMPLETED,
  "DELETED": TMeetingRecordingStatus.DELETED,
  "PROCESSING": TMeetingRecordingStatus.PROCESSING,
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

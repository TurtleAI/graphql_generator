// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: GraphQLGenerators
// **************************************************************************

import 'package:meta/meta.dart';

abstract class TurtleEvent {
  int id;

  String requestId;

  String time;

  factory TurtleEvent.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "AccountTransfer":
        return AccountTransfer.fromJson(json);
      case "CardAssigned":
        return CardAssigned.fromJson(json);
      case "CardBudgetDecreased":
        return CardBudgetDecreased.fromJson(json);
      case "CardBudgetIncreased":
        return CardBudgetIncreased.fromJson(json);
      case "CardBudgetUnset":
        return CardBudgetUnset.fromJson(json);
      case "CardCompleted":
        return CardCompleted.fromJson(json);
      case "CardCreated":
        return CardCreated.fromJson(json);
      case "CardDueDateSet":
        return CardDueDateSet.fromJson(json);
      case "CardDueDateUnset":
        return CardDueDateUnset.fromJson(json);
      case "CardEstimateSet":
        return CardEstimateSet.fromJson(json);
      case "CardEstimateUnset":
        return CardEstimateUnset.fromJson(json);
      case "CardMemberAdded":
        return CardMemberAdded.fromJson(json);
      case "CardMemberRemoved":
        return CardMemberRemoved.fromJson(json);
      case "CardMoved":
        return CardMoved.fromJson(json);
      case "CardRenamed":
        return CardRenamed.fromJson(json);
      case "CardUnassigned":
        return CardUnassigned.fromJson(json);
      case "CardUncompleted":
        return CardUncompleted.fromJson(json);
      case "FeedMessageDeleted":
        return FeedMessageDeleted.fromJson(json);
      case "FeedMessageEdited":
        return FeedMessageEdited.fromJson(json);
      case "FeedMessagePosted":
        return FeedMessagePosted.fromJson(json);
      case "FeedSubscriptionUpdated":
        return FeedSubscriptionUpdated.fromJson(json);
      case "PayoutRecorded":
        return PayoutRecorded.fromJson(json);
      case "ReactionAdded":
        return ReactionAdded.fromJson(json);
      case "ReactionRemoved":
        return ReactionRemoved.fromJson(json);
      case "StripeChargeCreated":
        return StripeChargeCreated.fromJson(json);
      case "TimeEntryCreated":
        return TimeEntryCreated.fromJson(json);
      case "TimeEntryDeleted":
        return TimeEntryDeleted.fromJson(json);
      case "TimeEntryEdited":
        return TimeEntryEdited.fromJson(json);
      case "UserReadFeedEvent":
        return UserReadFeedEvent.fromJson(json);
      case "UserUnreadFeedEvent":
        return UserUnreadFeedEvent.fromJson(json);
    }
    return null;
  }
}

abstract class FeedSource {
  factory FeedSource.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return Card.fromJson(json);
      case "User":
        return User.fromJson(json);
    }
    return null;
  }
}

abstract class DocumentToken {
  factory DocumentToken.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return Card.fromJson(json);
      case "DateObject":
        return DateObject.fromJson(json);
      case "DurationRange":
        return DurationRange.fromJson(json);
      case "File":
        return File.fromJson(json);
      case "Link":
        return Link.fromJson(json);
      case "StringObject":
        return StringObject.fromJson(json);
      case "TimeEntry":
        return TimeEntry.fromJson(json);
      case "User":
        return User.fromJson(json);
    }
    return null;
  }
}

abstract class AccountSource {
  factory AccountSource.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return Card.fromJson(json);
      case "User":
        return User.fromJson(json);
    }
    return null;
  }
}

class CardCreateInput {
  CardCreateInput(
      {this.afterId,
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

  factory CardCreateInput.fromJson(Map<String, dynamic> json) {
    return CardCreateInput(
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'afterId': afterId,
      'assigneeId': assigneeId,
      'beforeId': beforeId,
      'cardId': cardId,
      'cardName': cardName,
      'meta': meta,
      'parentId': parentId,
      'quickAdd': quickAdd,
    };
  }
}

class CardBudgetIncreaseInput {
  CardBudgetIncreaseInput(
      {@required this.budgetDuration, @required this.cardId});

  /// The duration of work to increase the budget by.
  /// Budgets may support money in the future but currently only duration is supported.
  ///
  bool budgetDuration;

  /// The card to increase the budget for
  String cardId;

  factory CardBudgetIncreaseInput.fromJson(Map<String, dynamic> json) {
    return CardBudgetIncreaseInput(
      budgetDuration: json['budgetDuration'] as bool,
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'budgetDuration': budgetDuration,
      'cardId': cardId,
    };
  }
}

class Kv {
  Kv({this.k, this.v});

  /// The key
  String k;

  /// The value
  String v;

  factory Kv.fromJson(Map<String, dynamic> json) {
    return Kv(
      k: json['k'] as String,
      v: json['v'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'k': k,
      'v': v,
    };
  }
}

class CardUnassignInput {
  CardUnassignInput({@required this.cardId});

  /// The card to remove the assignee for
  String cardId;

  factory CardUnassignInput.fromJson(Map<String, dynamic> json) {
    return CardUnassignInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class ContractStartInput {
  ContractStartInput(
      {this.contractId,
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

  factory ContractStartInput.fromJson(Map<String, dynamic> json) {
    return ContractStartInput(
      contractId: json['contractId'] as String,
      contractorHourlyRate: json['contractorHourlyRate'] as String,
      contractorId: json['contractorId'] as String,
      customerHourlyRate: json['customerHourlyRate'] as String,
      projectId: json['projectId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'contractId': contractId,
      'contractorHourlyRate': contractorHourlyRate,
      'contractorId': contractorId,
      'customerHourlyRate': customerHourlyRate,
      'projectId': projectId,
    };
  }
}

class TimeEntryCreateInput {
  TimeEntryCreateInput(
      {@required this.cardId,
      @required this.entryDate,
      @required this.entryDuration,
      this.entryId,
      this.entryMemo});

  /// The card (task) the work was done on
  String cardId;

  /// The date the work was done
  String entryDate;

  /// How long the work took
  bool entryDuration;

  /// The id of the time entry. You must pass in 'new' and it will get generated server-side.
  String entryId;

  /// More detailed notes about the work done
  String entryMemo;

  factory TimeEntryCreateInput.fromJson(Map<String, dynamic> json) {
    return TimeEntryCreateInput(
      cardId: json['cardId'] as String,
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as bool,
      entryId: json['entryId'] as String,
      entryMemo: json['entryMemo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'entryDate': entryDate,
      'entryDuration': entryDuration,
      'entryId': entryId,
      'entryMemo': entryMemo,
    };
  }
}

class AddReactionInput {
  AddReactionInput({this.feedEventId, this.reaction});

  /// The feed event to add the reaction to
  String feedEventId;

  /// The reaction to add. Should be an emoji like 👍
  String reaction;

  factory AddReactionInput.fromJson(Map<String, dynamic> json) {
    return AddReactionInput(
      feedEventId: json['feedEventId'] as String,
      reaction: json['reaction'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'feedEventId': feedEventId,
      'reaction': reaction,
    };
  }
}

class CardLinkDeleteInput {
  CardLinkDeleteInput(
      {@required this.fromId, @required this.linkType, @required this.toId});

  /// The card the link to delete is coming from
  String fromId;

  /// The type of the link to be deleted
  String linkType;

  /// The card the link to delete is going to
  String toId;

  factory CardLinkDeleteInput.fromJson(Map<String, dynamic> json) {
    return CardLinkDeleteInput(
      fromId: json['fromId'] as String,
      linkType: json['linkType'] as String,
      toId: json['toId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fromId': fromId,
      'linkType': linkType,
      'toId': toId,
    };
  }
}

class UserSetRolesInput {
  UserSetRolesInput({this.roles, @required this.userId});

  /// THe list of roles to give a user.
  /// This overwrites teh entire list. So if you want to add a role, you must pass in the full list with the new role added.
  ///
  List<Role> roles;

  /// The user to update the roles for.
  String userId;

  factory UserSetRolesInput.fromJson(Map<String, dynamic> json) {
    return UserSetRolesInput(
      roles: (json['roles'] as List)?.map((e) => RoleValues[e])?.toList(),
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'roles': roles == null
          ? null
          : new List<dynamic>.from(
              roles.map((x) => x.toString().split('.').last)),
      'userId': userId,
    };
  }
}

class CardMoveInput {
  CardMoveInput(
      {this.afterId,
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

  factory CardMoveInput.fromJson(Map<String, dynamic> json) {
    return CardMoveInput(
      afterId: json['afterId'] as String,
      beforeId: json['beforeId'] as String,
      cardId: json['cardId'] as String,
      toId: json['toId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'afterId': afterId,
      'beforeId': beforeId,
      'cardId': cardId,
      'toId': toId,
    };
  }
}

class CardRenameInput {
  CardRenameInput({@required this.cardId, @required this.cardName});

  /// The card to rename
  String cardId;

  /// The new name to give the card
  String cardName;

  factory CardRenameInput.fromJson(Map<String, dynamic> json) {
    return CardRenameInput(
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'cardName': cardName,
    };
  }
}

class RecordPayoutInput {
  RecordPayoutInput(
      {@required this.amount,
      @required this.date,
      @required this.fee,
      this.memo,
      @required this.method,
      this.payoutId,
      @required this.userId});

  /// The amount that the user got paid
  String amount;

  /// The date the payment was made. Just used for record keeping.
  String date;

  /// The transaction fee involved. May differ between payment providers.
  String fee;

  /// The memo fo the payout. The user who got paid will see this in their statement.
  String memo;

  /// The way the user got paid. Usually the name of 3rd party service. Currently can be payoneer, paypal, popmoney, wire, square, transferwise, check, adjustment
  String method;

  /// A unique identifier of the payout. Depends on the 3rd party service that was used to pay.
  String payoutId;

  /// The user that got paid
  String userId;

  factory RecordPayoutInput.fromJson(Map<String, dynamic> json) {
    return RecordPayoutInput(
      amount: json['amount'] as String,
      date: json['date'] as String,
      fee: json['fee'] as String,
      memo: json['memo'] as String,
      method: json['method'] as String,
      payoutId: json['payoutId'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'amount': amount,
      'date': date,
      'fee': fee,
      'memo': memo,
      'method': method,
      'payoutId': payoutId,
      'userId': userId,
    };
  }
}

class FeedPostMessageInput {
  FeedPostMessageInput({@required this.feedId, @required this.messageBody});

  /// The feed to post the message to
  String feedId;

  /// The contents of the message.
  ///
  /// Message format:
  /// Just plain text
  /// User mentions in the format <user:27156949188089024041474864119808>
  /// Card references in the format <card:27156949188089024041474864119808>
  /// Files in the format <file.s3:2309j_f23fdf2fdf>
  ///
  String messageBody;

  factory FeedPostMessageInput.fromJson(Map<String, dynamic> json) {
    return FeedPostMessageInput(
      feedId: json['feedId'] as String,
      messageBody: json['messageBody'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'feedId': feedId,
      'messageBody': messageBody,
    };
  }
}

class CardUncompleteInput {
  CardUncompleteInput({@required this.cardId});

  /// The card to mark as incomplete
  String cardId;

  factory CardUncompleteInput.fromJson(Map<String, dynamic> json) {
    return CardUncompleteInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class CardLinkCreateInput {
  CardLinkCreateInput(
      {@required this.fromId, @required this.linkType, @required this.toId});

  /// The card the link will come from
  String fromId;

  /// The type of link. For example management or turtle_support.
  String linkType;

  /// The card the link will go to
  String toId;

  factory CardLinkCreateInput.fromJson(Map<String, dynamic> json) {
    return CardLinkCreateInput(
      fromId: json['fromId'] as String,
      linkType: json['linkType'] as String,
      toId: json['toId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fromId': fromId,
      'linkType': linkType,
      'toId': toId,
    };
  }
}

class ProjectAddBalanceWithStripeInput {
  ProjectAddBalanceWithStripeInput(
      {@required this.amount,
      this.cardToken,
      this.creditCardId,
      @required this.projectId});

  /// The amount of money to add to the project account
  String amount;

  /// The token from the client that represents the credit card details.
  /// Either cardToken or creditCardId must be provided.
  ///
  String cardToken;

  /// The id of an existing credit card on file to charge.
  /// Credit card must belong to you for security purposes unless you are a manager or admin.
  /// Either cardToken or creditCardId must be provided.
  ///
  String creditCardId;

  /// The project to refill
  String projectId;

  factory ProjectAddBalanceWithStripeInput.fromJson(Map<String, dynamic> json) {
    return ProjectAddBalanceWithStripeInput(
      amount: json['amount'] as String,
      cardToken: json['cardToken'] as String,
      creditCardId: json['creditCardId'] as String,
      projectId: json['projectId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'amount': amount,
      'cardToken': cardToken,
      'creditCardId': creditCardId,
      'projectId': projectId,
    };
  }
}

class CardUndeleteInput {
  CardUndeleteInput({@required this.cardId});

  /// The deleted card to restore
  String cardId;

  factory CardUndeleteInput.fromJson(Map<String, dynamic> json) {
    return CardUndeleteInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class TimeEntryEditInput {
  TimeEntryEditInput(
      {this.entryDate,
      this.entryDuration,
      @required this.entryId,
      this.entryMemo});

  /// The date the work was done (if modified)
  String entryDate;

  /// The amount of work done (if modified)
  bool entryDuration;

  /// The time entry to modify
  String entryId;

  /// Details about the work done (if modified)
  String entryMemo;

  factory TimeEntryEditInput.fromJson(Map<String, dynamic> json) {
    return TimeEntryEditInput(
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as bool,
      entryId: json['entryId'] as String,
      entryMemo: json['entryMemo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'entryDate': entryDate,
      'entryDuration': entryDuration,
      'entryId': entryId,
      'entryMemo': entryMemo,
    };
  }
}

class CardRemoveMemberInput {
  CardRemoveMemberInput({@required this.cardId, @required this.memberId});

  /// The project to remove the user from
  String cardId;

  /// The user to remove from the project
  String memberId;

  factory CardRemoveMemberInput.fromJson(Map<String, dynamic> json) {
    return CardRemoveMemberInput(
      cardId: json['cardId'] as String,
      memberId: json['memberId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'memberId': memberId,
    };
  }
}

class CardEstimateSetInput {
  CardEstimateSetInput({@required this.cardId, @required this.estimate});

  /// The card to set the estimate for
  String cardId;

  /// how long you think this card (task) will take to complete
  String estimate;

  factory CardEstimateSetInput.fromJson(Map<String, dynamic> json) {
    return CardEstimateSetInput(
      cardId: json['cardId'] as String,
      estimate: json['estimate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'estimate': estimate,
    };
  }
}

class CardBudgetUnsetInput {
  CardBudgetUnsetInput({@required this.cardId});

  /// The card to remove the budget for
  String cardId;

  factory CardBudgetUnsetInput.fromJson(Map<String, dynamic> json) {
    return CardBudgetUnsetInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class CardEstimateUnsetInput {
  CardEstimateUnsetInput({@required this.cardId});

  /// The card to remove the estimate for
  String cardId;

  factory CardEstimateUnsetInput.fromJson(Map<String, dynamic> json) {
    return CardEstimateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class AccountOpenInput {
  AccountOpenInput({@required this.accountId});

  /// Identifier for the account. Must be of the form like turtle:idofacct or external:idofacct
  String accountId;

  factory AccountOpenInput.fromJson(Map<String, dynamic> json) {
    return AccountOpenInput(
      accountId: json['accountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accountId': accountId,
    };
  }
}

class FeedDeleteMessageInput {
  FeedDeleteMessageInput({this.feedEventId});

  /// The feed event to delete
  String feedEventId;

  factory FeedDeleteMessageInput.fromJson(Map<String, dynamic> json) {
    return FeedDeleteMessageInput(
      feedEventId: json['feedEventId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'feedEventId': feedEventId,
    };
  }
}

class RemoveReactionInput {
  RemoveReactionInput({this.feedEventId, this.reaction});

  /// The feed event remove the reaction from
  String feedEventId;

  /// The reaction to remove. Should be an emoji like 👍
  String reaction;

  factory RemoveReactionInput.fromJson(Map<String, dynamic> json) {
    return RemoveReactionInput(
      feedEventId: json['feedEventId'] as String,
      reaction: json['reaction'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'feedEventId': feedEventId,
      'reaction': reaction,
    };
  }
}

class CardDeleteInput {
  CardDeleteInput({@required this.cardId});

  /// The id of the project/task to delete
  String cardId;

  factory CardDeleteInput.fromJson(Map<String, dynamic> json) {
    return CardDeleteInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class CardDueDateSetInput {
  CardDueDateSetInput({@required this.cardId, @required this.dueDate});

  /// The card to set the due date of
  String cardId;

  /// The due date to set it to
  String dueDate;

  factory CardDueDateSetInput.fromJson(Map<String, dynamic> json) {
    return CardDueDateSetInput(
      cardId: json['cardId'] as String,
      dueDate: json['dueDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'dueDate': dueDate,
    };
  }
}

class ProfileTimezoneSetInput {
  ProfileTimezoneSetInput({this.timezone});

  /// The timezone you are currently in
  String timezone;

  factory ProfileTimezoneSetInput.fromJson(Map<String, dynamic> json) {
    return ProfileTimezoneSetInput(
      timezone: json['timezone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'timezone': timezone,
    };
  }
}

class ContractEndInput {
  ContractEndInput({@required this.contractId});

  /// The contract to end.
  /// A user can have a max of one contract per project.
  ///
  String contractId;

  factory ContractEndInput.fromJson(Map<String, dynamic> json) {
    return ContractEndInput(
      contractId: json['contractId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'contractId': contractId,
    };
  }
}

class UserSetSkillsInput {
  UserSetSkillsInput({this.skills, @required this.userId});

  /// THe list of tags to give a user. For example react, ios, android, ml.
  /// This overwrites teh entire list. So if you want to add a skill, you must pass in the full list with the new tags added.
  ///
  List<String> skills;

  /// The user to set the skill tags for
  String userId;

  factory UserSetSkillsInput.fromJson(Map<String, dynamic> json) {
    return UserSetSkillsInput(
      skills: (json['skills'] as List)?.map((e) => e as String)?.toList(),
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'skills': skills,
      'userId': userId,
    };
  }
}

class CardBudgetDecreaseInput {
  CardBudgetDecreaseInput(
      {@required this.budgetDuration, @required this.cardId});

  /// The duration of work to increase the budget by.
  /// Budgets may support money in the future but currently only duration is supported.
  ///
  bool budgetDuration;

  /// The card to increase the budget for
  String cardId;

  factory CardBudgetDecreaseInput.fromJson(Map<String, dynamic> json) {
    return CardBudgetDecreaseInput(
      budgetDuration: json['budgetDuration'] as bool,
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'budgetDuration': budgetDuration,
      'cardId': cardId,
    };
  }
}

class CardAssignInput {
  CardAssignInput({@required this.assigneeId, @required this.cardId});

  /// The user to assign the card to. Self-assign by passing in the current user id.
  String assigneeId;

  /// The card to assign
  String cardId;

  factory CardAssignInput.fromJson(Map<String, dynamic> json) {
    return CardAssignInput(
      assigneeId: json['assigneeId'] as String,
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'assigneeId': assigneeId,
      'cardId': cardId,
    };
  }
}

class CardAddMemberInput {
  CardAddMemberInput({@required this.cardId, @required this.memberId});

  /// The id of the project
  String cardId;

  /// The id of the user to add to the project
  String memberId;

  factory CardAddMemberInput.fromJson(Map<String, dynamic> json) {
    return CardAddMemberInput(
      cardId: json['cardId'] as String,
      memberId: json['memberId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'memberId': memberId,
    };
  }
}

class CardDueDateUnsetInput {
  CardDueDateUnsetInput({@required this.cardId});

  /// The card of the due date to clear
  String cardId;

  factory CardDueDateUnsetInput.fromJson(Map<String, dynamic> json) {
    return CardDueDateUnsetInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class CardInviteUserInput {
  CardInviteUserInput({this.cardId, @required this.email});

  /// The project to add the user to.
  /// If left out, a user will be created for the e-mail (if one doesn't already exist).
  ///
  String cardId;

  /// The e-mail of the user to invite to the project. If the user with this e-mail exists, the
  String email;

  factory CardInviteUserInput.fromJson(Map<String, dynamic> json) {
    return CardInviteUserInput(
      cardId: json['cardId'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'email': email,
    };
  }
}

class FeedEditMessageInput {
  FeedEditMessageInput({this.feedEventId, this.messageBody});

  /// The feed event to edit the message body for
  String feedEventId;

  /// The new message body
  ///
  /// Message format: see [FeedPostMessage] mutation.
  ///
  String messageBody;

  factory FeedEditMessageInput.fromJson(Map<String, dynamic> json) {
    return FeedEditMessageInput(
      feedEventId: json['feedEventId'] as String,
      messageBody: json['messageBody'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'feedEventId': feedEventId,
      'messageBody': messageBody,
    };
  }
}

class SendLowBalanceReminderInput {
  SendLowBalanceReminderInput({this.projectId, this.userId});

  /// The project that has the low balance
  String projectId;

  /// The user to send the reminder e-mail to
  String userId;

  factory SendLowBalanceReminderInput.fromJson(Map<String, dynamic> json) {
    return SendLowBalanceReminderInput(
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'projectId': projectId,
      'userId': userId,
    };
  }
}

class ProfileNameSetInput {
  ProfileNameSetInput({this.name});

  /// The name you want publicly displayed throughout Turtle.
  String name;

  factory ProfileNameSetInput.fromJson(Map<String, dynamic> json) {
    return ProfileNameSetInput(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
    };
  }
}

class UpdateAvailabilityInput {
  UpdateAvailabilityInput(
      {@required this.endDate,
      this.projectId,
      @required this.startDate,
      @required this.timePerWeek,
      this.userId});

  /// The end date when the user has this availability.
  /// Must be a Sunday to confirm to the US calendar week.
  ///
  String endDate;

  /// The project the user is committing the hours to. Leave this out to submit overall availability.
  String projectId;

  /// The start period when the user has this availability.
  /// Must be a Sunday to confirm to the US calendar week.
  ///
  String startDate;

  /// The amount of time per week the user has available to from startDate to endDate (inclusive)
  ///
  bool timePerWeek;

  /// The user to update the availabiltiy for
  String userId;

  factory UpdateAvailabilityInput.fromJson(Map<String, dynamic> json) {
    return UpdateAvailabilityInput(
      endDate: json['endDate'] as String,
      projectId: json['projectId'] as String,
      startDate: json['startDate'] as String,
      timePerWeek: json['timePerWeek'] as bool,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'endDate': endDate,
      'projectId': projectId,
      'startDate': startDate,
      'timePerWeek': timePerWeek,
      'userId': userId,
    };
  }
}

class CardTagsSetInput {
  CardTagsSetInput({@required this.cardId, this.tagGroup, this.tags});

  /// The card to set the tags for
  String cardId;

  /// The tag group (namespae) of tags. Currently only 'project_status' is supported.
  /// Once we introduce tagging on the client-app or add other management features, other tags may be added.
  ///
  String tagGroup;

  /// The tags to set
  List<String> tags;

  factory CardTagsSetInput.fromJson(Map<String, dynamic> json) {
    return CardTagsSetInput(
      cardId: json['cardId'] as String,
      tagGroup: json['tagGroup'] as String,
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
      'tagGroup': tagGroup,
      'tags': tags,
    };
  }
}

class FeedMarkAsReadInput {
  FeedMarkAsReadInput({this.feedId});

  /// The feed you want to mark as read. (Unread feed events in this feed will be marked as read.)
  String feedId;

  factory FeedMarkAsReadInput.fromJson(Map<String, dynamic> json) {
    return FeedMarkAsReadInput(
      feedId: json['feedId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'feedId': feedId,
    };
  }
}

class CardCompleteInput {
  CardCompleteInput({@required this.cardId});

  /// The card to mark as complete
  String cardId;

  factory CardCompleteInput.fromJson(Map<String, dynamic> json) {
    return CardCompleteInput(
      cardId: json['cardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cardId': cardId,
    };
  }
}

class AccountTransferInput {
  AccountTransferInput(
      {@required this.amount,
      @required this.destAccount,
      this.memo,
      @required this.sourceAccount});

  /// The amount of money to transfer
  String amount;

  /// The account to put money in
  String destAccount;

  /// Some notes about the transaction. A customer may see this in their transactions screen.
  String memo;

  /// The account to take money from
  String sourceAccount;

  factory AccountTransferInput.fromJson(Map<String, dynamic> json) {
    return AccountTransferInput(
      amount: json['amount'] as String,
      destAccount: json['destAccount'] as String,
      memo: json['memo'] as String,
      sourceAccount: json['sourceAccount'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'amount': amount,
      'destAccount': destAccount,
      'memo': memo,
      'sourceAccount': sourceAccount,
    };
  }
}

class TimeEntryDeleteInput {
  TimeEntryDeleteInput({@required this.entryId});

  /// The time entry to delete
  String entryId;

  factory TimeEntryDeleteInput.fromJson(Map<String, dynamic> json) {
    return TimeEntryDeleteInput(
      entryId: json['entryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'entryId': entryId,
    };
  }
}

/// A card had its budget decreased.
/// Every card can have a budget. This is used so a customer can budget a feature.
/// For example, a customer could limit the cost of a feature to 100h.
///
class CardBudgetDecreased implements TurtleEvent {
  CardBudgetDecreased(
      {this.actor,
      this.actorId,
      this.budget,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that increased the budget
  User actor;

  /// The user that increased the budget
  String actorId;

  /// The amount the card's budget was decreased by
  CardBudget budget;

  /// The card which had its budget decreased
  Card card;

  /// The card which had its budget decreased
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardBudgetDecreased.fromJson(Map<String, dynamic> json) {
    return CardBudgetDecreased(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      budget: json['budget'] == null
          ? null
          : CardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class RootSubscriptionType {
  RootSubscriptionType(
      {this.feedSubscriptionUpdated,
      this.feedUpdated,
      this.meetingUpdated,
      this.unreadCountUpdated});

  /// One or more attributes of a feed was updated.
  ///
  FeedSubscription feedSubscriptionUpdated;

  /// One or more attributes of a feed was updated
  Feed feedUpdated;

  /// A meeting is updated. This could mean any state on the meeting has changed.
  Meeting meetingUpdated;

  /// The current user's number of unread messages has changed
  Me unreadCountUpdated;

  factory RootSubscriptionType.fromJson(Map<String, dynamic> json) {
    return RootSubscriptionType(
      feedSubscriptionUpdated: json['feedSubscriptionUpdated'] == null
          ? null
          : FeedSubscription.fromJson(
              json['feedSubscriptionUpdated'] as Map<String, dynamic>),
      feedUpdated: json['feedUpdated'] == null
          ? null
          : Feed.fromJson(json['feedUpdated'] as Map<String, dynamic>),
      meetingUpdated: json['meetingUpdated'] == null
          ? null
          : Meeting.fromJson(json['meetingUpdated'] as Map<String, dynamic>),
      unreadCountUpdated: json['unreadCountUpdated'] == null
          ? null
          : Me.fromJson(json['unreadCountUpdated'] as Map<String, dynamic>),
    );
  }
}

/// A user added a reaction to a feed event (message) in an activity feed.
/// Very similar to reactions work in popular work apps like Slack/Hipchat.
///
class ReactionAdded implements TurtleEvent {
  ReactionAdded(
      {this.actorId,
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

  factory ReactionAdded.fromJson(Map<String, dynamic> json) {
    return ReactionAdded(
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

/// A contrator tracks logs for work that they have done.
/// Generates a transaction that deducts from customer account and adds to the your account.
///
class TimeEntryCreated implements TurtleEvent {
  TimeEntryCreated(
      {this.actor,
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
  User actor;

  /// The user that logged the time. (It's possible that this may be different from the user who did the work.)
  String actorId;

  /// The card (task) that the use did work on.
  Card card;

  /// The card (task) that the use did work on.
  String cardId;

  /// The associated contract under which the work was done. Of note is the customer rate and freelancer rate.
  /// If a time entry is edited, this same contract will be used to avoid situations of a contract being edited retroactively.
  ///
  Contract contract;

  /// The user that did the work. The generated transaction will transfer money into this users account.
  User contractor;

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
  Card project;

  /// The project the card belongs to.
  String projectId;

  String requestId;

  String time;

  /// The time entry that was created.
  /// Note that this is a reference to the latest time entry, so if it was edited after this event, you will see the latest properties.
  ///
  TimeEntry timeEntry;

  /// The id of the time entry that was created
  String timeEntryId;

  factory TimeEntryCreated.fromJson(Map<String, dynamic> json) {
    return TimeEntryCreated(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : User.fromJson(json['contractor'] as Map<String, dynamic>),
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as bool,
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as int,
      project: json['project'] == null
          ? null
          : Card.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      timeEntry: json['timeEntry'] == null
          ? null
          : TimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      timeEntryId: json['timeEntryId'] as String,
    );
  }
}

/// A user estimated how long a card (task) will take. For example 5-10h.
/// Also includes situtations when a user revises their estimate.
///
class CardEstimateSet implements TurtleEvent {
  CardEstimateSet(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.estimate,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that set the estimate. Usually done by the person doing the work, but can be done by anyone.
  User actor;

  /// The user that set the estimate. Usually done by the person doing the work, but can be done by anyone.
  String actorId;

  /// The card the estimate was set for
  Card card;

  /// The card the estimate was set for
  String cardId;

  /// The value the cards estimate was set to
  DurationRange estimate;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardEstimateSet.fromJson(Map<String, dynamic> json) {
    return CardEstimateSet(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      estimate: json['estimate'] == null
          ? null
          : DurationRange.fromJson(json['estimate'] as Map<String, dynamic>),
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card had its budget increased or set for the first time.
/// Every card can have a budget. This is used so a customer can budget a feature.
/// For example, a customer could limit the cost of a feature to 100h.
///
class CardBudgetIncreased implements TurtleEvent {
  CardBudgetIncreased(
      {this.actor,
      this.actorId,
      this.budget,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that increased the budget
  User actor;

  /// The user that increased the budget
  String actorId;

  /// The amount the card's budget was increased by
  CardBudget budget;

  /// The card which had its budget increased
  Card card;

  /// The card which had its budget increased
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardBudgetIncreased.fromJson(Map<String, dynamic> json) {
    return CardBudgetIncreased(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      budget: json['budget'] == null
          ? null
          : CardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// An hourly contract between a project and user. Used in generating transactions when a user tracks time.
/// It is worth noting that contracts are immutable. They can only be started and ended. (This is to avoid complications which we don't get into here.)
///
class Contract {
  Contract(
      {this.active,
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
  User contractor;

  /// The amount of money the contractor earns for each hour billed.
  Money contractorHourlyRate;

  /// The amount of money the customer spends for each hour the contractor bills.
  Money customerHourlyRate;

  /// The time the contract was ended. Empty if the contract is currently active.
  String endedAt;

  int id;

  /// The project the contractor does work for.
  Project project;

  /// The time the contract was started.
  String startedAt;

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      active: json['active'] as bool,
      contractor: json['contractor'] == null
          ? null
          : User.fromJson(json['contractor'] as Map<String, dynamic>),
      contractorHourlyRate: json['contractorHourlyRate'] == null
          ? null
          : Money.fromJson(
              json['contractorHourlyRate'] as Map<String, dynamic>),
      customerHourlyRate: json['customerHourlyRate'] == null
          ? null
          : Money.fromJson(json['customerHourlyRate'] as Map<String, dynamic>),
      endedAt: json['endedAt'] as String,
      id: json['id'] as int,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      startedAt: json['startedAt'] as String,
    );
  }
}

/// A user edited the content of an existing message in a feed.
class FeedMessageEdited implements TurtleEvent {
  FeedMessageEdited(
      {this.actor,
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
  User actor;

  /// The user that edited the message
  String actorId;

  /// The feed the edited message belongs to
  Feed feed;

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

  factory FeedMessageEdited.fromJson(Map<String, dynamic> json) {
    return FeedMessageEdited(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
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

class HubspotDealStage {
  HubspotDealStage(
      {this.active,
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

  factory HubspotDealStage.fromJson(Map<String, dynamic> json) {
    return HubspotDealStage(
      active: json['active'] as bool,
      closedWon: json['closedWon'] as String,
      displayOrder: json['displayOrder'] as int,
      id: json['id'] as int,
      label: json['label'] as String,
      probability: json['probability'] as double,
    );
  }
}

/// A user was added to a project.
class CardMemberAdded implements TurtleEvent {
  CardMemberAdded(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.member,
      this.projectId,
      this.requestId,
      this.time});

  /// The user performing the action. The one who added the user to the project.
  User actor;

  /// The user performing the action. The one who added the user to the project.
  String actorId;

  /// The project the user was added to
  Card card;

  /// The id of the card
  @Deprecated(
      'Use projectId instead since cardId will always point to a project.')
  String cardId;

  int id;

  /// The user that was added to the project
  User member;

  /// The project the user was added to
  String projectId;

  String requestId;

  String time;

  factory CardMemberAdded.fromJson(Map<String, dynamic> json) {
    return CardMemberAdded(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      member: json['member'] == null
          ? null
          : User.fromJson(json['member'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user marked a card as completed.
class CardCompleted implements TurtleEvent {
  CardCompleted(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that marked the card as completed
  User actor;

  /// The user that marked the card as completed
  String actorId;

  /// The card that was completed
  Card card;

  /// The card that was completed
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardCompleted.fromJson(Map<String, dynamic> json) {
    return CardCompleted(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
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
class UserReadFeedEvent implements TurtleEvent {
  UserReadFeedEvent(
      {this.actorId,
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

  factory UserReadFeedEvent.fromJson(Map<String, dynamic> json) {
    return UserReadFeedEvent(
      actorId: json['actorId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class CardDueDateUnset implements TurtleEvent {
  CardDueDateUnset(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that cleared the due date
  User actor;

  /// The user that cleared the due date
  String actorId;

  /// The card the due date was cleared for.
  /// Note that this is the latest reference to the card. It's not a snapshot of the card at the time of this event.
  ///
  Card card;

  /// The card the due date was cleared for
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardDueDateUnset.fromJson(Map<String, dynamic> json) {
    return CardDueDateUnset(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// After paying someone, a manager recorded a payment in the accounting system.
/// Generates a transaction.
///
class PayoutRecorded implements TurtleEvent {
  PayoutRecorded(
      {this.actor,
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
  User actor;

  /// The user that recorded the payout
  String actorId;

  /// The amount of money paid to the freelancer
  Money amount;

  /// The date the payment was made
  String date;

  /// The transaction fee that was paid to the 3rd party provider.
  Money fee;

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
  User user;

  /// The user that was paid
  String userId;

  factory PayoutRecorded.fromJson(Map<String, dynamic> json) {
    return PayoutRecorded(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      date: json['date'] as String,
      fee: json['fee'] == null
          ? null
          : Money.fromJson(json['fee'] as Map<String, dynamic>),
      id: json['id'] as int,
      memo: json['memo'] as String,
      method: json['method'] as String,
      payoutId: json['payoutId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['userId'] as String,
    );
  }
}

/// An activity feed that may be associated with a number of things.
/// Currently supports private 1-on-1 conversations and task-level conversations.
/// Contains user written messages and also activity-related messages like time tracking and task completion.
///
class Feed {
  Feed(
      {this.card,
      this.feedEvents,
      this.feedSubscription,
      this.id,
      this.lastFeedEvent,
      this.otherUser,
      this.project,
      this.source,
      this.version});

  @Deprecated('use source instead')
  Card card;

  /// List of feed events that belong to the activity feed. Sorted by time created ascending.
  List<FeedEvent> feedEvents;

  /// The current user's subscription of this activity feed.
  FeedSubscription feedSubscription;

  /// Unique identifier for an activity feed.
  ///     Generated based on what it is attached to like conversation-123-987, card-556, or meeting-abc
  int id;

  /// The most recent event/message in the activity feed
  FeedEvent lastFeedEvent;

  @Deprecated('use source instead')
  User otherUser;

  /// If the feed is attached to a task, this is the project the task belongs to.
  ///       Useful if you want to show which project a message belong to.
  Card project;

  /// The entity the activity feed is attached to.
  ///         It's either the other user in the conversation if it's a private message.
  ///         Or it's the card it's attached to.
  FeedSource source;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      feedEvents: (json['feedEvents'] as List)
          ?.map((e) =>
              e == null ? null : FeedEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedSubscription: json['feedSubscription'] == null
          ? null
          : FeedSubscription.fromJson(
              json['feedSubscription'] as Map<String, dynamic>),
      id: json['id'] as int,
      lastFeedEvent: json['lastFeedEvent'] == null
          ? null
          : FeedEvent.fromJson(json['lastFeedEvent'] as Map<String, dynamic>),
      otherUser: json['otherUser'] == null
          ? null
          : User.fromJson(json['otherUser'] as Map<String, dynamic>),
      project: json['project'] == null
          ? null
          : Card.fromJson(json['project'] as Map<String, dynamic>),
      source: json['source'] == null
          ? null
          : FeedSource.fromJson(json['source'] as Map<String, dynamic>),
      version: json['version'] as String,
    );
  }
}

/// Money was transferred between two accounts
class AccountTransfer implements TurtleEvent {
  AccountTransfer(
      {this.actor,
      this.actorId,
      this.amount,
      this.destAccountId,
      this.id,
      this.memo,
      this.requestId,
      this.sourceAccountId,
      this.time});

  /// The user that performed the action
  User actor;

  /// The user that performed the action
  String actorId;

  /// The amount of money transferred
  Money amount;

  /// The account the money was deposited to
  String destAccountId;

  int id;

  /// An optional memo the preson doing the transfer can write in
  String memo;

  String requestId;

  /// The account the money was withdrawn from
  String sourceAccountId;

  String time;

  factory AccountTransfer.fromJson(Map<String, dynamic> json) {
    return AccountTransfer(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      destAccountId: json['destAccountId'] as String,
      id: json['id'] as int,
      memo: json['memo'] as String,
      requestId: json['requestId'] as String,
      sourceAccountId: json['sourceAccountId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user was removed from a project
class CardMemberRemoved implements TurtleEvent {
  CardMemberRemoved(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.member,
      this.projectId,
      this.requestId,
      this.time});

  /// The user performing the action. The one who added the user to the project.
  User actor;

  /// The user performing the action. The one who added the user to the project.
  String actorId;

  /// The project the user was removed from
  Card card;

  /// The id of the card
  @Deprecated(
      'Use projectId instead since cardId will always point to a project.')
  String cardId;

  int id;

  /// The user that was removed from the project
  User member;

  String projectId;

  String requestId;

  String time;

  factory CardMemberRemoved.fromJson(Map<String, dynamic> json) {
    return CardMemberRemoved(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      member: json['member'] == null
          ? null
          : User.fromJson(json['member'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A card was move from one parent to another
class CardMoved implements TurtleEvent {
  CardMoved(
      {this.actor,
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
  User actor;

  /// The user who moved the card
  String actorId;

  /// The card that was moved
  Card card;

  /// The card that was moved
  String cardId;

  int id;

  /// The project the card was moved within. Currently cards can only be moved within a project.
  String projectId;

  String requestId;

  String time;

  /// The new parent the card was moved under
  Card to;

  /// The new parent the card was moved under
  String toId;

  factory CardMoved.fromJson(Map<String, dynamic> json) {
    return CardMoved(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      to: json['to'] == null
          ? null
          : Card.fromJson(json['to'] as Map<String, dynamic>),
      toId: json['toId'] as String,
    );
  }
}

/// Wrapper for a string scalar
class StringObject implements DocumentToken {
  StringObject({this.value});

  String value;

  factory StringObject.fromJson(Map<String, dynamic> json) {
    return StringObject(
      value: json['value'] as String,
    );
  }
}

/// A user was charged on their credit card.
/// Generates a transaction.
///
class StripeChargeCreated implements TurtleEvent {
  StripeChargeCreated(
      {this.actor,
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
  User actor;

  /// The credit card that was charged
  CreditCard creditCard;

  int id;

  @Deprecated('use creditCard instead')
  String last4;

  /// The project the charge was associated wtih.
  Card project;

  String requestId;

  String time;

  factory StripeChargeCreated.fromJson(Map<String, dynamic> json) {
    return StripeChargeCreated(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      creditCard: json['creditCard'] == null
          ? null
          : CreditCard.fromJson(json['creditCard'] as Map<String, dynamic>),
      id: json['id'] as int,
      last4: json['last4'] as String,
      project: json['project'] == null
          ? null
          : Card.fromJson(json['project'] as Map<String, dynamic>),
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// The name property of a card was changed
class CardRenamed implements TurtleEvent {
  CardRenamed(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.cardName,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user who renamed the card
  User actor;

  /// The user who renamed the card
  String actorId;

  /// The card that was renamed
  Card card;

  /// The card that was renamed
  String cardId;

  /// The new name the card was renamed to
  String cardName;

  int id;

  /// The project of the card that was renamed
  String projectId;

  String requestId;

  String time;

  factory CardRenamed.fromJson(Map<String, dynamic> json) {
    return CardRenamed(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A range of duration, such as 1.5-2h.
class DurationRange implements DocumentToken {
  DurationRange({this.max, this.min});

  /// The upper bound of the range. If max is the same as min, then it represents a single value like 2h.
  bool max;

  /// The lower bound of the range
  bool min;

  factory DurationRange.fromJson(Map<String, dynamic> json) {
    return DurationRange(
      max: json['max'] as bool,
      min: json['min'] as bool,
    );
  }
}

class Reaction {
  Reaction({this.emoji, this.reaction, this.userId});

  /// The emoji of the reaction like "🐢"
  String emoji;

  @Deprecated('Internal use')
  String reaction;

  /// The id of the user that added the reaction
  String userId;

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      emoji: json['emoji'] as String,
      reaction: json['reaction'] as String,
      userId: json['userId'] as String,
    );
  }
}

/// A single accounting entry (event) for an account.
/// Whenever a transaction is generated, it has 2+ accounting entries.
///
class AccountEntry {
  AccountEntry(
      {this.balanceSnapshot,
      this.createdAt,
      this.delta,
      this.memo,
      this.sourceEvent});

  /// The total balance at this moment. (Includes the delta applied.)
  Money balanceSnapshot;

  /// The time the account entry and its transaction were generated.
  String createdAt;

  /// The change in balance at this moment
  Money delta;

  /// If a memo was entered, the contents of the memo.
  String memo;

  /// The associated domain event that was used to generate this accounting entry and transaction.
  TurtleEvent sourceEvent;

  factory AccountEntry.fromJson(Map<String, dynamic> json) {
    return AccountEntry(
      balanceSnapshot: json['balanceSnapshot'] == null
          ? null
          : Money.fromJson(json['balanceSnapshot'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      delta: json['delta'] == null
          ? null
          : Money.fromJson(json['delta'] as Map<String, dynamic>),
      memo: json['memo'] as String,
      sourceEvent: json['sourceEvent'] == null
          ? null
          : TurtleEvent.fromJson(json['sourceEvent'] as Map<String, dynamic>),
    );
  }
}

class HubspotContact {
  HubspotContact(
      {this.coreSkills,
      this.githubUsername,
      this.hourlyRate,
      this.id,
      this.recruitingStage});

  List<String> coreSkills;

  String githubUsername;

  Money hourlyRate;

  int id;

  HubspotDealStage recruitingStage;

  factory HubspotContact.fromJson(Map<String, dynamic> json) {
    return HubspotContact(
      coreSkills:
          (json['coreSkills'] as List)?.map((e) => e as String)?.toList(),
      githubUsername: json['githubUsername'] as String,
      hourlyRate: json['hourlyRate'] == null
          ? null
          : Money.fromJson(json['hourlyRate'] as Map<String, dynamic>),
      id: json['id'] as int,
      recruitingStage: json['recruitingStage'] == null
          ? null
          : HubspotDealStage.fromJson(
              json['recruitingStage'] as Map<String, dynamic>),
    );
  }
}

/// Represents hourly work done by a contrator.
/// Whenever they do work, the contractor logs how much time was spent, the associated task, some notes about the work.
///
class TimeEntry implements DocumentToken {
  TimeEntry(
      {this.addedAt,
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
  Card card;

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
  User user;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      addedAt: json['addedAt'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      contractId: json['contractId'] as String,
      date: json['date'] as String,
      deleted: json['deleted'] as bool,
      duration: json['duration'] as bool,
      edited: json['edited'] as bool,
      id: json['id'] as int,
      memo: json['memo'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      version: json['version'] as String,
    );
  }
}

/// A completed card was marked as incomplete
class CardUncompleted implements TurtleEvent {
  CardUncompleted(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that marked the card as incomplete
  User actor;

  /// The user that marked the card as incomplete
  String actorId;

  /// The card that was marked incomplete
  Card card;

  /// The card that was marked incomplete
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardUncompleted.fromJson(Map<String, dynamic> json) {
    return CardUncompleted(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A credit card that customers pay with. Currently all credit cards are from Stripe.
class CreditCard {
  CreditCard(
      {this.brand,
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
  User owner;

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      brand: json['brand'] as String,
      expMonth: json['expMonth'] as int,
      expYear: json['expYear'] as int,
      id: json['id'] as int,
      last4: json['last4'] as String,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }
}

/// A new card was created.
/// If the card is a project (root card), then parentId will be null and the projectId will equal to the cardId.
///
class CardCreated implements TurtleEvent {
  CardCreated(
      {this.actor,
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
  User actor;

  /// The user that created the card
  String actorId;

  /// The card that was created.
  /// Note that this is the latest reference to the card. It's not a snapshot of the card when it was created.
  ///
  Card card;

  /// The id of the newly created card
  String cardId;

  /// The name of the card. This is what shows up in a tree view of a task manager.
  String cardName;

  int id;

  /// The parent card it was created under. This is null if a root project-card was created.
  /// Note that this is the latest reference to the parent. It's not a snapshot of the card when it was created.
  ///
  Card parent;

  /// The parent card it was created under. This is null if a root project-card was created.
  String parentId;

  /// The project that the card was created in. If a project-card was created, this is equal to the id of the card.
  String projectId;

  String requestId;

  String time;

  factory CardCreated.fromJson(Map<String, dynamic> json) {
    return CardCreated(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      cardName: json['cardName'] as String,
      id: json['id'] as int,
      parent: json['parent'] == null
          ? null
          : Card.fromJson(json['parent'] as Map<String, dynamic>),
      parentId: json['parentId'] as String,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class CardDueDateSet implements TurtleEvent {
  CardDueDateSet(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.dueDate,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that set the due date
  User actor;

  /// The user that set the due date
  String actorId;

  /// The card the due date was set for.
  /// Note that this is the latest reference to the card. It's not a snapshot of the card at the time of this event.
  ///
  Card card;

  /// The card the due date was set for
  String cardId;

  /// The value the due date was set to.
  String dueDate;

  int id;

  /// The project of the card
  String projectId;

  String requestId;

  String time;

  factory CardDueDateSet.fromJson(Map<String, dynamic> json) {
    return CardDueDateSet(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      dueDate: json['dueDate'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A directional link between two cards in Turtle. Kind of like a hyperlink.
/// Used for things like tying an internal management project to a customer project.
///
class CardLink {
  CardLink({this.from, this.to, this.type});

  /// The card the link is coming from
  Card from;

  /// The card the link is going to
  Card to;

  /// The type of link. For example management or turtle_support.
  String type;

  factory CardLink.fromJson(Map<String, dynamic> json) {
    return CardLink(
      from: json['from'] == null
          ? null
          : Card.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : Card.fromJson(json['to'] as Map<String, dynamic>),
      type: json['type'] as String,
    );
  }
}

/// Object that namespaces data related to the current user
class Me {
  Me(
      {this.accessibleUsers,
      this.events,
      this.eventsCount,
      this.feeds,
      this.permissions,
      this.projects,
      this.unreadCount,
      this.user});

  /// All of the users reachable by the current user based on projects they've been on, users they have interacted with, etc.
  ///         Usually used if you want to give the user autocomplete.
  List<User> accessibleUsers;

  List<TurtleEvent> events;

  int eventsCount;

  /// A list of conversations private/public current user is involved in. Sorted by last activity descending.
  List<Feed> feeds;

  List<Permission> permissions;

  /// The projects the current user is a member of
  List<Project> projects;

  /// The number of messages unread by the current user
  int unreadCount;

  /// The current user object
  User user;

  factory Me.fromJson(Map<String, dynamic> json) {
    return Me(
      accessibleUsers: (json['accessibleUsers'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      events: (json['events'] as List)
          ?.map((e) => e == null
              ? null
              : TurtleEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventsCount: json['eventsCount'] as int,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
              e == null ? null : Feed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      permissions: (json['permissions'] as List)
          ?.map((e) => PermissionValues[e])
          ?.toList(),
      projects: (json['projects'] as List)
          ?.map((e) =>
              e == null ? null : Project.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      unreadCount: json['unreadCount'] as int,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class Money {
  Money({this.amount, this.currency});

  int amount;

  String currency;

  factory Money.fromJson(Map<String, dynamic> json) {
    return Money(
      amount: json['amount'] as int,
      currency: json['currency'] as String,
    );
  }
}

/// A user deleted a time entry that they have already tracked.
/// The editable fields of a time entry are the duration, memo, and date.
/// This generates an adjustment for the contractor to refund Turtle and Turtle to refund the customer.
///
class TimeEntryDeleted implements TurtleEvent {
  TimeEntryDeleted(
      {this.actor,
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
  User actor;

  /// The user that deleted the time entry. (It's possible that this may be different from the user who did the work.)
  String actorId;

  /// The card (task) that the use did work on.
  Card card;

  /// The card (task) that the use did work on.
  String cardId;

  /// The associated contract under which the work was done. Of note is the customer rate and freelancer rate.
  /// If a time entry is deleted, this same contract will be used to avoid edge cases.
  ///
  Contract contract;

  /// The user that did the work. The generated transaction will transfer money into this users account.
  User contractor;

  int id;

  /// The duration (time worked) of the time entry before it was deleted
  bool prevEntryDuration;

  /// The project the card belongs to.
  Card project;

  /// The project the card belongs to.
  String projectId;

  String requestId;

  String time;

  /// A reference to the latest time entry.
  /// Note that this points to the most recent one so its attributes will include all past edits.
  ///
  TimeEntry timeEntry;

  /// The id of the time entry that was edited
  String timeEntryId;

  factory TimeEntryDeleted.fromJson(Map<String, dynamic> json) {
    return TimeEntryDeleted(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : User.fromJson(json['contractor'] as Map<String, dynamic>),
      id: json['id'] as int,
      prevEntryDuration: json['prevEntryDuration'] as bool,
      project: json['project'] == null
          ? null
          : Card.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      timeEntry: json['timeEntry'] == null
          ? null
          : TimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      timeEntryId: json['timeEntryId'] as String,
    );
  }
}

/// A user posted a message to an activity feed.
class FeedMessagePosted implements TurtleEvent {
  FeedMessagePosted(
      {this.actor,
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
  User actor;

  /// The user posted the message
  String actorId;

  /// The feed the message was posted to
  Feed feed;

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

  factory FeedMessagePosted.fromJson(Map<String, dynamic> json) {
    return FeedMessagePosted(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
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

/// Every time a notifition is delivered, delivery record is created to keep track of information about the delivery.
/// Used for debugging when (and if) a user is receiving notifiations.
///
class NotificationDelivery {
  NotificationDelivery(
      {this.deliveredAt,
      this.feed,
      this.feedEvent,
      this.id,
      this.recipient,
      this.type});

  /// When the message about the notification was delivered
  String deliveredAt;

  /// The activity feed that the notification originated from
  Feed feed;

  /// The exact feed event (message) the notification originated from
  FeedEvent feedEvent;

  int id;

  /// The user the notification was delivered to.
  User recipient;

  /// The medium of delivery. Currently can be push or email.
  NotificationDeliveryType type;

  factory NotificationDelivery.fromJson(Map<String, dynamic> json) {
    return NotificationDelivery(
      deliveredAt: json['deliveredAt'] as String,
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEvent: json['feedEvent'] == null
          ? null
          : FeedEvent.fromJson(json['feedEvent'] as Map<String, dynamic>),
      id: json['id'] as int,
      recipient: json['recipient'] == null
          ? null
          : User.fromJson(json['recipient'] as Map<String, dynamic>),
      type: NotificationDeliveryTypeValues[json['type']],
    );
  }
}

/// A card had its budget removed.
/// Usually means that a customer decided they didn't want a budget for a card.
///
class CardBudgetUnset implements TurtleEvent {
  CardBudgetUnset(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that removed the cards budget
  User actor;

  /// The user that removed the cards budget
  String actorId;

  /// The card which had its budget removed
  Card card;

  /// The card which had its budget removed
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardBudgetUnset.fromJson(Map<String, dynamic> json) {
    return CardBudgetUnset(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user removed the estimate for a card (task)
class CardEstimateUnset implements TurtleEvent {
  CardEstimateUnset(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that set the estimate
  User actor;

  /// The user that removed the estimate
  String actorId;

  /// The card the estimate was removed for
  Card card;

  /// The card the estimate was removed for
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardEstimateUnset.fromJson(Map<String, dynamic> json) {
    return CardEstimateUnset(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class RootMutationType {
  RootMutationType(
      {this.projectAddBalanceWithStripe,
      this.userSetSkills,
      this.timeEntryDelete,
      this.cardMove,
      this.sendLowBalanceReminder,
      this.contractStart,
      this.cardAddMember,
      this.meetingRoomJoin,
      this.feedDeleteMessage,
      this.updateAvailability,
      this.cardLinkCreate,
      this.addReaction,
      this.cardUnassign,
      this.profileTimezoneSet,
      this.timeEntryEdit,
      this.feedMarkAsRead,
      this.cardComplete,
      this.cardEstimateUnset,
      this.removeReaction,
      this.cardBudgetUnset,
      this.feedEditMessage,
      this.recordPayout,
      this.userSetRoles,
      this.cardTagsSet,
      this.cardDelete,
      this.cardRemoveMember,
      this.profileNameSet,
      this.cardDueDateSet,
      this.feedPostMessage,
      this.contractEnd,
      this.timeEntryCreate,
      this.cardAssign,
      this.cardBudgetDecrease,
      this.linkOrCreateHubSpotContact,
      this.cardLinkDelete,
      this.cardCreate,
      this.accountOpen,
      this.cardBudgetIncrease,
      this.accountTransfer,
      this.cardDueDateUnset,
      this.cardUncomplete,
      this.cardInviteUser,
      this.cardEstimateSet,
      this.cardUndelete,
      this.cardRename});

  /// Refill your project balance by paying with Stripe.
  /// Each project has an associated project:idofproject account which the balance will get deposited into.
  ///
  dynamic projectAddBalanceWithStripe;

  /// Set the skills a user has. Used by Turtle internally to match contractors to new projects.
  dynamic userSetSkills;

  /// Deletes the time entry for work that was done.
  /// Generates a transaction that takes money from your account and gives it back to the customer.
  ///
  dynamic timeEntryDelete;

  /// Move a card (task) from one location to another.
  /// Currently only possible to move cards that belong to a project within their own project.
  ///
  Card cardMove;

  /// Send a reminder to a customer about their project once their balance becomes low.
  /// Because of the nuances around timing when to send these e-mails, this is currently a manual operation.
  ///
  /// The e-mail says something like this:
  ///
  /// Hi John,
  ///
  /// This is a friendly reminder that your Turtle balance for ACME is now ___.
  /// ...
  ///
  dynamic sendLowBalanceReminder;

  /// Start a contract between a person and a project.
  /// This is required for a contractor to start billing time and working on a project so the accounting system can generate the proper transactions when time is tracked.
  /// Note: contracts are immutable. To change a contractor's rate, you must end a contract and start a new one.
  /// A user can have a max of one contract per project.
  ///
  dynamic contractStart;

  /// Add a user to a project.
  dynamic cardAddMember;

  TwilioAuth meetingRoomJoin;

  /// Delete a feed event (message) in a feed.
  dynamic feedDeleteMessage;

  /// Update a user's availability based on how many hours/week they are free to work on Turtle.
  /// This can be used to compare their desired workload with actual workload from time entries.
  ///
  /// Currently, availability is based on week-blocks (Sun-Sat) to keep things simple.
  ///
  /// For example, this is a visual representation of an availability calendar for a user gets filled:
  ///
  /// May 2019                timePerWeek
  /// Su Mo Tu We Th Fr Sa
  ///          1  2  3  4     10h
  /// 5  6  7  8  9 10 11     15h
  /// 12 13 14 15 16 17 18    20h
  /// 19 20 21 22 23 24 25    10h
  /// 26 27 28 29 30 31       10h
  ///
  dynamic updateAvailability;

  /// Create a directional link between two cards. This is kind of like a hyperlink.
  /// Used for things like tying an internal management project to a customer project.
  ///
  /// Currently, links are unique by link_type, from_id, and to_id.
  /// Trying to create two links with all of these the same will result in an error.
  ///
  dynamic cardLinkCreate;

  /// Add a reaction to a feed event.
  /// All feed events within a feed can have reactions. Just like Slack, HipChat, etc.
  ///
  dynamic addReaction;

  /// Remove the assignee for a card (task)
  Card cardUnassign;

  /// Set your current timezone.
  /// Will be used by managers and the Turtle platform to help with coordinating meetings/communication.
  ///
  dynamic profileTimezoneSet;

  /// Modify one or more attributes of a time entry.
  /// If the duration is modified, an adjustment transaction is generated to make sure customer/user balances are accurate.
  ///
  dynamic timeEntryEdit;

  /// Mark all unread feed events (unread by you) in a feed as read.
  /// If all feed events have already been read, this results in a no-op.
  ///
  dynamic feedMarkAsRead;

  /// Mark a card as complete
  Card cardComplete;

  /// Remove an estimate a card (task).
  ///
  Card cardEstimateUnset;

  /// Remove a reaction from a feed event.
  /// All feed events within a feed can have reactions. Just like Slack, HipChat, etc.
  ///
  dynamic removeReaction;

  /// Completely remove the budget for a card.
  /// Usually used if a customer decides they don't want a budget anymore.
  ///
  Card cardBudgetUnset;

  /// Edit the message body of a feed event
  ///
  dynamic feedEditMessage;

  /// Record a payout to a user.
  /// Each user has an acccount with a balance. When time is billed, send a referral, etc, their balance increasses.
  /// Once a payout is recorded, their balance decreases by the amount they were paid.
  ///
  /// Imagine a contractor has $500 in their account. They get paid $400. Their balance will now be $100.
  ///
  dynamic recordPayout;

  /// Set the roles of a user. Overwrites the previous list of roles.
  dynamic userSetRoles;

  /// Set the tags of a card. Overwrites the previous list of tags.
  /// If you want to add a tag, make sure to pass the entire list of tags with the new tag.
  ///
  dynamic cardTagsSet;

  /// Delete a card (project/task)
  /// Deleting a card which has subtasks will also mark those subtasks as deleted.
  /// Rsetoring those tasks with [CardUndelete] will also restore those subtasks.
  ///
  Card cardDelete;

  /// Remove a user from a project.
  /// They will lose access to everything in the project.
  ///
  dynamic cardRemoveMember;

  /// Set your full name.
  /// This will override whatever is taken from your auth account (like google).
  /// This will also affect mentions in chat.
  ///
  dynamic profileNameSet;

  /// Set the due date of a card.
  /// Use CardDueDateUnset to remove the due date.
  ///
  Card cardDueDateSet;

  /// Post a message to a feed. Similar to posting a message in Slack or HipChat.
  dynamic feedPostMessage;

  /// End a contract.
  /// This means time can no longer be tracked by a contractor to this project without a new contract being started.
  ///
  dynamic contractEnd;

  /// Track logs for work that you have done.
  /// Generates a transaction that deducts from customer account and adds to the your account.
  ///
  dynamic timeEntryCreate;

  /// Assign a card to a user
  Card cardAssign;

  /// Decrease the budget of a card.
  /// Every card can have a budget. This is used so a customer can budget a feature.
  /// For example, a customer could limit the cost of a feature to 100h.
  /// Budgets operations are relative so the user can work relative to the current budget.
  ///
  Card cardBudgetDecrease;

  /// Link or create HubSpot contact
  HubspotContact linkOrCreateHubSpotContact;

  /// Remove a directional link between two cards.
  ///
  dynamic cardLinkDelete;

  /// Create a new card. This could either mean creating a project or a task.
  ///
  Card cardCreate;

  /// Open an account if one doesn't already exist
  dynamic accountOpen;

  /// Decrease the budget of a card. To set the initial budget of a card, use this command.
  /// Every card can have a budget. This is used so a customer can budget a feature.
  /// For example, a customer could limit the cost of a feature to 100h.
  /// Budgets operations are relative so the user can work relative to the current budget.
  ///
  Card cardBudgetIncrease;

  /// Transfer money from one account to another.
  dynamic accountTransfer;

  /// Clear the due date of a card
  Card cardDueDateUnset;

  /// Mark a completed task as incomplete again
  Card cardUncomplete;

  /// Add a user to a project and send them an e-mail notification saying they were invited to the project.
  ///
  /// If the user exists by e-mail, this user will be invited.
  /// If the user doesn't exist by e-mail, an account will be created for the user.
  ///
  User cardInviteUser;

  /// Set (or update) an estimated for how long you think a card (task) will take to complete. For example 5-10h.
  ///
  Card cardEstimateSet;

  /// Restore a deleted card and all of its subtasks.
  ///
  Card cardUndelete;

  /// Change the name of a card (or project)
  Card cardRename;

  factory RootMutationType.fromJson(Map<String, dynamic> json) {
    return RootMutationType(
      projectAddBalanceWithStripe: json['projectAddBalanceWithStripe'],
      userSetSkills: json['userSetSkills'],
      timeEntryDelete: json['timeEntryDelete'],
      cardMove: json['cardMove'] == null
          ? null
          : Card.fromJson(json['cardMove'] as Map<String, dynamic>),
      sendLowBalanceReminder: json['sendLowBalanceReminder'],
      contractStart: json['contractStart'],
      cardAddMember: json['cardAddMember'],
      meetingRoomJoin: json['meetingRoomJoin'] == null
          ? null
          : TwilioAuth.fromJson(
              json['meetingRoomJoin'] as Map<String, dynamic>),
      feedDeleteMessage: json['feedDeleteMessage'],
      updateAvailability: json['updateAvailability'],
      cardLinkCreate: json['cardLinkCreate'],
      addReaction: json['addReaction'],
      cardUnassign: json['cardUnassign'] == null
          ? null
          : Card.fromJson(json['cardUnassign'] as Map<String, dynamic>),
      profileTimezoneSet: json['profileTimezoneSet'],
      timeEntryEdit: json['timeEntryEdit'],
      feedMarkAsRead: json['feedMarkAsRead'],
      cardComplete: json['cardComplete'] == null
          ? null
          : Card.fromJson(json['cardComplete'] as Map<String, dynamic>),
      cardEstimateUnset: json['cardEstimateUnset'] == null
          ? null
          : Card.fromJson(json['cardEstimateUnset'] as Map<String, dynamic>),
      removeReaction: json['removeReaction'],
      cardBudgetUnset: json['cardBudgetUnset'] == null
          ? null
          : Card.fromJson(json['cardBudgetUnset'] as Map<String, dynamic>),
      feedEditMessage: json['feedEditMessage'],
      recordPayout: json['recordPayout'],
      userSetRoles: json['userSetRoles'],
      cardTagsSet: json['cardTagsSet'],
      cardDelete: json['cardDelete'] == null
          ? null
          : Card.fromJson(json['cardDelete'] as Map<String, dynamic>),
      cardRemoveMember: json['cardRemoveMember'],
      profileNameSet: json['profileNameSet'],
      cardDueDateSet: json['cardDueDateSet'] == null
          ? null
          : Card.fromJson(json['cardDueDateSet'] as Map<String, dynamic>),
      feedPostMessage: json['feedPostMessage'],
      contractEnd: json['contractEnd'],
      timeEntryCreate: json['timeEntryCreate'],
      cardAssign: json['cardAssign'] == null
          ? null
          : Card.fromJson(json['cardAssign'] as Map<String, dynamic>),
      cardBudgetDecrease: json['cardBudgetDecrease'] == null
          ? null
          : Card.fromJson(json['cardBudgetDecrease'] as Map<String, dynamic>),
      linkOrCreateHubSpotContact: json['linkOrCreateHubSpotContact'] == null
          ? null
          : HubspotContact.fromJson(
              json['linkOrCreateHubSpotContact'] as Map<String, dynamic>),
      cardLinkDelete: json['cardLinkDelete'],
      cardCreate: json['cardCreate'] == null
          ? null
          : Card.fromJson(json['cardCreate'] as Map<String, dynamic>),
      accountOpen: json['accountOpen'],
      cardBudgetIncrease: json['cardBudgetIncrease'] == null
          ? null
          : Card.fromJson(json['cardBudgetIncrease'] as Map<String, dynamic>),
      accountTransfer: json['accountTransfer'],
      cardDueDateUnset: json['cardDueDateUnset'] == null
          ? null
          : Card.fromJson(json['cardDueDateUnset'] as Map<String, dynamic>),
      cardUncomplete: json['cardUncomplete'] == null
          ? null
          : Card.fromJson(json['cardUncomplete'] as Map<String, dynamic>),
      cardInviteUser: json['cardInviteUser'] == null
          ? null
          : User.fromJson(json['cardInviteUser'] as Map<String, dynamic>),
      cardEstimateSet: json['cardEstimateSet'] == null
          ? null
          : Card.fromJson(json['cardEstimateSet'] as Map<String, dynamic>),
      cardUndelete: json['cardUndelete'] == null
          ? null
          : Card.fromJson(json['cardUndelete'] as Map<String, dynamic>),
      cardRename: json['cardRename'] == null
          ? null
          : Card.fromJson(json['cardRename'] as Map<String, dynamic>),
    );
  }
}

/// Wrapper for a date scalar
class DateObject implements DocumentToken {
  DateObject({this.value});

  ///
  String value;

  factory DateObject.fromJson(Map<String, dynamic> json) {
    return DateObject(
      value: json['value'] as String,
    );
  }
}

/// The subscription status between a user and an activity feed was updated.
/// This could mean they got subscribed, unsubscribed, or muted.
/// (A user sees all subscribed feeds in their conversation list.)
///
class FeedSubscriptionUpdated implements TurtleEvent {
  FeedSubscriptionUpdated(
      {this.actorId,
      this.feedId,
      this.id,
      this.projectId,
      this.requestId,
      this.subscriptionType,
      this.time});

  /// The user that the subscription belongs to
  String actorId;

  /// The feed that the subscription status changed for
  String feedId;

  int id;

  /// The project the feed belongs to (if any)
  String projectId;

  String requestId;

  /// The new subscription status of the feed
  FeedSubscriptionStatus subscriptionType;

  String time;

  factory FeedSubscriptionUpdated.fromJson(Map<String, dynamic> json) {
    return FeedSubscriptionUpdated(
      actorId: json['actorId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      subscriptionType: FeedSubscriptionStatusValues[json['subscriptionType']],
      time: json['time'] as String,
    );
  }
}

/// A user edited a time entry that they have already tracked.
/// The editable fields of a time entry are the duration, memo, and date.
/// If a memo and date was edited, it's just a simple edit of those attributes.
/// If the duration was edited, this generates an adjustment transaction to account for this change.
///
class TimeEntryEdited implements TurtleEvent {
  TimeEntryEdited(
      {this.actor,
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
  User actor;

  /// The user that edited the time entry. (It's possible that this may be different from the user who did the work.)
  String actorId;

  /// The card (task) that the use did work on.
  Card card;

  /// The card (task) that the use did work on.
  String cardId;

  /// The associated contract under which the work was done. Of note is the customer rate and freelancer rate.
  /// If a time entry is edited, this same contract will be used to avoid situations of a contract being edited retroactively.
  ///
  Contract contract;

  /// The user that did the work. The generated transaction will transfer money into this users account.
  User contractor;

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
  Card project;

  String requestId;

  String time;

  /// A reference to the latest time entry.
  /// Note that this points to the most recent one so its attributes will include all past edits.
  ///
  TimeEntry timeEntry;

  /// The id of the time entry that was edited
  String timeEntryId;

  factory TimeEntryEdited.fromJson(Map<String, dynamic> json) {
    return TimeEntryEdited(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
      contractor: json['contractor'] == null
          ? null
          : User.fromJson(json['contractor'] as Map<String, dynamic>),
      entryDate: json['entryDate'] as String,
      entryDuration: json['entryDuration'] as bool,
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as int,
      prevEntryDuration: json['prevEntryDuration'] as bool,
      project: json['project'] == null
          ? null
          : Card.fromJson(json['project'] as Map<String, dynamic>),
      requestId: json['requestId'] as String,
      time: json['time'] as String,
      timeEntry: json['timeEntry'] == null
          ? null
          : TimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      timeEntryId: json['timeEntryId'] as String,
    );
  }
}

/// The subscription for a specific user and feed.
/// Contains user-specific info like unread counts.
///
class FeedSubscription {
  FeedSubscription(
      {this.feedId,
      this.id,
      this.status,
      this.unreadCount,
      this.userId,
      this.version});

  /// The feed being subscribed to
  String feedId;

  String id;

  FeedSubscriptionStatus status;

  /// The number of unread messages in the feed for the user
  int unreadCount;

  /// The user subscribed to the feed
  String userId;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  factory FeedSubscription.fromJson(Map<String, dynamic> json) {
    return FeedSubscription(
      feedId: json['feedId'] as String,
      id: json['id'] as String,
      status: FeedSubscriptionStatusValues[json['status']],
      unreadCount: json['unreadCount'] as int,
      userId: json['userId'] as String,
      version: json['version'] as String,
    );
  }
}

/// A card's assignee was removed
class CardUnassigned implements TurtleEvent {
  CardUnassigned(
      {this.actor,
      this.actorId,
      this.card,
      this.cardId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that removed the assignee
  User actor;

  /// The user that removed the assignee
  String actorId;

  /// The card that the assignee was removed for
  Card card;

  /// The card that the assignee was removed for
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardUnassigned.fromJson(Map<String, dynamic> json) {
    return CardUnassigned(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class MeetingRecording {
  MeetingRecording(
      {this.downloadUrl,
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
  MeetingRecordingStatus status;

  factory MeetingRecording.fromJson(Map<String, dynamic> json) {
    return MeetingRecording(
      downloadUrl: json['downloadUrl'] as String,
      duration: json['duration'] as bool,
      fileSize: json['fileSize'] as int,
      format: json['format'] as String,
      id: json['id'] as String,
      resolution: json['resolution'] as String,
      status: MeetingRecordingStatusValues[json['status']],
    );
  }
}

class HubspotPipeline {
  HubspotPipeline({this.id, this.label, this.stages});

  int id;

  String label;

  List<HubspotDealStage> stages;

  factory HubspotPipeline.fromJson(Map<String, dynamic> json) {
    return HubspotPipeline(
      id: json['id'] as int,
      label: json['label'] as String,
      stages: (json['stages'] as List)
          ?.map((e) => e == null
              ? null
              : HubspotDealStage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// An entry representing how many hours/week a contractor wants to work.
/// This can be used to compare their desired workload with actual workload from time entries.
/// To simplify things, start and end dates currently must line up on a US calendar.
///
class AvailabilityEntry {
  AvailabilityEntry(
      {this.author,
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
  User author;

  /// The user id that logged the entry. Might be a manager or the user self-reporting.
  String authorId;

  /// End of the time period (inclusive). Currently must be a Saturday, US end of the week.
  String endDate;

  /// The project in question.
  /// Contractors can report the total amount of time they'd like to work. (This field will be empty)
  /// Or contractors can report how much they would like to work specific to a project. (This field will refer to the project)
  ///
  Project project;

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
  User user;

  /// The contractor id doing the work
  String userId;

  factory AvailabilityEntry.fromJson(Map<String, dynamic> json) {
    return AvailabilityEntry(
      author: json['author'] == null
          ? null
          : User.fromJson(json['author'] as Map<String, dynamic>),
      authorId: json['authorId'] as String,
      endDate: json['endDate'] as String,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      startDate: json['startDate'] as String,
      timePerWeek: json['timePerWeek'] as bool,
      updatedAt: json['updatedAt'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['userId'] as String,
    );
  }
}

/// A bank-account-like entity that is used for keeping track of balances for projects, contractors, and turtle itself.
///
class Account {
  Account(
      {this.balance,
      this.balancePending,
      this.balanceSettled,
      this.entries,
      this.id,
      this.source,
      this.type});

  /// The current balance of the account. Kind of like a Venmo/PayPal balance. It's the sum of all ledger in the account.
  Money balance;

  Money balancePending;

  Money balanceSettled;

  /// List of transaction entries for this account.
  List<AccountEntry> entries;

  /// A unique identifier for the account of the form type:id
  /// For example turtle:management external:customer_deposits user:27981359507659557423658059497472, project:27157007491395523176927665389568
  /// For user and project accounts, it the second part is the identifier (user or project id) the account refers to.
  ///
  int id;

  /// The entity this account is associated with. Currently only applies to users or projects.
  AccountSource source;

  AccountType type;

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      balance: json['balance'] == null
          ? null
          : Money.fromJson(json['balance'] as Map<String, dynamic>),
      balancePending: json['balancePending'] == null
          ? null
          : Money.fromJson(json['balancePending'] as Map<String, dynamic>),
      balanceSettled: json['balanceSettled'] == null
          ? null
          : Money.fromJson(json['balanceSettled'] as Map<String, dynamic>),
      entries: (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : AccountEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      id: json['id'] as int,
      source: json['source'] == null
          ? null
          : AccountSource.fromJson(json['source'] as Map<String, dynamic>),
      type: AccountTypeValues[json['type']],
    );
  }
}

class Card implements FeedSource, DocumentToken, AccountSource {
  Card(
      {this.assignee,
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
  User assignee;

  /// The id of the user this card is assigned to
  String assigneeId;

  /// The budget specific to this card.
  /// For example a customer may set a 150h budget for a feature.
  /// Does not include budgets of child cards. For reporting, aggregations must be done on the client.
  ///
  CardBudget budget;

  bool completed;

  /// The time when the card was most recently marked completed.
  String completedAt;

  /// The time the card was reated
  String createdAt;

  /// Whether the card is marked deleted or not. If a card is deleted, its children are also marked deleted.
  bool deleted;

  /// Child cards, grandchild cards, and so on. Can control depth and filters.
  List<Card> descendants;

  String dueDate;

  /// Estimate for how long a developer this this task will take. For example 10-15h.
  /// Does not include estimates of child cards.
  ///
  DurationRange estimate;

  /// The associated feed for this card. Every card has an activity feed.
  Feed feed;

  /// The associated feed id for this card. Every card has an activity feed.
  String feedId;

  int id;

  /// The users that are members of the current card. Only applies to root project cards.
  List<User> members;

  dynamic meta;

  /// The title of the card. This is what is usually rendered in a task list.
  String name;

  /// Card links that point from this card to another card.
  List<CardLink> outgoingLinks;

  /// The id of the parent card. The root project card will not have this set.
  String parentId;

  /// An integer representing the order of this card with respect to its siblings.
  /// Frontend should sort children of a card by this propertly. There may be spaces like [1, 10, 15]
  ///
  int position;

  /// The project the card belongs to. The root card itself is a project. In this case projectId and id will be equal.
  Project project;

  /// The id of the project the card belongs to. The root card itself is a project. In this case projectId and id will be equal.
  String projectId;

  /// All time entries tracked for this card.
  List<TimeEntry> timeEntries;

  /// The total time tracked with time entries this card. Does not include time tracked on children.
  bool timeTracked;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      assignee: json['assignee'] == null
          ? null
          : User.fromJson(json['assignee'] as Map<String, dynamic>),
      assigneeId: json['assigneeId'] as String,
      budget: json['budget'] == null
          ? null
          : CardBudget.fromJson(json['budget'] as Map<String, dynamic>),
      completed: json['completed'] as bool,
      completedAt: json['completedAt'] as String,
      createdAt: json['createdAt'] as String,
      deleted: json['deleted'] as bool,
      descendants: (json['descendants'] as List)
          ?.map((e) =>
              e == null ? null : Card.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      dueDate: json['dueDate'] as String,
      estimate: json['estimate'] == null
          ? null
          : DurationRange.fromJson(json['estimate'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      members: (json['members'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      meta: json['meta'],
      name: json['name'] as String,
      outgoingLinks: (json['outgoingLinks'] as List)
          ?.map((e) =>
              e == null ? null : CardLink.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      parentId: json['parentId'] as String,
      position: json['position'] as int,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
              e == null ? null : TimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timeTracked: json['timeTracked'] as bool,
      version: json['version'] as String,
    );
  }
}

class Command {
  Command(
      {this.actor,
      this.executedAt,
      this.id,
      this.input,
      this.requestId,
      this.type});

  User actor;

  String executedAt;

  int id;

  dynamic input;

  String requestId;

  String type;

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      executedAt: json['executedAt'] as String,
      id: json['id'] as int,
      input: json['input'],
      requestId: json['requestId'] as String,
      type: json['type'] as String,
    );
  }
}

/// A user removed their reaction from a feed event (message) in an activity feed
///
class ReactionRemoved implements TurtleEvent {
  ReactionRemoved(
      {this.actorId,
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

  factory ReactionRemoved.fromJson(Map<String, dynamic> json) {
    return ReactionRemoved(
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

class Project {
  Project(
      {this.balance,
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

  Money balance;

  @Deprecated('use balance which is more appropriately named')
  Money budget;

  List<Contract> contracts;

  Money estimatedHourlyRate;

  List<Feed> feeds;

  int id;

  String lastActivity;

  CreditCard lastChargedCard;

  List<Card> managerOverdueCards;

  List<User> managers;

  List<User> members;

  dynamic meta;

  String name;

  List<String> projectStatusTags;

  Card rootCard;

  List<TimeEntry> timeEntries;

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      balance: json['balance'] == null
          ? null
          : Money.fromJson(json['balance'] as Map<String, dynamic>),
      budget: json['budget'] == null
          ? null
          : Money.fromJson(json['budget'] as Map<String, dynamic>),
      contracts: (json['contracts'] as List)
          ?.map((e) =>
              e == null ? null : Contract.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      estimatedHourlyRate: json['estimatedHourlyRate'] == null
          ? null
          : Money.fromJson(json['estimatedHourlyRate'] as Map<String, dynamic>),
      feeds: (json['feeds'] as List)
          ?.map((e) =>
              e == null ? null : Feed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      id: json['id'] as int,
      lastActivity: json['lastActivity'] as String,
      lastChargedCard: json['lastChargedCard'] == null
          ? null
          : CreditCard.fromJson(
              json['lastChargedCard'] as Map<String, dynamic>),
      managerOverdueCards: (json['managerOverdueCards'] as List)
          ?.map((e) =>
              e == null ? null : Card.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      managers: (json['managers'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      members: (json['members'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      meta: json['meta'],
      name: json['name'] as String,
      projectStatusTags: (json['projectStatusTags'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      rootCard: json['rootCard'] == null
          ? null
          : Card.fromJson(json['rootCard'] as Map<String, dynamic>),
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
              e == null ? null : TimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// Represents the budget for a card. Currently only supports a time-based (not money-based) budget.
class CardBudget {
  CardBudget({this.duration});

  /// The max number of hours allocated
  bool duration;

  factory CardBudget.fromJson(Map<String, dynamic> json) {
    return CardBudget(
      duration: json['duration'] as bool,
    );
  }
}

/// A single instance of a video conference meeting. Has a start time, end time, participants and so on.
///
class Meeting {
  Meeting(
      {this.duration,
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
  List<User> participants;

  /// The video recording of the meeting.
  /// Only applies to meetings that have happened in the past with recording enabled.
  ///
  MeetingRecording recording;

  /// The room the meeting belongs to. For example project:27637534222268650867953431281664
  /// A room may only have one meeting going on at a time and all meetings belong to a room.
  ///
  String roomId;

  /// The time the meeting started.
  /// Same as when the first parcipant joined.
  ///
  String startedAt;

  MeetingStatus status;

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      duration: json['duration'] as bool,
      endedAt: json['endedAt'] as String,
      id: json['id'] as String,
      participants: (json['participants'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      recording: json['recording'] == null
          ? null
          : MeetingRecording.fromJson(
              json['recording'] as Map<String, dynamic>),
      roomId: json['roomId'] as String,
      startedAt: json['startedAt'] as String,
      status: MeetingStatusValues[json['status']],
    );
  }
}

/// A card was assigned to a user
class CardAssigned implements TurtleEvent {
  CardAssigned(
      {this.actor,
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
  User actor;

  /// The user who assigned the card
  String actorId;

  /// The user the card was assigned to
  User assignee;

  /// The user the card was assigned to
  String assigneeId;

  /// The card that was assigned
  Card card;

  /// The card that was assigned
  String cardId;

  int id;

  /// The project the card belongs to
  String projectId;

  String requestId;

  String time;

  factory CardAssigned.fromJson(Map<String, dynamic> json) {
    return CardAssigned(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      assignee: json['assignee'] == null
          ? null
          : User.fromJson(json['assignee'] as Map<String, dynamic>),
      assigneeId: json['assigneeId'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cardId: json['cardId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A file stored on S3 that was uploaded by a user.
class File implements DocumentToken {
  File(
      {this.contentType,
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

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
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

class RootQueryType {
  RootQueryType(
      {this.account,
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
  Account account;

  List<Account> accounts;

  List<Project> activeProjects;

  String apiVersion;

  List<AvailabilityEntry> availabilityEntries;

  /// Fetch a card by its id
  Card card;

  /// All cards current user has access to.
  ///
  List<Card> cards;

  /// All cards current user has access to.
  ///
  int cardsCount;

  Command command;

  /// Fetch a feed by its id
  Feed feed;

  /// Fetch a feed event by id
  FeedEvent feedEvent;

  /// All feed events the current user has access to.
  ///
  List<FeedEvent> feedEvents;

  /// All feed events the current user has access to.
  ///
  int feedEventsCount;

  /// Feed subscriptions for the current user.
  ///
  List<FeedSubscription> feedSubscriptions;

  /// Feed subscriptions for the current user.
  ///
  int feedSubscriptionsCount;

  /// All feeds the current user has access to.
  ///
  List<Feed> feeds;

  /// All feeds the current user has access to.
  ///
  int feedsCount;

  HubspotPipeline hubspotPipeline;

  Me me;

  /// Fetch a meeting by its id
  Meeting meeting;

  /// Fetch the meetings for a given project
  List<Meeting> meetings;

  List<NotificationDelivery> notificationDeliveries;

  Project project;

  List<Project> projects;

  /// Time entries for a given user. Defaults to current user.
  ///
  List<TimeEntry> timeEntries;

  /// Time entries for a given user. Defaults to current user.
  ///
  int timeEntriesCount;

  /// Fetch a time entry by its id
  TimeEntry timeEntry;

  /// Fetch a user by id
  User user;

  List<User> users;

  factory RootQueryType.fromJson(Map<String, dynamic> json) {
    return RootQueryType(
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      accounts: (json['accounts'] as List)
          ?.map((e) =>
              e == null ? null : Account.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      activeProjects: (json['activeProjects'] as List)
          ?.map((e) =>
              e == null ? null : Project.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      apiVersion: json['apiVersion'] as String,
      availabilityEntries: (json['availabilityEntries'] as List)
          ?.map((e) => e == null
              ? null
              : AvailabilityEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      cards: (json['cards'] as List)
          ?.map((e) =>
              e == null ? null : Card.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      cardsCount: json['cardsCount'] as int,
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEvent: json['feedEvent'] == null
          ? null
          : FeedEvent.fromJson(json['feedEvent'] as Map<String, dynamic>),
      feedEvents: (json['feedEvents'] as List)
          ?.map((e) =>
              e == null ? null : FeedEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedEventsCount: json['feedEventsCount'] as int,
      feedSubscriptions: (json['feedSubscriptions'] as List)
          ?.map((e) => e == null
              ? null
              : FeedSubscription.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedSubscriptionsCount: json['feedSubscriptionsCount'] as int,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
              e == null ? null : Feed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      feedsCount: json['feedsCount'] as int,
      hubspotPipeline: json['hubspotPipeline'] == null
          ? null
          : HubspotPipeline.fromJson(
              json['hubspotPipeline'] as Map<String, dynamic>),
      me: json['me'] == null
          ? null
          : Me.fromJson(json['me'] as Map<String, dynamic>),
      meeting: json['meeting'] == null
          ? null
          : Meeting.fromJson(json['meeting'] as Map<String, dynamic>),
      meetings: (json['meetings'] as List)
          ?.map((e) =>
              e == null ? null : Meeting.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      notificationDeliveries: (json['notificationDeliveries'] as List)
          ?.map((e) => e == null
              ? null
              : NotificationDelivery.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      projects: (json['projects'] as List)
          ?.map((e) =>
              e == null ? null : Project.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
              e == null ? null : TimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timeEntriesCount: json['timeEntriesCount'] as int,
      timeEntry: json['timeEntry'] == null
          ? null
          : TimeEntry.fromJson(json['timeEntry'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      users: (json['users'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// Link to an internet webpage or an internal turtle link (like card or user)
class Link implements DocumentToken {
  Link({this.title, this.type, this.uri});

  /// The title of the link. It's either the name of the entity or left blank.
  String title;

  /// The type of entity that is linked to. It can be user, card, or link (default).
  String type;

  /// The http://... url this goes to
  String uri;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      title: json['title'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }
}

class User implements FeedSource, DocumentToken, AccountSource {
  User(
      {this.activeContractsCount,
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
  List<Contract> contracts;

  String email;

  /// Activity feeds the user currently has access to. Sorted by most recently active first.
  List<Feed> feeds;

  HubspotContact hubspotContact;

  /// Unique identifier for the user. A user may have multiple identies connected to a single user.
  int id;

  /// The full name of the user. Will be taken from their Google account on initial login. Can be overridden in their profile.
  String name;

  String photo;

  /// Projects the user is currently a member of.
  List<Project> projects;

  /// The system-wide rules a user has.
  List<Role> roles;

  /// The registration status of the user. Can currently be either invited or active.
  String status;

  /// The time entries tracked by the current user
  List<TimeEntry> timeEntries;

  /// The timezone of the user related currently based on what we read from the browser.
  String timezone;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      activeContractsCount: json['activeContractsCount'] as int,
      contracts: (json['contracts'] as List)
          ?.map((e) =>
              e == null ? null : Contract.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      email: json['email'] as String,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
              e == null ? null : Feed.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      hubspotContact: json['hubspotContact'] == null
          ? null
          : HubspotContact.fromJson(
              json['hubspotContact'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
      projects: (json['projects'] as List)
          ?.map((e) =>
              e == null ? null : Project.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      roles: (json['roles'] as List)?.map((e) => RoleValues[e])?.toList(),
      status: json['status'] as String,
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
              e == null ? null : TimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timezone: json['timezone'] as String,
    );
  }
}

/// When new events are generated, a notification service decides which users should be notified of the event.
/// This could include events like users posting messages, tasks getting completed, and so on.
/// When a user should be notified of an event, this event is generated.
/// This, in combination with [UserReadFeedEvent], can be used to generate unread counts per feed.
///
class UserUnreadFeedEvent implements TurtleEvent {
  UserUnreadFeedEvent(
      {this.actorId,
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

  factory UserUnreadFeedEvent.fromJson(Map<String, dynamic> json) {
    return UserUnreadFeedEvent(
      actorId: json['actorId'] as String,
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// A user edited deleted an existing message in a feed.
class FeedMessageDeleted implements TurtleEvent {
  FeedMessageDeleted(
      {this.actor,
      this.actorId,
      this.feed,
      this.feedEventId,
      this.feedId,
      this.id,
      this.projectId,
      this.requestId,
      this.time});

  /// The user that deleted the message
  User actor;

  /// The user that deleted the message
  String actorId;

  /// The feed the edited message belongs to
  Feed feed;

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

  factory FeedMessageDeleted.fromJson(Map<String, dynamic> json) {
    return FeedMessageDeleted(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEventId: json['feedEventId'] as String,
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

/// The authentication result after joining a twilio meeting room.
class TwilioAuth {
  TwilioAuth({this.token});

  /// The token used for requests related to a twilio meeting room
  String token;

  factory TwilioAuth.fromJson(Map<String, dynamic> json) {
    return TwilioAuth(
      token: json['token'] as String,
    );
  }
}

class FeedEvent {
  FeedEvent(
      {this.actor,
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
  User actor;

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
  List<DocumentToken> bodyTokens;

  /// The time the feed event was posted if it was a message or the time the event was generated.
  String createdAt;

  /// Whether the message was edited. Also applies to other edits like time entries.
  bool edited;

  /// The time of the edit if edited=true
  String editedAt;

  /// The domain event that corresponds to this feed event.
  TurtleEvent event;

  /// The feed id this belongs to
  String feedId;

  /// Unique identifier of the feed event. It is time-ordered so sorting by ids results in order of creation.
  int id;

  /// An array of individual reactions to messages. Multiple users reacting with the same emoji results in distinct records.
  List<Reaction> reactions;

  /// Every time this entity is modified, its version will be updated with a larger value than before. Useful for syncing.
  String version;

  factory FeedEvent.fromJson(Map<String, dynamic> json) {
    return FeedEvent(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      body: json['body'] as String,
      bodyTokens: (json['bodyTokens'] as List)
          ?.map((e) => e == null
              ? null
              : DocumentToken.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      createdAt: json['createdAt'] as String,
      edited: json['edited'] as bool,
      editedAt: json['editedAt'] as String,
      event: json['event'] == null
          ? null
          : TurtleEvent.fromJson(json['event'] as Map<String, dynamic>),
      feedId: json['feedId'] as String,
      id: json['id'] as int,
      reactions: (json['reactions'] as List)
          ?.map((e) =>
              e == null ? null : Reaction.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      version: json['version'] as String,
    );
  }
}

class __InputValue {
  __InputValue({this.defaultValue, this.description, this.name, this.type});

  String defaultValue;

  String description;

  String name;

  __Type type;

  factory __InputValue.fromJson(Map<String, dynamic> json) {
    return __InputValue(
      defaultValue: json['defaultValue'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      type: json['type'] == null
          ? null
          : __Type.fromJson(json['type'] as Map<String, dynamic>),
    );
  }
}

/// Represents a directive
class __Directive {
  __Directive(
      {this.args,
      this.description,
      this.locations,
      this.name,
      this.onField,
      this.onFragment,
      this.onOperation});

  List<__InputValue> args;

  String description;

  List<__DirectiveLocation> locations;

  String name;

  @Deprecated('Check `locations` field for enum value FIELD')
  bool onField;

  @Deprecated('Check `locations` field for enum value FRAGMENT_SPREAD')
  bool onFragment;

  @Deprecated('Check `locations` field for enum value OPERATION')
  bool onOperation;

  factory __Directive.fromJson(Map<String, dynamic> json) {
    return __Directive(
      args: (json['args'] as List)
          ?.map((e) => e == null
              ? null
              : __InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      locations: (json['locations'] as List)
          ?.map((e) => __DirectiveLocationValues[e])
          ?.toList(),
      name: json['name'] as String,
      onField: json['onField'] as bool,
      onFragment: json['onFragment'] as bool,
      onOperation: json['onOperation'] as bool,
    );
  }
}

class __Field {
  __Field(
      {this.args,
      this.deprecationReason,
      this.description,
      this.isDeprecated,
      this.name,
      this.type});

  List<__InputValue> args;

  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  __Type type;

  factory __Field.fromJson(Map<String, dynamic> json) {
    return __Field(
      args: (json['args'] as List)
          ?.map((e) => e == null
              ? null
              : __InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      deprecationReason: json['deprecationReason'] as String,
      description: json['description'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      name: json['name'] as String,
      type: json['type'] == null
          ? null
          : __Type.fromJson(json['type'] as Map<String, dynamic>),
    );
  }
}

/// Represents scalars, interfaces, object types, unions, enums in the system
class __Type {
  __Type(
      {this.description,
      this.enumValues,
      this.fields,
      this.inputFields,
      this.interfaces,
      this.kind,
      this.name,
      this.ofType,
      this.possibleTypes});

  String description;

  List<__EnumValue> enumValues;

  List<__Field> fields;

  List<__InputValue> inputFields;

  List<__Type> interfaces;

  String kind;

  String name;

  __Type ofType;

  List<__Type> possibleTypes;

  factory __Type.fromJson(Map<String, dynamic> json) {
    return __Type(
      description: json['description'] as String,
      enumValues: (json['enumValues'] as List)
          ?.map((e) => e == null
              ? null
              : __EnumValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      fields: (json['fields'] as List)
          ?.map((e) =>
              e == null ? null : __Field.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      inputFields: (json['inputFields'] as List)
          ?.map((e) => e == null
              ? null
              : __InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      interfaces: (json['interfaces'] as List)
          ?.map((e) =>
              e == null ? null : __Type.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      kind: json['kind'] as String,
      name: json['name'] as String,
      ofType: json['ofType'] == null
          ? null
          : __Type.fromJson(json['ofType'] as Map<String, dynamic>),
      possibleTypes: (json['possibleTypes'] as List)
          ?.map((e) =>
              e == null ? null : __Type.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

/// Represents a schema
class __Schema {
  __Schema(
      {this.directives,
      this.mutationType,
      this.queryType,
      this.subscriptionType,
      this.types});

  List<__Directive> directives;

  __Type mutationType;

  __Type queryType;

  __Type subscriptionType;

  List<__Type> types;

  factory __Schema.fromJson(Map<String, dynamic> json) {
    return __Schema(
      directives: (json['directives'] as List)
          ?.map((e) => e == null
              ? null
              : __Directive.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      mutationType: json['mutationType'] == null
          ? null
          : __Type.fromJson(json['mutationType'] as Map<String, dynamic>),
      queryType: json['queryType'] == null
          ? null
          : __Type.fromJson(json['queryType'] as Map<String, dynamic>),
      subscriptionType: json['subscriptionType'] == null
          ? null
          : __Type.fromJson(json['subscriptionType'] as Map<String, dynamic>),
      types: (json['types'] as List)
          ?.map((e) =>
              e == null ? null : __Type.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

class __EnumValue {
  __EnumValue(
      {this.deprecationReason, this.description, this.isDeprecated, this.name});

  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  factory __EnumValue.fromJson(Map<String, dynamic> json) {
    return __EnumValue(
      deprecationReason: json['deprecationReason'] as String,
      description: json['description'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      name: json['name'] as String,
    );
  }
}

abstract class Mutation {
  Future<Map<String, dynamic>> query(
      {String document, Map<String, dynamic> variables});

  String _extractFragmentName(String fragment) {
    RegExp exp =
        new RegExp(r"\s*fragment\s+(\w+)\s+on\s+(\w+)", caseSensitive: true);
    return exp.firstMatch(fragment)?.group(1);
  }

  /// [amount]  The amount of money to add to the project account
  /// [cardToken]  The token from the client that represents the credit card details.
  /// Either cardToken or creditCardId must be provided.
  ///
  /// [creditCardId]  The id of an existing credit card on file to charge.
  /// Credit card must belong to you for security purposes unless you are a manager or admin.
  /// Either cardToken or creditCardId must be provided.
  ///
  /// [projectId]  The project to refill
  Future<dynamic> projectAddBalanceWithStripe(
      {String amount,
      String cardToken,
      String creditCardId,
      String projectId}) async {
    ProjectAddBalanceWithStripeInput input =
        new ProjectAddBalanceWithStripeInput(
      amount: amount,
      cardToken: cardToken,
      creditCardId: creditCardId,
      projectId: projectId,
    );
    var result = await query(document: """
              mutation projectAddBalanceWithStripe(\$input:ProjectAddBalanceWithStripeInput!) {
                projectAddBalanceWithStripe(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['projectAddBalanceWithStripe'];
  }

  /// [skills]  THe list of tags to give a user. For example react, ios, android, ml.
  /// This overwrites teh entire list. So if you want to add a skill, you must pass in the full list with the new tags added.
  ///
  /// [userId]  The user to set the skill tags for
  Future<dynamic> userSetSkills({List<String> skills, String userId}) async {
    UserSetSkillsInput input = new UserSetSkillsInput(
      skills: skills,
      userId: userId,
    );
    var result = await query(document: """
              mutation userSetSkills(\$input:UserSetSkillsInput!) {
                userSetSkills(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['userSetSkills'];
  }

  /// [entryId]  The time entry to delete
  Future<dynamic> timeEntryDelete({String entryId}) async {
    TimeEntryDeleteInput input = new TimeEntryDeleteInput(
      entryId: entryId,
    );
    var result = await query(document: """
              mutation timeEntryDelete(\$input:TimeEntryDeleteInput!) {
                timeEntryDelete(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['timeEntryDelete'];
  }

  /// [afterId]  The sibling to move the card right after.
  /// Can't pass in beforeId and afterId together.
  ///
  /// [beforeId]  The sibling to move the card right before.
  /// Can't pass in beforeId and afterId together.
  ///
  /// [cardId]  The card to move
  /// [toId]  The new parent to move the card under.
  /// If you're just reordering the list relative to siblings, set this to the current parent.
  ///
  Future<Card> cardMove(
      {String afterId,
      String beforeId,
      String cardId,
      String toId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardMoveInput input = new CardMoveInput(
      afterId: afterId,
      beforeId: beforeId,
      cardId: cardId,
      toId: toId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardMove(\$input:CardMoveInput!) {
                cardMove(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(result['data']['cardMove'] as Map<String, dynamic>);
  }

  /// [projectId]  The project that has the low balance
  /// [userId]  The user to send the reminder e-mail to
  Future<dynamic> sendLowBalanceReminder(
      {String projectId, String userId}) async {
    SendLowBalanceReminderInput input = new SendLowBalanceReminderInput(
      projectId: projectId,
      userId: userId,
    );
    var result = await query(document: """
              mutation sendLowBalanceReminder(\$input:SendLowBalanceReminderInput!) {
                sendLowBalanceReminder(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['sendLowBalanceReminder'];
  }

  /// [contractId]  Pass in 'new' on the client. The server will replace with a generated id.
  /// [contractorHourlyRate]  How much the contractor earns per hour when they track time
  /// [contractorId]  The contractor the contract is tied to
  /// [customerHourlyRate]  How much the customer gets billed per hour when the contractor tracks time
  /// [projectId]  The project the contract is tied to
  Future<dynamic> contractStart(
      {String contractId,
      String contractorHourlyRate,
      String contractorId,
      String customerHourlyRate,
      String projectId}) async {
    ContractStartInput input = new ContractStartInput(
      contractId: contractId,
      contractorHourlyRate: contractorHourlyRate,
      contractorId: contractorId,
      customerHourlyRate: customerHourlyRate,
      projectId: projectId,
    );
    var result = await query(document: """
              mutation contractStart(\$input:ContractStartInput!) {
                contractStart(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['contractStart'];
  }

  /// [cardId]  The id of the project
  /// [memberId]  The id of the user to add to the project
  Future<dynamic> cardAddMember({String cardId, String memberId}) async {
    CardAddMemberInput input = new CardAddMemberInput(
      cardId: cardId,
      memberId: memberId,
    );
    var result = await query(document: """
              mutation cardAddMember(\$input:CardAddMemberInput!) {
                cardAddMember(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['cardAddMember'];
  }

  Future<TwilioAuth> meetingRoomJoin(String projectId,
      {String fragment =
          'fragment TwilioAuthFragment on TwilioAuth { token  }'}) async {
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation meetingRoomJoin(\$projectId:String!) {
                meetingRoomJoin(projectId:\$projectId) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"projectId": projectId});
    return TwilioAuth.fromJson(
        result['data']['meetingRoomJoin'] as Map<String, dynamic>);
  }

  /// [feedEventId]  The feed event to delete
  Future<dynamic> feedDeleteMessage({String feedEventId}) async {
    FeedDeleteMessageInput input = new FeedDeleteMessageInput(
      feedEventId: feedEventId,
    );
    var result = await query(document: """
              mutation feedDeleteMessage(\$input:FeedDeleteMessageInput!) {
                feedDeleteMessage(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['feedDeleteMessage'];
  }

  /// [endDate]  The end date when the user has this availability.
  /// Must be a Sunday to confirm to the US calendar week.
  ///
  /// [projectId]  The project the user is committing the hours to. Leave this out to submit overall availability.
  /// [startDate]  The start period when the user has this availability.
  /// Must be a Sunday to confirm to the US calendar week.
  ///
  /// [timePerWeek]  The amount of time per week the user has available to from startDate to endDate (inclusive)
  ///
  /// [userId]  The user to update the availabiltiy for
  Future<dynamic> updateAvailability(
      {String endDate,
      String projectId,
      String startDate,
      bool timePerWeek,
      String userId}) async {
    UpdateAvailabilityInput input = new UpdateAvailabilityInput(
      endDate: endDate,
      projectId: projectId,
      startDate: startDate,
      timePerWeek: timePerWeek,
      userId: userId,
    );
    var result = await query(document: """
              mutation updateAvailability(\$input:UpdateAvailabilityInput!) {
                updateAvailability(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['updateAvailability'];
  }

  /// [fromId]  The card the link will come from
  /// [linkType]  The type of link. For example management or turtle_support.
  /// [toId]  The card the link will go to
  Future<dynamic> cardLinkCreate(
      {String fromId, String linkType, String toId}) async {
    CardLinkCreateInput input = new CardLinkCreateInput(
      fromId: fromId,
      linkType: linkType,
      toId: toId,
    );
    var result = await query(document: """
              mutation cardLinkCreate(\$input:CardLinkCreateInput!) {
                cardLinkCreate(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['cardLinkCreate'];
  }

  /// [feedEventId]  The feed event to add the reaction to
  /// [reaction]  The reaction to add. Should be an emoji like 👍
  Future<dynamic> addReaction({String feedEventId, String reaction}) async {
    AddReactionInput input = new AddReactionInput(
      feedEventId: feedEventId,
      reaction: reaction,
    );
    var result = await query(document: """
              mutation addReaction(\$input:AddReactionInput!) {
                addReaction(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['addReaction'];
  }

  /// [cardId]  The card to remove the assignee for
  Future<Card> cardUnassign(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardUnassignInput input = new CardUnassignInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardUnassign(\$input:CardUnassignInput!) {
                cardUnassign(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardUnassign'] as Map<String, dynamic>);
  }

  /// [timezone]  The timezone you are currently in
  Future<dynamic> profileTimezoneSet({String timezone}) async {
    ProfileTimezoneSetInput input = new ProfileTimezoneSetInput(
      timezone: timezone,
    );
    var result = await query(document: """
              mutation profileTimezoneSet(\$input:ProfileTimezoneSetInput!) {
                profileTimezoneSet(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['profileTimezoneSet'];
  }

  /// [entryDate]  The date the work was done (if modified)
  /// [entryDuration]  The amount of work done (if modified)
  /// [entryId]  The time entry to modify
  /// [entryMemo]  Details about the work done (if modified)
  Future<dynamic> timeEntryEdit(
      {String entryDate,
      bool entryDuration,
      String entryId,
      String entryMemo}) async {
    TimeEntryEditInput input = new TimeEntryEditInput(
      entryDate: entryDate,
      entryDuration: entryDuration,
      entryId: entryId,
      entryMemo: entryMemo,
    );
    var result = await query(document: """
              mutation timeEntryEdit(\$input:TimeEntryEditInput!) {
                timeEntryEdit(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['timeEntryEdit'];
  }

  /// [feedId]  The feed you want to mark as read. (Unread feed events in this feed will be marked as read.)
  Future<dynamic> feedMarkAsRead({String feedId}) async {
    FeedMarkAsReadInput input = new FeedMarkAsReadInput(
      feedId: feedId,
    );
    var result = await query(document: """
              mutation feedMarkAsRead(\$input:FeedMarkAsReadInput!) {
                feedMarkAsRead(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['feedMarkAsRead'];
  }

  /// [cardId]  The card to mark as complete
  Future<Card> cardComplete(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardCompleteInput input = new CardCompleteInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardComplete(\$input:CardCompleteInput!) {
                cardComplete(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardComplete'] as Map<String, dynamic>);
  }

  /// [cardId]  The card to remove the estimate for
  Future<Card> cardEstimateUnset(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardEstimateUnsetInput input = new CardEstimateUnsetInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardEstimateUnset(\$input:CardEstimateUnsetInput!) {
                cardEstimateUnset(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardEstimateUnset'] as Map<String, dynamic>);
  }

  /// [feedEventId]  The feed event remove the reaction from
  /// [reaction]  The reaction to remove. Should be an emoji like 👍
  Future<dynamic> removeReaction({String feedEventId, String reaction}) async {
    RemoveReactionInput input = new RemoveReactionInput(
      feedEventId: feedEventId,
      reaction: reaction,
    );
    var result = await query(document: """
              mutation removeReaction(\$input:RemoveReactionInput!) {
                removeReaction(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['removeReaction'];
  }

  /// [cardId]  The card to remove the budget for
  Future<Card> cardBudgetUnset(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardBudgetUnsetInput input = new CardBudgetUnsetInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardBudgetUnset(\$input:CardBudgetUnsetInput!) {
                cardBudgetUnset(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardBudgetUnset'] as Map<String, dynamic>);
  }

  /// [feedEventId]  The feed event to edit the message body for
  /// [messageBody]  The new message body
  ///
  /// Message format: see [FeedPostMessage] mutation.
  ///
  Future<dynamic> feedEditMessage(
      {String feedEventId, String messageBody}) async {
    FeedEditMessageInput input = new FeedEditMessageInput(
      feedEventId: feedEventId,
      messageBody: messageBody,
    );
    var result = await query(document: """
              mutation feedEditMessage(\$input:FeedEditMessageInput!) {
                feedEditMessage(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['feedEditMessage'];
  }

  /// [amount]  The amount that the user got paid
  /// [date]  The date the payment was made. Just used for record keeping.
  /// [fee]  The transaction fee involved. May differ between payment providers.
  /// [memo]  The memo fo the payout. The user who got paid will see this in their statement.
  /// [method]  The way the user got paid. Usually the name of 3rd party service. Currently can be payoneer, paypal, popmoney, wire, square, transferwise, check, adjustment
  /// [payoutId]  A unique identifier of the payout. Depends on the 3rd party service that was used to pay.
  /// [userId]  The user that got paid
  Future<dynamic> recordPayout(
      {String amount,
      String date,
      String fee,
      String memo,
      String method,
      String payoutId,
      String userId}) async {
    RecordPayoutInput input = new RecordPayoutInput(
      amount: amount,
      date: date,
      fee: fee,
      memo: memo,
      method: method,
      payoutId: payoutId,
      userId: userId,
    );
    var result = await query(document: """
              mutation recordPayout(\$input:RecordPayoutInput!) {
                recordPayout(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['recordPayout'];
  }

  /// [roles]  THe list of roles to give a user.
  /// This overwrites teh entire list. So if you want to add a role, you must pass in the full list with the new role added.
  ///
  /// [userId]  The user to update the roles for.
  Future<dynamic> userSetRoles({List<Role> roles, String userId}) async {
    UserSetRolesInput input = new UserSetRolesInput(
      roles: roles,
      userId: userId,
    );
    var result = await query(document: """
              mutation userSetRoles(\$input:UserSetRolesInput!) {
                userSetRoles(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['userSetRoles'];
  }

  /// [cardId]  The card to set the tags for
  /// [tagGroup]  The tag group (namespae) of tags. Currently only 'project_status' is supported.
  /// Once we introduce tagging on the client-app or add other management features, other tags may be added.
  ///
  /// [tags]  The tags to set
  Future<dynamic> cardTagsSet(
      {String cardId, String tagGroup, List<String> tags}) async {
    CardTagsSetInput input = new CardTagsSetInput(
      cardId: cardId,
      tagGroup: tagGroup,
      tags: tags,
    );
    var result = await query(document: """
              mutation cardTagsSet(\$input:CardTagsSetInput!) {
                cardTagsSet(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['cardTagsSet'];
  }

  /// [cardId]  The id of the project/task to delete
  Future<Card> cardDelete(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardDeleteInput input = new CardDeleteInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardDelete(\$input:CardDeleteInput!) {
                cardDelete(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(result['data']['cardDelete'] as Map<String, dynamic>);
  }

  /// [cardId]  The project to remove the user from
  /// [memberId]  The user to remove from the project
  Future<dynamic> cardRemoveMember({String cardId, String memberId}) async {
    CardRemoveMemberInput input = new CardRemoveMemberInput(
      cardId: cardId,
      memberId: memberId,
    );
    var result = await query(document: """
              mutation cardRemoveMember(\$input:CardRemoveMemberInput!) {
                cardRemoveMember(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['cardRemoveMember'];
  }

  /// [name]  The name you want publicly displayed throughout Turtle.
  Future<dynamic> profileNameSet({String name}) async {
    ProfileNameSetInput input = new ProfileNameSetInput(
      name: name,
    );
    var result = await query(document: """
              mutation profileNameSet(\$input:ProfileNameSetInput!) {
                profileNameSet(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['profileNameSet'];
  }

  /// [cardId]  The card to set the due date of
  /// [dueDate]  The due date to set it to
  Future<Card> cardDueDateSet(
      {String cardId,
      String dueDate,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardDueDateSetInput input = new CardDueDateSetInput(
      cardId: cardId,
      dueDate: dueDate,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardDueDateSet(\$input:CardDueDateSetInput!) {
                cardDueDateSet(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardDueDateSet'] as Map<String, dynamic>);
  }

  /// [feedId]  The feed to post the message to
  /// [messageBody]  The contents of the message.
  ///
  /// Message format:
  /// Just plain text
  /// User mentions in the format <user:27156949188089024041474864119808>
  /// Card references in the format <card:27156949188089024041474864119808>
  /// Files in the format <file.s3:2309j_f23fdf2fdf>
  ///
  Future<dynamic> feedPostMessage({String feedId, String messageBody}) async {
    FeedPostMessageInput input = new FeedPostMessageInput(
      feedId: feedId,
      messageBody: messageBody,
    );
    var result = await query(document: """
              mutation feedPostMessage(\$input:FeedPostMessageInput!) {
                feedPostMessage(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['feedPostMessage'];
  }

  /// [contractId]  The contract to end.
  /// A user can have a max of one contract per project.
  ///
  Future<dynamic> contractEnd({String contractId}) async {
    ContractEndInput input = new ContractEndInput(
      contractId: contractId,
    );
    var result = await query(document: """
              mutation contractEnd(\$input:ContractEndInput!) {
                contractEnd(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['contractEnd'];
  }

  /// [cardId]  The card (task) the work was done on
  /// [entryDate]  The date the work was done
  /// [entryDuration]  How long the work took
  /// [entryId]  The id of the time entry. You must pass in 'new' and it will get generated server-side.
  /// [entryMemo]  More detailed notes about the work done
  Future<dynamic> timeEntryCreate(
      {String cardId,
      String entryDate,
      bool entryDuration,
      String entryId,
      String entryMemo}) async {
    TimeEntryCreateInput input = new TimeEntryCreateInput(
      cardId: cardId,
      entryDate: entryDate,
      entryDuration: entryDuration,
      entryId: entryId,
      entryMemo: entryMemo,
    );
    var result = await query(document: """
              mutation timeEntryCreate(\$input:TimeEntryCreateInput!) {
                timeEntryCreate(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['timeEntryCreate'];
  }

  /// [assigneeId]  The user to assign the card to. Self-assign by passing in the current user id.
  /// [cardId]  The card to assign
  Future<Card> cardAssign(
      {String assigneeId,
      String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardAssignInput input = new CardAssignInput(
      assigneeId: assigneeId,
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardAssign(\$input:CardAssignInput!) {
                cardAssign(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(result['data']['cardAssign'] as Map<String, dynamic>);
  }

  /// [budgetDuration]  The duration of work to increase the budget by.
  /// Budgets may support money in the future but currently only duration is supported.
  ///
  /// [cardId]  The card to increase the budget for
  Future<Card> cardBudgetDecrease(
      {bool budgetDuration,
      String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardBudgetDecreaseInput input = new CardBudgetDecreaseInput(
      budgetDuration: budgetDuration,
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardBudgetDecrease(\$input:CardBudgetDecreaseInput!) {
                cardBudgetDecrease(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardBudgetDecrease'] as Map<String, dynamic>);
  }

  Future<HubspotContact> linkOrCreateHubSpotContact(String userId,
      {String fragment =
          'fragment HubspotContactFragment on HubspotContact { githubUsername id  }'}) async {
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation linkOrCreateHubSpotContact(\$userId:String!) {
                linkOrCreateHubSpotContact(userId:\$userId) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"userId": userId});
    return HubspotContact.fromJson(
        result['data']['linkOrCreateHubSpotContact'] as Map<String, dynamic>);
  }

  /// [fromId]  The card the link to delete is coming from
  /// [linkType]  The type of the link to be deleted
  /// [toId]  The card the link to delete is going to
  Future<dynamic> cardLinkDelete(
      {String fromId, String linkType, String toId}) async {
    CardLinkDeleteInput input = new CardLinkDeleteInput(
      fromId: fromId,
      linkType: linkType,
      toId: toId,
    );
    var result = await query(document: """
              mutation cardLinkDelete(\$input:CardLinkDeleteInput!) {
                cardLinkDelete(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['cardLinkDelete'];
  }

  /// [afterId]  The sibling card to place the new card after.
  /// [assigneeId]  The user to assign the task to.
  /// [beforeId]  The sibling card to place the new card before.
  /// [cardId]  The id of the card. This is server-generated so pass in 'new' as the paramter.
  /// [cardName]  The name to give the card. This is what will show up in task lists.
  ///
  /// [meta]  General purpose meta data for keeping track of anything you desire. For example, the source of the task.
  /// [parentId]  The parent id of the card to place the card under. Omit if you are creating a project.
  Future<Card> cardCreate(
      {String afterId,
      String assigneeId,
      String beforeId,
      String cardId,
      String cardName,
      String meta,
      String parentId,
      bool quickAdd,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardCreateInput input = new CardCreateInput(
      afterId: afterId,
      assigneeId: assigneeId,
      beforeId: beforeId,
      cardId: cardId,
      cardName: cardName,
      meta: meta,
      parentId: parentId,
      quickAdd: quickAdd,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardCreate(\$input:CardCreateInput!) {
                cardCreate(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(result['data']['cardCreate'] as Map<String, dynamic>);
  }

  /// [accountId]  Identifier for the account. Must be of the form like turtle:idofacct or external:idofacct
  Future<dynamic> accountOpen({String accountId}) async {
    AccountOpenInput input = new AccountOpenInput(
      accountId: accountId,
    );
    var result = await query(document: """
              mutation accountOpen(\$input:AccountOpenInput!) {
                accountOpen(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['accountOpen'];
  }

  /// [budgetDuration]  The duration of work to increase the budget by.
  /// Budgets may support money in the future but currently only duration is supported.
  ///
  /// [cardId]  The card to increase the budget for
  Future<Card> cardBudgetIncrease(
      {bool budgetDuration,
      String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardBudgetIncreaseInput input = new CardBudgetIncreaseInput(
      budgetDuration: budgetDuration,
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardBudgetIncrease(\$input:CardBudgetIncreaseInput!) {
                cardBudgetIncrease(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardBudgetIncrease'] as Map<String, dynamic>);
  }

  /// [amount]  The amount of money to transfer
  /// [destAccount]  The account to put money in
  /// [memo]  Some notes about the transaction. A customer may see this in their transactions screen.
  /// [sourceAccount]  The account to take money from
  Future<dynamic> accountTransfer(
      {String amount,
      String destAccount,
      String memo,
      String sourceAccount}) async {
    AccountTransferInput input = new AccountTransferInput(
      amount: amount,
      destAccount: destAccount,
      memo: memo,
      sourceAccount: sourceAccount,
    );
    var result = await query(document: """
              mutation accountTransfer(\$input:AccountTransferInput!) {
                accountTransfer(input:\$input)
              }
              
""", variables: {"input": input.toJson()});
    return result['data']['accountTransfer'];
  }

  /// [cardId]  The card of the due date to clear
  Future<Card> cardDueDateUnset(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardDueDateUnsetInput input = new CardDueDateUnsetInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardDueDateUnset(\$input:CardDueDateUnsetInput!) {
                cardDueDateUnset(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardDueDateUnset'] as Map<String, dynamic>);
  }

  /// [cardId]  The card to mark as incomplete
  Future<Card> cardUncomplete(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardUncompleteInput input = new CardUncompleteInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardUncomplete(\$input:CardUncompleteInput!) {
                cardUncomplete(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardUncomplete'] as Map<String, dynamic>);
  }

  /// [cardId]  The project to add the user to.
  /// If left out, a user will be created for the e-mail (if one doesn't already exist).
  ///
  /// [email]  The e-mail of the user to invite to the project. If the user with this e-mail exists, the
  Future<User> cardInviteUser(
      {String cardId,
      String email,
      String fragment =
          'fragment UserFragment on User { activeContractsCount email id name photo status timezone  }'}) async {
    CardInviteUserInput input = new CardInviteUserInput(
      cardId: cardId,
      email: email,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardInviteUser(\$input:CardInviteUserInput!) {
                cardInviteUser(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return User.fromJson(
        result['data']['cardInviteUser'] as Map<String, dynamic>);
  }

  /// [cardId]  The card to set the estimate for
  /// [estimate]  how long you think this card (task) will take to complete
  Future<Card> cardEstimateSet(
      {String cardId,
      String estimate,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardEstimateSetInput input = new CardEstimateSetInput(
      cardId: cardId,
      estimate: estimate,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardEstimateSet(\$input:CardEstimateSetInput!) {
                cardEstimateSet(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardEstimateSet'] as Map<String, dynamic>);
  }

  /// [cardId]  The deleted card to restore
  Future<Card> cardUndelete(
      {String cardId,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardUndeleteInput input = new CardUndeleteInput(
      cardId: cardId,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardUndelete(\$input:CardUndeleteInput!) {
                cardUndelete(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(
        result['data']['cardUndelete'] as Map<String, dynamic>);
  }

  /// [cardId]  The card to rename
  /// [cardName]  The new name to give the card
  Future<Card> cardRename(
      {String cardId,
      String cardName,
      String fragment = """fragment DemoCard on Card { assigneeId budget 
      completed completedAt } """}) async {
    CardRenameInput input = new CardRenameInput(
      cardId: cardId,
      cardName: cardName,
    );
    var fragmentName = _extractFragmentName(fragment);
    var result = await query(document: """
              mutation cardRename(\$input:CardRenameInput!) {
                cardRename(input:\$input) { ...$fragmentName }
              }
  $fragment
              
""", variables: {"input": input.toJson()});
    return Card.fromJson(result['data']['cardRename'] as Map<String, dynamic>);
  }
}

enum FeedSubscriptionStatus {
  DELETED,
  FOLLOWING,
  MUTED,
}

const FeedSubscriptionStatusValues = {
  "DELETED": FeedSubscriptionStatus.DELETED,
  "FOLLOWING": FeedSubscriptionStatus.FOLLOWING,
  "MUTED": FeedSubscriptionStatus.MUTED,
};
enum MeetingParticipantFilter {
  ALL,
  CONNECTED,
}

const MeetingParticipantFilterValues = {
  "ALL": MeetingParticipantFilter.ALL,
  "CONNECTED": MeetingParticipantFilter.CONNECTED,
};
enum Permission {
  ADMIN_VIEW,
  MY_ACCOUNTING_VIEW,
  PROJECT_ACCOUNTING_VIEW,
  PROJECT_MEMBERS_MANAGE,
}

const PermissionValues = {
  "ADMIN_VIEW": Permission.ADMIN_VIEW,
  "MY_ACCOUNTING_VIEW": Permission.MY_ACCOUNTING_VIEW,
  "PROJECT_ACCOUNTING_VIEW": Permission.PROJECT_ACCOUNTING_VIEW,
  "PROJECT_MEMBERS_MANAGE": Permission.PROJECT_MEMBERS_MANAGE,
};
enum NotificationDeliveryType {
  EMAIL,
  PUSH,
}

const NotificationDeliveryTypeValues = {
  "EMAIL": NotificationDeliveryType.EMAIL,
  "PUSH": NotificationDeliveryType.PUSH,
};
enum MeetingStatus {
  COMPLETED,
  FAILED,
  IN_PROGRESS,
}

const MeetingStatusValues = {
  "COMPLETED": MeetingStatus.COMPLETED,
  "FAILED": MeetingStatus.FAILED,
  "IN_PROGRESS": MeetingStatus.IN_PROGRESS,
};
enum ReadStatus {
  ALL,
  READ,
  SUBSCRIBED,
  UNREAD,
}

const ReadStatusValues = {
  "ALL": ReadStatus.ALL,
  "READ": ReadStatus.READ,
  "SUBSCRIBED": ReadStatus.SUBSCRIBED,
  "UNREAD": ReadStatus.UNREAD,
};
enum AccountType {
  EXTERNAL,
  PROJECT,
  TURTLE,
  USER,
}

const AccountTypeValues = {
  "EXTERNAL": AccountType.EXTERNAL,
  "PROJECT": AccountType.PROJECT,
  "TURTLE": AccountType.TURTLE,
  "USER": AccountType.USER,
};
enum MeetingRecordingStatus {
  COMPLETED,
  DELETED,
  ENQUEUED,
  PROCESSING,
}

const MeetingRecordingStatusValues = {
  "COMPLETED": MeetingRecordingStatus.COMPLETED,
  "DELETED": MeetingRecordingStatus.DELETED,
  "ENQUEUED": MeetingRecordingStatus.ENQUEUED,
  "PROCESSING": MeetingRecordingStatus.PROCESSING,
};
enum Role {
  ADMIN,
  CONTRACTOR,
  CUSTOMER,
  MANAGER,
}

const RoleValues = {
  "ADMIN": Role.ADMIN,
  "CONTRACTOR": Role.CONTRACTOR,
  "CUSTOMER": Role.CUSTOMER,
  "MANAGER": Role.MANAGER,
};
enum __DirectiveLocation {
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  MUTATION,
  QUERY,
  SUBSCRIPTION,
}

const __DirectiveLocationValues = {
  "FIELD": __DirectiveLocation.FIELD,
  "FRAGMENT_DEFINITION": __DirectiveLocation.FRAGMENT_DEFINITION,
  "FRAGMENT_SPREAD": __DirectiveLocation.FRAGMENT_SPREAD,
  "INLINE_FRAGMENT": __DirectiveLocation.INLINE_FRAGMENT,
  "MUTATION": __DirectiveLocation.MUTATION,
  "QUERY": __DirectiveLocation.QUERY,
  "SUBSCRIPTION": __DirectiveLocation.SUBSCRIPTION,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GraphQLGenerator
// **************************************************************************

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

class CardCompleted implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardCompleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class RootMutationType {
  Raw accountOpen;

  Raw feedMarkAsRead;

  User cardInviteUser;

  Raw timeEntryDelete;

  Card cardUncomplete;

  Card cardDueDateSet;

  Raw timeEntryEdit;

  Card cardBudgetDecrease;

  Raw cardAddMember;

  Raw sendLowBalanceReminder;

  Raw cardMetaSet;

  Card cardUndelete;

  Raw accountTransfer;

  Card cardEstimateUnset;

  Card cardComplete;

  Raw timeEntryCreate;

  Raw userSetRoles;

  Card cardDueDateUnset;

  Card cardEstimateSet;

  Raw userSetSkills;

  Raw feedPostMessage;

  Card cardRename;

  Raw feedEditMessage;

  Raw profileTimezoneSet;

  Raw projectAddBalanceWithStripe;

  Card cardCreate;

  Card cardAssign;

  Raw cardTagsSet;

  Raw removeReaction;

  Raw feedDeleteMessage;

  Raw addReaction;

  Raw profileNameSet;

  Card cardBudgetIncrease;

  Raw contractStart;

  Card cardBudgetUnset;

  TwilioAuth meetingRoomJoin;

  Card cardUnassign;

  Raw recordPayout;

  Card cardDelete;

  Raw cardRemoveMember;

  HubspotContact linkOrCreateHubSpotContact;

  Raw contractEnd;

  Card cardMove;

  Raw updateAvailability;

  RootMutationType({this.accountOpen,
    this.feedMarkAsRead,
    this.cardInviteUser,
    this.timeEntryDelete,
    this.cardUncomplete,
    this.cardDueDateSet,
    this.timeEntryEdit,
    this.cardBudgetDecrease,
    this.cardAddMember,
    this.sendLowBalanceReminder,
    this.cardMetaSet,
    this.cardUndelete,
    this.accountTransfer,
    this.cardEstimateUnset,
    this.cardComplete,
    this.timeEntryCreate,
    this.userSetRoles,
    this.cardDueDateUnset,
    this.cardEstimateSet,
    this.userSetSkills,
    this.feedPostMessage,
    this.cardRename,
    this.feedEditMessage,
    this.profileTimezoneSet,
    this.projectAddBalanceWithStripe,
    this.cardCreate,
    this.cardAssign,
    this.cardTagsSet,
    this.removeReaction,
    this.feedDeleteMessage,
    this.addReaction,
    this.profileNameSet,
    this.cardBudgetIncrease,
    this.contractStart,
    this.cardBudgetUnset,
    this.meetingRoomJoin,
    this.cardUnassign,
    this.recordPayout,
    this.cardDelete,
    this.cardRemoveMember,
    this.linkOrCreateHubSpotContact,
    this.contractEnd,
    this.cardMove,
    this.updateAvailability});

  factory RootMutationType.fromJson(Map<String, dynamic> json) {
    return RootMutationType(
      accountOpen: json['accountOpen'] == null
          ? null
          : Raw.fromJson(json['accountOpen'] as Map<String, dynamic>),
      feedMarkAsRead: json['feedMarkAsRead'] == null
          ? null
          : Raw.fromJson(json['feedMarkAsRead'] as Map<String, dynamic>),
      cardInviteUser: json['cardInviteUser'] == null
          ? null
          : User.fromJson(json['cardInviteUser'] as Map<String, dynamic>),
      timeEntryDelete: json['timeEntryDelete'] == null
          ? null
          : Raw.fromJson(json['timeEntryDelete'] as Map<String, dynamic>),
      cardUncomplete: json['cardUncomplete'] == null
          ? null
          : Card.fromJson(json['cardUncomplete'] as Map<String, dynamic>),
      cardDueDateSet: json['cardDueDateSet'] == null
          ? null
          : Card.fromJson(json['cardDueDateSet'] as Map<String, dynamic>),
      timeEntryEdit: json['timeEntryEdit'] == null
          ? null
          : Raw.fromJson(json['timeEntryEdit'] as Map<String, dynamic>),
      cardBudgetDecrease: json['cardBudgetDecrease'] == null
          ? null
          : Card.fromJson(json['cardBudgetDecrease'] as Map<String, dynamic>),
      cardAddMember: json['cardAddMember'] == null
          ? null
          : Raw.fromJson(json['cardAddMember'] as Map<String, dynamic>),
      sendLowBalanceReminder: json['sendLowBalanceReminder'] == null
          ? null
          : Raw.fromJson(
          json['sendLowBalanceReminder'] as Map<String, dynamic>),
      cardMetaSet: json['cardMetaSet'] == null
          ? null
          : Raw.fromJson(json['cardMetaSet'] as Map<String, dynamic>),
      cardUndelete: json['cardUndelete'] == null
          ? null
          : Card.fromJson(json['cardUndelete'] as Map<String, dynamic>),
      accountTransfer: json['accountTransfer'] == null
          ? null
          : Raw.fromJson(json['accountTransfer'] as Map<String, dynamic>),
      cardEstimateUnset: json['cardEstimateUnset'] == null
          ? null
          : Card.fromJson(json['cardEstimateUnset'] as Map<String, dynamic>),
      cardComplete: json['cardComplete'] == null
          ? null
          : Card.fromJson(json['cardComplete'] as Map<String, dynamic>),
      timeEntryCreate: json['timeEntryCreate'] == null
          ? null
          : Raw.fromJson(json['timeEntryCreate'] as Map<String, dynamic>),
      userSetRoles: json['userSetRoles'] == null
          ? null
          : Raw.fromJson(json['userSetRoles'] as Map<String, dynamic>),
      cardDueDateUnset: json['cardDueDateUnset'] == null
          ? null
          : Card.fromJson(json['cardDueDateUnset'] as Map<String, dynamic>),
      cardEstimateSet: json['cardEstimateSet'] == null
          ? null
          : Card.fromJson(json['cardEstimateSet'] as Map<String, dynamic>),
      userSetSkills: json['userSetSkills'] == null
          ? null
          : Raw.fromJson(json['userSetSkills'] as Map<String, dynamic>),
      feedPostMessage: json['feedPostMessage'] == null
          ? null
          : Raw.fromJson(json['feedPostMessage'] as Map<String, dynamic>),
      cardRename: json['cardRename'] == null
          ? null
          : Card.fromJson(json['cardRename'] as Map<String, dynamic>),
      feedEditMessage: json['feedEditMessage'] == null
          ? null
          : Raw.fromJson(json['feedEditMessage'] as Map<String, dynamic>),
      profileTimezoneSet: json['profileTimezoneSet'] == null
          ? null
          : Raw.fromJson(json['profileTimezoneSet'] as Map<String, dynamic>),
      projectAddBalanceWithStripe: json['projectAddBalanceWithStripe'] == null
          ? null
          : Raw.fromJson(
          json['projectAddBalanceWithStripe'] as Map<String, dynamic>),
      cardCreate: json['cardCreate'] == null
          ? null
          : Card.fromJson(json['cardCreate'] as Map<String, dynamic>),
      cardAssign: json['cardAssign'] == null
          ? null
          : Card.fromJson(json['cardAssign'] as Map<String, dynamic>),
      cardTagsSet: json['cardTagsSet'] == null
          ? null
          : Raw.fromJson(json['cardTagsSet'] as Map<String, dynamic>),
      removeReaction: json['removeReaction'] == null
          ? null
          : Raw.fromJson(json['removeReaction'] as Map<String, dynamic>),
      feedDeleteMessage: json['feedDeleteMessage'] == null
          ? null
          : Raw.fromJson(json['feedDeleteMessage'] as Map<String, dynamic>),
      addReaction: json['addReaction'] == null
          ? null
          : Raw.fromJson(json['addReaction'] as Map<String, dynamic>),
      profileNameSet: json['profileNameSet'] == null
          ? null
          : Raw.fromJson(json['profileNameSet'] as Map<String, dynamic>),
      cardBudgetIncrease: json['cardBudgetIncrease'] == null
          ? null
          : Card.fromJson(json['cardBudgetIncrease'] as Map<String, dynamic>),
      contractStart: json['contractStart'] == null
          ? null
          : Raw.fromJson(json['contractStart'] as Map<String, dynamic>),
      cardBudgetUnset: json['cardBudgetUnset'] == null
          ? null
          : Card.fromJson(json['cardBudgetUnset'] as Map<String, dynamic>),
      meetingRoomJoin: json['meetingRoomJoin'] == null
          ? null
          : TwilioAuth.fromJson(
          json['meetingRoomJoin'] as Map<String, dynamic>),
      cardUnassign: json['cardUnassign'] == null
          ? null
          : Card.fromJson(json['cardUnassign'] as Map<String, dynamic>),
      recordPayout: json['recordPayout'] == null
          ? null
          : Raw.fromJson(json['recordPayout'] as Map<String, dynamic>),
      cardDelete: json['cardDelete'] == null
          ? null
          : Card.fromJson(json['cardDelete'] as Map<String, dynamic>),
      cardRemoveMember: json['cardRemoveMember'] == null
          ? null
          : Raw.fromJson(json['cardRemoveMember'] as Map<String, dynamic>),
      linkOrCreateHubSpotContact: json['linkOrCreateHubSpotContact'] == null
          ? null
          : HubspotContact.fromJson(
          json['linkOrCreateHubSpotContact'] as Map<String, dynamic>),
      contractEnd: json['contractEnd'] == null
          ? null
          : Raw.fromJson(json['contractEnd'] as Map<String, dynamic>),
      cardMove: json['cardMove'] == null
          ? null
          : Card.fromJson(json['cardMove'] as Map<String, dynamic>),
      updateAvailability: json['updateAvailability'] == null
          ? null
          : Raw.fromJson(json['updateAvailability'] as Map<String, dynamic>),
    );
  }
}

class DateObject implements DocumentToken {
  DateTime value;

  DateObject({this.value});

  factory DateObject.fromJson(Map<String, dynamic> json) {
    return DateObject(
      value: json['value'] == null
          ? null
          : DateTime.parse(json['value'] as String),
    );
  }
}

class HubspotContact {
  List<String> coreSkills;

  String githubUsername;

  Money hourlyRate;

  int id;

  HubspotDealStage recruitingStage;

  HubspotContact({this.coreSkills,
    this.githubUsername,
    this.hourlyRate,
    this.id,
    this.recruitingStage});

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

class ReactionRemoved implements TurtleEvent {
  String actorId;

  String cardId;

  String feedEventId;

  String feedId;

  int id;

  String projectId;

  String reaction;

  String receiverId;

  String requestId;

  String time;

  ReactionRemoved({this.actorId,
    this.cardId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.reaction,
    this.receiverId,
    this.requestId,
    this.time});

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

class DurationRangeObject implements DocumentToken {
  DurationRange value;

  DurationRangeObject({this.value});

  factory DurationRangeObject.fromJson(Map<String, dynamic> json) {
    return DurationRangeObject(
      value: json['value'] == null
          ? null
          : DurationRange.fromJson(json['value'] as Map<String, dynamic>),
    );
  }
}

class CardUnassigned implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardUnassigned({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class HubspotPipeline {
  int id;

  String label;

  List<HubspotDealStage> stages;

  HubspotPipeline({this.id, this.label, this.stages});

  factory HubspotPipeline.fromJson(Map<String, dynamic> json) {
    return HubspotPipeline(
      id: json['id'] as int,
      label: json['label'] as String,
      stages: (json['stages'] as List)
          ?.map((e) =>
      e == null
          ? null
          : HubspotDealStage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }
}

class PayoutRecorded implements TurtleEvent {
  User actor;

  String actorId;

  Money amount;

  DateTime date;

  Money fee;

  int id;

  String memo;

  String method;

  String payoutId;

  String requestId;

  String time;

  User user;

  String userId;

  PayoutRecorded({this.actor,
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

  factory PayoutRecorded.fromJson(Map<String, dynamic> json) {
    return PayoutRecorded(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: json['actorId'] as String,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      date:
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
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
      case "CardBudgetSet":
        return CardBudgetSet.fromJson(json);
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

class CardBudgetIncreased implements TurtleEvent {
  User actor;

  String actorId;

  CardBudget budget;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardBudgetIncreased({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class CreditCard {
  String brand;

  String expMonth;

  String expYear;

  int id;

  String last4;

  User owner;

  CreditCard({this.brand,
    this.expMonth,
    this.expYear,
    this.id,
    this.last4,
    this.owner});

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      brand: json['brand'] as String,
      expMonth: json['expMonth'] as String,
      expYear: json['expYear'] as String,
      id: json['id'] as int,
      last4: json['last4'] as String,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
    );
  }
}

class CardBudgetSet implements TurtleEvent {
  User actor;

  String actorId;

  CardBudget budget;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardBudgetSet({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

  factory CardBudgetSet.fromJson(Map<String, dynamic> json) {
    return CardBudgetSet(
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

class FeedMessageDeleted implements TurtleEvent {
  User actor;

  String actorId;

  Feed feed;

  String feedEventId;

  String feedId;

  int id;

  String projectId;

  String requestId;

  String time;

  FeedMessageDeleted({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class CardCreated implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  String cardName;

  int id;

  Card parent;

  String parentId;

  String projectId;

  String requestId;

  String time;

  CardCreated({this.actor,
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

class ReactionAdded implements TurtleEvent {
  String actorId;

  String cardId;

  String feedEventId;

  String feedId;

  int id;

  String projectId;

  String reaction;

  String receiverId;

  String requestId;

  String time;

  ReactionAdded({this.actorId,
    this.cardId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.projectId,
    this.reaction,
    this.receiverId,
    this.requestId,
    this.time});

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

class RootSubscriptionType {
  FeedSubscription feedSubscriptionUpdated;

  Feed feedUpdated;

  Me unreadCountUpdated;

  RootSubscriptionType({this.feedSubscriptionUpdated,
    this.feedUpdated,
    this.unreadCountUpdated});

  factory RootSubscriptionType.fromJson(Map<String, dynamic> json) {
    return RootSubscriptionType(
      feedSubscriptionUpdated: json['feedSubscriptionUpdated'] == null
          ? null
          : FeedSubscription.fromJson(
          json['feedSubscriptionUpdated'] as Map<String, dynamic>),
      feedUpdated: json['feedUpdated'] == null
          ? null
          : Feed.fromJson(json['feedUpdated'] as Map<String, dynamic>),
      unreadCountUpdated: json['unreadCountUpdated'] == null
          ? null
          : Me.fromJson(json['unreadCountUpdated'] as Map<String, dynamic>),
    );
  }
}

class FeedMessagePosted implements TurtleEvent {
  User actor;

  String actorId;

  Feed feed;

  String feedEventId;

  String feedId;

  int id;

  String messageBody;

  String projectId;

  String requestId;

  String time;

  FeedMessagePosted({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.messageBody,
    this.projectId,
    this.requestId,
    this.time});

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

class CardBudgetUnset implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardBudgetUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class UserUnreadFeedEvent implements TurtleEvent {
  String actorId;

  String feedEventId;

  String feedId;

  int id;

  String requestId;

  String time;

  UserUnreadFeedEvent({this.actorId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.requestId,
    this.time});

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

class Card implements FeedSource, AccountSource, DocumentToken {
  User assignee;

  String assigneeId;

  CardBudget budget;

  bool completed;

  DateTime completedAt;

  DateTime createdAt;

  bool deleted;

  List<Card> descendants;

  DateTime dueDate;

  DurationRange estimate;

  Feed feed;

  String feedId;

  int id;

  List<User> members;

  Raw meta;

  String name;

  String parentId;

  int position;

  Project project;

  String projectId;

  List<TimeEntry> timeEntries;

  Duration timeTracked;

  Card({this.assignee,
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
    this.parentId,
    this.position,
    this.project,
    this.projectId,
    this.timeEntries,
    this.timeTracked});

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
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deleted: json['deleted'] as bool,
      descendants: (json['descendants'] as List)
          ?.map((e) =>
      e == null ? null : Card.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
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
      meta: json['meta'] == null
          ? null
          : Raw.fromJson(json['meta'] as Map<String, dynamic>),
      name: json['name'] as String,
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
      timeTracked: json['timeTracked'] == null
          ? null
          : Duration.fromJson(json['timeTracked'] as Map<String, dynamic>),
    );
  }
}

class HubspotDealStage {
  bool active;

  String closedWon;

  int displayOrder;

  int id;

  String label;

  double probability;

  HubspotDealStage({this.active,
    this.closedWon,
    this.displayOrder,
    this.id,
    this.label,
    this.probability});

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

class CardMoved implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  Card to;

  String toId;

  CardMoved({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time,
    this.to,
    this.toId});

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

class MeetingRecording {
  String downloadUrl;

  Duration duration;

  int fileSize;

  String format;

  String id;

  String resolution;

  MeetingRecording({this.downloadUrl,
    this.duration,
    this.fileSize,
    this.format,
    this.id,
    this.resolution});

  factory MeetingRecording.fromJson(Map<String, dynamic> json) {
    return MeetingRecording(
      downloadUrl: json['downloadUrl'] as String,
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
      fileSize: json['fileSize'] as int,
      format: json['format'] as String,
      id: json['id'] as String,
      resolution: json['resolution'] as String,
    );
  }
}

class TimeEntryCreated implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  Contract contract;

  User contractor;

  DateTime entryDate;

  Duration entryDuration;

  String entryMemo;

  int id;

  Card project;

  String projectId;

  String requestId;

  String time;

  TimeEntry timeEntry;

  String timeEntryId;

  TimeEntryCreated({this.actor,
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
      entryDate: json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
      entryDuration: json['entryDuration'] == null
          ? null
          : Duration.fromJson(json['entryDuration'] as Map<String, dynamic>),
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

class CardRenamed implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  String cardName;

  int id;

  String projectId;

  String requestId;

  String time;

  CardRenamed({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.cardName,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class Money {
  int amount;

  String currency;

  Money({this.amount, this.currency});

  factory Money.fromJson(Map<String, dynamic> json) {
    return Money(
      amount: json['amount'] as int,
      currency: json['currency'] as String,
    );
  }
}

class TimeEntryEdited implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  Contract contract;

  User contractor;

  DateTime entryDate;

  Duration entryDuration;

  String entryMemo;

  int id;

  Duration prevEntryDuration;

  Card project;

  String requestId;

  String time;

  TimeEntry timeEntry;

  String timeEntryId;

  TimeEntryEdited({this.actor,
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
      entryDate: json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
      entryDuration: json['entryDuration'] == null
          ? null
          : Duration.fromJson(json['entryDuration'] as Map<String, dynamic>),
      entryMemo: json['entryMemo'] as String,
      id: json['id'] as int,
      prevEntryDuration: json['prevEntryDuration'] == null
          ? null
          : Duration.fromJson(
          json['prevEntryDuration'] as Map<String, dynamic>),
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

class FeedEvent {
  User actor;

  String body;

  List<DocumentToken> bodyTokens;

  String createdAt;

  bool edited;

  String editedAt;

  TurtleEvent event;

  String feedId;

  int id;

  Raw reactions;

  FeedEvent({this.actor,
    this.body,
    this.bodyTokens,
    this.createdAt,
    this.edited,
    this.editedAt,
    this.event,
    this.feedId,
    this.id,
    this.reactions});

  factory FeedEvent.fromJson(Map<String, dynamic> json) {
    return FeedEvent(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      body: json['body'] as String,
      bodyTokens: (json['bodyTokens'] as List)
          ?.map((e) =>
      e == null
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
      reactions: json['reactions'] == null
          ? null
          : Raw.fromJson(json['reactions'] as Map<String, dynamic>),
    );
  }
}

class CardBudgetDecreased implements TurtleEvent {
  User actor;

  String actorId;

  CardBudget budget;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardBudgetDecreased({this.actor,
    this.actorId,
    this.budget,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class Feed {
  Card card;

  List<FeedEvent> feedEvents;

  FeedSubscription feedSubscription;

  int id;

  FeedEvent lastFeedEvent;

  User otherUser;

  Card project;

  FeedSource source;

  Feed({this.card,
    this.feedEvents,
    this.feedSubscription,
    this.id,
    this.lastFeedEvent,
    this.otherUser,
    this.project,
    this.source});

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
    );
  }
}

class CardAssigned implements TurtleEvent {
  User actor;

  String actorId;

  User assignee;

  String assigneeId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardAssigned({this.actor,
    this.actorId,
    this.assignee,
    this.assigneeId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class TimeEntryDeleted implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  Contract contract;

  User contractor;

  int id;

  Duration prevEntryDuration;

  Card project;

  String projectId;

  String requestId;

  String time;

  TimeEntry timeEntry;

  String timeEntryId;

  TimeEntryDeleted({this.actor,
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
      prevEntryDuration: json['prevEntryDuration'] == null
          ? null
          : Duration.fromJson(
          json['prevEntryDuration'] as Map<String, dynamic>),
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

class CardEstimateSet implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  DurationRange estimate;

  int id;

  String projectId;

  String requestId;

  String time;

  CardEstimateSet({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.estimate,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class CardDueDateUnset implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardDueDateUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class Me {
  List<User> accessibleUsers;

  List<TurtleEvent> events;

  int eventsCount;

  List<Feed> feeds;

  List<Project> projects;

  int unreadCount;

  User user;

  Me({this.accessibleUsers,
    this.events,
    this.eventsCount,
    this.feeds,
    this.projects,
    this.unreadCount,
    this.user});

  factory Me.fromJson(Map<String, dynamic> json) {
    return Me(
      accessibleUsers: (json['accessibleUsers'] as List)
          ?.map((e) =>
      e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      events: (json['events'] as List)
          ?.map((e) =>
      e == null
          ? null
          : TurtleEvent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventsCount: json['eventsCount'] as int,
      feeds: (json['feeds'] as List)
          ?.map((e) =>
      e == null ? null : Feed.fromJson(e as Map<String, dynamic>))
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

class StripeChargeCreated implements TurtleEvent {
  User actor;

  CreditCard creditCard;

  int id;

  String last4;

  Card project;

  String requestId;

  String time;

  StripeChargeCreated({this.actor,
    this.creditCard,
    this.id,
    this.last4,
    this.project,
    this.requestId,
    this.time});

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

class CardBudget {
  Duration duration;

  CardBudget({this.duration});

  factory CardBudget.fromJson(Map<String, dynamic> json) {
    return CardBudget(
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
    );
  }
}

class TwilioAuth {
  String token;

  TwilioAuth({this.token});

  factory TwilioAuth.fromJson(Map<String, dynamic> json) {
    return TwilioAuth(
      token: json['token'] as String,
    );
  }
}

class AccountEntry {
  Money balanceSnapshot;

  String createdAt;

  Money delta;

  String memo;

  TurtleEvent sourceEvent;

  String type;

  AccountEntry({this.balanceSnapshot,
    this.createdAt,
    this.delta,
    this.memo,
    this.sourceEvent,
    this.type});

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
      type: json['type'] as String,
    );
  }
}

class AvailabilityEntry {
  User author;

  String authorId;

  DateTime endDate;

  Project project;

  String projectId;

  DateTime startDate;

  Duration timePerWeek;

  String updatedAt;

  User user;

  String userId;

  AvailabilityEntry({this.author,
    this.authorId,
    this.endDate,
    this.project,
    this.projectId,
    this.startDate,
    this.timePerWeek,
    this.updatedAt,
    this.user,
    this.userId});

  factory AvailabilityEntry.fromJson(Map<String, dynamic> json) {
    return AvailabilityEntry(
      author: json['author'] == null
          ? null
          : User.fromJson(json['author'] as Map<String, dynamic>),
      authorId: json['authorId'] as String,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      projectId: json['projectId'] as String,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      timePerWeek: json['timePerWeek'] == null
          ? null
          : Duration.fromJson(json['timePerWeek'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['userId'] as String,
    );
  }
}

class CardEstimateUnset implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardEstimateUnset({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class AccountTransfer implements TurtleEvent {
  User actor;

  String actorId;

  Money amount;

  String destAccountId;

  int id;

  String memo;

  String requestId;

  String sourceAccountId;

  String time;

  AccountTransfer({this.actor,
    this.actorId,
    this.amount,
    this.destAccountId,
    this.id,
    this.memo,
    this.requestId,
    this.sourceAccountId,
    this.time});

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

class CardMemberAdded implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  User member;

  String projectId;

  String requestId;

  String time;

  CardMemberAdded({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.member,
    this.projectId,
    this.requestId,
    this.time});

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

class RootQueryType {
  Account account;

  List<Account> accounts;

  List<Project> activeProjects;

  String apiVersion;

  List<AvailabilityEntry> availabilityEntries;

  Card card;

  Command command;

  Feed feed;

  FeedEvent feedEvent;

  HubspotPipeline hubspotPipeline;

  Me me;

  Meeting meeting;

  List<Meeting> meetings;

  List<NotificationDelivery> notificationDeliveries;

  Project project;

  List<Project> projects;

  List<TimeEntry> timeEntries;

  TimeEntry timeEntry;

  User user;

  List<User> users;

  RootQueryType({this.account,
    this.accounts,
    this.activeProjects,
    this.apiVersion,
    this.availabilityEntries,
    this.card,
    this.command,
    this.feed,
    this.feedEvent,
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
          ?.map((e) =>
      e == null
          ? null
          : AvailabilityEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      command: json['command'] == null
          ? null
          : Command.fromJson(json['command'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : Feed.fromJson(json['feed'] as Map<String, dynamic>),
      feedEvent: json['feedEvent'] == null
          ? null
          : FeedEvent.fromJson(json['feedEvent'] as Map<String, dynamic>),
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
          ?.map((e) =>
      e == null
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

class Account {
  Money balance;

  Money balancePending;

  Money balanceSettled;

  List<AccountEntry> entries;

  int id;

  AccountSource source;

  AccountType type;

  Account({this.balance,
    this.balancePending,
    this.balanceSettled,
    this.entries,
    this.id,
    this.source,
    this.type});

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
          ?.map((e) =>
      e == null
          ? null
          : AccountEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      id: json['id'] as int,
      source: json['source'] == null
          ? null
          : AccountSource.fromJson(json['source'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : AccountType.fromJson(json['type'] as Map<String, dynamic>),
    );
  }
}

class FeedMessageEdited implements TurtleEvent {
  User actor;

  String actorId;

  Feed feed;

  String feedEventId;

  String feedId;

  int id;

  String messageBody;

  String projectId;

  String requestId;

  String time;

  FeedMessageEdited({this.actor,
    this.actorId,
    this.feed,
    this.feedEventId,
    this.feedId,
    this.id,
    this.messageBody,
    this.projectId,
    this.requestId,
    this.time});

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

class Command {
  User actor;

  String executedAt;

  int id;

  Raw input;

  String requestId;

  String type;

  Command({this.actor,
    this.executedAt,
    this.id,
    this.input,
    this.requestId,
    this.type});

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      actor: json['actor'] == null
          ? null
          : User.fromJson(json['actor'] as Map<String, dynamic>),
      executedAt: json['executedAt'] as String,
      id: json['id'] as int,
      input: json['input'] == null
          ? null
          : Raw.fromJson(json['input'] as Map<String, dynamic>),
      requestId: json['requestId'] as String,
      type: json['type'] as String,
    );
  }
}

abstract class DocumentToken {
  factory DocumentToken.fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case "Card":
        return Card.fromJson(json);
      case "DateObject":
        return DateObject.fromJson(json);
      case "DurationRangeObject":
        return DurationRangeObject.fromJson(json);
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

class Project {
  Money balance;

  Money budget;

  List<Contract> contracts;

  Money estimatedHourlyRate;

  List<Feed> feeds;

  int id;

  DateTime lastActivity;

  CreditCard lastChargedCard;

  List<Card> managerOverdueCards;

  List<User> managers;

  List<User> members;

  Raw meta;

  String name;

  List<String> projectStatusTags;

  Card rootCard;

  List<TimeEntry> timeEntries;

  Project({this.balance,
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
      lastActivity: json['lastActivity'] == null
          ? null
          : DateTime.parse(json['lastActivity'] as String),
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
      meta: json['meta'] == null
          ? null
          : Raw.fromJson(json['meta'] as Map<String, dynamic>),
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

class NotificationDelivery {
  String deliveredAt;

  Feed feed;

  FeedEvent feedEvent;

  int id;

  User recipient;

  String type;

  NotificationDelivery({this.deliveredAt,
    this.feed,
    this.feedEvent,
    this.id,
    this.recipient,
    this.type});

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
      type: json['type'] as String,
    );
  }
}

class CardUncompleted implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  String projectId;

  String requestId;

  String time;

  CardUncompleted({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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

class TimeEntry implements DocumentToken {
  String addedAt;

  Card card;

  String contractId;

  DateTime date;

  bool deleted;

  Duration duration;

  bool edited;

  int id;

  String memo;

  User user;

  TimeEntry({this.addedAt,
    this.card,
    this.contractId,
    this.date,
    this.deleted,
    this.duration,
    this.edited,
    this.id,
    this.memo,
    this.user});

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      addedAt: json['addedAt'] as String,
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      contractId: json['contractId'] as String,
      date:
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      deleted: json['deleted'] as bool,
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
      edited: json['edited'] as bool,
      id: json['id'] as int,
      memo: json['memo'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class UserReadFeedEvent implements TurtleEvent {
  String actorId;

  String feedEventId;

  String feedId;

  int id;

  String requestId;

  String time;

  UserReadFeedEvent({this.actorId,
    this.feedEventId,
    this.feedId,
    this.id,
    this.requestId,
    this.time});

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

class CardDueDateSet implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  DateTime dueDate;

  int id;

  String projectId;

  String requestId;

  String time;

  CardDueDateSet({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.dueDate,
    this.id,
    this.projectId,
    this.requestId,
    this.time});

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
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      id: json['id'] as int,
      projectId: json['projectId'] as String,
      requestId: json['requestId'] as String,
      time: json['time'] as String,
    );
  }
}

class File implements DocumentToken {
  String contentType;

  String downloadUri;

  int id;

  String name;

  String path;

  int size;

  String thumbnailUri;

  String uri;

  String userId;

  File({this.contentType,
    this.downloadUri,
    this.id,
    this.name,
    this.path,
    this.size,
    this.thumbnailUri,
    this.uri,
    this.userId});

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

class Link implements DocumentToken {
  String title;

  String type;

  String uri;

  Link({this.title, this.type, this.uri});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      title: json['title'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }
}

class StringObject implements DocumentToken {
  String value;

  StringObject({this.value});

  factory StringObject.fromJson(Map<String, dynamic> json) {
    return StringObject(
      value: json['value'] as String,
    );
  }
}

class User implements FeedSource, AccountSource, DocumentToken {
  int activeContractsCount;

  List<Contract> contracts;

  String email;

  List<Feed> feeds;

  HubspotContact hubspotContact;

  int id;

  String name;

  String photo;

  List<Project> projects;

  List<Role> roles;

  String status;

  List<TimeEntry> timeEntries;

  String timezone;

  User({this.activeContractsCount,
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
      roles: (json['roles'] as List)
          ?.map((e) =>
      e == null ? null : Role.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      status: json['status'] as String,
      timeEntries: (json['timeEntries'] as List)
          ?.map((e) =>
      e == null ? null : TimeEntry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      timezone: json['timezone'] as String,
    );
  }
}

class Contract {
  bool active;

  User contractor;

  Money contractorHourlyRate;

  Money customerHourlyRate;

  String endedAt;

  int id;

  Project project;

  String startedAt;

  Contract({this.active,
    this.contractor,
    this.contractorHourlyRate,
    this.customerHourlyRate,
    this.endedAt,
    this.id,
    this.project,
    this.startedAt});

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

class FeedSubscription {
  String feedId;

  int unreadCount;

  String userId;

  FeedSubscription({this.feedId, this.unreadCount, this.userId});

  factory FeedSubscription.fromJson(Map<String, dynamic> json) {
    return FeedSubscription(
      feedId: json['feedId'] as String,
      unreadCount: json['unreadCount'] as int,
      userId: json['userId'] as String,
    );
  }
}

class CardMemberRemoved implements TurtleEvent {
  User actor;

  String actorId;

  Card card;

  String cardId;

  int id;

  User member;

  String projectId;

  String requestId;

  String time;

  CardMemberRemoved({this.actor,
    this.actorId,
    this.card,
    this.cardId,
    this.id,
    this.member,
    this.projectId,
    this.requestId,
    this.time});

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

class Meeting {
  Duration duration;

  DateTime endedAt;

  String id;

  List<User> participants;

  MeetingRecording recording;

  String roomId;

  DateTime startedAt;

  MeetingStatus status;

  Meeting({this.duration,
    this.endedAt,
    this.id,
    this.participants,
    this.recording,
    this.roomId,
    this.startedAt,
    this.status});

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
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
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      status: json['status'] == null
          ? null
          : MeetingStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }
}

class __InputValue {
  String defaultValue;

  String description;

  String name;

  __Type type;

  __InputValue({this.defaultValue, this.description, this.name, this.type});

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

class __Schema {
  List<__Directive> directives;

  __Type mutationType;

  __Type queryType;

  __Type subscriptionType;

  List<__Type> types;

  __Schema({this.directives,
    this.mutationType,
    this.queryType,
    this.subscriptionType,
    this.types});
  factory __Schema.fromJson(Map<String, dynamic> json) {
    return __Schema(
      directives: (json['directives'] as List)
          ?.map((e) =>
      e == null
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

class __Directive {
  List<__InputValue> args;

  String description;

  List<__DirectiveLocation> locations;

  String name;

  bool onField;

  bool onFragment;

  bool onOperation;

  __Directive({this.args,
    this.description,
    this.locations,
    this.name,
    this.onField,
    this.onFragment,
    this.onOperation});

  factory __Directive.fromJson(Map<String, dynamic> json) {
    return __Directive(
      args: (json['args'] as List)
          ?.map((e) =>
      e == null
          ? null
          : __InputValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      locations: (json['locations'] as List)
          ?.map((e) =>
      e == null
          ? null
          : __DirectiveLocation.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      name: json['name'] as String,
      onField: json['onField'] as bool,
      onFragment: json['onFragment'] as bool,
      onOperation: json['onOperation'] as bool,
    );
  }
}

class __Type {
  String description;

  List<__EnumValue> enumValues;

  List<__Field> fields;

  List<__InputValue> inputFields;

  List<__Type> interfaces;

  String kind;

  String name;

  __Type ofType;

  List<__Type> possibleTypes;

  __Type({this.description,
    this.enumValues,
    this.fields,
    this.inputFields,
    this.interfaces,
    this.kind,
    this.name,
    this.ofType,
    this.possibleTypes});
  factory __Type.fromJson(Map<String, dynamic> json) {
    return __Type(
      description: json['description'] as String,
      enumValues: (json['enumValues'] as List)
          ?.map((e) =>
      e == null
          ? null
          : __EnumValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      fields: (json['fields'] as List)
          ?.map((e) =>
      e == null ? null : __Field.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      inputFields: (json['inputFields'] as List)
          ?.map((e) =>
      e == null
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

class __Field {
  List<__InputValue> args;

  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  __Type type;

  __Field({this.args,
    this.deprecationReason,
    this.description,
    this.isDeprecated,
    this.name,
    this.type});
  factory __Field.fromJson(Map<String, dynamic> json) {
    return __Field(
      args: (json['args'] as List)
          ?.map((e) =>
      e == null
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

class __EnumValue {
  String deprecationReason;

  String description;

  bool isDeprecated;

  String name;

  __EnumValue(
      {this.deprecationReason, this.description, this.isDeprecated, this.name});
  factory __EnumValue.fromJson(Map<String, dynamic> json) {
    return __EnumValue(
      deprecationReason: json['deprecationReason'] as String,
      description: json['description'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      name: json['name'] as String,
    );
  }
}

class RootObject {}

enum AccountType {
  EXTERNAL,
  PROJECT,
  TURTLE,
  USER,
}
enum MeetingStatus {
  COMPLETED,
  FAILED,
  IN_PROGRESS,
}
enum Role {
  ADMIN,
  CONTRACTOR,
  CUSTOMER,
  MANAGER,
}
enum ReadStatus {
  ALL,
  READ,
  SUBSCRIBED,
  UNREAD,
}
enum __DirectiveLocation {
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  MUTATION,
  QUERY,
  SUBSCRIPTION,
}

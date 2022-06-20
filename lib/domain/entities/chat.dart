class Chat{
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;

  Chat({
    this.name = '',
    this.icon = '',
    this.isGroup = false,
    this.time = '',
    this.currentMessage = '',
    this.status = ''
  });
}
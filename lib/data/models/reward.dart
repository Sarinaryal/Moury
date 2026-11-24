class Reward {
  final String icon, title, sub, cost;
  bool locked;
  bool redeemed;
  
  Reward(
    this.icon,
    this.title,
    this.sub,
    this.cost, {
    this.locked = false,
    this.redeemed = false,
  });
}
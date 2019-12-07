abstract class ILifecycle {
  void initState();

  void didChangeDependencies();

  void didUpdateWidget<W>(W oldWidget);

  void deactivate();

  void dispose();
}
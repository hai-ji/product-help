使用各个设置配置备份作业。

**注意：** 保留更多备份可能会产生额外的使用费。如果减少保留的备份数，下次完成备份流程时可能会删除这些多余的备份。被删除的备份将无法恢复。

选择介于最高优先级 1 和最低优先级 5 之间的作业优先级值。下面介绍了它的工作原理：

-   默认情况下，每个作业都分配了优先级 5。
-   如果调度两个不同优先级的作业同时运行，将运行优先级更高的作业；优先级更低的作业将不运行。
-   如果调度两个相同优先级的作业同时运行，这两个作业都将运行。

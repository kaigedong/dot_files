在bash下输入`shopt`会显示shell options.
其中，`shopt | grep huponexit` 显示退出session后，是否会关闭后台进程。 

> https://www.ruanyifeng.com/blog/2016/02/linux-daemon.html
>
> 大多数Linux系统，这个参数默认关闭（off）。因此，session 退出的时候，不会把SIGHUP信号发给"后台任务"。所以，一般来说，"后台任务"不会随着 session 一起退出。

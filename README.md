# GCD_Barrier
珊栏函数的使用

/**
 珊栏函数的作用
 珊栏函数(dispatch_barrier_async)后面的任务必定在珊栏函数前面的任务同时完成之后才被执行
 珊栏函数前后的任务都是异步执行的
*/



利用GCD函数(dispatch_group_notify) 实现在所有异步请求处理完成后在处理相应的任务
//当提交到队列dispatch_queue_t queue上的所有任务执行完毕时会执行dispatch_group_notify里的dispatch_block_t block的代码

Return-Path: <SRS0=De2Q=NW=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8BAC432BE
	for <soc@archiver.kernel.org>; Tue, 31 Aug 2021 15:54:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0DA9160F46; Tue, 31 Aug 2021 15:54:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E739261027;
	Tue, 31 Aug 2021 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630425239;
	bh=Y3kg8LcpF+SZJ/Qt4mvCjZMSeVo5km019zcaEL/mH3Q=;
	h=Date:From:To:List-Id:Cc:Subject:Reply-To:References:In-Reply-To:
	 From;
	b=SG3F1Ttt5bWN4Vog/w48SR31sL7xXuNpR0twz6hzpgO7mWK7zLk9N7k4qTFghW3I+
	 l1vlurw8HILIH1dt2BVj+/UK0wx4xyLwuLZYq+jP09zql3dONfgl3FJcqr2n0k2W9f
	 vpkkqf6F7clFeFx64A3U9eqkajz8T98H7yZ08c1FPxQmrmq3ajQ9gwC5UN55wOomb5
	 RZLyZCNDIoqomj0SdL5x3vtETMHmgHl8BOvAHQ75mW5SQakTO6nST0VX3Wfh0CnfsZ
	 tie24weWSPkvKCTeRr+WkQUpsLjilPriFWhJGCu1RbbVGDeDWiFXD7HY/Kxmvup0+y
	 8/JmNWshsSAgw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A57125C019C; Tue, 31 Aug 2021 08:53:59 -0700 (PDT)
Date: Tue, 31 Aug 2021 08:53:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
List-Id: <soc.lore.kernel.org>
Cc: josh@joshtriplett.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	joel@joelfernandes.org, rcu@vger.kernel.org, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: rcu_preempt detected stalls
Message-ID: <20210831155359.GB4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210831152144.GA28128@trex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831152144.GA28128@trex>

On Tue, Aug 31, 2021 at 05:21:44PM +0200, Jorge Ramirez-Ortiz, Foundries wrote:
> Hi
>
> When enabling CONFIG_PREEMPT and running the stress-ng scheduler class
> tests on arm64 (xilinx zynqmp and imx imx8mm SoCs) we are observing the following.
>
> [   62.578917] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [   62.585015]  (detected by 0, t=5253 jiffies, g=3017, q=2972)
> [   62.590663] rcu: All QSes seen, last rcu_preempt kthread activity 5254 (4294907943-4294902689), jiffies_till_next_fqs=1, root
> +->qsmask 0x0
> [   62.603086] rcu: rcu_preempt kthread starved for 5258 jiffies! g3017 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
> [   62.613246] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.

The message above really does mean what it says:  If your workload
prevents RCU's grace-period kthread ("rcu_preempt" in this case) from
running, you just bought yourself an OOM.

> [   62.622359] rcu: RCU grace-period kthread stack dump:
> [   62.627395] task:rcu_preempt     state:R  running task     stack:    0 pid:   14 ppid:     2 flags:0x00000028
> [   62.637308] Call trace:
> [   62.639748]  __switch_to+0x11c/0x190
> [   62.643319]  __schedule+0x3b8/0x8d8
> [   62.646796]  schedule+0x4c/0x108
> [   62.650018]  schedule_timeout+0x1ac/0x358
> [   62.654021]  rcu_gp_kthread+0x6a8/0x12b8
> [   62.657933]  kthread+0x14c/0x158
> [   62.661153]  ret_from_fork+0x10/0x18
> [   62.682919] BUG: scheduling while atomic: stress-ng-hrtim/831/0x00000002
> [   62.689604] Preemption disabled at:
> [   62.689614] [<ffffffc010059418>] irq_enter_rcu+0x30/0x58
> [   62.698393] CPU: 0 PID: 831 Comm: stress-ng-hrtim Not tainted 5.10.42+ #5
> [   62.706296] Hardware name: Zynqmp new (DT)
> [   62.710115] Call trace:
> [   62.712548]  dump_backtrace+0x0/0x240
> [   62.716202]  show_stack+0x2c/0x38
> [   62.719510]  dump_stack+0xcc/0x104
> [   62.722904]  __schedule_bug+0x78/0xc8
> [   62.726556]  __schedule+0x70c/0x8d8
> [   62.730037]  schedule+0x4c/0x108
> [   62.733259]  do_notify_resume+0x224/0x5d8
> [   62.737259]  work_pending+0xc/0x2a4
>
> The error results in OOM eventually.
>
> RCU priority boosting does work around this issue but it seems to me
> a workaround more than a fix (otherwise boosting would be enabled
> by CONFIG_PREEMPT for arm64 I guess?).

RCU priority boosting sets the rcu_preempt kthread's scheduling priority
to SCHED_FIFO priority level 1 instead of the normal SCHED_OTHER.
Therefore, if you build with CONFIG_RCU_BOOST=n, but manually set the
priority of rcu_preempt to SCHED_FIFO priority level 1, you might also
see this RCU CPU stall warning go away.

> The question is: is this an arm64 bug that should be investigated? or
> is this some known corner case of running stress-ng that is already
> understood?

I have not looked at stress-ng, but it is possible to configure your
system so that rcu_preempt gets little or no CPU time, for example,
by placing it into a CPU-poor cgroup on the one hand or by disabling
throttling and running a heavy real-time workload on the other.
Is stress-ng doing something like this?

There could of course also be an arm64 problem that affect scheduling,
but I suggest looking closely at what stress-ng is doing first.

Please let me know how it goes!

							Thanx, Paul

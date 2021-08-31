Return-Path: <SRS0=ZvFH=NW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7155C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Aug 2021 17:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF1B6108B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Aug 2021 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EF1B6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w/lwdszgKjOFzwpu/1yRG/DM1HpTJBDZdivI2N0TJg=; b=ldAs42BTWJV36h
	Mjcwz+cyOymAAuhWIU2zGlVaPwwko3Yuv6HgD2pYhomzQm/ffKu9aeNmaZR1+sWcds09WeydqylWD
	nnnN/kiSZa76ocK+l0xyYEpTURKHFKgR+Oj1C/6yla4sA7NR4oUPI9zQQGt0ilr1MX72Xrzx3ZY/u
	owD0izIgmVvSRZwOnJdOJN22CcTuhL5GDU7jmlezOMVfAlXscR5Almyyglu2Emjs8GSd4T4you1TJ
	N5tO6HHFNHYWHqxPukar3pVg7dNcNTanijsco15hNz8J7nQAaRlqjDTUbFa9qiNbFRIPX6alQCBdF
	pX2mp4LfpIUI68D9z5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL7J9-002nii-1q; Tue, 31 Aug 2021 17:12:23 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL7J2-002nhh-GT
 for linux-arm-kernel@lists.infradead.org; Tue, 31 Aug 2021 17:12:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id r7so11910219edd.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 31 Aug 2021 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZbHfXvVhh4iun/ZRNpYXmFxLkzcbeoToQ9hWGOmo5g4=;
 b=SlgmD1ij7i7ApMQIQnKt+oOIsZZimChZMMREL2RjDMOQeorqxFNgv5Rt42zIMg9imj
 9F+xu1dMp/14lQ/u2iuCRIboetcCjLV2NGcyw70Xy/3k2c+L/mmvRhainUbtolfAc1ZQ
 MhdC1Wl9oDnUaMcgseUbF2snLbMgvA/+xjwjLZIVWR3dQ1AxlLCstD8PZpLLA+U9DICR
 KarL2dtMUiPRSBE1aQ1ZUPffzltOVRe56equE8xKTJRxtICz9ZR3ABIk6wZpWLQzyudN
 OjGmSZTS3DK47zgZDNn7e3b+2mDRdZteuTVJ9I5gmrJAxly//ZiXFGg/Tcd6gaIv2cDn
 Ze2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZbHfXvVhh4iun/ZRNpYXmFxLkzcbeoToQ9hWGOmo5g4=;
 b=NV9t8tpSbwEGF2wrR9/ev80LrObuiyWk79O5ugl4b/M+SvOhA6DDjKz94bNNE/9rxz
 1V6sH+p1UpLSRZITVFEVkDNAFWjUcvpzJNy6RUKyQbK34OlGaclgkQ6eAjhG5H8F+20z
 4UUrPoPldu9liiTlBG/A8mSxwbowrMt6K6rCoqlULYl83YfyH1HHrcZI8BKrr+kFmeOp
 mC1X30SwrxlW5qyn3CdiImJuhDtTi7yErTEaYjTN1ytZmpQamgwq76tVR6i4RsJOWoj5
 jG1n11cOr/9myFbbrHlpXd0AIl1GFy00v+GgcVxYmiymVHG2+6su5ykO7WM3yT4adIUn
 dwvQ==
X-Gm-Message-State: AOAM5315sIxs42FFWaY7H2IuvClGdL4o5O9CiL/FJ9sYJHMie/SsJPQX
 veLzWKwuSwtjkl3R+h3M79NOe95laH9ACa4UxB8=
X-Google-Smtp-Source: ABdhPJykAyAX75ZlSvAzih6ZHrougq8MBknQsYjWB5ZbxRRItoWAMaMQWvYbyCb6guNARJMVDBXxl1uHrjsAQF6A+EQ=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr31085378edr.64.1630429933895; 
 Tue, 31 Aug 2021 10:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210831152144.GA28128@trex>
 <CAABZP2xGnSLVbgxqjKMq=Oj_H7rYfYjuCvmBpmZ4tRptGs3SEw@mail.gmail.com>
In-Reply-To: <CAABZP2xGnSLVbgxqjKMq=Oj_H7rYfYjuCvmBpmZ4tRptGs3SEw@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 1 Sep 2021 01:11:59 +0800
Message-ID: <CAABZP2wUdToiAWOAgqDZrZtkuEdrXEv9GDgbioW3PZAyseOSgA@mail.gmail.com>
Subject: Re: rcu_preempt detected stalls
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
List-Id: <soc.lore.kernel.org>
Cc: paulmck@kernel.org, Josh Triplett <josh@joshtriplett.org>, 
 rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, "Joel Fernandes,
 Google" <joel@joelfernandes.org>, 
 rcu <rcu@vger.kernel.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_101216_592888_A43E7EA9 
X-CRM114-Status: GOOD (  25.06  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210831171159.L6GWokiqRdP6iR7ifyRwmK4o4zLRDfv695oAA6v1sWc@z>

followings are some of my kernel config options:
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
CONFIG_PREEMPT_RCU=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_FAST_NO_HZ is not set
# CONFIG_RCU_BOOST is not set
CONFIG_RCU_NOCB_CPU=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# RCU Debugging
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
# CONFIG_RCU_SCALE_TEST is not set
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set

Thanks
Zhouyi

On Wed, Sep 1, 2021 at 1:01 AM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
>
> I did an experiment just now on x86_64 virtual machines, rcu did not
> complain after 10 minutes's test, I hope my effort can provide some
> clue.
>
> 1. I clone the fresh new linux kernel (git clone
> https://kernel.source.codeaurora.cn/pub/scm/linux/kernel/git/torvalds/linux.git)
> 2. compile the kernel without CONFIG_RCU_BOOST (: # CONFIG_RCU_BOOST is not set)
> 3. boot the kernel on a x86_64 VM (kvm -cpu host -smp 16  -hda
> ./debian10.qcow2 -m 4096 -net
> user,hostfwd=tcp::5556-:22,hostfwd=tcp::5555-:19 -net nic,model=e1000
> -vnc :30)
> 4. run the test (stress-ng --sequential 16  --class scheduler -t 5m --times)
> 5. monitor the system by constantly typing top and dmesg
> 6. after 10 minutes, nothing else happens except that the dmesg report
> following two messages
> [  672.528192] sched: DL replenish lagged too much
> [  751.127790] hrtimer: interrupt took 12143 ns
>
> So, I guess CONFIG_RCU_BOOST is not necessary for x86_64 virtual machines
>
> Zhouyi
>
> On Tue, Aug 31, 2021 at 11:24 PM Jorge Ramirez-Ortiz, Foundries
> <jorge@foundries.io> wrote:
> >
> > Hi
> >
> > When enabling CONFIG_PREEMPT and running the stress-ng scheduler class
> > tests on arm64 (xilinx zynqmp and imx imx8mm SoCs) we are observing the following.
> >
> > [   62.578917] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > [   62.585015]  (detected by 0, t=5253 jiffies, g=3017, q=2972)
> > [   62.590663] rcu: All QSes seen, last rcu_preempt kthread activity 5254 (4294907943-4294902689), jiffies_till_next_fqs=1, root
> > +->qsmask 0x0
> > [   62.603086] rcu: rcu_preempt kthread starved for 5258 jiffies! g3017 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
> > [   62.613246] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
> > [   62.622359] rcu: RCU grace-period kthread stack dump:
> > [   62.627395] task:rcu_preempt     state:R  running task     stack:    0 pid:   14 ppid:     2 flags:0x00000028
> > [   62.637308] Call trace:
> > [   62.639748]  __switch_to+0x11c/0x190
> > [   62.643319]  __schedule+0x3b8/0x8d8
> > [   62.646796]  schedule+0x4c/0x108
> > [   62.650018]  schedule_timeout+0x1ac/0x358
> > [   62.654021]  rcu_gp_kthread+0x6a8/0x12b8
> > [   62.657933]  kthread+0x14c/0x158
> > [   62.661153]  ret_from_fork+0x10/0x18
> > [   62.682919] BUG: scheduling while atomic: stress-ng-hrtim/831/0x00000002
> > [   62.689604] Preemption disabled at:
> > [   62.689614] [<ffffffc010059418>] irq_enter_rcu+0x30/0x58
> > [   62.698393] CPU: 0 PID: 831 Comm: stress-ng-hrtim Not tainted 5.10.42+ #5
> > [   62.706296] Hardware name: Zynqmp new (DT)
> > [   62.710115] Call trace:
> > [   62.712548]  dump_backtrace+0x0/0x240
> > [   62.716202]  show_stack+0x2c/0x38
> > [   62.719510]  dump_stack+0xcc/0x104
> > [   62.722904]  __schedule_bug+0x78/0xc8
> > [   62.726556]  __schedule+0x70c/0x8d8
> > [   62.730037]  schedule+0x4c/0x108
> > [   62.733259]  do_notify_resume+0x224/0x5d8
> > [   62.737259]  work_pending+0xc/0x2a4
> >
> > The error results in OOM eventually.
> >
> > RCU priority boosting does work around this issue but it seems to me
> > a workaround more than a fix (otherwise boosting would be enabled
> > by CONFIG_PREEMPT for arm64 I guess?).
> >
> > The question is: is this an arm64 bug that should be investigated? or
> > is this some known corner case of running stress-ng that is already
> > understood?
> >
> > thanks
> > Jorge
> >
> >
> >

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=Q489=NX=gmail.com=zhouzhouyi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F2BC432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 09:17:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8D30160462; Wed,  1 Sep 2021 09:17:25 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634A960525;
	Wed,  1 Sep 2021 09:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 634A960525
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id x11so5315050ejv.0;
        Wed, 01 Sep 2021 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c88R+FAvwJlM8FpJiX5JDC5Io5vB566XAa618GziPaU=;
        b=iJ1Fbxf3vBANGBcLEgMF106n+F4uFoyL6Y0+hpnUgBwLaUHiy8e778XI/I4/Rs3l7C
         tiTPyu7Tj/EOvdfMv5H9Fjd5LalmznFXFnYcOcVUS/NhLFr+N8QSAbOPW9sBuUNKxqR3
         W+U09JpgAZhpP4tQfd+YBnLp6PcDVXhIw2Qu9J/ghywddE5DSGrE5jrW4aLjFym7v/4h
         Wkvu6UYwlpVviTFlX7KN0O4q2fHRM1McJ7WPfRByBR3P1GghI+dRpwel2XuhA4Xc5kzt
         AxeLIOkwfWx6i87lTbfs9syG0s/56EbFac8hFVO8+/ObwxW0hvLXwCKSyMGk047OOq8U
         islQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c88R+FAvwJlM8FpJiX5JDC5Io5vB566XAa618GziPaU=;
        b=LsZjv7WahsRfXZY+n62FkEWFrVir9SdbppVQbeHm3QW0utdokP+Td0Yy6fgsyZuJie
         Y0Iz+qK+oNdJUJpG650B+PLhk28xq78xFRgrtYZOgcMonYce7UDiY1aGuhWiTgXxVyUD
         UyFemDbFI8hg5X4E6/GVH8m51A60Mzxxpxo928DnkLeRWm1UCaXVrB0Dp4URfranNtpT
         vSW1DJ+SRBTtVtrmqmR8bKHWAvOHUkR0PLINiPFz6v8vQLKbpnXBg0j7t2Up0zAMc0av
         XbHKRjBO2DMUhWV+s0M/Ror5EXcEoZHQztzXXeBpOpiebKAJpv6EHBu5rlasPec0o//n
         DZGA==
X-Gm-Message-State: AOAM533ZPjLMQfzAtryvQsJNfoyBIZtZbMYM6vWl7Ae5zF5hz5H/O4gy
	VV6uEI+S5O545SQsF75NYKFvwMsENn4dBZ2217Wf71DBfwjmkiPy
X-Google-Smtp-Source: ABdhPJzoav8kc9yIG/mt4OFYq1KpuMJ2drdupuseuf12AblbOu9t6chvXrPnkVNIF5GlXrGEWf/6KViSaKQKgeCFv1Q=
X-Received: by 2002:a17:906:1d19:: with SMTP id n25mr31838328ejh.11.1630487844067;
 Wed, 01 Sep 2021 02:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210831152144.GA28128@trex> <CAABZP2xGnSLVbgxqjKMq=Oj_H7rYfYjuCvmBpmZ4tRptGs3SEw@mail.gmail.com>
 <CAABZP2wUdToiAWOAgqDZrZtkuEdrXEv9GDgbioW3PZAyseOSgA@mail.gmail.com>
 <CAABZP2zg8c_gkm4+h4-mPCv_uDf5-iJFHEExCDFoES0jmBeuKw@mail.gmail.com> <20210901082321.GA6551@trex>
In-Reply-To: <20210901082321.GA6551@trex>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 1 Sep 2021 17:17:12 +0800
Message-ID: <CAABZP2yERfsiV6VfmEjgDg9p9RD65Yu0y8yEq9f9qSmFxQTJJQ@mail.gmail.com>
Subject: Re: rcu_preempt detected stalls
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>, Neeraj Upadhyay <neeraju@codeaurora.org>
List-Id: <soc.lore.kernel.org>
Cc: paulmck@kernel.org, Josh Triplett <josh@joshtriplett.org>, 
	rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, "Joel Fernandes, Google" <joel@joelfernandes.org>, 
	rcu <rcu@vger.kernel.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 4:23 PM Jorge Ramirez-Ortiz, Foundries
<jorge@foundries.io> wrote:
>
> On 01/09/21, Zhouyi Zhou wrote:
> > Hi,
> >
> > I  perform following two new rounds of experiments:
> >
> >
> > Test environment (x86_64 debian10 virtual machine: kvm -cpu host -smp
> > 8 -hda ./debian10.qcow2 -m 4096 -net
> > user,hostfwd=tcp::5556-:22,hostfwd=tcp::5555-:19 -net nic,model=e1000
> > -vnc :30)
> >
> > 1.   CONFIG_RCU_BOOST=y
> > 1.1 as root, run #stress-ng --sequential 100  --class scheduler -t 5m --times
> > 1.2 as regular user at the same time, run $stress-ng --sequential 100
> > --class scheduler -t 5m --times
> >
> > System begin OOM kill after 6 minutes:
> > 31 19:41:12 debian kernel: [  847.171884] task:kworker/1:0     state:D
> > stack:    0 pid: 1634 ppid:     2 flag\
> > s:0x00004000
> > Aug 31 19:41:12 debian kernel: [  847.171890] Workqueue: ipv6_addrconf
> > addrconf_verify_work
> > Aug 31 19:41:12 debian kernel: [  847.171897] Call Trace:
> > Aug 31 19:41:12 debian kernel: [  847.171903]  __schedule+0x368/0xa40
> > Aug 31 19:41:12 debian kernel: [  847.171915]  schedule+0x44/0xe0
> > Aug 31 19:41:12 debian kernel: [  847.171921]
> > schedule_preempt_disabled+0x14/0x20
> > Aug 31 19:41:12 debian kernel: [  847.171924]  __mutex_lock+0x4b1/0xa10
> > Aug 31 19:41:12 debian kernel: [  847.171935]  ? addrconf_verify_work+0xa/0x20
> > Aug 31 19:41:12 debian kernel: [  847.171948]  ? addrconf_verify_work+0xa/0x20
> > Aug 31 19:41:12 debian kernel: [  847.171951]  addrconf_verify_work+0xa/0x20
> > Aug 31 19:41:12 debian kernel: [  847.171955]  process_one_work+0x1fa/0x5b0
> > Aug 31 19:41:12 debian kernel: [  847.171967]  worker_thread+0x64/0x3d0
> > Aug 31 19:41:12 debian kernel: [  847.171974]  ? process_one_work+0x5b0/0x5b0
> > Aug 31 19:41:12 debian kernel: [  847.171978]  kthread+0x131/0x180
> > Aug 31 19:41:12 debian kernel: [  847.171982]  ? set_kthread_struct+0x40/0x40
> > Aug 31 19:41:12 debian kernel: [  847.171989]  ret_from_fork+0x1f/0x30
> > Aug 31 19:41:12 debian kernel: [  847.176007]
> > Aug 31 19:41:12 debian kernel: [  847.176007] Showing all locks held
> > in the system:
> > Aug 31 19:41:12 debian kernel: [  847.176016] 1 lock held by khungtaskd/56:
> > Aug 31 19:41:12 debian kernel: [  847.176018]  #0: ffffffff82918b60
> > (rcu_read_lock){....}-{1:2}, at: debug_show_a\
> > ll_locks+0xe/0x1a0
> >
> > 2.  # CONFIG_RCU_BOOST is not set
> > 2.1 as root, run #stress-ng --sequential 100  --class scheduler -t 5m --times
> > 2.2 as regular user at the same time, run $stress-ng --sequential 100
> > --class scheduler -t 5m --times
> > System begin OOM kill after 6 minutes:
> > The system is so dead, that I can't save the backtrace to file nor did
> > kernel has a chance to save the log to /var/log/messages
> >
>
> all,
>
> Thanks for testing on x86. we can also reproduce on qemu arm64. So I
> think it will point out to the stress-ng test itself; I will debug it
> early next week - didnt expect so much support so fast TBH, it took me
> by surprise - and will report then (thanks again)

You are very welcome ;-)
I'm very glad that our effort can be of some help to you,
I've learned a lot from both of you during this process.
Looking forward to seeing your report.

Thanks
Zhouyi

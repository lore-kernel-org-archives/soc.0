Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5746AC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 09:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DC2600D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 09:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17DC2600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10wHGrll6iicHWA89/Gc/EXdgP8RXL2chxbnfUeKnN4=; b=pD5n2AOY187LJy
	sb6QIJdHU9ySgkwYroucSIUtQzr1VGfy2hggWHUgV/HCFj6lal/spAsaIKoCVh3FIRNDqeV4m8+Xz
	KqNODotMVBUxRH1QwHrOf+Cyfr4iP2iyWdk5VQdpDVhB6qTvzXq84WBtpmYvpfhB2NIIIRE5VV+pg
	vL9tV1ZgVPDM+N5ptUmUmOj/16pZUfTj4y8EOYLen//4PlgRbNb4VVt7gPo/iNbJspPs2RnlGY79x
	cgteW3OVVohiMfIlNNt8L3CcvcOsDRtqfsjm7pc2L9yKLJDhxEQG6qGIVIPZ30Yo8MxXTJh9n5QCx
	c1wWoeKf4sq09VcXWl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLMpL-004zQv-To; Wed, 01 Sep 2021 09:46:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLMN4-004p33-07
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 09:17:27 +0000
Received: by mail-ej1-x62e.google.com with SMTP id e21so5058994ejz.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 01 Sep 2021 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c88R+FAvwJlM8FpJiX5JDC5Io5vB566XAa618GziPaU=;
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
 b=PGJ3T3f0P260LZGB/YrYvuUDOtyVpwjYHr35/Tznz0wzjZlzosUGm4u8VLRIpD+0Mm
 1dXIUvGmTHJOGdpKT3/x0zE+D2Nw5m2LV2bekNq6G5ylzt24Bzs+7zK3iaMVUOpgGuiE
 oeoIYQ9+tK3/KW0qrrp740czioFLn7mNL2NynaFTim1RrBjZpRDDdWUHnSYY0Ltux9w4
 YaeMvOln+G1NU0jck6wt1fAgAoy0nR7KLO4qh2D3544xIfJW3HaNpM8QHNpY+BhcUS7H
 viIUPlQ9SuWilwceMUqiKf7W4QqJr5y3mrn7pVcSv2shVKKQofKu7P5rjMbaeAzU2hND
 opSQ==
X-Gm-Message-State: AOAM533vZw9n0AMSJEeK+ORiks64D/Ux6a1YwGha6xEDakDpjHSXAFT/
 eRXxNoAFxW4DRex5LfIZywnvh15xbAw9vvJ0MMY=
X-Google-Smtp-Source: ABdhPJzoav8kc9yIG/mt4OFYq1KpuMJ2drdupuseuf12AblbOu9t6chvXrPnkVNIF5GlXrGEWf/6KViSaKQKgeCFv1Q=
X-Received: by 2002:a17:906:1d19:: with SMTP id
 n25mr31838328ejh.11.1630487844067; 
 Wed, 01 Sep 2021 02:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210831152144.GA28128@trex>
 <CAABZP2xGnSLVbgxqjKMq=Oj_H7rYfYjuCvmBpmZ4tRptGs3SEw@mail.gmail.com>
 <CAABZP2wUdToiAWOAgqDZrZtkuEdrXEv9GDgbioW3PZAyseOSgA@mail.gmail.com>
 <CAABZP2zg8c_gkm4+h4-mPCv_uDf5-iJFHEExCDFoES0jmBeuKw@mail.gmail.com>
 <20210901082321.GA6551@trex>
In-Reply-To: <20210901082321.GA6551@trex>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 1 Sep 2021 17:17:12 +0800
Message-ID: <CAABZP2yERfsiV6VfmEjgDg9p9RD65Yu0y8yEq9f9qSmFxQTJJQ@mail.gmail.com>
Subject: Re: rcu_preempt detected stalls
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>,
 Neeraj Upadhyay <neeraju@codeaurora.org>
List-Id: <soc.lore.kernel.org>
Cc: paulmck@kernel.org, Josh Triplett <josh@joshtriplett.org>, 
 rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, "Joel Fernandes,
 Google" <joel@joelfernandes.org>, 
 rcu <rcu@vger.kernel.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_021726_101197_F5921316 
X-CRM114-Status: GOOD (  19.97  )
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
Message-ID: <20210901091712.oSGeSTF7aXRLTs1rdT4GUH18sEFVlx_z4knvKekvi34@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C2AC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 09:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1DB6103D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 09:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E1DB6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=foundries.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqBsunLqen85WnplWQo7nLsgFr0p5IhR1jQlBQeuRrY=; b=i8chAbxEHe0YRQ
	78Qu7zhH4gB/kQdfLluhsI2v7VMjoCKQAdw5yB9+9XaRT82e1iNx4ei5PeIgqRpl/X05KpYLR6TOL
	XPmK/0FsZcNH2K3rvtUivnEJrFt4qbxKpmtVD4RU9Npn8IbzNbB9FEDn61Qnw0XyNnEezeSDI4EAq
	zt8MRj9ziArhNCV6qPy7YiPkoeiAz0U0O4O92EEvcVXu793oOXYrMTRP0TnN8iLnVnJLb1Qyaa83M
	ftba2Dbn5K7UsS+LvlZaDaotRPp4MN5P3Acs6F+yYNoL0QKi3ZwdltFb2yHyMG0m1RaVVmUlefb9y
	ew5zq72bveBW/E65i6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLM6F-004iL9-UQ; Wed, 01 Sep 2021 09:00:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLWm-004YKE-TV
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 08:23:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id q11so3151422wrr.9
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 01 Sep 2021 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/mEszP5w7DlGRC19iEDfVrZxvNnrPnTs3JozJsb/fDM=;
 b=k9Y0/D9MoUSo0lJLMUFp6WKzQBvyupSGfe8qZsaGihEBPGmb7G3rvyCfU+5KPQl39h
 4AYXK3X8yXqTmmLOE3sQgJ7dShrpbj/1MR30M16vy+ZtMtNnlqdbBF9oqk/U5qN0bTbx
 SMn2QI6H3CM0wqo1jWyYPt02yflsQBHSPdBjSn88Wnwr2qXwpiTVp8U/y+04721WjK3X
 pULl7UWo8icrjT+xdb/mQc3InUawwuenQABfCXuVXnymYDMXrXYdKos7VJsOzOGdZqru
 4CheFvvbvdrHJ6eRHNhbPACxVgaG4cAugsX8Ao3kr72AOxyUqzUQ3eNYhE+yYQcHctJW
 t62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/mEszP5w7DlGRC19iEDfVrZxvNnrPnTs3JozJsb/fDM=;
 b=OM0iEQ+nYt9a687xZHnIzOQelOekGWlWOUoE3IhB1BIbY2PMtx9Gmfv5/hqc0cKPZ8
 cSPm4gfcQkYuPLpEhYueQe8Eir8kty7jSYWtMBNUVOw4TCnKKQmnDm1bIuGNxpPfAKDb
 HkCAB253Pz6fmSn43U+TWCJXPGNLsCyjFVeGUm6+pVziWqleokKLoml3recHSmiotlt3
 NkRtxSiMbWSL/u02xkIoSfWBXi4HY/UYUiULVp1d5ozJMi8LiyNnIMkzkgjQW0T2g2fM
 I4YqlZy+iQGkozMu7pxUUaWvmIJJ73/HAT2qTB/d+xB98FB4ywwC02tiXGsaYvbwRR6H
 cwqg==
X-Gm-Message-State: AOAM530SFtOU80RTj1OhEauU+ZVuaEI7mQofLyDg6ZtE+Tmbe9dYXroh
 xMOKMJU+Z/F1EBiNbLe0tpWMyQ==
X-Google-Smtp-Source: ABdhPJwD+I52MpdxPgFMi7zcP5lrvVk3QmCrVgR6fhielUnZuOmjMha1Nx7GgXaPafI2I3z5eQ31IQ==
X-Received: by 2002:a05:6000:18c6:: with SMTP id
 w6mr36923867wrq.159.1630484602971; 
 Wed, 01 Sep 2021 01:23:22 -0700 (PDT)
Received: from trex (162.red-79-154-201.dynamicip.rima-tde.net.
 [79.154.201.162])
 by smtp.gmail.com with ESMTPSA id u26sm19298460wrd.32.2021.09.01.01.23.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Sep 2021 01:23:22 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Wed, 1 Sep 2021 10:23:21 +0200
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>,
 paulmck@kernel.org, Josh Triplett <josh@joshtriplett.org>,
 rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 "Joel Fernandes, Google" <joel@joelfernandes.org>,
 rcu <rcu@vger.kernel.org>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: rcu_preempt detected stalls
Message-ID: <20210901082321.GA6551@trex>
References: <20210831152144.GA28128@trex>
 <CAABZP2xGnSLVbgxqjKMq=Oj_H7rYfYjuCvmBpmZ4tRptGs3SEw@mail.gmail.com>
 <CAABZP2wUdToiAWOAgqDZrZtkuEdrXEv9GDgbioW3PZAyseOSgA@mail.gmail.com>
 <CAABZP2zg8c_gkm4+h4-mPCv_uDf5-iJFHEExCDFoES0jmBeuKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAABZP2zg8c_gkm4+h4-mPCv_uDf5-iJFHEExCDFoES0jmBeuKw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_012325_037198_7F7A5ECB 
X-CRM114-Status: GOOD (  16.27  )
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
Message-ID: <20210901082321.nj61nA4mXy_hgClhySzqE-uoWYVzA0aI3c0f_uguoIs@z>

On 01/09/21, Zhouyi Zhou wrote:
> Hi,
> 
> I  perform following two new rounds of experiments:
> 
> 
> Test environment (x86_64 debian10 virtual machine: kvm -cpu host -smp
> 8 -hda ./debian10.qcow2 -m 4096 -net
> user,hostfwd=tcp::5556-:22,hostfwd=tcp::5555-:19 -net nic,model=e1000
> -vnc :30)
> 
> 1.   CONFIG_RCU_BOOST=y
> 1.1 as root, run #stress-ng --sequential 100  --class scheduler -t 5m --times
> 1.2 as regular user at the same time, run $stress-ng --sequential 100
> --class scheduler -t 5m --times
> 
> System begin OOM kill after 6 minutes:
> 31 19:41:12 debian kernel: [  847.171884] task:kworker/1:0     state:D
> stack:    0 pid: 1634 ppid:     2 flag\
> s:0x00004000
> Aug 31 19:41:12 debian kernel: [  847.171890] Workqueue: ipv6_addrconf
> addrconf_verify_work
> Aug 31 19:41:12 debian kernel: [  847.171897] Call Trace:
> Aug 31 19:41:12 debian kernel: [  847.171903]  __schedule+0x368/0xa40
> Aug 31 19:41:12 debian kernel: [  847.171915]  schedule+0x44/0xe0
> Aug 31 19:41:12 debian kernel: [  847.171921]
> schedule_preempt_disabled+0x14/0x20
> Aug 31 19:41:12 debian kernel: [  847.171924]  __mutex_lock+0x4b1/0xa10
> Aug 31 19:41:12 debian kernel: [  847.171935]  ? addrconf_verify_work+0xa/0x20
> Aug 31 19:41:12 debian kernel: [  847.171948]  ? addrconf_verify_work+0xa/0x20
> Aug 31 19:41:12 debian kernel: [  847.171951]  addrconf_verify_work+0xa/0x20
> Aug 31 19:41:12 debian kernel: [  847.171955]  process_one_work+0x1fa/0x5b0
> Aug 31 19:41:12 debian kernel: [  847.171967]  worker_thread+0x64/0x3d0
> Aug 31 19:41:12 debian kernel: [  847.171974]  ? process_one_work+0x5b0/0x5b0
> Aug 31 19:41:12 debian kernel: [  847.171978]  kthread+0x131/0x180
> Aug 31 19:41:12 debian kernel: [  847.171982]  ? set_kthread_struct+0x40/0x40
> Aug 31 19:41:12 debian kernel: [  847.171989]  ret_from_fork+0x1f/0x30
> Aug 31 19:41:12 debian kernel: [  847.176007]
> Aug 31 19:41:12 debian kernel: [  847.176007] Showing all locks held
> in the system:
> Aug 31 19:41:12 debian kernel: [  847.176016] 1 lock held by khungtaskd/56:
> Aug 31 19:41:12 debian kernel: [  847.176018]  #0: ffffffff82918b60
> (rcu_read_lock){....}-{1:2}, at: debug_show_a\
> ll_locks+0xe/0x1a0
> 
> 2.  # CONFIG_RCU_BOOST is not set
> 2.1 as root, run #stress-ng --sequential 100  --class scheduler -t 5m --times
> 2.2 as regular user at the same time, run $stress-ng --sequential 100
> --class scheduler -t 5m --times
> System begin OOM kill after 6 minutes:
> The system is so dead, that I can't save the backtrace to file nor did
> kernel has a chance to save the log to /var/log/messages
> 

all, 

Thanks for testing on x86. we can also reproduce on qemu arm64. So I
think it will point out to the stress-ng test itself; I will debug it
early next week - didnt expect so much support so fast TBH, it took me
by surprise - and will report then (thanks again)





_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

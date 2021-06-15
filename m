Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA3CC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 21:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C53760FEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 21:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C53760FEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DeB72rjVu0hDcvsiXD+1b70h9AV8wxeZoHWuv4nVs4=; b=xsMClWeNzKPCLE
	vlAaULUvn1L+QoFUmM+v6cbjRPMnejUMKgiLX3l+cJtZLYsbJC4eUdXPISNf1U31oceraCOHUR4fI
	OK3RaJzs/U8kMe3MWsYrw60qjapTGLayL8j+oFCjFOZ+QeDOrHcFTGWV5bUeRJNxnqYHfWmLPt064
	0KCyUxnrBVRdj3N0bFQfVdQTEP7EKSFe08cOz2//Y6wOzLY3PX2IzdY889JlUygIKvTDPG6CCGM/E
	7RQFGlZGuS93F8jVaxt94hNCbO7pcFWu+9L6iv3RWG6ovN0BVogsi0TmaJdJV3Bo0J4oXEj03khAw
	8j7DIJIBdqG04jBjtj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGJr-00324E-RA; Tue, 15 Jun 2021 21:10:00 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCuC-001km4-9n
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 17:31:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id l4so13633575ljg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=39g+12RbBupyfwOsZFzw4LYXqjKe0xK0TdY1WsE/9Rs=;
 b=hFKT0mbDSgE50YhcOuclusC4U/fakLcKZIUN+lD7eiKVCwRQfMJdSLcg1pS9Ohf9ri
 LTxJJowiL9WzmlsVXTvTATkKSjGGLpgRhh6CKqb8gNoTw8EiA8EQ0Z05PXvWgfjbXb4r
 LiVujPlHGuH3zRnU5fUGp8lnJ9HNw7gzCnmDQcIBGXt8Q0fTQyKBcs9AVQro/ZZqaEK+
 9+WWTkL8sdln4yedRJXU8sHwapwVmDNJicATIx0JMlbIRniykpaomCH2Ytys15SzIhHl
 GHdCcQtATZiW7kl5bgJWy5ro1+OzCAZpMbuhhHBOMGIoobKsPLLwZ74in44pPbzpRtA8
 cZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=39g+12RbBupyfwOsZFzw4LYXqjKe0xK0TdY1WsE/9Rs=;
 b=roj+d9gsYRbtxQLIL74mGbUVQzfJ7bv2xwIy/iPsS2ja60kClGuWR/U1IVl2x6Onsj
 +ZDu0kdUHY1JcXSOqtsMYx/sLSPW1FtQDyGHpXBT8wpICLbGs46AIRo8lgCnfpCCdWDq
 d5/GY+hCqDS5ixG6tcNV4vHqvv52ZwtW9jL4woE9v3Ys1odLTzcnL+SWyo2u3exuABjC
 AW2ZGwWGEM9jp43JB/lAGvnyNBbNf0qKoaNpWk55hceymq70VusyASmefWGJ0k0J143A
 YMxkStQgNnKDi2mDPWuJeigiU6bOUkppe2jnOgN+QTtKUyCVZziAaQlg3/PXwsjnbJA6
 fPYg==
X-Gm-Message-State: AOAM532KNPcbKfP9mWvDqh12tV5A8vM+Ip2x9An2kYrCzPU+j1m5uiV7
 wqxgPuxd0wTFRGYMqOx0JWW72g==
X-Google-Smtp-Source: ABdhPJzDiI8gCBiGgk7ZlBw55YgjqqSepBm3KZuZW6eDjEhrP1bHzBemiKb9erh7MTymQCaTkw8jWw==
X-Received: by 2002:a05:651c:50c:: with SMTP id
 o12mr643041ljp.364.1623778274172; 
 Tue, 15 Jun 2021 10:31:14 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id u13sm1871710lfq.201.2021.06.15.10.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:31:13 -0700 (PDT)
Date: Tue, 15 Jun 2021 09:47:24 -0700
From: Olof Johansson <olof@lixom.net>
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210615164724.GA6312@lx2k>
References: <20210601095838.GA838783@bogus>
 <20210614170856.rs7jrke3gvpmu4km@bogus>
 <20210615152149.GB11724@lx2k>
 <20210615153430.qslynmqo5urwfugt@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615153430.qslynmqo5urwfugt@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103116_536234_F94C5867 
X-CRM114-Status: GOOD (  39.73  )
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
Message-ID: <20210615164724.TThGH67kAoL3p7BvDtrcuxYF-66fYr9BpB2omgWk_4Y@z>

On Tue, Jun 15, 2021 at 04:34:30PM +0100, Sudeep Holla wrote:
> Hi Olof,
> 
> On Tue, Jun 15, 2021 at 08:21:49AM -0700, Olof Johansson wrote:
> > Hi,
> >
> > On Mon, Jun 14, 2021 at 06:08:56PM +0100, Sudeep Holla wrote:
> > > Hi Olof,
> > >
> > > On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> > > > Hi ARM SoC Team,
> > > >
> > > > Please pull !
> > > >
> > > > This is a new driver pull request. One of the arm64 patch is being
> > > > pulled from a stable arm64 branch for-next/ffa as the other patches
> > > > are dependent of the same.
> > > >
> > > > Background
> > > > ----------
> > > > This has been on the list for almost a year now with changing requirements.
> > > > Initially Arm KVM wanted to use this via userspace interface in VMM to
> > > > communicate with VMs. But it was later dropped in favour of arch-agnostic
> > > > interface[1].
> > > >
> > > > Also there was some discussion on the dt-bindings which was dropped
> > > > completely. Though we need to workaround the lack of full discoveribility
> > > > in v1.0 spec, it is now being fixed for the next version of the spec.
> > > >
> > >
> > > I see that you have pulled quite a lot of drivers and other SoC code
> > > including my scmi and juno ones that were sent more recently than this
> > > one. Just thought of checking if this is still in queue ? Sorry for the
> > > nag but this has been on a list almost a year. We missed v5.13 due to
> > > DT binding controveries(for good reasons) and we really don't want to
> > > miss v5.14
> >
> > I held off because I wanted to spend a few cycles on looking into it before
> > blindly merging it.
> >
> 
> Sure, just wanted to make sure it was in your list.

Yeah, thanks for the ping. Whenever we miss something we almost always say:
"But you didn't ping us?!". You did, and it'd be awfully bad signaling if we
somehow got upset by it if we want people to do it more often.

> > Are there any implemented users of this (on either side) today? We normally
> > don't merge a framework in the kernel without having at least one user of it
> > also available.
> >
> 
> Fair enough.
> 
> Yes, OPTEE patches are on the list[1]. Just to avoid complexity in merging
> Jens(OPTEE maintainer) held it off for next cycle allowing more time. But we
> have been testing all the versions of this driver posted on the list with
> OPTEE. There are other users too but they need userspace interface which
> is still work in progress.

Ok, thanks for that! Ideally, having that in the tag, i.e. also in cover letter
for patch set would have avoided this round trip next time. But thanks for that
detail.

I'll queue this up shortly.


-Olof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

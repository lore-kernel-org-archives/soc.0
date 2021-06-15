Return-Path: <SRS0=fFfY=LJ=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE5CC48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 17:31:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2E39761414; Tue, 15 Jun 2021 17:31:16 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF33D610A3
	for <soc@kernel.org>; Tue, 15 Jun 2021 17:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF33D610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-lj1-f177.google.com with SMTP id r16so26136652ljk.9
        for <soc@kernel.org>; Tue, 15 Jun 2021 10:31:15 -0700 (PDT)
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
        b=L2z3pbDszurpsUajcz090GCcN5LEDrSRqtpwCH+aeoyZVEl6y6cicnmPX8EjqFwkhF
         Ms39E5L/cgQYMOpgiMbMWKfDrDVxLMzdPzboGjnWXKyCuYEZQboUebCFrbnbrqPTyDSU
         c6RmRWMVMfBZWQj8ivUJeZoSUHZTX/eNT70dzOj0Epb9IktsfP0e1hH6WzsDpJ0r0TVw
         KiuWNkJHkjRGRSKizg6LpLSH8N2KmeV5hGLp97iESHyhaCXI6DIYjsj+T/xxX7VUwx2i
         keFpW2cOSnespFN4GfYh+jWsMkK0E4NQYYIHr6L/jgInidBhHwQTHzaFLIpXm56+mL7Y
         MiNQ==
X-Gm-Message-State: AOAM5302pO9JMj7akNQErvlGp/++o3n7WniepmSm3AYJAP1OVfY2EV5x
	zxuO6CRexi/W5UOY6VvdCYinXQ==
X-Google-Smtp-Source: ABdhPJzDiI8gCBiGgk7ZlBw55YgjqqSepBm3KZuZW6eDjEhrP1bHzBemiKb9erh7MTymQCaTkw8jWw==
X-Received: by 2002:a05:651c:50c:: with SMTP id o12mr643041ljp.364.1623778274172;
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615153430.qslynmqo5urwfugt@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)

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

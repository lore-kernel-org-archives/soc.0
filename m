Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F47C3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 20:09:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 831A922242; Fri, 27 Nov 2020 20:09:44 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5AAD22223F;
	Fri, 27 Nov 2020 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606507784;
	bh=xjkHz9LU09u19AHW6KW9MzWfb2YsS3rWnAT4/GCrQhA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IanKyMvdNv5mUOKTw22O2cuKiTFR45lN8HizXRY2Ml7kY89UuUuLkvwihfMEMk2ha
	 EEaAYtVCe8nh4zjJi8fxQPXSR2of1N+J89tte4+5jXpEojIOPtTnje9TBS4pSf7ck+
	 lG2gjOUGIjdvCs7RtQ8L43e4zyaOr0UvnrGagCKA=
Received: by mail-ot1-f53.google.com with SMTP id k3so5636501otp.12;
        Fri, 27 Nov 2020 12:09:44 -0800 (PST)
X-Gm-Message-State: AOAM530urk8x03kRXCqtVHFmrBa9Hkl80R/RQydS5epxrYbrJ7RyQdrE
	aWfLfe9Llvi7W2VPqs/afiGtsi9hWuSOnCKFsqw=
X-Google-Smtp-Source: ABdhPJwA9ea8MXWuapY3zEriuULbtZBo7olT5s8nw9s1eotIg7jG5HhjvMb1CMTlrG6XScHncBcY2XX4VHfwBCZmjoU=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr7537248otk.251.1606507783711;
 Fri, 27 Nov 2020 12:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20201124122412.22386-1-sudeep.holla@arm.com> <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
 <20201127100007.iu657u63jnoeg6g2@bogus>
In-Reply-To: <20201127100007.iu657u63jnoeg6g2@bogus>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 27 Nov 2020 21:09:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a07J7dUxd4v9ks0uV6RB5gbzC84f1rBRpuXVrtbXSE9mQ@mail.gmail.com>
Message-ID: <CAK8P3a07J7dUxd4v9ks0uV6RB5gbzC84f1rBRpuXVrtbXSE9mQ@mail.gmail.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Kevin Hilman <khilman@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 11:00 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Thu, Nov 26, 2020 at 09:54:50PM +0100, Arnd Bergmann wrote:
> > On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > Hi ARM SoC Team,
> > >
> > > Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> > > the fixes that got merged in -rc2.
> >
> > Is there no way to avoid this? I would really prefer not to have to backmerge
> > rc2 into my existing branch if it's just about the bugfix.
> >
> > I tried rebasing your branch onto -rc2 and only got a trivial conflict
> > in one line, and even that could be avoided by merging in your
> > bugfix branch instead of the whole -rc2.
> >
>
> Unfortunately the branch/tag I shared with Mark Brown to merge the voltage
> regulator part is also based on -rc2. I might have to drop those patches
> from this pull request if I need to rebase on -rc1. If that's OK, I can
> send fresh/new PR based on -rc1. Sorry for the trouble.

I ended up doing the backmerge of v5.10-rc2 into arm/drivers and merged
your tag on top of that. I'll have to remember filtering out the changes
when I send my pull request to Linus, but otherwise this seems like
the lesser evil.

     Arnd

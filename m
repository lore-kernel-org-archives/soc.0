Return-Path: <SRS0=iHFn=SX=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EFEC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 10:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 887B7C340F7; Tue,  8 Feb 2022 10:34:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id E2AA8C340EF;
	Tue,  8 Feb 2022 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2AA8C340EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB77211D4;
	Tue,  8 Feb 2022 02:34:16 -0800 (PST)
Received: from bogus (unknown [10.57.41.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16D063F718;
	Tue,  8 Feb 2022 02:34:14 -0800 (PST)
Date: Tue, 8 Feb 2022 10:33:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
Message-ID: <20220208103327.hjld33z3lkfrpu6k@bogus>
References: <20211222141342.56395-1-sudeep.holla@arm.com>
 <20220107113740.f4zlz25largdjcfd@bogus>
 <20220108202410.GA1057@lx2k>
 <CAK8P3a1qcZHFpxdqF1AFSCGR+AyDrYmucdBQGz5G1PvnEMbp8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1qcZHFpxdqF1AFSCGR+AyDrYmucdBQGz5G1PvnEMbp8Q@mail.gmail.com>

On Tue, Feb 08, 2022 at 11:00:43AM +0100, Arnd Bergmann wrote:
> On Sat, Jan 8, 2022 at 9:24 PM Olof Johansson <olof@lixom.net> wrote:
> > On Fri, Jan 07, 2022 at 11:37:40AM +0000, Sudeep Holla wrote:
> > > On Wed, Dec 22, 2021 at 02:13:42PM +0000, Sudeep Holla wrote:
> > > > Hi ARM SoC Team,
> > > >
> > > > Please pull !
> > > >
> > >
> > > I am aware I sent this pull request just around the same time Arnd finalised
> > > the initial set. I have seen emails suggesting that Olof might be planning
> > > to merge additional PR, so it would be great if this gets included in
> > > that cut. All the changes are in -next since 21st December, so there should
> > > be no surprises.
> > >
> > > Thanks again and sorry for nagging.
> >
> > Yeah, no worries -- I'd been letting pull requests sitting for a while over the
> > holidays. I've merged this into our late branch now.
> 
> Hi Sudeep,
> 
> I'm going through all the stuff that we ended up not getting into v5.17.
> As you probably already know, this pull request was part of the arm/late
> branch that missed out, sorry for the mistake on our end.
>

No worries, it was indeed a late PR.

> As the contents are still fine, I could offer to either merge the branch again
> for v5.18, or I can drop it and wait for a new pull request from you, please
> let me know your preference.
>

Is it OK if I merge this tag with v5.17-rc1 as base and load it with any
new v5.18 material on the top ? I just want to avoid rebasing as the same time
some of the new material depend on these changes. Let me know if that
is fine. I am open to any other suggestions too.

> If any of the patches are bug fixes that you think should be in v5.17,
> it would be good to have a separate pull request or patch email for the
> 5.17 fixes branch.
>

Sure, I will check again, but AFAIK there were no fixes for existing bugs.

-- 
Regards,
Sudeep

Return-Path: <SRS0=0D7X=FC=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE3DC63697
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 08:34:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 17CC122280; Sat, 28 Nov 2020 08:34:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 6F0D6208CA;
	Sat, 28 Nov 2020 08:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0D6208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C09D831B;
	Sat, 28 Nov 2020 00:34:45 -0800 (PST)
Received: from bogus (unknown [10.57.59.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DC793F71F;
	Sat, 28 Nov 2020 00:34:43 -0800 (PST)
Date: Sat, 28 Nov 2020 08:34:36 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
Message-ID: <20201128083436.c5cgygkas34mtnkd@bogus>
References: <20201124122412.22386-1-sudeep.holla@arm.com>
 <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
 <20201127100007.iu657u63jnoeg6g2@bogus>
 <CAK8P3a07J7dUxd4v9ks0uV6RB5gbzC84f1rBRpuXVrtbXSE9mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a07J7dUxd4v9ks0uV6RB5gbzC84f1rBRpuXVrtbXSE9mQ@mail.gmail.com>
User-Agent: NeoMutt/20171215

On Fri, Nov 27, 2020 at 09:09:27PM +0100, Arnd Bergmann wrote:
> On Fri, Nov 27, 2020 at 11:00 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On Thu, Nov 26, 2020 at 09:54:50PM +0100, Arnd Bergmann wrote:
> > > On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > >
> > > > Hi ARM SoC Team,
> > > >
> > > > Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> > > > the fixes that got merged in -rc2.
> > >
> > > Is there no way to avoid this? I would really prefer not to have to backmerge
> > > rc2 into my existing branch if it's just about the bugfix.
> > >
> > > I tried rebasing your branch onto -rc2 and only got a trivial conflict
> > > in one line, and even that could be avoided by merging in your
> > > bugfix branch instead of the whole -rc2.
> > >
> >
> > Unfortunately the branch/tag I shared with Mark Brown to merge the voltage
> > regulator part is also based on -rc2. I might have to drop those patches
> > from this pull request if I need to rebase on -rc1. If that's OK, I can
> > send fresh/new PR based on -rc1. Sorry for the trouble.
> 
> I ended up doing the backmerge of v5.10-rc2 into arm/drivers and merged
> your tag on top of that. I'll have to remember filtering out the changes
> when I send my pull request to Linus, but otherwise this seems like
> the lesser evil.
> 

Thanks and extremely sorry for the trouble. I always try to base on -rc1.
Since I had seen Arm SoC pull requests on -rc2 sometimes due to other
dependencies, I thought -rc2 wasn't too bad. I will try to stick with -rc1
or fixes tag in future to keep it simple.

-- 
Regards,
Sudeep

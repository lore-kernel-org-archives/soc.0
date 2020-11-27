Return-Path: <SRS0=yohB=FB=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCBBC63777
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 10:00:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 00E2C221FF; Fri, 27 Nov 2020 10:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 6B36721D91;
	Fri, 27 Nov 2020 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B36721D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 525F81478;
	Fri, 27 Nov 2020 02:00:15 -0800 (PST)
Received: from bogus (unknown [10.57.59.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF5B73F71F;
	Fri, 27 Nov 2020 02:00:13 -0800 (PST)
Date: Fri, 27 Nov 2020 10:00:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
Message-ID: <20201127100007.iu657u63jnoeg6g2@bogus>
References: <20201124122412.22386-1-sudeep.holla@arm.com>
 <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
User-Agent: NeoMutt/20171215

On Thu, Nov 26, 2020 at 09:54:50PM +0100, Arnd Bergmann wrote:
> On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > Hi ARM SoC Team,
> >
> > Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> > the fixes that got merged in -rc2.
> 
> Is there no way to avoid this? I would really prefer not to have to backmerge
> rc2 into my existing branch if it's just about the bugfix.
> 
> I tried rebasing your branch onto -rc2 and only got a trivial conflict
> in one line, and even that could be avoided by merging in your
> bugfix branch instead of the whole -rc2.
> 

Unfortunately the branch/tag I shared with Mark Brown to merge the voltage
regulator part is also based on -rc2. I might have to drop those patches
from this pull request if I need to rebase on -rc1. If that's OK, I can
send fresh/new PR based on -rc1. Sorry for the trouble.

-- 
Regards,
Sudeep

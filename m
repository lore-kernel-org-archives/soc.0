Return-Path: <SRS0=iHFn=SX=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D2EC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 11:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CD29C36AE2; Tue,  8 Feb 2022 11:35:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id A2301C340E9;
	Tue,  8 Feb 2022 11:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2301C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A7BFED1;
	Tue,  8 Feb 2022 03:35:46 -0800 (PST)
Received: from bogus (unknown [10.57.41.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ED873F73B;
	Tue,  8 Feb 2022 03:35:44 -0800 (PST)
Date: Tue, 8 Feb 2022 11:34:57 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
Message-ID: <20220208113457.waf4fdujnbtvneka@bogus>
References: <20211222141342.56395-1-sudeep.holla@arm.com>
 <20220107113740.f4zlz25largdjcfd@bogus>
 <20220108202410.GA1057@lx2k>
 <CAK8P3a1qcZHFpxdqF1AFSCGR+AyDrYmucdBQGz5G1PvnEMbp8Q@mail.gmail.com>
 <20220208103327.hjld33z3lkfrpu6k@bogus>
 <CAK8P3a1Xq0O83PF1U-CcQTzAdaLuuxoLN=p+nC-ZjEbzAjPwSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Xq0O83PF1U-CcQTzAdaLuuxoLN=p+nC-ZjEbzAjPwSA@mail.gmail.com>

On Tue, Feb 08, 2022 at 12:14:25PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 8, 2022 at 11:33 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On Tue, Feb 08, 2022 at 11:00:43AM +0100, Arnd Bergmann wrote:
> > > As the contents are still fine, I could offer to either merge the branch again
> > > for v5.18, or I can drop it and wait for a new pull request from you, please
> > > let me know your preference.
> > >
> >
> > Is it OK if I merge this tag with v5.17-rc1 as base and load it with any
> > new v5.18 material on the top ? I just want to avoid rebasing as the same time
> > some of the new material depend on these changes. Let me know if that
> > is fine. I am open to any other suggestions too.
> 
> Yes, I think that is ok, as long as you start a branch from v5.17-rc1 and merge
> the old contents into the new branch, rather than back-merging the -rc1 tag
> into your existing branch. This way, the git history still makes sense
> across the merges.

Thanks for confirming my understanding.

-- 
Regards,
Sudeep

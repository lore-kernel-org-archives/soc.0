Return-Path: <will@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D10C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Mar 2021 10:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2EEA364F21; Thu,  4 Mar 2021 10:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A791764F2B;
	Thu,  4 Mar 2021 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614854816;
	bh=v5I8NFYJWGZ9TAXOrjLUPD1HIpMNZJQ6NdamJtztHes=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=nNx0/ShdNg3fg4fg+fJQiGQes4hSaEsSwfyOa9CNg3BSvAvU9VwS9vh+YbDTPOJTB
	 DkCAYNUn47679FeK+y/6idwud0g6FYGzXmI+VSa/mAHmkxnuyYC4eZVhD2pEO2702+
	 tcAg2jZfTylvOOFJj76dNlB3Vdn/NFWPJElSLBgzhbuneVifk0/V6829WZoAulVQKS
	 p+vVHt007/J0kcm2KF7WVbSIyu7AlO46WY69dDZw2RPyfvoiwuFgURSSDLr31tYqW5
	 qgazAPm1Haewoi3gbxYhL/2hGUtC6QT8g0rUsub7z94om140PNnYyxEsLR/fALbl/6
	 ziJRBr8qnAdHw==
Date: Thu, 4 Mar 2021 10:46:51 +0000
From: Will Deacon <will@kernel.org>
To: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: 'Arnd Bergmann' <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Olof Johansson <olof@lixom.net>,
	"misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
	james.morse@arm.com
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
Message-ID: <20210304104650.GA20843@willie-the-truck>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Mar 04, 2021 at 10:34:43AM +0000, tan.shaopeng@fujitsu.com wrote:
> > On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> > <tan.shaopeng@jp.fujitsu.com> wrote:
> > > +
> > > +config FUJITSU_CACHE
> > > +        tristate "FUJITSU Cache Driver"
> > > +        depends on ARM64_VHE || COMPILE_TEST
> > > +        help
> > > +          FUJITSU Cache Driver
> > > +
> > > +          This driver offers cache functions for A64FX system.
> > > +         Loading this cache driver, control registers will be set to enable
> > > +         these functions, and advanced settings registers will be set by
> > default
> > > +         values. After loading this driver, you can use the default values of
> > the
> > > +         advanced settings registers or set the advanced settings registers
> > > +         from EL0. Unloading this driver, control registers will be clear to
> > > +         disable these functions.
> > > +          When built as a module, this will be called as "fujitsu_cache".
> > 
> > My feeling is that this code should be in arch/arm64/, as the cache
> > is generally considered part of the CPU, rather than part of the wider
> > SoC design, or something that can be controlled separately from the
> > core kernel and memory management code.
> 
> Thanks for your advice. I also would like to hear the opinions from 
> other soc&arm maintainers, and then consider whether to add this to 
> arch/arm64/.

Given that all of this is outside of the scope of the architecture, I don't
think that arch/arm64/ is the right place for it. Perhaps this would fit
into the resctrl rework that James has been doing for MPAM?

Will

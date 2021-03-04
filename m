Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C76C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 10:49:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EFC64F2C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 10:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EFC64F2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfEh9IwQVvVaRfmWEoZyQ8prQG4PYzpiwOM4jpOsMDE=; b=JWHKzggCCKsuNx1nnhx/YDTOq
	Qk/qlZn3jTLseP9rkVivsE9A+P2zr+X61JDz5eB5kYawcslbtmwL5XuOcmccJZR+qE58LqQrrIl2M
	bu91OG/DKWlgfVgTzI9iQXbOS6KLNm04wxntvwDn3pT9IyN7AfaLX+WA9+lXhiuJORIpZeKkpv0o7
	b4SF6W19KZcF4MUjEUiXMfPX0TlHPAuyxtfKDTRmCeXVrfNcZ60iHsgUMuJl2BqxRyZ0iS+KPKxFG
	rj7JI7C/ID7iFB2cpGM2F0N0Pi1F1SiDcI9M2GBzZFNgUJcIXnbHYCwHDYMbv8WvvSxRYbv7g4bDJ
	78JnGO56w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHlVa-008Nut-TQ; Thu, 04 Mar 2021 10:47:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHlVR-008NtF-Hi
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Mar 2021 10:47:00 +0000
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
 SoC Team <soc@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
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
Content-Disposition: inline
In-Reply-To: <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Message-ID: <20210304104651.gNfJhpKervFBmZv9g5IBWM2JXUTo3Vk7UyI3uFjUTt4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

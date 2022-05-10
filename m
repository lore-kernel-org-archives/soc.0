Return-Path: <SRS0=2XoW=VS=arm.com=liviu.dudau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F47BC433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 20:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D48A8C385CA; Tue, 10 May 2022 20:07:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 5E69AC385C9
	for <soc@kernel.org>; Tue, 10 May 2022 20:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E69AC385C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 116FE12FC
	for <soc@kernel.org>; Tue, 10 May 2022 13:07:03 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C015B3F5A1
	for <soc@kernel.org>; Tue, 10 May 2022 13:07:02 -0700 (PDT)
Date: Tue, 10 May 2022 21:06:52 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, carsten.haitzler@arm.com,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Message-ID: <YnrF3Nc7NbcX6v3b@e110455-lin.cambridge.arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus>
 <YnpgsZAfUAN3apQO@e110455-lin.cambridge.arm.com>
 <YnpjKMQnbCr8pD/j@sirena.org.uk>
 <02ce0958-7e19-3315-a39f-548cf41e1f0b@foss.arm.com>
 <YnqQeEsKzSu4Opcc@e110455-lin.cambridge.arm.com>
 <YnqTTy7P5IEC6no/@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnqTTy7P5IEC6no/@sirena.org.uk>

On Tue, May 10, 2022 at 05:31:11PM +0100, Mark Brown wrote:
> On Tue, May 10, 2022 at 05:19:04PM +0100, Liviu Dudau wrote:
> > On Tue, May 10, 2022 at 03:05:21PM +0100, Carsten Haitzler wrote:
> 
> > > is it the:
> 
> > > [    7.471809] tda9950 0-0034: driver requires an interrupt
> 
> > > that you're talking about Liviu?
> 
> > Yes, that is the warning.
> 
> That doesn't look too worrying TBH, if it's causing confusion we should
> just either fix the tda998x driver to not instantiate the tda9950 unless
> it has an interrupt or lower the severity of the log message in the
> tda9950 code.  It's certanly not something that should block use in a
> defconfig.
> 
> Ideally we'd not be using the wildcard compatible in the tda998x and
> would know if the CEC functionality was there but I think that ship has
> disappeared over the horizon at this point, and in any case someone
> might just not want to support CEC for some reason.

The quickest way is to harmonise the treatment of IRQs between tda998x and tda9950.
The former treats the IRQ as optional, the later as mandatory. Given that (according
to comments in the code) TDA998X is actually a TDA9989+TDA9950, it makes sense to
treat the lack of IRQ the same way (make it optional, IMHO).

I agree that that should not block adding the two config options to the defconfig.
It's just that using Juno as an argument for doing so when tda9950 returns ENXIO on
that platform can confuse people.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

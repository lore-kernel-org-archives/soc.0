Return-Path: <SRS0=KaRM=GZ=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF347C433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 16:35:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7328C23A9A; Fri, 22 Jan 2021 16:35:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B40E239EE;
	Fri, 22 Jan 2021 16:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B40E239EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5E39340013;
	Fri, 22 Jan 2021 16:35:20 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:35:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
Message-ID: <20210122163520.GG1196852@piout.net>
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>

On 22/01/2021 16:25:47+0100, Arnd Bergmann wrote:
> On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
> >
> > From: Nicolas Ferre <nicolas.ferre@microchip.com>
> >
> > Arnd, Olof,
> >
> > I'm taking back the lead on sending the pull-requests for AT91 and hope that I
> > didn't loose the knowledge in the meantime. Tell me if there's something I'm
> > missing. Thanks a lot to Alexandre who kept our flow steady and very
> > predictable during all those years!
> >
> > Here are the first SoC changes for 5.12 which contain a single patch for multi
> > platform kernels.
> >
> > I plan to send another pull-request for the SoC changes related to new sama7g5
> > that Claudiu sent to the mainling-list recently. I'll let it mature in
> > linux-next by the beginning of next week and will send another pull-request by
> > mid-next-week.
> > Tell me if you see a problem with this approach.
> 
> This all looks good to me, but I think I'd rather take the 'soc' pull request
> into the v5.11 bugfixes, as this may already affect users on other machines.
> 
> I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
> I can just cherry-pick that patch into the fixes branch and add it there.
> 

I wouldn't backport it as a fix, this is just a warning, in a
configuration that is very unlikely to be used (and honestly, I
wouldn't enable this driver on any platform).

If you take it as a fix, you'll have to also get
https://lore.kernel.org/linux-arm-kernel/1611318097-8970-5-git-send-email-claudiu.beznea@microchip.com/


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

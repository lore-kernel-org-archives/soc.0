Return-Path: <SRS0=0QUU=FI=alpha.franken.de=tsbogend@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6103C4361A
	for <soc@archiver.kernel.org>; Fri,  4 Dec 2020 12:10:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9883A22A84; Fri,  4 Dec 2020 12:10:34 +0000 (UTC)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by mail.kernel.org (Postfix) with ESMTP id 8AE20225A9;
	Fri,  4 Dec 2020 12:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE20225A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tsbogend@alpha.franken.de
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1kl9ud-0005Nb-00; Fri, 04 Dec 2020 13:10:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 596D6C02CF; Fri,  4 Dec 2020 13:06:32 +0100 (CET)
Date: Fri, 4 Dec 2020 13:06:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
List-Id: <soc.lore.kernel.org>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
	tony@atomide.com, mripard@kernel.org, wens@csie.org,
	jernej.skrabec@siol.net, thierry.reding@gmail.com,
	jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
	James.Bottomley@HansenPartnership.com, deller@gmx.de,
	mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
	lee.jones@linaro.org, sam@ravnborg.org, emil.l.velikov@gmail.com,
	daniel.thompson@linaro.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, soc@kernel.org
Subject: Re: [PATCH v2 3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC
 option
Message-ID: <20201204120632.GA10011@alpha.franken.de>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <20201201222922.3183-4-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201222922.3183-4-andrey.zhizhikin@leica-geosystems.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Dec 01, 2020 at 10:29:20PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from all MIPS configurations.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  arch/mips/configs/gcw0_defconfig      | 1 -
>  arch/mips/configs/gpr_defconfig       | 1 -
>  arch/mips/configs/lemote2f_defconfig  | 1 -
>  arch/mips/configs/loongson3_defconfig | 1 -
>  arch/mips/configs/mtx1_defconfig      | 1 -
>  arch/mips/configs/rs90_defconfig      | 1 -
>  6 files changed, 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

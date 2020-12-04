Return-Path: <SRS0=P42T=FI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146E4C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Dec 2020 12:12:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80024225A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Dec 2020 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80024225A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mk1PPTbTzXklbWpRAtx/Cm9cDGgGJzhmYLoB+5Bqv0k=; b=yoNWRJY3tTF6ZOg4AS2g4hqkf
	BXhOi3vlgceYA49dZKzsRUblh/gPxVbIeqkX/Hpc3rlolMKwC5+qaM6Wf4J1gJvKsUDjpBlUc+/ce
	iTYbsSrXIS5rNrc7vzWvTkUuMqvMrlsUvbQiVpoGY3vwTPNu5eJysgnepkPAxsQO0LlhZ4/K/IqsT
	MRO03cJt3wlHqMkp42lk0yJy2Uw+IOoxghLd3PE/RPIdaguFOXAxN910VCeUoNr9whQ0deaMqguFt
	3Ug8yrpwi3wOMuRpLMfgRvoQgLqbqma5HARDDL0CyybGTWtzowOYtTMq/mm3miwkNsInkybr97YHR
	bIWsptLVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl9uz-0003qY-H4; Fri, 04 Dec 2020 12:10:33 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl9ux-0003pq-KE
 for linux-arm-kernel@lists.infradead.org; Fri, 04 Dec 2020 12:10:32 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kl9ud-0005Nb-00; Fri, 04 Dec 2020 13:10:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 596D6C02CF; Fri,  4 Dec 2020 13:06:32 +0100 (CET)
Date: Fri, 4 Dec 2020 13:06:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH v2 3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201204120632.GA10011@alpha.franken.de>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <20201201222922.3183-4-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201222922.3183-4-andrey.zhizhikin@leica-geosystems.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_071031_793183_AC769217 
X-CRM114-Status: GOOD (  12.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: alexandre.belloni@bootlin.com, tony@atomide.com, benh@kernel.crashing.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 thierry.reding@gmail.com, paulus@samba.org, sam@ravnborg.org,
 daniel.thompson@linaro.org, linux-omap@vger.kernel.org, mpe@ellerman.id.au,
 deller@gmx.de, linux@armlinux.org.uk, krzk@kernel.org, jonathanh@nvidia.com,
 ludovic.desroches@microchip.com, catalin.marinas@arm.com,
 linux-mips@vger.kernel.org, will@kernel.org, mripard@kernel.org,
 soc@kernel.org, linux-tegra@vger.kernel.org, lee.jones@linaro.org,
 wens@csie.org, linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-parisc@vger.kernel.org, emil.l.velikov@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201204120632.eGRkbn4aRsU1Cn3IQKOBzWGwqPIE9TrqT1TpJ-lVIGc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

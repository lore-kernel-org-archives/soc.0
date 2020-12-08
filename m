Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261F3C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 17:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDBA823B01
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 17:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDBA823B01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DF+dI3/6uT7lhxyJNgqhUgmZgzZo4hRE+7qaeuK2JSI=; b=TM1PzPtVzQqcj1FhTM8vofwWT
	76+5RKLCSG4gfENVdCtHxdS1InCXteoIaxmRD9q8vNi+adN+oCDBlHnZIrO2WhgmY1HxRNPKmZuCN
	su8TNslt6nOEP7x2cbHJ4kdhrZqw1BcABUbjjT+Z009JJno1PhuxWtbIKPR/mu5ZO6u0R7woVSkHV
	WcRtMbhxETTh5vc2RaewVS97/ykrniJybXynPhP/DYS2P2N8pqPQrEldM5Wn6mDE3AV8gNS1gjBbC
	E9j3ABnJLZ/SqlFtAEJK4hnUR2ua4yzTgT1oZHHBu4A9PJVPl+tYPGxVZg7NPcP8OEdiWI2jHs9tD
	eLPQbRLzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmgMA-0001aZ-0N; Tue, 08 Dec 2020 17:00:54 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmgM1-0001Ww-RB
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 17:00:51 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kmgLm-0006Gx-00; Tue, 08 Dec 2020 18:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 909BFC0331; Tue,  8 Dec 2020 18:00:21 +0100 (CET)
Date: Tue, 8 Dec 2020 18:00:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201208170021.GA6168@alpha.franken.de>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_120046_247354_6DC670A0 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: alexandre.belloni@bootlin.com, sam@ravnborg.org, tony@atomide.com,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, wens@csie.org, thierry.reding@gmail.com,
 paulus@samba.org, will@kernel.org, daniel.thompson@linaro.org,
 mpe@ellerman.id.au, deller@gmx.de, linux@armlinux.org.uk, krzk@kernel.org,
 jonathanh@nvidia.com, ludovic.desroches@microchip.com, catalin.marinas@arm.com,
 linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, soc@kernel.org,
 linux-tegra@vger.kernel.org, lee.jones@linaro.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-parisc@vger.kernel.org, emil.l.velikov@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208170021.1QTn9Szl6YYDB4iVDFzVQbO_1gfJ95wbggi9yGkyu90@z>

On Tue, Dec 08, 2020 at 05:34:46PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Tue, 1 Dec 2020 22:29:17 +0000, Andrey Zhizhikin wrote:
> > Since the removal of generic_bl driver from the source tree in commit
> > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > therefore subject to clean-up from all configuration files.
> > 
> > This series introduces patches to address this removal, separated by
> > architectures in the kernel tree.
> > 
> > [...]
> 
> While my plan was to only take the arm specific patches, it seems
> nobody else has applied the other architecture specific ones,
> but there have been a lot of Acks. Also, b4 makes it easy to
> merge the entire branch, so I'll just take all of these.
> 
> Applied to arm/defconfig, thanks!
> 
> [1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 0437141b4e2233ae0109a9584e7a003cd05b0a20
> [2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>       commit: 717c4c8336486781630893508b3347ae18953fae
> [3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 2257682282531de45929c6006152f6e2ee881b42

this one is already in mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

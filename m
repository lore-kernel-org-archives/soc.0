Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E05FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 14:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB4261166
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 14:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFB4261166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsKvvXK51gWUnJF3yfi0DODeErJ/pjAXBxmg2nDL7GU=; b=OFMhScrqunILyQ
	ceipbdYX0ZC6quVqf7oxy4dQilz2vPyjVSCzGwsqY3/EFXMRAmXf8n04XGVZJ0YEEwmmCr5Bj9+MR
	m/fw+17/iBiUedxsYIsIWPqj02w+1eLyXasuIzwu/JM9TsIAT4/5QkM9EOuF15uQslMqm0Yto89zf
	bMBzPgD4IqxNaNHWW3brqVd8nJsh06f3HMvvMQ0MvK0R3xmT357pHorYSp5NyJfJgVT7EeQWnhKmZ
	BCpX1k9Dcx/c4EBYsmtZ8Jhfzsr8+GYiwaQwAp2e5afVIbYYHliQC085By3cq1HF5kfSIYLaLnNWt
	o5q3xQa5QcxnEckYv2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafU7-00HD7i-1g; Wed, 13 Oct 2021 14:43:59 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafTv-00HD5E-Ku
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 14:43:49 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 70C2D1BF205;
 Wed, 13 Oct 2021 14:43:44 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcel Ziswiler <marcel@ziswiler.com>,
 Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, Olof
 Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, soc@kernel.org
Subject: Re: [PATCH v3 0/3] ARM: prepare and add netgear gs110emx support
In-Reply-To: <20211007205659.702842-1-marcel@ziswiler.com>
References: <20211007205659.702842-1-marcel@ziswiler.com>
Date: Wed, 13 Oct 2021 16:43:38 +0200
Message-ID: <87ily1dlyd.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_074347_860668_195FA42F 
X-CRM114-Status: GOOD (  13.44  )
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
Message-ID: <20211013144338.6scATs67S7EAOBZV8PWwGAy98FJlPGTLvnXy_9V8JdY@z>

Hello Marcel Ziswiler,

> Cleanup mvebu_v7_defconfig and then add support for the Netgear
> GS110EMX which is an 8 port Gigabit switch with two additional
> Multi-Gig ports. An 88E6390X switch sits at its core connecting to two
> 88X3310P 10G PHYs while the control plane is handled by an 88F6811
> Armada 381 SoC.
>
> Changes in v3:
> - Got rid of unused 3.3 volt regulator as suggested by Andrew.
> - Got rid of partitioning comment.
> - Added switch interrupt GPIO configuration.
>
> Changes in v2:
> - Add Andrew's reviewed-by tag.
> - Add Andrew's reviewed-by tag.
> - Send previous first patch separately to netdev mailing list as
>   suggested by Andrew.
> - Fix numbering of the PHY labels as suggested by Andrew.
>
> Marcel Ziswiler (3):
>   ARM: mvebu_v7_defconfig: enable mtd physmap
>   ARM: mvebu_v7_defconfig: rebuild default configuration

Both applied on mvebu/defconfig

>   ARM: dts: mvebu: add device tree for netgear gs110emx switch

Applied on mvebu/dt

Thanks,

Gregory

>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/armada-381-netgear-gs110emx.dts  | 295 ++++++++++++++++++
>  arch/arm/configs/mvebu_v7_defconfig           |  18 +-
>  3 files changed, 304 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts
>
> -- 
> 2.26.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

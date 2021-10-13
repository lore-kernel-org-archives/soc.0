Return-Path: <SRS0=rXV9=PB=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0F9C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 14:43:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2009061181; Wed, 13 Oct 2021 14:43:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DD161175;
	Wed, 13 Oct 2021 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25DD161175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
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
Content-Type: text/plain

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

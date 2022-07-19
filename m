Return-Path: <SRS0=UQO0=XY=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6BAC433EF
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 13:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D11EBC341CB; Tue, 19 Jul 2022 13:25:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 577F4C341C6;
	Tue, 19 Jul 2022 13:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 577F4C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A3C4120009;
	Tue, 19 Jul 2022 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658237132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bj7TuN+pRazcYiQ/4sjLM9j7HaDTTLEJm56eNhZ2vs=;
	b=OPuo9yLflkq3hm3gHA/70JbIIP271rS0uzZh7d+csjjRgNkLYLHJIuee9mGUZHY15H/+Rx
	Z0BplQKRagezJmoHivm5UrKuRKDxhAmzATqGvym2WajaTM8hvMm5DmMXr6eiVQb2JeFG+H
	uNIjJ/NFBOqe+NFySa02bovSBgi4bEg2oa1GEtRImolCMHgOeMBwNFKxrqdfDlO6865wgi
	Fi6uAfYrR+rGVt/v/H0FyzyabhN2a8anT7yuFCdlJck19srygFWA1H7dJu26rZXzetxBKi
	tSW6qSk8idZDmN2DgPu8AYdCEm5H/AJTzi4mTpgWcaFE0HptCkSZu12pfyQrEQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Vadym Kochan
 <vadym.kochan@plvision.eu>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.20 (#1)
In-Reply-To: <87o7xlqn6x.fsf@BL-laptop>
References: <87o7xlqn6x.fsf@BL-laptop>
Date: Tue, 19 Jul 2022 15:25:27 +0200
Message-ID: <87fsixqlo8.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

> Hi,
>
> Here is the first pull request for dt64 for mvebu for v5.20.
>
> Sorry to be late, actually I've just realized this week we were already
> at -rc7.
>
> Gregory
>
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
>
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-5.20-1
>
> for you to fetch changes up to df9c42a99a89f3e8c613ec669fa9a10637c96231:
>
>   arm64: marvell: enable the 98DX2530 pinctrl driver (2022-07-18 12:47:18 +0200)
>
> ----------------------------------------------------------------
> mvebu dt64 for 5.20 (part 1)
>
> Add support for Marvell 98DX2530 (and variants)
>
> ----------------------------------------------------------------
> Chris Packham (3):
>       dt-bindings: marvell: Document the AC5/AC5X compatibles
>       arm64: dts: marvell: Add Armada 98DX2530 SoC and RD-AC5X board

As seen with Arnd on IRC, I fixed the cpu node for this patch by using
the specific cpu type: cortex-a55 instead of the generic one amrv8.

So I am replacing this tag by an updated one, and a new pull request is
coming soon.

Gregory

>       arm64: marvell: enable the 98DX2530 pinctrl driver
>
>  .../bindings/arm/marvell/marvell,ac5.yaml          |  32 +++
>  arch/arm64/Kconfig.platforms                       |   2 +
>  arch/arm64/boot/dts/marvell/Makefile               |   1 +
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      | 291 +++++++++++++++++++++
>  arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts    | 101 +++++++
>  arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi      |  17 ++
>  6 files changed, 444 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,ac5.yaml
>  create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
>  create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts
>  create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi
>
> -- 
> Gregory Clement, Bootlin
> Embedded Linux and Kernel engineering
> http://bootlin.com
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

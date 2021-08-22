Return-Path: <SRS0=RQuT=NN=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D325C4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 10:17:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB6076127B; Sun, 22 Aug 2021 10:17:14 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E3D611EF;
	Sun, 22 Aug 2021 10:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46E3D611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mHkXR-0003qA-1O; Sun, 22 Aug 2021 12:17:13 +0200
From: heiko@sntech.de
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.14
Date: Sun, 22 Aug 2021 12:17:12 +0200
Message-ID: <5500960.5fSG56mABF@phil>
In-Reply-To: <5824467.iIbC2pHGDl@phil>
References: <5824467.iIbC2pHGDl@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Sorry, wrong subject
new mail coming up for clarity.

Heiko

Am Sonntag, 22. August 2021, 12:16:12 CEST schrieb Heiko Stuebner:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts32-1
> 
> for you to fetch changes up to 9d508827c7939242e8ed6b06f66aa87d9f7ea832:
> 
>   ARM: dts: rockchip: Add SFC to RV1108 (2021-08-18 23:48:35 +0200)
> 
> ----------------------------------------------------------------
> io-domains for rk3188 and rv1108, sfc (flash) support fpr rv1108
> and some cleanups.
> 
> ----------------------------------------------------------------
> Chris Morgan (1):
>       ARM: dts: rockchip: Add SFC to RV1108
> 
> Johan Jonker (6):
>       ARM: dts: rockchip: rename pcfg_* nodenames for rk3066/rk3188
>       ARM: dts: rockchip: add space after &grf on rk3188
>       ARM: dts: rockchip: rename timer compatible strings for rk3066a
>       ARM: dts: rockchip: remove interrupt-names from iommu nodes
>       ARM: dts: rockchip: add io-domains node to rk3188.dtsi
>       ARM: dts: rockchip: add io-domains nodes to rv1108.dtsi
> 
>  arch/arm/boot/dts/rk3066a.dtsi | 10 ++++-----
>  arch/arm/boot/dts/rk3188.dtsi  | 13 +++++++----
>  arch/arm/boot/dts/rk3288.dtsi  |  6 ------
>  arch/arm/boot/dts/rv1108.dtsi  | 49 +++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 62 insertions(+), 16 deletions(-)
> 





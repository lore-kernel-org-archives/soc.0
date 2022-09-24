Return-Path: <SRS0=Tvk5=Z3=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAACCC32771
	for <soc@archiver.kernel.org>; Sat, 24 Sep 2022 19:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77836C43470; Sat, 24 Sep 2022 19:00:55 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E739C433C1;
	Sat, 24 Sep 2022 19:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E739C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p57b775e6.dip0.t-ipconnect.de ([87.183.117.230] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ocAO3-0001iI-11; Sat, 24 Sep 2022 21:00:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.1 #2
Date: Sat, 24 Sep 2022 21:00:24 +0200
Message-ID: <3790767.LM0AJKV5NW@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

I was somehow expecting more driver-stuff so while this
could've also lived in the dts branch, I put it in the driver
one, hence the separate pull.


Heiko


The following changes since commit 6541b424ce1dda616d3946e839f015c984df7a99:

  soc: rockchip: power-domain: add power domain support for rk3588 (2022-09-09 19:06:41 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-drivers2

for you to fetch changes up to adc4f190260a6c004f950992d8c9ee3aec8da38b:

  dt-bindings: soc: rockchip: grf: add rockchip,rk3128-grf (2022-09-14 10:50:12 +0200)

----------------------------------------------------------------
Some binding additions for rk3128 and rv1126

----------------------------------------------------------------
Jagan Teki (2):
      dt-bindings: soc: rockchip: Document RV1126 grf
      dt-bindings: soc: rockchip: Document RV1126 pmugrf

Johan Jonker (2):
      dt-bindings: arm: rockchip: pmu: add rockchip,rk3128-pmu
      dt-bindings: soc: rockchip: grf: add rockchip,rk3128-grf

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 4 ++++
 2 files changed, 6 insertions(+)




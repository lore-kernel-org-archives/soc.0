Return-Path: <SRS0=RsFN=LQ=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C69C2B9F4
	for <soc@archiver.kernel.org>; Tue, 22 Jun 2021 13:25:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 966CD6115A; Tue, 22 Jun 2021 13:25:54 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938D46102A;
	Tue, 22 Jun 2021 13:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 938D46102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1lvgPY-0003up-9M; Tue, 22 Jun 2021 15:25:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.14 - #2
Date: Tue, 22 Jun 2021 15:25:51 +0200
Message-ID: <4876354.ZzFAyJQhcr@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

another late (and now final addition) hopefully for 5.14.
Basic support for the new rk3568 SoC released some weeks ago.

The core dtsi and evb support is isolated from the rest of course,
so hasn't really the capacity to break anything else and the yaml
dtbscheck was happy with the addition as well.

So if it's still suitable, please pull.

Thanks
Heiko


The following changes since commit eb607cd4957fb0ef97beb2a8293478be6a54240a:

  arm64: dts: rockchip: Re-add regulator-always-on for vcc_sdio for rk3399-roc-pc (2021-06-19 23:55:10 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts64-2

for you to fetch changes up to 01610a24cefa182b155a17e38cd0b84f8a3f0529:

  arm64: dts: rockchip: add basic dts for RK3568 EVB (2021-06-22 12:21:55 +0200)

----------------------------------------------------------------
Basic support for the new rk3568 soc.

----------------------------------------------------------------
Liang Chen (3):
      arm64: dts: rockchip: add generic pinconfig settings used by most Rockchip socs
      arm64: dts: rockchip: add core dtsi for RK3568 SoC
      arm64: dts: rockchip: add basic dts for RK3568 EVB

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |   79 +
 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi   | 3111 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |  593 ++++
 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi |  344 +++
 6 files changed, 4133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi




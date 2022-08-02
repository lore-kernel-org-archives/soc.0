Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF1C19F28
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4675FC433D7; Tue,  2 Aug 2022 14:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC6CC43140;
	Tue,  2 Aug 2022 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448924;
	bh=ftaDza9JOwFBXgyzsweemBRCFuC1pJDgWy5ByxgdCyA=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=hhZzX/5OxsTr0Nzr1FGG8IdXvHpfWaNikd67mRAzY2jXkLfZDhamhLaww69jeu4Vx
	 QkS1phIdfo7C0PZThOpMcvTtF4YStIFDQOB9sd+x/T5SbHLG523m8elrF3kwN1zcr8
	 aL3+Gx7UumIGfHC+/VPU4WbC/CD/3bZ2DY9G2dS0go3ykQVTelK7Y1QJ/EDsRCbsaP
	 B+zabJPwCJp+aLMu8GqJqzUOAZ1DQ2ovTzMZeP8ubZ3Kr/ghH1RQkpr8R2tUvhrRnW
	 5aupr7iUN9tC/6uTup1puU4Ti9diBxmz36zA4SrM+nhC6CTPG73r2mm9bZmgt6y8Gc
	 CrDtM6ubbTwdg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 0/6] SoC branches for 6.0, second try
Date: Tue,  2 Aug 2022 16:01:54 +0200
Message-Id: <20220802140200.3987874-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I screwed up the pull requests when I sent them out before being away
for a few days. These are the exact same contents, but I double-checked
everything and used a little more scripting to generate these instead
of sending the emails manually. I hope this works better.

This is another large merge window for us, with over 1000 patches from
177 contributors. I'm sending these early since I'll be out of office
for the next few days.

The main highlights are the addition of two new SoC platforms (Nuvoton
NPCM8XX and Sunplus SP7021), marking 80% of the remaining pre-DT board
files as unused for later removal, and a ton of new hardware support in
particular for Qualcomm and Broadcom SoC platforms.

The main contributors by number of patches this time are:
    208 Krzysztof Kozlowski
     46 William Zhang
     42 Dmitry Baryshkov
     36 AngeloGioacchino Del Regno
     26 Arnd Bergmann
     22 Johan Hovold
     21 Nícolas F. R. A. Prado
     19 Marcel Ziswiler
     19 Konrad Dybcio
     18 Geert Uytterhoeven
     17 Bjorn Andersson
     16 Marek Vasut
     15 Tomer Maimon
     15 Max Krummenacher
     14 Abel Vesa
     13 Samuel Holland
     13 Rohit Agarwal
     12 Cristian Marussi
     11 Douglas Anderson
     11 Christian Marangi
     11 Chanho Park
     10 Michael Walle
     10 Fabio Estevam

Included branches:

[GIT PULL 1/6] ARM: SoC updates for 6.0
[GIT PULL 2/6] ARM: SoC drivers for 6.0
[GIT PULL 3/6] ARM: DT changes for 6.0
[GIT PULL 4/6] ARM: SoC defconfig updates for 6.0
[GIT PULL 5/6] ARM: new SoC support for 6.0
[GIT PULL 6/6] ARM: boardfile deprecation for 6.0

Dirstat:
   2.9% Documentation/devicetree/bindings/arm/
   3.2% Documentation/devicetree/bindings/
  18.9% arch/arm/boot/dts/
   1.0% arch/arm/configs/
   6.5% arch/arm/mach-davinci/
   1.7% arch/arm/
   1.7% arch/arm64/boot/dts/allwinner/
   1.3% arch/arm64/boot/dts/broadcom/bcmbca/
   3.1% arch/arm64/boot/dts/exynos/
  11.1% arch/arm64/boot/dts/freescale/
   4.2% arch/arm64/boot/dts/mediatek/
   1.2% arch/arm64/boot/dts/nvidia/
  20.1% arch/arm64/boot/dts/qcom/
   1.5% arch/arm64/boot/dts/renesas/
   1.2% arch/arm64/boot/dts/rockchip/
   3.7% arch/arm64/boot/dts/
   3.4% drivers/firmware/arm_scmi/
   5.6% drivers/soc/mediatek/
   1.1% drivers/soc/qcom/
   2.8% drivers/
   1.2% include/dt-bindings/clock/
   1.0% include/
 1297 files changed, 45609 insertions(+), 12448 deletions(-)


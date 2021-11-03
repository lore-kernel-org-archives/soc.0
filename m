Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AC8C433EF
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 22:49:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BCC2A610EA; Wed,  3 Nov 2021 22:49:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A66EE6052B
	for <soc@kernel.org>; Wed,  3 Nov 2021 22:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635979793;
	bh=Momhe6y4DCF2zH53AZW1s5/0XBR+I9mO2K5ELhpoWnY=;
	h=From:Date:Subject:List-Id:To:From;
	b=DPfj6F1lNnjl53vyHwZnRUhMeG4Dwmw+ViLZ5mQ4eWapJSF8WvxdXi7jy+6cK6V+N
	 LENrO0sdvws3zZYH3aYq5xZUyQ0EtQmU8GxqQH44LPk3DAQFGhCKuYFodtouLtYds/
	 1wcTVlUQglbgg5jOo1zX+C7BesTq3ZlHqpp4YtWXaC/YuISSo9nwWWW644VGa9HLEc
	 7tUZBABOFd9TAKC+lrGd9KfYVqO06n4gf9XdJtKGBIVNQG9nng1WUzFDGCzX9anu6G
	 PKe0VCzxcizeWT75APuEQ88DBZw4+udebdo+9/rzdkjXxuE2onyTF6VJ2dmkQQ62UN
	 tGnERfLUObRnA==
Received: by mail-wr1-f52.google.com with SMTP id d5so5844556wrc.1
        for <soc@kernel.org>; Wed, 03 Nov 2021 15:49:53 -0700 (PDT)
X-Gm-Message-State: AOAM533rYlmMLyDcYFckKIEqLPDgMJ0NyjcAtlohNNTAPhzEp8+CEvR9
	63ltsCKYPSbdcBV+tqQZ7HCBFYgZSm9KSUg8Hug=
X-Google-Smtp-Source: ABdhPJxbbLmIy7/33QDWr2NtoqgJUJ8KHKeu6h1cIyWXjLvx3dn9LhJHi4Eb5crYolh+PVusAoHExJXDt6ZJIHtn1Nw=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr36190349wrp.428.1635979792167;
 Wed, 03 Nov 2021 15:49:52 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Nov 2021 23:49:35 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
Message-ID: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
Subject: [GIT PULL 0/4] ARM SoC updates for 5.16
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is a rather large update, both for devicetree files and drivers,
with close to 1000
non-merge commits and 100 branches pulled into the soc tree, which
feels like more
than we've had in a single release for several years.

There is not much that stands out in particular, except maybe a
particularly large
chunk of new hardware support for Qualcomm Snapdragon platforms.
In fact, some of the usually active platforms (sunxi, imx) seem to have fewer
changes than normal.

         Arnd

Dirstat
   0.8% Documentation/devicetree/bindings/arm/
   0.3% Documentation/devicetree/bindings/memory-controllers/ddr/
   1.0% Documentation/devicetree/bindings/memory-controllers/
   0.8% Documentation/devicetree/bindings/mtd/
   0.2% Documentation/devicetree/bindings/soc/imx/
   0.6% Documentation/devicetree/bindings/soc/qcom/
   0.6% Documentation/devicetree/bindings/
  12.2% arch/arm/boot/dts/
   1.5% arch/arm/mach-ep93xx/
  14.6% arch/arm/mach-omap2/
   0.8% arch/arm/
   1.2% arch/arm64/boot/dts/amlogic/
   0.3% arch/arm64/boot/dts/apple/
   2.1% arch/arm64/boot/dts/exynos/
   2.0% arch/arm64/boot/dts/freescale/
   0.4% arch/arm64/boot/dts/marvell/
   1.0% arch/arm64/boot/dts/mediatek/
   6.5% arch/arm64/boot/dts/nvidia/
  18.9% arch/arm64/boot/dts/qcom/
   6.1% arch/arm64/boot/dts/renesas/
   5.5% arch/arm64/boot/dts/rockchip/
   2.3% arch/arm64/boot/dts/ti/
   0.2% arch/arm64/boot/dts/toshiba/
   4.2% arch/arm64/boot/dts/xilinx/
   0.3% arch/arm64/boot/dts/
   0.3% drivers/bus/
   0.4% drivers/cpuidle/
   0.3% drivers/memory/tegra/
   1.4% drivers/memory/
   0.8% drivers/soc/aspeed/
   0.9% drivers/soc/imx/
   0.3% drivers/soc/mediatek/
   2.0% drivers/soc/qcom/
   0.5% drivers/soc/
   6.0% drivers/tee/optee/
   0.4% drivers/
   0.3% include/
894 files changed, 58070 insertions(+), 16923 deletions(-)

Most active contributors out of 222 individuals:
     33 Michal Simek
     30 Geert Uytterhoeven
     26 Stephan Gerhold
     26 Konrad Dybcio
     25 Dmitry Baryshkov
     23 AngeloGioacchino Del Regno
     21 Tony Lindgren
     21 Dmitry Osipenko
     21 Biju Das
     19 Krzysztof Kozlowski
     18 Lucas Stach
     17 Li Yang
     17 David Heidelberg
     16 Shawn Guo
     16 Maxime Ripard
     16 Matthew Hagan
     16 Cai Huoqing
     15 Sibi Sankar
     14 Luca Weiss
     13 Yong Wu
     13 Peter Geis
     13 Johan Jonker
     13 Joel Stanley
     13 Bjorn Andersson
     13 Arnd Bergmann
     13 Andreas Kemnade
     11 Fabio Estevam
     10 Marcel Ziswiler
     10 Eddie James

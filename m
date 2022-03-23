Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ADAC433EF
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 23:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C51F7C340F8; Wed, 23 Mar 2022 23:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF45FC340E9;
	Wed, 23 Mar 2022 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648076735;
	bh=gadBB+ZTX41+/2HJ8SRzZ92p6WHZEG7kbvG59ml1GVQ=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=M+YLkfMxT+yysOcbBemB0EqGpd9yPNMlFV3jhuxlkla6ONArWaMG04XKtv5H+/pTb
	 A4ehFigt/n8f+j8KoR5EFH1EDxCKqZ4SmVxpqLpi+EC+q+m9I33YNxOu2y/kfzz1yp
	 szbBrWVOP7YjYV8budwGlpp4IChiX4LdsSqSOy4+2XNSH+6ad6+NZh4yr15DNVFaW4
	 SAIEB89iaoSW8jPQFifxqwNbAkty2L83u8rCcaO65iZBPBmeKZN2MznnOMhManMtgV
	 tAp3tGPG97IV6MZ73qzi/w6Xg021/lcoMdZWUen+sr1LKr2IUBuuEpMBhe1XEZEJxI
	 ucm1yR+9Ue9cA==
Received: by mail-wr1-f47.google.com with SMTP id t11so4223151wrm.5;
        Wed, 23 Mar 2022 16:05:35 -0700 (PDT)
X-Gm-Message-State: AOAM533J20/u6/HYPaRl181Xlx44IMgwpgNrYx7F9oQvsD7RjcyoHgQa
	Z+RgO7ul1p8gN81I8z6+bIVc4hEPZ8GcZ+JW9PQ=
X-Google-Smtp-Source: ABdhPJwEbhZ6arZni6zydQiKO3K1M7y01B9XCDosTwQaVL/lR8QgHHKSaPa8taLwVhaytrGesNn2OnJ6/dxipND1zio=
X-Received: by 2002:adf:f04b:0:b0:203:f0bf:1d83 with SMTP id
 t11-20020adff04b000000b00203f0bf1d83mr1910051wro.317.1648076733823; Wed, 23
 Mar 2022 16:05:33 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Mar 2022 00:05:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
Message-ID: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
Subject: [GIT PULL 0/4] ARM: SoC tree changes for 5.18
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"

These are the usual four branches for 5.18, no late branch or other
changes are pending this time. The contents are fairly typical, but
there are nine new SoCs that are now supported in DT files, plus
another one that only made it in partially.

The code changes in arch/arm/ are mainly cleanups, removing old
board files and broken support for MMU-less kernels on systems
that have an MMU.

The top contributors this time are:

     95 Krzysztof Kozlowski
     23 Cristian Marussi
     21 David Heidelberg
     19 Linus Walleij
     18 Biju Das
     17 Luca Weiss
     17 Bjorn Andersson
     16 Erwan Le Ray
     16 Alim Akhtar
     15 Douglas Anderson
     14 Daniel Palmer
     13 Claudiu Beznea
     12 Marcel Ziswiler
     12 Christian Hewitt
     11 Michael Riesch
     11 Lucas Stach
     10 Potin Lai
     10 Jens Wiklander
     10 Geert Uytterhoeven

Dirstat:

   0.5% Documentation/devicetree/bindings/arm/
   0.4% Documentation/devicetree/bindings/clock/
   1.2% Documentation/devicetree/bindings/memory-controllers/ddr/
   0.3% Documentation/devicetree/bindings/memory-controllers/fsl/
   2.0% Documentation/devicetree/bindings/pinctrl/
   0.2% Documentation/devicetree/bindings/soc/imx/
   0.4% Documentation/devicetree/bindings/
  21.0% arch/arm/boot/dts/
   0.2% arch/arm/configs/
   1.8% arch/arm/mach-ixp4xx/include/mach/
   2.7% arch/arm/mach-ixp4xx/
   1.5% arch/arm/mach-pxa/
   1.0% arch/arm/
   1.5% arch/arm64/boot/dts/amlogic/
   0.2% arch/arm64/boot/dts/arm/
   0.2% arch/arm64/boot/dts/broadcom/
   6.0% arch/arm64/boot/dts/exynos/
   9.1% arch/arm64/boot/dts/freescale/
   0.7% arch/arm64/boot/dts/mediatek/
   4.5% arch/arm64/boot/dts/nvidia/
  12.9% arch/arm64/boot/dts/qcom/
   4.2% arch/arm64/boot/dts/renesas/
   2.5% arch/arm64/boot/dts/rockchip/
   1.8% arch/arm64/boot/dts/tesla/
   1.4% arch/arm64/boot/dts/ti/
   0.2% arch/arm64/boot/dts/
   0.2% drivers/bus/
   5.7% drivers/clk/samsung/
   3.0% drivers/firmware/arm_scmi/
   0.4% drivers/firmware/
   0.2% drivers/memory/tegra/
   0.2% drivers/net/
   0.2% drivers/pcmcia/
   2.6% drivers/soc/mediatek/
   0.3% drivers/soc/microchip/
   0.6% drivers/soc/qcom/
   0.5% drivers/soc/
   0.5% drivers/tee/optee/
   0.9% drivers/tee/
   0.6% drivers/
   1.2% include/dt-bindings/clock/
   0.3% include/dt-bindings/power/
   0.2% include/dt-bindings/
   0.4% include/linux/soc/mediatek/
   0.6% include/linux/

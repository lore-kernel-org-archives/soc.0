Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23474C432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 19:54:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F2BE1610A1; Wed,  1 Sep 2021 19:54:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC7666109E
	for <soc@kernel.org>; Wed,  1 Sep 2021 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630526089;
	bh=pH6akMMCftdaAdl/OZD0bcwyKaRWhox1RHbH2G0EZbs=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=D+Xh3jtE8WsuaxrzBbReytgowBls6DXR0hn6qJ4hv4wd9PIobITexodwwfugAJeGR
	 bM1qzUtukiEc5nA7Yu/dGKtYF5JP0Db1KBgdDcbRjO9mR/p5veszvLFIyTQjrznq++
	 /OPidiqHhRPYvulgMAQ7vY3vS1WStjcyEAu4QjVzHG1cX+8HQ27Gb7d+8PzqS3WYfe
	 VVvjGIEOlpymiaISn62XeKxNRqf1UTGb+7qx5/CwrYjq1oogZTGACYRrUkUOMud/uB
	 dS/TWvmlW3eAOX2gqBsMOPfYBbJ+VE98Oz3zlaWmMLsfJZdpmG2z623kyZ328K30qQ
	 onkvKQmg9gQTg==
Received: by mail-wr1-f43.google.com with SMTP id u9so1335039wrg.8
        for <soc@kernel.org>; Wed, 01 Sep 2021 12:54:49 -0700 (PDT)
X-Gm-Message-State: AOAM531xH11lSDhbEXyFAsws/WjyQ8s3CuUBR3qwnLq9OzGL1D4nC2Au
	Ak17ktN72PhkUKiSWIMgAfmOPj/1f6j7OCF8Ju8=
X-Google-Smtp-Source: ABdhPJwnnitnVbJ+nH9+HM07f9rYnl2x86i2JnjsTb9oPXz3oPngU0lYo94kP4dHEvxPm+1FPIcn3RZjXcc1xKgSLnM=
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr1183593wrf.361.1630526088549;
 Wed, 01 Sep 2021 12:54:48 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 1 Sep 2021 19:54:32 +0000
X-Gmail-Original-Message-ID: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
Message-ID: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
Subject: [GIT PULL 0/4] ARM SoC branches for 5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'm still on vacation, so here is a little shorter summary than
usual. We got a few new SoCs, all of which are related to
already supported ones, and some cleanup for 32-bit platforms.
Overall nothing exceptional this time, just as we like it for
what will likely become the LTS kernel.

There are four branches included this time, but I have another
"late" branch for a few things that got sent at the last minute.
Unless there are any problems, I plan to send those early next
week.

There are 740 patches in total, mostly from the usual suspects.
I pulled in 61 branches from 22 platform and subsystem maintainers.
The most patches came from:

     39 Linus Walleij
     32 Michal Simek
     31 Konrad Dybcio
     29 Geert Uytterhoeven
     26 Claudiu Beznea
     25 Dmitry Osipenko
     16 Grygorii Strashko
     16 Christoph Niedermaier
     14 AngeloGioacchino Del Regno
     13 Vinod Koul
     13 Suman Anna
     13 Alain Volmat
     12 Tao Ren
     12 Robin Gong
     12 Peter Geis
     12 Johan Jonker
     10 Michael Riesch
     10 Cristian Marussi

Dirstat:
   0.4% Documentation/devicetree/bindings/arm/
   0.4% Documentation/devicetree/bindings/bus/
   0.3% Documentation/devicetree/bindings/gpio/
   1.3% Documentation/devicetree/bindings/power/
   0.4% Documentation/devicetree/bindings/reset/
   0.4% Documentation/devicetree/bindings/soc/qcom/
   0.4% Documentation/devicetree/bindings/
  34.2% arch/arm/boot/dts/
   0.5% arch/arm/configs/
   1.7% arch/arm/mach-at91/
   0.9% arch/arm/mach-ep93xx/
   7.7% arch/arm/mach-ixp4xx/
   0.3% arch/arm/
   0.2% arch/arm64/boot/dts/amlogic/
   0.2% arch/arm64/boot/dts/exynos/
   5.7% arch/arm64/boot/dts/freescale/
   3.6% arch/arm64/boot/dts/marvell/
   1.3% arch/arm64/boot/dts/nvidia/
  14.1% arch/arm64/boot/dts/qcom/
   2.5% arch/arm64/boot/dts/renesas/
   6.8% arch/arm64/boot/dts/rockchip/
   0.4% arch/arm64/boot/dts/ti/
   4.7% arch/arm64/boot/dts/xilinx/
   0.7% drivers/ata/
   1.0% drivers/bus/
   0.2% drivers/dma/
   3.6% drivers/firmware/arm_scmi/
   0.2% drivers/firmware/
   0.3% drivers/memory/
   0.5% drivers/reset/
   0.7% drivers/soc/mediatek/
   0.4% drivers/soc/qcom/
   0.6% drivers/soc/
   0.6% drivers/watchdog/
   0.2% drivers/
   0.4% include/soc/at91/
   0.2% include/

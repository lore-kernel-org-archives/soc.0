Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF061C433ED
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 15:53:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97077610A2; Mon, 26 Apr 2021 15:53:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C4FD6105A
	for <soc@kernel.org>; Mon, 26 Apr 2021 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619452390;
	bh=3xvN2At+w6IE8T1lkLL48cZrJG39528+LI4ee95/cvI=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=HE/XQK8U1nsiwBSWbrMjkKddTNZyVkgJUzU3GAH9/C7iNGdCGKl4dEAFSY4QP0NJZ
	 5693KPcuCZhEMKyEArj2GtHw+C05uu/t64hBtiQ2jDx88h9E5f+jjtQqBIhdlXrkdo
	 PBiKSpsztunQgnM4xNyT/+rQkj0/HDM+v4nWDP70cRnYbgQX7QH7PQ/Y1wXLek9dNQ
	 wmOPsbdx3lkD5FfZLRYUZBnewisOQSKtjY3MlEsXp9azOcFzQBp/4fIp4RiyKVyW77
	 3RJdRG4cfnxqEz9XCzVtYJvHTXzVY6CxSHLJaP8Elo04nmP2ZsUCp+J94jaTqTB3a6
	 g1cCJwvjoC1Yg==
Received: by mail-wr1-f52.google.com with SMTP id q9so2250078wrs.6
        for <soc@kernel.org>; Mon, 26 Apr 2021 08:53:10 -0700 (PDT)
X-Gm-Message-State: AOAM532FVFwSW8WgPmBj14w8faMw6oQpxPZ6BjRuGB7TNYVLNLV/LJ+y
	IN6IaOljuyNhIImpesZdSwLKFN0dg9jC5NAXNL4=
X-Google-Smtp-Source: ABdhPJxwxYnxpReVhW98YZhCNqhQWeKcOAzDFQGh2f5hHxyuTG30Pi13wa1Li6TjTjip1BiTpGilTEhlLANdyEzTwDA=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr23840851wrj.99.1619452388953;
 Mon, 26 Apr 2021 08:53:08 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 17:52:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
Message-ID: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
Subject: [GIT PULL 0/6] ARM SoC branches for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here are six branches for the SoC tree for the 5.13 merge window.
There are a couple
of new SoCs this time, with the initial Apple M1 support being the
most exciting one.
The STM32H750 platform is also noteworthy because it's fairly
unexpected to still
see new MMU-less boards.

The arm-apple-m1-5.13 tag includes changes from the tty and arm64
trees, so it would
be good to merge those first in order to get a neater git history.
Both have been
submitted today by Greg and Catalin.

As usual, the changes are mostly for devicetree files, aside from the
ongoing cleanup
work to omap2 and driver work for tegra and socfpga.  About two thirds
this of the
overall changes this time are for 64-bit machines, which is more than usual=
 but
fits in with the long-term trend.

A few more statistics: There are 863 non-merge commits this time, from 195
authors. These twenty people have done more than ten changes each:

     79 Tony Lindgren
     47 Krzysztof Kozlowski
     38 Cristian Marussi
     28 Vinod Koul
     28 Dmitry Osipenko
     21 Manivannan Sadhasivam
     18 Hector Martin
     18 Geert Uytterhoeven
     18 Dong Aisheng
     18 Arnd Bergmann
     17 Sai Prakash Ranjan
     17 Rafa=C5=82 Mi=C5=82ecki
     15 Jagan Teki
     12 Stephen Boyd
     12 Nicolas Saenz Julienne
     11 Linus Walleij
     11 Jonathan Neusch=C3=A4fer
     11 Heiko Stuebner
     11 Eddie James
     11 Chunfeng Yun

This is the total diffstat:

   0.6% Documentation/devicetree/bindings/arm/
   0.2% Documentation/devicetree/bindings/interrupt-controller/
   0.3% Documentation/devicetree/bindings/memory-controllers/
   0.2% Documentation/devicetree/bindings/mfd/
   0.2% Documentation/devicetree/bindings/
   1.6% Documentation/driver-api/
  23.1% arch/arm/boot/dts/
   0.5% arch/arm/configs/
   4.8% arch/arm/mach-omap2/
   1.2% arch/arm/
   0.2% arch/arm64/boot/dts/allwinner/
   0.8% arch/arm64/boot/dts/amlogic/
   0.3% arch/arm64/boot/dts/apple/
   0.5% arch/arm64/boot/dts/broadcom/bcm4908/
   8.1% arch/arm64/boot/dts/freescale/
   0.6% arch/arm64/boot/dts/intel/
   0.4% arch/arm64/boot/dts/marvell/
   3.1% arch/arm64/boot/dts/mediatek/
  14.4% arch/arm64/boot/dts/qcom/
   2.3% arch/arm64/boot/dts/renesas/
   0.8% arch/arm64/boot/dts/rockchip/
   8.3% arch/arm64/boot/dts/ti/
   0.2% arch/arm64/include/asm/
   0.2% arch/arm64/
   0.2% drivers/bus/
   0.4% drivers/clk/
   0.3% drivers/cpufreq/
   9.2% drivers/firmware/arm_scmi/
   0.6% drivers/firmware/
   1.7% drivers/iio/common/scmi_sensors/
   2.1% drivers/irqchip/
   1.2% drivers/memory/tegra/
   0.5% drivers/pwm/
   0.9% drivers/soc/fsl/qe/
   2.5% drivers/soc/mediatek/
   0.5% drivers/soc/qcom/
   0.5% drivers/soc/tegra/
   0.3% drivers/soc/
   0.4% drivers/tty/serial/
   1.2% drivers/
   1.3% include/linux/
   0.2% include/soc/
   0.2% include/
 774 files changed, 35247 insertions(+), 8091 deletions(-)

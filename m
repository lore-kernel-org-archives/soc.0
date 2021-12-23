Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E13FC433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF930C36AEE; Thu, 23 Dec 2021 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A950AC36AEB
	for <soc@kernel.org>; Thu, 23 Dec 2021 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640295118;
	bh=N5hFYNMKt5+zcKDD02Wpc14x4X8CKzcxds+NKM+0LYg=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=saz5ydpc4uEpSpXd+SCUHqyZTG1uajHNnaTw+ur/wAE+DwUKIjDbCSPCsMK9SOExd
	 oCYDycahOJP+Pw+KRZ7Gtv0V/O1Ac716M0oIo050ja6pDQAp1T2hUsDCkb0uU6svdr
	 h58CBJcufErWebLcxWdy29VubWygxYli5jv3AkkoC0LWckOfyQEE3vf8lnzlYo+ElU
	 6Ipw2NAxWgLvnUir8Ztk2FasKjqnddcFgs/kxlNsOq6UsHtaJ4bN1mgb0vp8lccqmK
	 a29aqcYhYGuVAHufaocoSu32wNdqcw/i/WZ8NNc42wmgMJ4FOiLI8EXMoUZ1RuKoqn
	 Oh7y2q64PqiPw==
Received: by mail-wr1-f53.google.com with SMTP id e5so13856585wrc.5
        for <soc@kernel.org>; Thu, 23 Dec 2021 13:31:58 -0800 (PST)
X-Gm-Message-State: AOAM532bUauQu+o6EA2oYGteCijdzKuOwnjcdzyfOEZPhrb+bhOKpCjh
	T2gQRXpj+yvcOvjfAYi6R2n0eg5uRakJPxS/9vM=
X-Google-Smtp-Source: ABdhPJyCtm+55Tksr9ZXSfhOmAnVC7HpdAepjoheO0Ys6R7JhyAFMiq+kjIj/LHFet3ZIQeBIN27MwNFVNh6uMv5BPo=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr2840780wrs.219.1640295117038;
 Thu, 23 Dec 2021 13:31:57 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 22:31:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
Message-ID: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
Subject: [GIT PULL 0/5] SoC changes for 5.17
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

I'm sending out the pull requests for 5.17 early, as I won't have access to
my workstation for the next two weeks. With only 760 non-merge commits,
this again feels quieter than the massive previous merge window, but the
number of changed lines was actually slightly higher.

There are very few changes aside from devicetree patches, most of
which are for the i.MX, Tegra, Qualcomm, Apple, K3 and Aspeed
platforms.

We have a couple of new SoCs in existing families:

 - Qualcomm Snapdragon 8 Gen1
 - Qualcomm Snapdragon SDX65
 - NXP i.MX8ULP
 - Texas Instruments j721s2
 - Renesas R-Car S4-8

The time between product announcement and kernel support is fairly short
for all of these, which is nice. In particular the two Snapdragons were only
announced this month and are the current high end of Qualcomm's products.
On the other end of the spectrum, we also add support for ST SPEAr320s,
which was launched 10 years ago.

Aside from the Arm chips, there is also a pull request for a new RISC-V SoC,
the Starfive JH7100, including some of the basic drivers to make it boot.

        Arnd

Dirstat
   0.2% Documentation/devicetree/bindings/arm/apple/
   0.5% Documentation/devicetree/bindings/arm/tegra/
   0.6% Documentation/devicetree/bindings/arm/
   0.3% Documentation/devicetree/bindings/clock/
   0.5% Documentation/devicetree/bindings/firmware/
   0.3% Documentation/devicetree/bindings/gpu/host1x/
   0.3% Documentation/devicetree/bindings/mailbox/
   0.2% Documentation/devicetree/bindings/media/
   0.2% Documentation/devicetree/bindings/misc/
   0.9% Documentation/devicetree/bindings/mmc/
   0.5% Documentation/devicetree/bindings/pinctrl/
   0.2% Documentation/devicetree/bindings/soc/samsung/
   0.2% Documentation/devicetree/bindings/soc/
   1.3% Documentation/devicetree/bindings/
  46.4% arch/arm/boot/dts/
   0.6% arch/arm/
   0.3% arch/arm64/boot/dts/allwinner/
   0.3% arch/arm64/boot/dts/amlogic/
   2.2% arch/arm64/boot/dts/apple/
  11.7% arch/arm64/boot/dts/freescale/
   0.7% arch/arm64/boot/dts/mediatek/
   2.6% arch/arm64/boot/dts/nvidia/
   7.9% arch/arm64/boot/dts/qcom/
   1.6% arch/arm64/boot/dts/renesas/
   0.3% arch/arm64/boot/dts/rockchip/
   3.9% arch/arm64/boot/dts/ti/
   0.4% arch/arm64/boot/dts/
   0.5% arch/riscv/boot/dts/starfive/
   1.5% drivers/clk/starfive/
   0.2% drivers/memory/
   2.3% drivers/pinctrl/
   0.2% drivers/reset/
   0.5% drivers/soc/apple/
   0.2% drivers/soc/imx/
   0.6% drivers/soc/qcom/
   1.5% drivers/soc/renesas/
   0.4% drivers/soc/samsung/
   0.4% drivers/soc/tegra/
   0.2% drivers/soc/xilinx/
   0.8% drivers/tee/optee/
   0.2% drivers/tee/
   0.6% drivers/
   1.2% include/dt-bindings/clock/
   0.6% include/dt-bindings/pinctrl/
   0.2% include/dt-bindings/reset/
   0.2% include/dt-bindings/
 718 files changed, 62620 insertions(+), 16020 deletions(-)

Most active contributors out of 183 individuals:
     83 Thierry Reding
     42 Dmitry Osipenko
     22 Hector Martin
     20 Konrad Dybcio
     17 Vinod Koul
     17 Giulio Benetti
     15 Adam Ford
     14 Jernej Skrabec
     13 Yoshihiro Shimoda
     13 Emil Renner Berthing
     13 Biju Das
     12 Sam Protsenko
     12 Lad Prabhakar
     12 Dmitry Baryshkov
     12 Arnd Bergmann
     10 Geert Uytterhoeven
     10 Alexander Stein

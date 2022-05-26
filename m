Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0345FC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0580C3411A; Thu, 26 May 2022 14:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A72C34118
	for <soc@kernel.org>; Thu, 26 May 2022 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576261;
	bh=FZdgVBAsDEhOhuPNO664KfOqZMLUfaXivcodwnEiEwM=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=gAZ6jQEiIiAHbvt60m/QJCtMETdseaPvFcIEvo1soWkJhMyF8czIj3Rc0yyq21xWw
	 DPAcwbli8CWbXs18X58uB0IbNU0Xp3M1Qd+gLKhObQgUT4KDtM5pfSoGiXbytVgZbI
	 8LAhg7ENbb4XDCf6+iafDAUmubyjbBM4oYTk2JfuVJsGonQRd6bnEMUOlYwz2SzwYg
	 V5At1xUUtPrC29GZzv0Ynk26W9FjiBtyMOaE2r50SqmNgFnNuYja171QE1HRP9Az7n
	 qMgQutd5e62NElJdu9Nn4vL4ETQFShcZPUdi4cE5fDPMOOmvUC6GPL/pnRWgk36/Iv
	 fRyY0m/vxQ+tQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ef5380669cso17569987b3.9
        for <soc@kernel.org>; Thu, 26 May 2022 07:44:21 -0700 (PDT)
X-Gm-Message-State: AOAM532UpFEFtB3f/NCZZQBuCq468sMZgAg+Zp3AGAqzkxPEmNSdmsPr
	GQ6KZmIlCcjfg5Y/4zuR+3rDInewMixARA0mJKc=
X-Google-Smtp-Source: ABdhPJz62vsqTUeGqCuuKLQZ7SXMUHfeuKaw+CBp1IJQnaqqe+ERnpuX0MjAoShm91SPNEqA0MFPzITn/unpzVK22NQ=
X-Received: by 2002:a81:a15:0:b0:300:37bd:d2e0 with SMTP id
 21-20020a810a15000000b0030037bdd2e0mr12687858ywk.249.1653576260759; Thu, 26
 May 2022 07:44:20 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 May 2022 16:44:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
Message-ID: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
Subject: [GIT PULL 0/5] ARM: SoC changes for 5.19, part 1
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

This is a large chunk of ARM related changes, but larger than average
patches for both DT and drivers, plus a series for multiplatform conversion.
Today's patches contain the first 1084 changesets, but I am planning for
a follow-up with another 100 or so next week that had some late rebases.

Most active developers this time are:

     98 Arnd Bergmann
     95 Krzysztof Kozlowski
     45 Biju Das
     39 Konrad Dybcio
     33 Tony Lindgren
     33 Dmitry Baryshkov
     23 Michael Walle
     22 Cristian Marussi
     21 Geert Uytterhoeven
     21 David Jander
     18 Lad Prabhakar
     17 Marcel Ziswiler
     16 Luca Weiss
     16 Allen-KH Cheng
     15 Vinod Koul
     15 Marek Vasut
     15 Gireesh Hiremath
     14 Rohit Agarwal
     14 Max Krummenacher
     14 Bhupesh Sharma
     13 Philipp Zabel
     11 Linus Walleij
     11 Janusz Krzysztofik
     11 Fabio Estevam
     11 Bjorn Andersson

Krzysztof did a lot of work on devicetree fixes cross platforms, while I did
most of the multiplatform conversion. Interestingly, a large chunk of the
changes this time are for 32-bit platforms, while the general trend recently
has been towards 64-bit ones.

Overall dirstat:
   0.7% Documentation/devicetree/bindings/arm/
   0.5% Documentation/devicetree/bindings/clock/
   0.9% Documentation/devicetree/bindings/reset/
   2.3% Documentation/devicetree/bindings/soc/qcom/
   1.2% Documentation/devicetree/bindings/
  27.2% arch/arm/boot/dts/
   0.6% arch/arm/mach-at91/
   0.8% arch/arm/mach-davinci/include/mach/
   0.9% arch/arm/mach-davinci/
   0.5% arch/arm/mach-mmp/
   4.2% arch/arm/mach-omap1/
   0.4% arch/arm/mach-omap2/
   1.8% arch/arm/mach-pxa/
   0.4% arch/arm/mach-s3c/
   0.5% arch/arm/mach-versatile/
   0.7% arch/arm/plat-omap/
   2.5% arch/arm/
   0.5% arch/arm64/boot/dts/arm/
   7.0% arch/arm64/boot/dts/freescale/
   3.3% arch/arm64/boot/dts/mediatek/
   1.0% arch/arm64/boot/dts/nvidia/
   9.4% arch/arm64/boot/dts/qcom/
   4.2% arch/arm64/boot/dts/renesas/
   3.2% arch/arm64/boot/dts/rockchip/
   1.2% arch/arm64/boot/dts/ti/
   0.7% arch/arm64/boot/dts/
   0.5% drivers/bus/
   0.6% drivers/clk/pxa/
   3.4% drivers/firmware/arm_scmi/
   0.4% drivers/memory/tegra/
   2.0% drivers/nvme/host/
   1.8% drivers/soc/apple/
   1.7% drivers/soc/imx/
   1.1% drivers/soc/mediatek/
   0.7% drivers/soc/qcom/
   0.7% drivers/soc/
   0.8% drivers/tee/optee/
   3.0% drivers/
   1.6% include/dt-bindings/clock/
   0.4% include/linux/soc/ti/
   0.4% include/linux/soc/
   0.7% include/
   1.0% sound/soc/pxa/
   0.4% sound/

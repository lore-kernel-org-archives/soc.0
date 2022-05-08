Return-Path: <SRS0=1kPU=VQ=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036DBC433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 20:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C36CFC385B1; Sun,  8 May 2022 20:52:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10227C385A4;
	Sun,  8 May 2022 20:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10227C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id m20so23338771ejj.10;
        Sun, 08 May 2022 13:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aqIh2P0/IzGdCclUQ03tUyhz7ObCywRgF6s5L3upE2k=;
        b=FTfFM1cE08rsFCwTtKk0gdricEdIUYeWAGdHbjeDq5wUPFqMR2dpUc2pCWzq3z0izX
         jCXwogmCkSkSdygKaXEqS+E+xXu6gVvMQmjRiNyDk4ExWNl3WwVlmf6d/klO/sO9GVcF
         pJMb34BwwB7sYirXrF4X7o2v+5jYpU1ji0UkUVkkl6JoNndRjTwKpIpqsChzaqsgkt68
         lJM1w4P5/QqE7RAFA7SLHZ5HqA8eeharyFxVm8Hz3/QVaT0q1hb3Ae08QS+2pPOQ9exv
         pL6GG2XxRPLxIgFAmUE39ghk1GbqaNTJ8JCCWSjZdk6HBLtUAaKSp3AI6tPPOPtozWiJ
         qPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aqIh2P0/IzGdCclUQ03tUyhz7ObCywRgF6s5L3upE2k=;
        b=inoSloM6ihFrYe+ZxRbK0EXjIGGAUWqQHD3dSjhxN/UgggpglHaLkDVf4/5JOjirTk
         jwpCMwzvbWBWhYo2zElV+o0NCoizhiTskBZXoc8kN2KKSm/aZdeW5WeacKGZNGymQmh6
         BnHz0mIaSrIbogtvwyNrtZtAyR6Cyd2lJ0tjw47EOyFgBp+p4bBt65yUXv40IkmajGlY
         TYjmUZerhVs23CGcRMlliCIHDaIPz+KvN0DP27s+a7f7pOHxxp9Mp6Bx/4rlOGq/+ILZ
         9mJ1kngx9T98Js8lc1Pqo0B0AdVJR+YCC5XH6XGSc0d9rxI6UyoFEcpaG/Iv47kV+Fyq
         yHwA==
X-Gm-Message-State: AOAM533iFKkMp9jvK8CDvj0KeHW0TqubQJCf5+hvZlKgGFjB48XiRSlW
	Yp6AN6w7ErbQY/QUd8Axsl7GXbrUzig=
X-Google-Smtp-Source: ABdhPJymZEbJ3wiwIwIhY1OfqQaOakyF0++7Im51awEbuf7b+RrcqOcs64o4hkepuLp1sapnZyVSzg==
X-Received: by 2002:a17:906:d554:b0:6f5:2242:a499 with SMTP id cr20-20020a170906d55400b006f52242a499mr11046306ejc.488.1652043133223;
        Sun, 08 May 2022 13:52:13 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id ze11-20020a170906ef8b00b006f3ef214e43sm4371883ejb.169.2022.05.08.13.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 13:52:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Jernej Skrabec <jernej@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner DT changes for 5.19
Date: Sun, 08 May 2022 22:52:11 +0200
Message-ID: <1789096.atdPhlSkOF@kista>
In-Reply-To: <YnVUmSLE1MZFkApt@kista.localdomain>
References: <YnVUmSLE1MZFkApt@kista.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 06. maj 2022 ob 19:02:17 CEST je Jernej Skrabec napisal(a):
> Hi!
> 
> Please pull following DT changes for 5.19.

I missed one patch, please disregard.

Regards,
Jernej

> 
> Best regards,
> Jernej
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/
sunxi-dt-for-5.19-1
> 
> for you to fetch changes up to 50612cf9e05d111c21e84096e50a31d0c35d5825:
> 
>   arm64: dts: allwinner: teres-i: Add GPIO port regulators (2022-05-03 
19:00:24 +0200)
> 
> ----------------------------------------------------------------
> - F1C100 improvements (SPI, MMC, timer, cpu, watchdog)
> - SPI flash node for licheepi-nano
> - enabled analogue audio on olinuxino-a64
> - GPIO port regulators on teres-i
> 
> ----------------------------------------------------------------
> Andre Przywara (9):
>       dt-bindings: watchdog: sunxi: fix F1C100s compatible
>       dt-bindings: watchdog: sunxi: clarify clock support
>       ARM: dts: suniv: F1C100: fix watchdog compatible
>       dt-bindings: arm: sunxi: document LicheePi Nano name
>       ARM: dts: suniv: F1C100: fix CPU node
>       ARM: dts: suniv: F1C100: fix timer node
>       dt-bindings: spi: sunxi: document F1C100 controllers
>       ARM: dts: suniv: F1C100: add SPI support
>       ARM: dts: suniv: licheepi-nano: add SPI flash
> 
> Harald Geyer (1):
>       arm64: dts: allwinner: teres-i: Add GPIO port regulators
> 
> Jesse Taube (3):
>       ARM: dts: suniv: F1C100: add clock and reset macros
>       ARM: dts: suniv: F1C100: add MMC controllers
>       ARM: dts: suniv: licheepi-nano: add microSD card
> 
> Philip Rinn (1):
>       arm64: dts: allwinner: a64: olinuxino: Enable audio
> 
>  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml      |   1 +
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |  24 ++---
>  arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
>  arch/arm/boot/dts/suniv-f1c100s.dtsi               | 104 ++++++++++++++++++
+--
>  .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    |  30 ++++++
>  .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |   8 ++
>  7 files changed, 178 insertions(+), 25 deletions(-)
> 
> 



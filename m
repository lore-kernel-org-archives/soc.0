Return-Path: <SRS0=zFty=JG=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFA9C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 06:14:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 42A286115B; Fri,  9 Apr 2021 06:14:42 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97A360FF0
	for <soc@kernel.org>; Fri,  9 Apr 2021 06:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97A360FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qk1-f177.google.com with SMTP id i9so4844973qka.2
        for <soc@kernel.org>; Thu, 08 Apr 2021 23:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FRZO+HCHZaJtI6l3DQpMewHRTRciapnJj+KPs9srAYQ=;
        b=B67LEXXfgUlYFemvN+DJR7IYbvMH3mkXnOcevWgTrbqUc0CCPaMU+JYsg6zlQQ39tg
         CqOlZAHS8pilJzDBQQdxg8x53R3TWbJIxRmaXY9ScNs63C8XEMDtt3JF6910/nkjF00m
         gTRpG9uVnxB0d1EubDsXdNDqK/7r2lczBaPP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FRZO+HCHZaJtI6l3DQpMewHRTRciapnJj+KPs9srAYQ=;
        b=Cq8qS5iDidc5ZWIEA1MJMd4rG9PlQp7mQp7bJAi4WgSgDPWdpqP8YdxqpQVz92YOaM
         Z4Fd9saU5tTis0H9xTIb9Qdcghtb9scP1fyLbZPieZNwX8GBOupDMUWJdYFaqmsmHrUy
         meM6Q/K33pAYk11hrcwQfwLfGKLIM9lo57CfLShUhTi4tpfhJ6aMqOKOcvH0SQofCdMh
         DYkHpXp+KUbUyNN9gwSrSUihuzKPlnLoPVsGY8yunrroj+D/SshEppkuCNmMSGp5zeSF
         wHRTnqyscL/62AeQnw4puSgoGz+ASVcUtIVQhwAhakybpphd9KSJON3AEXEei5sd1IWT
         Zc3g==
X-Gm-Message-State: AOAM531kpdt2ZbsfKOTqXhHp7YgPg/PohFqozmOBh1Ud9G2VUZOLH5Mm
	UABPWweg4bmB5k14qDqkGHFvhpPOKvvsrNvY3aP/+A7SU1k=
X-Google-Smtp-Source: ABdhPJx2tT32pLMBe/ETq04appLjgR5JqaPIOwjjPXDIviNZnJEEKdWtCGh+Ko6rd/Bw2dFAt/4A9EMFCeGXfn9YOE4=
X-Received: by 2002:a05:620a:c11:: with SMTP id l17mr12431122qki.487.1617948880016;
 Thu, 08 Apr 2021 23:14:40 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:14:27 +0000
Message-ID: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
Subject: [GIT PULL] ARM: bmc: devicetree changes for 5.13
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here's a pull request from me for the ASPEED and Nuvoton changes
targeting the v5.13 merge window. As you can see I've chosen to
arrange the pull request as one single "BMC-related" set of changes.
If we choose to continue with this, in the future I will cover the
ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.

The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree

for you to fetch changes up to ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13

The ASPEED and Nuvoton pull request now comes as a combined BMC pull
request.

 - New machines

  * ASRock E3C246D4I, an AST2500 BMC for an Xeon E-2100/E-2200 mini-ITX
    system
  * Quanta GBS, an NPCM730 BMC for an x86 server

 - Power10 BMC updates for Everest and Rainier

 - GPIO line names for Mihawk

----------------------------------------------------------------

Alpana Kumari (2):
      ARM: dts: aspeed: rainier: Add presence GPIOs
      ARM: dts: aspeed: everest: GPIOs support

Brandon Wyman (2):
      ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
      ARM: dts: aspeed: everest: Add power supply i2c devices

Eddie James (7):
      ARM: dts: aspeed: rainier: Add additional processor CFAMs
      ARM: dts: aspeed: rainier: Enable fan watchdog
      ARM: dts: aspeed: rainier 4U: Fix fan configuration
      ARM: dts: aspeed: everest: Add FSI CFAMs and re-number engines
      ARM: dts: aspeed: everest: Add RTC
      ARM: dts: aspeed: everest: Enable fan watchdog
      ARM: dts: aspeed: Add Rainier 1S4U machine

George Hung (1):
      ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree

Jim Wright (1):
      ARM: dts: aspeed: everest: Add UCD90320 power sequencer

Joel Stanley (2):
      ARM: dts: aspeed: rainier: Add missing fan nodes
      ARM: dts: aspeed: everest: Add size/address cells

Matthew Barth (2):
      ARM: dts: aspeed: everest: Add max31785 fan controller device
      ARM: dts: aspeed: everest: Add pca9552 fan presence

Nichole Wang (1):
      ARM: dts: aspeed: mihawk: Add GPIO line names

Priyanga Ramasamy (1):
      ARM: dts: aspeed: everest: Add I2C components

Vishwanatha Subbanna (1):
      ARM: dts: aspeed: rainier: Add directly controlled LEDs

Zev Weiss (1):
      ARM: dts: aspeed: Add ASRock E3C246D4I BMC

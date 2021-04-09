Return-Path: <SRS0=zFty=JG=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B9C433ED
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 06:46:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0CC26600D1; Fri,  9 Apr 2021 06:46:42 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D79610C8
	for <soc@kernel.org>; Fri,  9 Apr 2021 06:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35D79610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qt1-f180.google.com with SMTP id y12so3459156qtx.11
        for <soc@kernel.org>; Thu, 08 Apr 2021 23:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Fk+SLvQByxpVgF9nXnK+sGfyXWmk8mqqM5Z9mDGSXkM=;
        b=nQOrPXAP/rlXJIGMD67uNpaC5fSCWPVHu39ALGm7WV4Dnt2JXgbUa87Gj5jf+BptHR
         JlBiR9daoFIXRJoqnqwHoeGl8k5ddLFoYeFpisFVWS5PkThNBdGiqHDSv4yj/JkvJDlY
         F4MWHsFZ7pJznA1OX5VI8A3USTLnvksfeu7b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Fk+SLvQByxpVgF9nXnK+sGfyXWmk8mqqM5Z9mDGSXkM=;
        b=WdFW+cNCbwvri68iIL/oseiz7LgVcfmk3fYAqnHsXzd7cLdn33nSxSHMAmIJ1OV0oa
         7YLbg7RgQes0SJ7YSjN+TGFx5PEP2Q4U1hTmpQ4G9I0THsOdi53WP1F1j8Y8FJ/PLzqo
         Xo9c6/FFKAORsDBYpA2ZlF+OZQ90lhPjRsohMV8ftcZq5xY5I5ym1GKUPXb/LzoLM1OT
         p3qaBs8JURbCGH0SBQbyyyiTyy6gsEO7Bt6NW3xGQ2APbjg/kaQ6dHfVme+iOBPa1fBU
         oIWVN85/e7aCF0OwODzuhMf9gKXpQGINZJEa2YtDE3ZuFFo7/n8yLzuQX8JgSgVZl2Fl
         DM3g==
X-Gm-Message-State: AOAM532RJurMBRDuyC1Q/3bjL6oYoT22FDF4KU/X5zYuRAzqbWu4C2E/
	9MKzVtIh8HPHUSWpF23BF3qEUmzVRBZH9p9NmwcIxB2CY/ivYQ==
X-Google-Smtp-Source: ABdhPJyOK1IoEN8R85hTcPiUd7XO74Y6XVEax2g5xYbXraGJzUecQnp5eFR8XWNCzxuAlQ3ltLYwd23fyAcCPakT7Xk=
X-Received: by 2002:ac8:4d1b:: with SMTP id w27mr6020430qtv.363.1617950799643;
 Thu, 08 Apr 2021 23:46:39 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:46:27 +0000
Message-ID: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: Add WPCM450 support
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Soc maintainers,

Here's a support for a Nuvoton soc contributed by Jonathan. There are
changes for the irq controller, timer and serial port that have been
merged by other maintainers. I've picked up the arch and device tree
changes on his behalf to go through the soc tree.

The following changes since commit 09e6d2b71ae673dccf9f59f0fc1e17109113b6f4=
:

  ARM: config: Add WPCM to multi v5 (2021-04-09 15:18:40 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-wpcm450

for you to fetch changes up to 09e6d2b71ae673dccf9f59f0fc1e17109113b6f4:

  ARM: config: Add WPCM to multi v5 (2021-04-09 15:18:40 +0930)

----------------------------------------------------------------
Nuvoton WPCM450 BMC SoC

This adds basic support for the Nuvoton WPCM450 BMC SoC. It's an older
SoC but still commonly found on eBay, mostly in Supermicro X9 server
boards.

Third-party documentation is available at:
https://github.com/neuschaefer/wpcm450/wiki

The code has been contributed by Jonathan Neusch=C3=A4fer who has also
stepped forward to maintain the soc.

----------------------------------------------------------------
Joel Stanley (1):
      ARM: config: Add WPCM to multi v5

Jonathan Neusch=C3=A4fer (10):
      dt-bindings: arm: Convert nuvoton,npcm750 binding to YAML
      ARM: dts: Add board-specific compatible string to npcm750-evb devicet=
ree
      dt-bindings: vendor-prefixes: Add Supermicro
      dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible string
      dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
      ARM: npcm: Introduce Nuvoton WPCM450 SoC
      watchdog: npcm: Add support for WPCM450
      ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
      ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based on WPCM450
      MAINTAINERS: Add entry for Nuvoton WPCM450

Return-Path: <SRS0=hd79=GZ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A17BC433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 21:02:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20EC023B16; Fri, 22 Jan 2021 21:02:57 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1ED823B18
	for <soc@kernel.org>; Fri, 22 Jan 2021 21:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1ED823B18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 3so8110842ljc.4
        for <soc@kernel.org>; Fri, 22 Jan 2021 13:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=vqaX6daGGhU/xWLrgGxV257EP9zBKB1iyy7cjSU7f5w=;
        b=TcP1yM1mEzjBs0QroHWmG3Wq8sf+0mWg2KNMrdE/eMRFNapWtD5tVwm9pfXNiFwGqx
         M0b58oOMI0vMv82QYADeTPUjkRDXsDFxcPyzteML7U77coEgD+S+csVXtMnl+Xwwo8Va
         Z8I/BsXAVgE0OelIbGdE3XxBVsACYA9q45lkeBWZUSp4xQVaCXCTbL4t5I7Z7wb3aVhB
         fMPh+gUxCAKzqplx2Xs04Ku/GUJ3/Mmv593vNua1GJ3O0/fS5tSGDcUdQ9h6zbJRcJ5p
         ny4TCJELjdsUWOsfUpt9oeTFlkdvCiWIS4nYPgxIYGTw5ti32P1lPRItcqYdQEkyDGHg
         53Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vqaX6daGGhU/xWLrgGxV257EP9zBKB1iyy7cjSU7f5w=;
        b=dDgzjHDk1ibOdYxoJRmhGgfsHUpo4+MnJSHIQ7C1h3NMv0Wp1g6zAfruPovk/Hee7u
         PIStEaEb35gqoMXMDE59ejkfLx9k10F9Sx7Sy3N3pQegnRBg+UXDCTJPZcDXWb0ATNTp
         7ZF09FXY7W6N85rifyOZNBplaHaqd5kpYwMyNghj1bkoqF0AGXEZPGyP/IUAjfu47qZ1
         aigJRW5svmFxMa8Bf0uBHr3K0Rt2SCesZS+5Fmme/vYDZqTAINYoyNHJkkd+WC2ecxY2
         Ll/0m8XBF2YACFXdvNd5zu3IiRAgfcjoGfbDtIsUs5PVe+TjK/KjR0/1qGDsQlZEt1XE
         eImQ==
X-Gm-Message-State: AOAM530eu6+C73nvmvhigtWP47/6lompMl1OeHrDyMLSR/AWIBvjcr4v
	H0zyjF6q9iMCZ5QLPGzUyo4iwHKEKREbJOz3xeA9o/Av7P4UqMSK
X-Google-Smtp-Source: ABdhPJywH+fblvJkzQic5ghlUuwc7ZQ20EB1xks8MZti83Gf5BZpd5binGQDX9cbpR9+iDtVtSEPjQR1cp6qf5pB920=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr596917ljl.467.1611349374950;
 Fri, 22 Jan 2021 13:02:54 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Jan 2021 22:02:43 +0100
Message-ID: <CACRpkdbn=P63V9aEO2wKu2DwvVUcbjwCEV_JvKwWZ0netT75ig@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for the v5.12 kernel cycle
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here are some DTS updates for the v5.12 kernel cycle.

The details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.12

for you to fetch changes up to 28734f87a03ef4e6e443d11633d5e3c7eae44c8f:

  ARM: dts: Fix up MMC host node names (2021-01-22 21:45:43 +0100)

----------------------------------------------------------------
Ux500 DTS updates for the v5.12 kernel cycle:

- A new DTS file for the Samsung GT-I9070 (Janice)
- Fix up ADC channel name attributes
- Add charger interrupts
- Add thermistors to the HREF boards
- Remove the non-existing AB8505 HW ADC IRQ
- Push down the VMMCI setting to each board
- Add the die temperature channel to teh AB8505
- Fix up the MMC host names to follow the standard
  naming convention

----------------------------------------------------------------
Linus Walleij (8):
      ARM: dts: ux500: Add a device tree for Janice
      ARM: dts: ux500: Fix channel names attributes
      ARM: dts: ux500: Add interrupts to charger
      ARM: dts: ux500: Add thermistors to the HREF
      ARM: dts: ux500: Remove the GPADC HW IRQ
      ARM: dts: ux500: Push VMMCI down to each tree
      ARM: dts: ux500: Add die temperature to AB8505
      ARM: dts: Fix up MMC host node names

 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/ste-ab8500.dtsi              |  64 +-
 arch/arm/boot/dts/ste-ab8505.dtsi              |  67 +-
 arch/arm/boot/dts/ste-dbx5x0.dtsi              |  12 +-
 arch/arm/boot/dts/ste-href.dtsi                |  23 +-
 arch/arm/boot/dts/ste-href520-tvk.dts          |  42 +-
 arch/arm/boot/dts/ste-hrefprev60-stuib.dts     |  19 +
 arch/arm/boot/dts/ste-hrefprev60-tvk.dts       |  19 +
 arch/arm/boot/dts/ste-hrefprev60.dtsi          |   8 +-
 arch/arm/boot/dts/ste-hrefv60plus-stuib.dts    |  39 ++
 arch/arm/boot/dts/ste-hrefv60plus-tvk.dts      |  39 ++
 arch/arm/boot/dts/ste-hrefv60plus.dtsi         |  76 ++-
 arch/arm/boot/dts/ste-snowball.dts             |   8 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |   6 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 894 +++++++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts |   6 +-
 16 files changed, 1244 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-janice.dts

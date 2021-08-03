Return-Path: <SRS0=uzdW=M2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498DDC4338F
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 12:25:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 273E760F48; Tue,  3 Aug 2021 12:25:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D7A60F35
	for <soc@kernel.org>; Tue,  3 Aug 2021 12:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03D7A60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id f42so165695lfv.7
        for <soc@kernel.org>; Tue, 03 Aug 2021 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=2vR54FtkJtwvV/eZwBB/ZobftRPkYHq3z3g8svYKyt0=;
        b=Kmd8GuUKxsxY2kCMsI3QkoLIc6nPiuHs2150O1ehpcRAACni/vX1tio9Q3Lh8HIKZu
         RwfRr3XgQ2XOlRximm/Y3gAbjRGW5bID2E2GQVapLAz0GGAWD7QEgYFjfITc+ooan9+D
         b0sMUy3lrLirnNl0q3ZvqeOIrK9ctrluMJ8pNyyZ5TMldbaY9iUSWN+ShEF0NATZdJyd
         CK9s8XT5KLZkxw4ly5wUdOfMsQoDgsC/kz0ANOT+J8XwIkrmAt5FSOOgpDg8zC05A0E7
         4C0wIahYZZSBm4JOg7NRgoKyKjNdy37RreqGaeNJI1WF10I5GwNSkJtpPMlWzX75nP7I
         i7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=2vR54FtkJtwvV/eZwBB/ZobftRPkYHq3z3g8svYKyt0=;
        b=KaaNfM2pKrRDVtXf3mm/3x5mcSvLXXapc10vTRc3sFTtRGnW0LsdhWKOvEjSYdCrem
         cx9QKEOrzzk49lbPO1pCqiF2OusV0phT/GjASd20JQhWa4/QoWmjYzRz6dqwUpTm+Wew
         OqgzQT5Ag6dLqiuP/cZ5/9J7ydwLyjVWVWiBywvta9+L0qlafF5M+bEDwmCFE9UFwtUe
         G66gO+VNa9fX8BjVgiZy/eehVSNLPCrJ8n+FS2POmsxVNKNpMiebSvKQR5LGTcfHzvvp
         5SJb6Qhb0H8qKAA9vlFEoKiAKX1km8UliylFuUvGUOr7QUeSAhqfzhJSF1dPX31Od3OY
         qZLQ==
X-Gm-Message-State: AOAM533Sxissg8RhcCHSNzBgQc2JJk/c9NZ31ebsgDq5SrSf4x6FPiT2
	MzjZFNA7g8iSBHb3ny/lHFkrOQT7Ih3Q3un6ALKUjmWvJZxUJg==
X-Google-Smtp-Source: ABdhPJzfzwbDtQbRpJA0lvEOFxyFr+49gj6LvtCiEn7lnxpwH4Opxs0V5dmvDLo1BTnA4twDZu7YON/6hSLUfKm4TY4=
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr4457478lfg.586.1627993525786;
 Tue, 03 Aug 2021 05:25:25 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Aug 2021 14:25:15 +0200
Message-ID: <CACRpkdbjBv5ywZZD8rK07d5sLcHsG8o4iYD-3jHO=HLg6-nKnA@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for the v5.15 kernel cycle
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here is a first set of DTS changes for v5.15 that would be nice if
you could pull into the appropriate DTS branch in the SoC tree.

The details are in the signed tag, mainly some new phones,
and some generic fixes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.15-1

for you to fetch changes up to fe2fc0fd379371af510caf39181460f2eed4c35b:

  ARM: dts: ux500: Adjust operating points to reality (2021-08-02
01:41:59 +0200)

----------------------------------------------------------------
Ux500 Device Tree updates for the v5.15 kernel cycle:

- New device trees for these mobile phones:
  - Samsung Gavini
  - Samsung Codina
  - Samsung Kyle
- Flag eMMC cards as non-SD non-SDIO to save time
- Link USB PHY to USB controller in the device tree
- Fix up the operating points to the actual clock frequencies

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ux500: Add device tree for Samsung Gavini
      ARM: dts: ux500: Flag eMMCs as non-SDIO/SD
      ARM: dts: ux500: Add devicetree for Codina
      ARM: dts: ux500: Add a device tree for Kyle
      ARM: dts: ux500: Adjust operating points to reality

Stephan Gerhold (1):
      ARM: dts: ux500: ab8500: Link USB PHY to USB controller node

 arch/arm/boot/dts/Makefile                     |   5 +-
 arch/arm/boot/dts/ste-ab8500.dtsi              |   8 +-
 arch/arm/boot/dts/ste-ab8505.dtsi              |   6 +
 arch/arm/boot/dts/ste-db8500.dtsi              |   7 +-
 arch/arm/boot/dts/ste-db8520.dtsi              |   7 +-
 arch/arm/boot/dts/ste-db9500.dtsi              |   9 +-
 arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi      |  18 +
 arch/arm/boot/dts/ste-href.dtsi                |   4 +
 arch/arm/boot/dts/ste-snowball.dts             |   2 +
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts | 863 +++++++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 854 ++++++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |   2 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts |   2 +
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts   | 664 +++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts |   2 +
 15 files changed, 2438 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-codina.dts
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts

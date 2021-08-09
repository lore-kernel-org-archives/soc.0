Return-Path: <SRS0=qS+w=NA=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E4EC4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 00:16:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 262A060F25; Mon,  9 Aug 2021 00:16:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B0560E96
	for <soc@kernel.org>; Mon,  9 Aug 2021 00:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6B0560E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id c16so30366857lfc.2
        for <soc@kernel.org>; Sun, 08 Aug 2021 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SXCwGy8W/lyhDJAw8LeWy5sqKGzOBkB2ozVZa+PP2Vs=;
        b=JolAq4UmFFsURHJrGBrfI0bS1rBwL8A8RT/8k0HuLQhvC0itcNAWl908S89VfZQ9ho
         1QTjsUffdLYiC4dDLCZXBOkjKMgQHwnizBw4koBc7FHT4Ru25CJc0twOVWtFXKJg1YFi
         QiwUNiyg1y1eC0PBHklj40JeDGM/hDJEK4DvHnDuF4+CXRbWD/vUh7KU5eqYmczB48xZ
         oTsTclkKKmJJ2lR2+5I2SyPcHGXMvonnJ2AVVnAWlgDXh/GJ7h/lWVDUBkHvjUJuvW6O
         Pr/LUfJ956tNjF7TSwUFHvx6c/HJXYtr6UvgfLYHtJstWS25MW1q3MPImzFFkfpPuS3l
         8p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SXCwGy8W/lyhDJAw8LeWy5sqKGzOBkB2ozVZa+PP2Vs=;
        b=Tu0wTPCXiKGg1dlQCM72TF+fGp2IjPOy9CELp4aDdqBANx8j6xYyd6oYM4MVMnG330
         KlT2hIXDkX/MoyPCDArOtehEsyuhWvuewfYWnDD+wFaCLmFvmqowN6lfSGdGmWMVfFG0
         /tAC4RFuejdNwj5CJgx31YnHUSrYjWvYbIEWTVW/iEadSt0B9cYEpnSBWG75tOdkfxRr
         tTKnMy2tVApORFCP7XigUhKnrpCs2CjrV/PfMZg7XVBkfrFpKbiJzJJ/CC3UF1II9lF3
         bav3Pwp6mixuFeAqzeHXBmkPc5BAsLU3efvEoUF3qIx0VLKD2TCzVBIIRRnEjO6zC/HZ
         enaA==
X-Gm-Message-State: AOAM5323ZoqA0UX6DF/S4MEdv87aBDILUDRaC5S4qgDN2Dyjddrp0nId
	VwPHr3GRDMgj+TvykfsTMhUuY2aA3OMGC9XKqN3JDBwUyjyiqQ==
X-Google-Smtp-Source: ABdhPJx74Fr1izS++bpq2IWd4Q6ZWz4T+hWD0gQz0NNxzvm/rjrpHOJIbX+AQfiYJh+Z7mY7L0J6vIcqc7iigdyuzDA=
X-Received: by 2002:a19:7b14:: with SMTP id w20mr15701715lfc.29.1628468168009;
 Sun, 08 Aug 2021 17:16:08 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Aug 2021 02:15:57 +0200
Message-ID: <CACRpkdY19AvWT--OcmEKbwFue_EcThVs7uZeHkzORten7xj-RA@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS updates for v5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Krzysztof Halasa <khalasa@piap.pl>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

this is the big DTS update for IXP4xx for kernel v5.15.

There is still some two device trees that need some more work
and some of these may need some additional hammering before
they are perfect(TM) but the basic functionality for all these systems
should be there and we can proceed to delete some boardfiles
as soon as we have successful boots on them all or we get tired of
waiting for someone to test them.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dts-arm-soc-v5.15-1

for you to fetch changes up to f2841e3ab175da656e9124a9b032daf5a86c7ade:

  ARM: dts: ixp4xx: Add a devicetree for Freecom FSG-3 (2021-08-09
01:55:59 +0200)

----------------------------------------------------------------
IXP4xx DTS file updates for the v5.15 kernel cycle:

- Fix up some (non-urgent) IRQ flags for the PCI buses.

- Add the second UART to the generic ixp4xx.dtsi

- Make use of the new expansion bus driver in all device
  trees with e.g. flash memory on the expansion bus.

- Adds the CF card slot to the Gateworks GW2358.

- Add new device trees for:
  - Iomega NAS 100D
  - D-Link DSM-G600
  - Netgear WG302v2
  - Arcom Vulcan
  - Gateworks Avila GW2348
  - Intel IXPD425 and siblings
  - Coyote and IXDPG425
  - Linksys WRV54G

----------------------------------------------------------------
Linus Walleij (14):
      ARM: dts: ixp4xx: Fix up bad interrupt flags
      ARM: dts: ixp4xx: Add devicetree for Iomega NAS 100D
      ARM: dts: ixp4xx: Move EPBX100 flash to external bus node
      ARM: dts: ixp4xx: Add devicetree for D-Link DSM-G600 rev A
      ARM: dts: ixp4xx: Add second UART
      ARM: dts: ixp4xx: Use the expansion bus
      ARM: dts: ixp4xx: Add devicetree for Netgear WG302v2
      ARM: dts: ixp4xx: Add Arcom Vulcan device tree
      ARM: dts: ixp4xx: Add Gateworks Avila GW2348 device tree
      ARM: dts: ixp4xx: Add CF to GW2358
      ARM: dts: ixp4xx: Add Intel IXDP425 etc reference designs
      ARM: dts: ixp4xx: Add device trees for Coyote and IXDPG425
      ARM: dts: ixp4xx: Add devicetree for Linksys WRV54G
      ARM: dts: ixp4xx: Add a devicetree for Freecom FSG-3

 arch/arm/boot/dts/Makefile                         |  14 +-
 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts      | 110 +++++++++++++
 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts    | 167 ++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts  | 145 +++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts   | 158 +++++++++++++++++++
 .../arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts | 172 ++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts  | 146 +++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts         |  72 +++++++++
 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts        | 125 +++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts   |  30 ++--
 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts  | 173 +++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts |  95 +++++++++++
 .../arm/boot/dts/intel-ixp42x-welltech-epbx100.dts |  84 +++++-----
 arch/arm/boot/dts/intel-ixp42x.dtsi                |   5 +
 .../arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts |  81 ++++++----
 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts        |  68 ++++++++
 arch/arm/boot/dts/intel-ixp43x.dtsi                |   6 +
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi         |  11 ++
 arch/arm/boot/dts/intel-ixp46x-ixdp465.dts         |  38 +++++
 .../boot/dts/intel-ixp4xx-reference-design.dtsi    | 132 ++++++++++++++++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |  44 +++++-
 21 files changed, 1784 insertions(+), 92 deletions(-)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp46x-ixdp465.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi

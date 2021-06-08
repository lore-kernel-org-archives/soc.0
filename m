Return-Path: <SRS0=BsQ+=LC=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB513C47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 02:31:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B522C610A1; Tue,  8 Jun 2021 02:31:33 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE28160FDC
	for <soc@kernel.org>; Tue,  8 Jun 2021 02:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE28160FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qv1-f51.google.com with SMTP id im10so9170487qvb.3
        for <soc@kernel.org>; Mon, 07 Jun 2021 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=X8PuT0wByoowhTlCtWl1lnUG0e3GVawCK0aUaYszsuo=;
        b=dqdPDJkDCuEZ1Ah4vxQrDsiTr1jeFn6P/47b9G4+fG+MLusPHgEkYcvdJv+Hy86dEu
         CSopIaCtJPCXLk0V8I/Z1KHKez+5U9UW5zhc9Xfdmpb0+Zj0jYe7qsMcDKVSbBMYeT5U
         0Jhzg+CKm3wSGZDmC56mF8Ci2uDqS/oPXXEuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=X8PuT0wByoowhTlCtWl1lnUG0e3GVawCK0aUaYszsuo=;
        b=sOWXJoujBHtPmu4xDJ6qzlwzE+6tZlLbk3VedOMIUwDvLD7hRSG5Oq1hk994xlvTTV
         prP3MK0DuEfF86v/yjJ0XGe5x+VrLlg+FqoFccjM0b8VaX80EJ6e/+datD2xmCtqX6FD
         GWUj0+KuVOpcIPB+QSBwTWVynf7/b6uAsBQm2a8q7DQ4VYeYrgkSNWp8VLXNs9oUeBnb
         KVd0xZs1bOepI/UTKX6MnTw4Q9H8xNSuW85H2x1FBRg4acvs43/sdJuRR96DW2/xGKmX
         KLndty9J5LPmq0IL7gIL0teDnsAWbiVaTXgtd+nh26mDdG/SxiZITBbOb+gPDvW0EOEA
         EfJg==
X-Gm-Message-State: AOAM532r0bKFb9SnH+SE8SVhALmo42bet20Esbvbf+6EAyjAhIF7HyvF
	1p4O1b3SPIBLLaYDOs2ILzapla3PwLdxNqigLnurG52OVtw=
X-Google-Smtp-Source: ABdhPJzhXY/SJseg0VPNHlw2tkO3JkY6p7RIGqOsi5vobBUn+f6MbbHLg2B78ZJxHCzP4QGFMNWGkgF2DhTAh+9rrsE=
X-Received: by 2002:ad4:4513:: with SMTP id k19mr5251381qvu.10.1623119491048;
 Mon, 07 Jun 2021 19:31:31 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jun 2021 02:31:19 +0000
Message-ID: <CACPK8XduV9F=piu1qh56g+YNOZOBYTW7b2Y=XVYafpYDwWmDYA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrew Jeffery <andrewrjeffery@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

A normal looking Aspeed pull request for the next merge window.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.14-devicetree

for you to fetch changes up to dd87684c7c9b82ad450cf063c58b4131074ad8f2:

  ARM: dts: aspeed: everest: Add pcie cable card indicator leds
(2021-06-07 13:38:55 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.14

 - IBM Rainier and Everest LED descriptions. These systems have a large
   number of LEDs attached via expanders.

 - Ampere Mt Jade updates, as OpenBMC bringup continues for this
   machine.

 - Updated 64MB flash layout for systems using OpenBMC on NOR root file
   systems.

 - Support for HS200 MMC on AST2600 EVB. This is only supported from A2,
   so a new device tree is added to support A0 and A1.

 - Update all command lines for early serial output.

----------------------------------------------------------------
Eddie James (1):
      ARM: dts: aspeed: Rainier 4U: Remove fan updates

Joel Stanley (2):
      ARM: dts: aspeed: Set earlycon boot argument
      ARM: dts: aspeed-g5: Add SCU phandle to GFX node

Quan Nguyen (3):
      ARM: dts: aspeed: mtjade: Enable OCP card support via NC-SI
      ARM: dts: aspeed: mtjade: Add PSU support
      ARM: dts: aspeed: mtjade: switch to 64MB flash layout

Santosh Puranik (1):
      ARM: dts: aspeed: Everest: Fix cable card PCA chips

Steven Lee (4):
      ARM: dts: aspeed: ast2600evb: Add sdhci node and gpio regulator
for A2 evb.
      ARM: dts: aspeed: ast2600evb: Add phase correction for emmc controller.
      ARM: dts: aspeed: ast2600evb: Add dts file for A1 and A0
      ARM: dts: aspeed-g6: Add pinctrl settings

Troy Lee (1):
      ARM: dts: aspeed: Grow u-boot partition 64MiB OpenBMC flash layout

Vishwanatha Subbanna (7):
      ARM: dts: aspeed: Everest: Add directly controlled LEDs
      ARM: dts: aspeed: everest: Add system level indicator leds
      ARM: dts: aspeed: everest: Add nvme and fan indicator leds
      ARM: dts: aspeed: everest: Add pcie slot indicator leds
      ARM: dts: aspeed: everest: Add dimm indicator leds
      ARM: dts: aspeed: everest: Add vrm and other indicator leds
      ARM: dts: aspeed: everest: Add pcie cable card indicator leds

 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    2 +-
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts        |   15 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  119 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   59 +-
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    |    2 +-
 .../dts/aspeed-bmc-arm-stardragon4800-rep2.dts     |    2 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |    2 +-
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      |    2 +-
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 2060 ++++++++++++++++++--
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   30 -
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts     |    2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |    2 +-
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  |    2 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |   10 +
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |   18 +-
 37 files changed, 2116 insertions(+), 253 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts

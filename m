Return-Path: <SRS0=M0Ae=TL=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3009C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 05:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B289C340F1; Mon, 28 Feb 2022 05:56:44 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4B2CC340E7
	for <soc@kernel.org>; Mon, 28 Feb 2022 05:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4B2CC340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id w7so11562998qvr.3
        for <soc@kernel.org>; Sun, 27 Feb 2022 21:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=6xc8Wlk7+FaQnbhDm/63togy1hcoxDMaWox1JtA0XU8=;
        b=MnpXaqrNLYda6gdjpPcqdmnNaF4ziI+u7yZbxS77qpgHnRAxVQmSm3AFEn8kqnIMas
         ri4XXQrF7oCaG1H7k6+YH4SGLBXpJamW0KCDY+z+zoeBBhiNNXD3IMrR1+Gs5XIOsCOE
         oeqOl/h/9SgGTikzEnkdu7bH2dQrDua0CPpGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=6xc8Wlk7+FaQnbhDm/63togy1hcoxDMaWox1JtA0XU8=;
        b=eksQtSsnTYD1aHHoJxt2fRnJJlTysEgsNaywTGPM6l+Yp6Rgm2uqmxBEX1Ipqq2y6E
         bS1XRmeCAgm5/DCXJ8dlUYSus1xFrgc2YNQinvgOASAmICtBT//O/dACXWIh0qbBqZoa
         c0vDA7SkwbHl62e/aHwAPezyst1r3ki/xVzsEPqIV1hSGNtpdheqXh99S+MtD1t0JOdr
         lyUeFeCe6MSuRY1JRZGT4UEbTnNRoKIygNv4gzf88x7FupWAmXZDNoC3nv4AjYRoBGVP
         AYXycttgfy7VRjUlmkOwVr1gQCGWhWAwGqtW9Oag2YwWH4EyDs6VOBxceyzmE0gI+xxD
         Qzzw==
X-Gm-Message-State: AOAM530bqUiJdXb9gz3BeAtRxaHdrfNXBytUjwnIVc6FFB6Bgj/ctAaa
	RxI0vpKoJ3aa0iJ4by4hAm8CXH91DDPEWPufeys1zckvQhhjnA==
X-Google-Smtp-Source: ABdhPJzDXu9DZCz+hqMVPfZ2AyE/cJra0N1jOLfN3vAnmS2EO8d8+f1POTjpJOshlctAIDo3t3e8HYECm4oOwLzh7Yk=
X-Received: by 2002:a05:6214:19c4:b0:432:8bd1:d8d7 with SMTP id
 j4-20020a05621419c400b004328bd1d8d7mr13117126qvc.65.1646027801875; Sun, 27
 Feb 2022 21:56:41 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 05:56:30 +0000
Message-ID: <CACPK8XdUXy5cnEDKmNirtByNMBGCjXwZpdKqJ0ytc0f34vzbBA@mail.gmail.com>
Subject: [GIT PULL v2] ARM: aspeed: devicetree changes for 5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the aspeed bits for v5.18, with the tag on the correct branch
this time.

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.18-devicetree-2

for you to fetch changes up to 09603f805ab69dbf18015363c2a00001647e89f2:

  ARM: dts: aspeed: p10bmc: Enable ftrace in ramoops buffer
(2022-02-28 15:46:12 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.18

 - New machines

  * Quanta S6Q AST2600 BMC
  * ASRock ROMED8HM3 AST2500 BMC, a half-width, single-socket Epyc
    server board

 - Facebook's Bletchley has a large update for production hardware

 - Ampere's Mt Jade has a number of updates

 - Small clenaups and additions for Everest, Rainier and Tacoma, and the
   flash layout

----------------------------------------------------------------
Andrew Geissler (2):
      ARM: dts: aspeed: everest: Label reset-cause-pinhole GPIO
      ARM: dts: aspeed: rainier: Label reset-cause-pinhole GPIO

Andrew Jeffery (1):
      ARM: dts: aspeed: tacoma: Clean up KCS nodes

Eddie James (3):
      ARM: dts: aspeed: rainier and everest: Enable UHCI
      ARM: dts: aspeed: tacoma: Remove CFAM reset GPIO
      ARM: dts: aspeed: p10bmc: Enable ftrace in ramoops buffer

George Hung (1):
      ARM: dts: aspeed: Add device tree for Quanta S6Q BMC

Joel Stanley (3):
      ARM: dts: aspeed: rainier: Remove SPI NOR controllers
      ARM: dts: aspeed: rainer: Add RTC battery gpio name
      ARM: dts: aspeed: everest: Add RTC battery gpio name

Potin Lai (10):
      ARM: dts: aspeed: bletchley: Switch sled numbering to 1-based
      ARM: dts: aspeed: bletchley: Separate leds into multiple groups
      ARM: dts: aspeed: bletchley: Update gpio-line-names
      ARM: dts: aspeed: bletchley: Update fmc configurations
      ARM: dts: aspeed: bletchley: Switch to spi-gpio for spi2
      ARM: dts: aspeed: bletchley: Add interrupt support for sled io expander
      ARM: dts: aspeed: bletchley: Add shunt-resistor for ADM1278
      ARM: dts: aspeed: bletchley: Add INA230 sensor on each sled
      ARM: dts: aspeed: bletchley: Enable mdio3 bus
      ARM: dts: aspeed: bletchley: Cleanup redundant nodes

Quan Nguyen (5):
      ARM: dts: aspeed: mtjade: Enable secondary flash
      ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
      ARM: dts: aspeed: mtjade: Update host0-ready pin
      ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
      ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node

Zev Weiss (2):
      ARM: dts: Fix OpenBMC flash layout label addresses
      ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC

 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |  26 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts  | 259 +++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 320 +++++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  11 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  33 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |  12 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts        | 610 +++++++++++++++++++++
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |   2 +-
 arch/arm/boot/dts/openbmc-flash-layout.dtsi        |   2 +-
 10 files changed, 1112 insertions(+), 165 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts

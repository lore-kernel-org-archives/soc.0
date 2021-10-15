Return-Path: <SRS0=rSjf=PD=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAA6C433F5
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 04:01:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 933AE610E5; Fri, 15 Oct 2021 04:01:44 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B35D610D1
	for <soc@kernel.org>; Fri, 15 Oct 2021 04:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B35D610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id b12so7754853qtq.3
        for <soc@kernel.org>; Thu, 14 Oct 2021 21:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ECBOEkwsFwUl/LQLvdaX8K1iYZNdAdzVqfvemry/2Js=;
        b=gIXasXOqP3ZyNyTBXLwyCySfZifxVIYOiEQJmV+nxk/PHLSxGrhrIGcgesEMSwYtbw
         rzulIvfb37aOBwzkHvO/2jsQxTxGQCaJN3hoFAMCgszHfdGgpZNds6+SChBW9PRQorza
         /pZ8u0n1z1AHojts8kU0xMlPWIGuBgf7+oBjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ECBOEkwsFwUl/LQLvdaX8K1iYZNdAdzVqfvemry/2Js=;
        b=4cNXcVlfsDi/UucrVB0TWS3dVmB8Vp6zNA+EezugFK+lKysUikbys6ZhxLRuslUAhX
         a8DXxZFzYPoMndrrDeUuv+SEHI6XEqmH8lAqUfpP4KeA+3Af9tap1/IyOQ4Zz5r/8neU
         LUhYiPKUo7uxuX52oJOwqAqO36v0KnEXwg9Bu3VN6bGWSIPk38+X/DQXOitKVTlmMpp1
         Kzt8qhT8MnbB631BPVnvG2xy749zsq8KKjZjxXzIlxAxxhV713xnZx+LpbARGV/KAySu
         4VBfXmJFVQ/4zDlMh7szYsdtw2K012VW4EDjQofbzRsGBwViiJiCT2pyGgjkE82A1nNY
         yqhg==
X-Gm-Message-State: AOAM532v920nhT2FNEXqjpr+Rf3gXW8ZuWVju6RgahJLMzJOEAcWJZH+
	9CtpVXCyzfeipkIz8K5q0t8ClF8gG79FdripnSY7QuXsAo0=
X-Google-Smtp-Source: ABdhPJz5ihCwKgESTZKbaaX82wih0wrKU9fUlqSYcBkxd2H4K+BVYtLy0hdfzMJuRZWu1v78+2JJaDVjGuxV09hydak=
X-Received: by 2002:a05:622a:1451:: with SMTP id v17mr11094292qtx.25.1634270501310;
 Thu, 14 Oct 2021 21:01:41 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Oct 2021 04:01:30 +0000
Message-ID: <CACPK8XdrMzY9tzdof7KpzxKquTo7GcWW4N9Zqwtmmu73C7htXA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrewrjeffery@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the aspeed device tree changes for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-devicetree

for you to fetch changes up to 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62:

  ARM: dts: aspeed: fp5280g2: Use the 64M layout (2021-10-14 18:25:17 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.15

 - New machines:

  * TYAN S7106 BMC, a x86 server from about four years ago

 - Descriptions for the AST2600 ADC, which now has an upstream driver

 - Lots of GPIO line names. The OpenBMC project has adopted a scheme for
   naming the lines, and new additions will follow this guide

 - New I2C devices for Rainier, Everest, EthanolX, Mt Jade

 - Fixes for fp5280g2 which has seen some recent development, including
   the addtion of a QEmu machine for testing

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: dts: aspeed: rainier: Add power-config-full-load gpio

Ben Tyner (3):
      ARM: dts: rainier: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line B6

Eddie James (3):
      ARM: dts: aspeed: rainier: Add system LEDs
      ARM: dts: aspeed: everest: Add I2C bus 15 muxes
      ARM: dts: aspeed: Add ADC for AST2600 and enable for Rainier and Everest

George Liu (1):
      ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding

Isaac Kurth (1):
      ARM: dts: everest: Add 'factory-reset-toggle' as GPIOF6

Joel Stanley (1):
      ARM: dts: aspeed: p10bmc: Define secure boot gpio

John Wang (1):
      ARM: dts: aspeed: fp5280g2: Use the 64M layout

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Add FRU EEPROM

Oskar Senft (1):
      ARM: dts: aspeed: Add TYAN S7106 BMC machine

Quan Nguyen (1):
      ARM: dts: aspeed: mtjade: Add some gpios

 arch/arm/boot/dts/Makefile                       |    3 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts    |    5 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts   |   21 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts     |  182 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts     | 1571 +++++++++++++++++++---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts |    9 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts      |  488 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi                 |   20 +
 8 files changed, 2075 insertions(+), 224 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

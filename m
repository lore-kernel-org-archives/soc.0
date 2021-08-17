Return-Path: <SRS0=tEDI=NI=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354AFC4338F
	for <soc@archiver.kernel.org>; Tue, 17 Aug 2021 07:52:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1783260F5E; Tue, 17 Aug 2021 07:52:08 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3482C60EFF
	for <soc@kernel.org>; Tue, 17 Aug 2021 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3482C60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id x1so2991043qtw.5
        for <soc@kernel.org>; Tue, 17 Aug 2021 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=sYsUG/NPZIBujIh9hacdzMbIEijzFzCoj/G7iIt4alA=;
        b=WTQvyBhSFaH0kQ9XuClZSoEzRDenz7OtNePSY1feYXSOiMhWE2Gux6tItSCNdsIqlb
         RRt5k3y2zkMKlOUbnPvL9JrtNG9D3vFfcYPrV/eEONn3dLgoHQlO2Y+XKZn3Tkyuk00n
         ADBEO8LK3V4w39Slu2yfTdkl+di5UEF26Uauw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=sYsUG/NPZIBujIh9hacdzMbIEijzFzCoj/G7iIt4alA=;
        b=G7WMaSGFBC1pc35l0vl0fzTQIy2fPHceOP+yIT8kMGStXAHw2Odn4St8C7rHs72yx2
         4xESIIvrObWq/zxceuxXA/r3z/RB2VSKIhPLVbIKuuHyO6em+fSktT6910eXW9iod8xV
         IRWtZmtSjZvSyKd5qjBpAzF15edWcNNnUgmDLGBDOpM7G344Y1vYg2dq7SRIloQ/UjF6
         pFcX3LBavRaG2VJ56KX4YxuEWiDAuwxcchL4RHmOQZKuSO1CevMXAzdB9a4Ljk0H6U6I
         iVicI16Y/R/2Hs7K9vVfEjZvlh3pqtQinn1F2RW18f0LdYJF6EajICmTPSZoTUie05bq
         l00g==
X-Gm-Message-State: AOAM5300bA4XEUVZuO2zP9gDUANkLckIylv03thXOvJwIq0FVQ7KIZM6
	SVlly0rDPaFu7a2c8TYqv19mjcqJik8LH9wZWUCa6w6JAos=
X-Google-Smtp-Source: ABdhPJw8feCldLj7Vhc6iKE3JJaHj+my9WkV2PsvQhwYUggdZ9tUjdGKV0GGDotySpd7kIReJnHO1FO9/bXwb6aGkEY=
X-Received: by 2002:ac8:5bcc:: with SMTP id b12mr1879604qtb.176.1629186725533;
 Tue, 17 Aug 2021 00:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 07:51:54 +0000
Message-ID: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the aspeed changes for 5.15.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-devicetree

for you to fetch changes up to 6b8b31269898b8891f1f3a95578ceeb109393e23:

  ARM: dts: aspeed: p10bmc: Add power control pins (2021-08-17 13:52:46 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.15

 - New machines

  * Facebook's Cloudripper
  * Facebook's Elbert
  * Facebook's Fuji

  All three carry the description of "Facebook's next generation switch
  platform with an AST2600 BMC integrated for health monitoring
  purpose."

  They share a 128 MB SPI NOR flash layout that is also used by some
  older platforms.

  * Inspur's NF5280M6, an x86 platform server with an AST2500-based BMC

 - SGPIO updates including AST2600 support

 - GPIO descriptions for the IBM AST2600 machines

 - Pinctrl fix

 - Updates to Facebook's AST2500 based machines

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: everest: Add phase corrections for eMMC

Dylan Hung (1):
      ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi

Jim Wright (1):
      ARM: dts: aspeed: p10bmc: Add power control pins

Joel Stanley (3):
      ARM: dts: rainier, everest: Add TPM reset GPIO
      ARM: dts: aspeed: tacoma: Add TPM reset GPIO
      ARM: dts: aspeed: ast2500evb: Enable built in RTC

Ping Guo (1):
      ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine

Steven Lee (4):
      dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
      dt-bindings: aspeed-sgpio: Add ast2600 sgpio
      ARM: dts: aspeed-g6: Add SGPIO node.
      ARM: dts: aspeed-g5: Remove ngpios from sgpio node.

Tao Ren (12):
      ARM: dts: aspeed: Enable ADC in Facebook AST2400 common dtsi
      ARM: dts: aspeed: wedge40: Remove redundant ADC device
      ARM: dts: aspeed: galaxy100: Remove redundant ADC device
      ARM: dts: aspeed: wedge100: Enable ADC channels
      ARM: dts: Add Facebook BMC 128MB flash layout
      ARM: dts: aspeed: wedge400: Use common flash layout
      ARM: dts: aspeed: Common dtsi for Facebook AST2600 Network BMCs
      ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Elbert (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
      ARM: dts: aspeed: minipack: Update flash partition table
      ARM: dts: aspeed: cloudripper: Add comments for "mdio1"

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   77 ++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |   46 -
 arch/arm/boot/dts/Makefile                         |    4 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    4 +
 .../boot/dts/aspeed-bmc-facebook-cloudripper.dts   |  544 +++++++++
 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts   |  185 +++
 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts     | 1251 ++++++++++++++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts |    8 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts |    5 +
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts |   48 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |    4 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts   |  691 +++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 -
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |    4 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   28 +
 .../boot/dts/ast2400-facebook-netbmc-common.dtsi   |    4 +
 .../boot/dts/ast2600-facebook-netbmc-common.dtsi   |  169 +++
 .../boot/dts/facebook-bmc-flash-layout-128.dtsi    |   60 +
 22 files changed, 3033 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsilin

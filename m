Return-Path: <SRS0=nqVE=RH=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A151C433FE
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 01:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9EB1C36AEC; Wed, 22 Dec 2021 01:54:33 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6452C36AEB
	for <soc@kernel.org>; Wed, 22 Dec 2021 01:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6452C36AEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id de30so957029qkb.0
        for <soc@kernel.org>; Tue, 21 Dec 2021 17:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=HFSYhlP839ztZdYk29Ex144WAucP2wu8MzPmrNXTlQA=;
        b=huc845Tn47CEh0haij4OJsh57TON22ZNkRaYpXqQlh9aCJAjs8sP8Fl/0k47xF82tr
         vRiWHtUdzQG7gZh/10V7K6RHG3hjv483l2ACcs4oYMHGSSH02skT0/ZUx8HdKzOOkMZ6
         3akzt+zq+ikss1bjqvR9CEo22ltUrag85BDY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=HFSYhlP839ztZdYk29Ex144WAucP2wu8MzPmrNXTlQA=;
        b=WEPBQRFEHe6wlljHnmcuppObSm3T2dTtcSDPJCDEEkJeyOZUn53aY+admhtzmLyfXF
         FPRgNb3bc+wXPsZ/Yv2sc1rRQhqbNjobsiknlZIyP7BDMsh19SkUMDEY5WldVPt7x0HX
         +zj3IDPo4Gm/HK10qkawkA2EgEY61F/ON1h4SUeygI4dM9K61RXThV91gXS4KeRvZlSz
         6Kg9rAcfmr/stZSSk2f6BKc0HVQTm3pkeFd5iQSXf3LmL2OzdgtN7aYX0RvkcHZ3CYU6
         5SMmWeAbvbxGRoUlZvuXwaspWhkIyVrxeoJUefP4Og0fG8ovqCLEtC3Y5KEPilApS5a2
         ZaBA==
X-Gm-Message-State: AOAM531tlsjB20Ud88/peFKSgHIBwXiZYFetB3rAmHEDhoybk3l4hV2v
	ov05aJ3vMPiviqU8StBKl6mSBn7GBBafh7z3aZt/I+d7Nso=
X-Google-Smtp-Source: ABdhPJwpXXAdFHNTEtfPzvHirKYCeb2CCGjAds6+T4yOYMQEzs1ifEBbU8o9BULp7bPgbte+1SZj3AVa8aC5mhHLDpg=
X-Received: by 2002:ae9:ef11:: with SMTP id d17mr779610qkg.347.1640138070840;
 Tue, 21 Dec 2021 17:54:30 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:54:19 +0000
Message-ID: <CACPK8Xd1RfMLRbwBWqo8nm=w0V2AubmzraVW3h==XBcs21+mnA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.17
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the aspeed device tree changes for v5.17.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.17-devicetree

for you to fetch changes up to 45cd8bbaaa18ab1c4f4387529db72b33be463197:

  ARM: dts: aspeed: add LCLK setting into LPC KCS nodes (2021-12-21
15:33:10 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.17

 - New machines:

  * TYAN S8036 AST2500 BMC
  * Facebook Bletchley AST2600 BMC
  * Yadro VEGMAN series of AST2500 BMC for x86 servers

 - LPC clock additions, to fix long standing missed irq on boot issue

 - Secure boot controller description for AST2600

 - Alternate chip flash layout, used by Bytedance's G220A

 - Various additions to Rainier, Everest, S7106

----------------------------------------------------------------
Ali El-Haj-Mahmoud (1):
      ARM: dts: aspeed: Add TYAN S8036 BMC machine

Andrei Kartashev (2):
      dt-bindings: vendor-prefixes: add YADRO
      ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC

Eddie James (2):
      ARM: dts: aspeed: p10: Enable USB host ports
      ARM: dts: aspeed: p10: Add TPM device

Howard Chiu (1):
      ARM: dts: aspeed: Adding Facebook Bletchley BMC

Jae Hyun Yoo (3):
      ARM: dts: aspeed: add LCLK setting into LPC IBT node
      dt-bindings: ipmi: bt-bmc: add 'clocks' as a required property
      ARM: dts: aspeed: add LCLK setting into LPC KCS nodes

Joel Stanley (2):
      dt-bindings: aspeed: Add Secure Boot Controller bindings
      ARM: dts: aspeed: Add secure boot controller node

Lei YU (2):
      ARM: dts: Add openbmc-flash-layout-64-alt.dtsi
      ARM: dts: aspeed: g220a: Enable secondary flash

Oskar Senft (2):
      ARM: dts: aspeed: tyan-s7106: Update nct7802 config
      ARM: dts: aspeed: tyan-s7106: Add uart_routing and fix vuart config

Quan Nguyen (2):
      ARM: dts: aspeed: mtjade: Add I2C buses for NVMe devices
      ARM: dts: aspeed: mtjade: Add uefi partition

 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml |  37 +
 .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   7 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 267 ++++++++
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |  12 +
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 756 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  17 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  11 +
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts        |  40 ++
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts        | 470 +++++++++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts       | 149 ++++
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts       | 255 +++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts       | 154 +++++
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi           | 311 +++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   1 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   5 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  10 +
 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi |  35 +
 19 files changed, 2539 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi

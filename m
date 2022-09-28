Return-Path: <SRS0=lNGk=Z7=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12424C32771
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 04:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC828C433C1; Wed, 28 Sep 2022 04:44:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D368CC433D6
	for <soc@kernel.org>; Wed, 28 Sep 2022 04:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D368CC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id cc5so17883188wrb.6
        for <soc@kernel.org>; Tue, 27 Sep 2022 21:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date;
        bh=1PfKcGXTKrr3UV/m0HPi+qVvDseRBuYOzsnEs9kMkLA=;
        b=iDCAmKSRu5xkdoyJpzhMzzv3YMUHwtEfPaG89XbhRxSmEnEHcKvCNzYSDhOQL6UU7O
         DkUaD0lxqDYxTlegIFaYbRRickvjfCoUGfOMu2LIWPQmS9rHZAv7rH5aOHNpR+8pr4MQ
         AoswscjpFoHrpd2r+OhTHgCwUVSsTHzs6zbi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1PfKcGXTKrr3UV/m0HPi+qVvDseRBuYOzsnEs9kMkLA=;
        b=Y7P6KLKeD8T+kw858VRJ5mDJVpLXkHMczg1JzwvAVyqop3JBmr2qHMUBb3UDxIkj+5
         ku7ToaVDeRv6Dvbh/+ne7GPCUSXv/23ZeCtqKlUL+5fM3AqaQiEHo4majOOOpS+MrLZz
         MfRPSM3o772luBn5Q+bpeCl6wznkv7FryYGUqRYuJbqmPCC8RjDq9TJhmHAJKMBWkpu7
         njGDl7wfVwvUO2SQuuk0x69COrcROXVCFRUnpYzdPZmoS+ZDnfTZT5v/jxl7fuAAwnCI
         CHXKEPQk5H9pNwbdKmsC4rvU8Z0wMRU83bEzSAeZtwJ8sQ5bQybVMB17wJHz3EPxnGhk
         i4pQ==
X-Gm-Message-State: ACrzQf3FLFsGgSCMDzBDhn+iRSLP2S9oP2OeEvoRIQJBktDB9iKlZ6E4
	+LLm885oO2y1MZtr6k2gBHbDnYEgVMOp3QE7Z52CGpkb1A9Qsg==
X-Google-Smtp-Source: AMsMyM7SZLOgC1tGxnPlSxrCi21CpjzhGRnBvxUSkNfPyahkIsl/3XPWtD96QSQCuIeLoRGJIH88OAa9Fqfq30WmPj4=
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr18925621wrt.549.1664340263678; Tue, 27
 Sep 2022 21:44:23 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 04:44:12 +0000
Message-ID: <CACPK8Xepnci+f+7Pi1jtXod8Jmt+OnJYfDRENjiP-xDBQwFCVg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.1
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello soc maintainers,

Here are the aspeed device tree changes for v6.1.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868=
:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.1-devicetree

for you to fetch changes up to 73b4476562de2a26debc076801ca28148076c79f:

  ARM: dts: aspeed: ast2600-evb-a1: Add compatible (2022-09-28 12:31:40 +09=
30)

----------------------------------------------------------------
ASPEED device tree updates for 6.1

 - New machines

  * AMD's DaytonaX AST2600 BMC, for the amd64 server
  * Ampre's Mt. Mitchell AST2600 BMC, for the AmpereOne arm64 server

 - Fixes and updates for bletchley, mtjade, yosemitev2 and the ast2600-evb

----------------------------------------------------------------
C=C3=A9dric Le Goater (1):
      ARM: dts: aspeed: ast2600-evb: Enable Quad SPI RX tranfers

Joel Stanley (3):
      ARM: dts: aspeed: ast2600-evb: Update I2C devices
      ARM: dts: aspeed: ast2600evb: Fix compatible string
      ARM: dts: aspeed: ast2600-evb-a1: Add compatible

Karthikeyan Pasupathi (2):
      ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
      ARM: dts: aspeed: yosemitev2: Disable the EEPROM driver

Ken Chen (1):
      ARM: dts: aspeed-g6: Enable more UART controllers

Konstantin Aladyshev (2):
      dt-bindings: arm: aspeed: document AMD DaytonaX
      ARM: dts: aspeed: Add AMD DaytonaX BMC

Potin Lai (2):
      ARM: dts: aspeed: bletchley: Add USB debug card IPMB node
      ARM: dts: aspeed: bletchley: Remove hdc1080 node

Quan Nguyen (3):
      dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC
      ARM: dts: aspeed: mtjade: Remove gpio-keys entries

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   2 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts        |   2 +-
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  25 +-
 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts      | 319 ++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |  95 ----
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 546 +++++++++++++++++=
++++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  13 +-
 .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    |  15 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  56 +++
 10 files changed, 963 insertions(+), 112 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

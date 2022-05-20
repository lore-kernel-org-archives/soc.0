Return-Path: <SRS0=MgbM=V4=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9934EC433EF
	for <soc@archiver.kernel.org>; Fri, 20 May 2022 03:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D94AC385A9; Fri, 20 May 2022 03:35:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CE7CC385AA
	for <soc@kernel.org>; Fri, 20 May 2022 03:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CE7CC385AA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id k126-20020a1ca184000000b003943fd07180so3663054wme.3
        for <soc@kernel.org>; Thu, 19 May 2022 20:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=RsspTnky8wBT4eD5g1aW2BHX4lOGWhiOULBVmitpB44=;
        b=NmqrYE2cIoYRISM5bg4s6/mcOkVD5so63MhAc3RlzIRzi/V+1jt8GDHiwjvJHGKEBd
         pTUv1ulmOUWotXjSJ7sLRYpFxgNyWwNn8xTu10ojbvQHR93icUFEz4tS5uoGL2m9YLYM
         gKX7IJqKQ9JT9BG/XUELPZNG1pIV6S8bzER8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=RsspTnky8wBT4eD5g1aW2BHX4lOGWhiOULBVmitpB44=;
        b=4zC1O/mPlivKpc8N4y3NMP8S6PeMlFt8Vzsxdsm/0IoL5oLIGDq6vqm1D/mi2QEsAy
         EKFIECeAneGgqodRH0DZOG4C2paoETErgwgBw0/wfhPA4k4/GsZYbdxviIczjX3rrl6Y
         hW2BcnhDNosT0ilFXxsVUKGhQuOsPsPkWzjLx5Fp0h2MUh2yOAcW6oEDxH39pU9HPFzl
         XhnLJSiWoT+BRG+f0SguAZtXWN52IdQwByOFDDgs3hrBN/tZ0FuIMfwimh5ZhdRtpUZT
         L/OKHySkXaVlRhPZTfCwG8yAor4z/5wtWYa+RZi2wsCvQGiCn1FkLxPD5keggXacsKwN
         0B6w==
X-Gm-Message-State: AOAM533HIcfEbiDA+CqJ7rB1qX+sboow+Bs2QhTbzcu10VP5FNM6DcbS
	E7XLe34f5Sw2/+95jtk7MQ9I+dTiqoEFp3QVVDNmERz8CkI=
X-Google-Smtp-Source: ABdhPJzmke6Q3ll9vqmiN/8q3kK3N7WRTqtonBvGVGuPyGiHAsa5U75PZxMDKbImXBqe/Y4a91kgWDNfRbQBWINYoic=
X-Received: by 2002:a7b:c017:0:b0:394:5631:62bc with SMTP id
 c23-20020a7bc017000000b00394563162bcmr6936908wmb.190.1653017702807; Thu, 19
 May 2022 20:35:02 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 May 2022 03:34:50 +0000
Message-ID: <CACPK8XfUmFxU8Y6C+aZ2+=dT7=fCfs2=2_aYqyRjoXCoeQaUWQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.19
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Soc maintainers,

Here is the (second) device tree pull request for aspeed socs. The
first ended up being the fixes I sent, which Arnd decided to put in
-next.

The following changes since commit 32e62d1beab70d485980013312e747a25c4e13f7=
:

  ARM: dts: aspeed: Add video engine to g6 (2022-04-13 11:53:53 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.19-devicetree

for you to fetch changes up to 8dc7aa0a7246ad0f718d91d09b4d48460508627b:

  ARM: dts: aspeed: ast2600-evb: Enable GFX device (2022-05-19 17:18:56 +09=
30)

----------------------------------------------------------------
ASPEED device tree updates for 5.19

 - New machine:

    * Nuvia's DC-SCM BMC

 - Enable AST2600 GFX, the BMC-driven graphics device

 - Add a bunch of devices for the AST2600 EVB

 - Updates to the AST2600 Bletchley machine

 - Backwards compatible changes to support the new spi-mem based SPI NOR
   driver

----------------------------------------------------------------
Brandon Wyman (1):
      ARM: dts: aspeed: everest, rainier: Add power-ffs-sync-history GPIO

C=C3=A9dric Le Goater (2):
      ARM: dts: aspeed: Adjust "reg" property of FMC/SPI controllers
      ARM: dts: aspeed: Enable Dual SPI RX transfers

Graeme Gregory (1):
      ARM: dts: aspeed: Add Nuvia DC-SCM BMC

Howard Chiu (3):
      ARM: dts: aspeed: ast2600-evb: Enable RX delay for MAC0/MAC1
      ARM: dts: aspeed: ast2600-evb: Enable video engine
      ARM: dts: aspeed: ast2600-evb: Enable virtual hub

Joel Stanley (2):
      ARM: dts: aspeed: Add GFX node to AST2600
      ARM: dts: aspeed: ast2600-evb: Enable GFX device

Neal Liu (1):
      ARM: dts: aspeed: Add USB2.0 device controller node

Potin Lai (7):
      ARM: dts: aspeed: bletchley: enable ehci0 device node
      ARM: dts: aspeed: bletchley: switch spi2 driver to aspeed-smc
      ARM: dts: aspeed: bletchley: Enable mdio0 bus
      ARM: dts: aspeed: bletchley: update gpio0 line names
      ARM: dts: aspeed: bletchley: add pca9536 node on each sled
      ARM: dts: aspeed: bletchley: add eeprom node on each sled
      ARM: dts: aspeed: bletchley: add sample averaging for ADM1278

Tao Ren (1):
      ARM: dts: aspeed-g4: Set spi-max-frequency for all flashes

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  39 ++++-
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 182 ++++++++++++++++-=
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   2 +-
 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts      | 190 +++++++++++++++++=
++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  16 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  16 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  38 ++++-
 9 files changed, 431 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts

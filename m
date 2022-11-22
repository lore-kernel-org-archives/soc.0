Return-Path: <SRS0=3AKP=3W=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3354C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 00:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA9E1C433D7; Tue, 22 Nov 2022 00:57:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95A20C433D6
	for <soc@kernel.org>; Tue, 22 Nov 2022 00:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95A20C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id b12so8653564wrn.2
        for <soc@kernel.org>; Mon, 21 Nov 2022 16:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLNpOC+EKWhHYX3ClfPrj2d8ABDTkig29CHfa3CG5z0=;
        b=Wn7LxHxNYEUcNzh5Yi6H7zMJ37MUheNt1yCSxSgFx4Nd19to9uIfW10w5VhxWTOa2u
         /I+0m0Glugebfu3wA5PTRVCTuY/bPYaxKjsXTyqqRMpADGP3NidUypMw8zvYzpX2n9Rg
         AMXXNT97A2/YSYROnpkAlf13MuN4Iu/wNv6TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLNpOC+EKWhHYX3ClfPrj2d8ABDTkig29CHfa3CG5z0=;
        b=ua0K3IbZJp1T2sgjok3LPi7U9Y9SuRU0/tGxHFyZ8hRkXmLYswrnBWqpyP3F21jpG6
         33MPUf5Se+PVUeSVmo9AiBPaxuPKNDVVKLvhJuPuWhYDwHd6TkMOKXfCtpZZDBuCJCsq
         scBv/TfVhjdMX5j00Lu69wnyi+2yPh0ScBuKQr5UKx2apKYPbYx+oQGEPfPs1xiXpiIC
         yyFSzh/SwTBUCHn7+WXPDe/s0Zq7AmO/vvi5+6Tee8UCbYEtZseRPpYUvOJSBPYtQ7MO
         LBgxCd6ywfhQWR68n5ndKs0eRgG2KzbxrziDJH4zjGlGfJ4bbtZrvnluQMK8tHJ3NFr0
         cQ6g==
X-Gm-Message-State: ANoB5plmFkd1JHvrzQFTINoETA/+3GwOTkNLKNvJzr27jmfxyFALpcdF
	rlqwN/F4S8U9pVRAKnfboctgDkxY0g/BqkSWUCpk/5numO8=
X-Google-Smtp-Source: AA0mqf4zegYOqBDXBohUs5DvvquRK2r81ahOv/8Tc5r8so4t4oYa7n5dSAlPXleW16X3sA1ToHjCec/d5wZBzNh5ZAU=
X-Received: by 2002:a5d:6642:0:b0:236:6a28:eeda with SMTP id
 f2-20020a5d6642000000b002366a28eedamr12373629wrw.315.1669078660427; Mon, 21
 Nov 2022 16:57:40 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Nov 2022 00:57:29 +0000
Message-ID: <CACPK8Xfsc8BaL_qAgV+3Rk-AFcQoDVfTpMzHvq_rR-UYqwpNNQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello soc maintainers,

Here are the aspeed device tree changes for v6.2.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.2-devicetree

for you to fetch changes up to 3973fc0f9f07fc4186bb581014404fbf77a659b5:

  ARM: dts: aspeed: mtjade: Add SMPro nodes (2022-11-20 20:47:32 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.2

 - New machines

  * IBM Bonnell AST2600 BMC, for a Power10 server
  * Delta AHE-50DC AST1250 BMC, for a 1U Open19 power shelf

 - Removed machines

  * IBM Mihawk AST2500 BMC, a Power9 server similar to Witherspoon

 - Fixes and updates for bletchley, mtjade/mtmitchell, rainier/everest

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: dts: aspeed: rainier,everest: Move reserved memory regions

Eddie James (2):
      ARM: dts: aspeed: Add IBM Bonnell system BMC devicetree
      ARM: dts: aspeed: p10bmc: Add occ-hwmon nodes

Joel Stanley (1):
      ARM: dts: aspeed: Remove Mihawk

Potin Lai (7):
      ARM: dts: aspeed: bletchley: Change LED sys_log_id to active low
      ARM: dts: aspeed: bletchley: Disable GPIOV2 pull-down
      ARM: dts: aspeed: bletchley: Bind presence-sledX pins via gpio-keys
      ARM: dts: aspeed: bletchley: Update fusb302 nodes
      ARM: dts: aspeed: bletchley: Update and fix gpio-line-names
      ARM: dts: aspeed: bletchley: Enable emmc and ehci1
      ARM: dts: aspeed-g6: Add aliases for mdio nodes

Quan Nguyen (2):
      ARM: dts: aspeed: mtjade,mtmitchell: Add BMC SSIF nodes
      ARM: dts: aspeed: mtjade: Add SMPro nodes

Santosh Puranik (1):
      ARM: dts: aspeed: rainier: Fix pca9551 nodes

Zev Weiss (2):
      dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
      ARM: dts: aspeed: Add Delta AHE-50DC BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   12 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts |    4 +
 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts     |  418 ++++++
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  213 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts       |  921 +++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   57 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |  244 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        | 1381 --------------------
 arch/arm/boot/dts/aspeed-g6.dtsi                   |    4 +
 11 files changed, 1705 insertions(+), 1553 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
 delete mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts

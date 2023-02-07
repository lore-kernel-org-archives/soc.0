Return-Path: <SRS0=NaiB=6D=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2025FC636CD
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 03:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFE11C433D2; Tue,  7 Feb 2023 03:51:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DD87C433EF
	for <soc@kernel.org>; Tue,  7 Feb 2023 03:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DD87C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id jg8so330772ejc.6
        for <soc@kernel.org>; Mon, 06 Feb 2023 19:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1kuhwo6Br/SXIA2IZ0bvJrbV39UIM6SkgEHl7l1GqPY=;
        b=dT7Q1Y3yd0f3DfyVEQW4gse6XFUUvZZZCepxJSb52yaVwBxAuotMAH51inwzxhoG9m
         mvogpN897vxwD8NIgQYd+4C5enARq2jPPnX/oAyp3ocmcHgMZoNqP+6jwBrfk7aMYDbt
         jeeeNdfB9zl3Np1ocU1y49Z241AjqChYefAvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kuhwo6Br/SXIA2IZ0bvJrbV39UIM6SkgEHl7l1GqPY=;
        b=AKNtbMuPmv8MwESNHgAUGa2OKaGZwt+JXJsEzEFIldTf8Xh1N26nw2Oni/MX/wr9Wv
         OBDV8eNMbuXr3MYtX52W6jaSP+LyN8xfcV3qd5kn+OigKZO5rPvzlGyJEtuasGwRPXhm
         BgEP6IPSUi3GxpjCut8KfXSXmk6P6l6FTZOt2H3NzykVZlU842hdu2BfpUWERE/n3Gk9
         lImqIcei3SDtac0mcxWzI6p6xQeZZ+sIy1zWbu49aU+CgIevHjBSocK4CqiQTgusJosZ
         mXiDAl4SWzUVnmRqAFZC5y4DhSFoUUfx+h0vzjVtP/oXJTS6cAOE07TtXa0sHU5hGAeu
         0cQg==
X-Gm-Message-State: AO0yUKVG3tZZnG24qYu1mO6+eiS79gK0c4xWOJqEtu6Dt1d18oFGSt3E
	CXgQnCsHbp1Bemh2BI7ajnmwsmhcbNNhzmXLG9EPstK9
X-Google-Smtp-Source: AK7set97XHlhlULHvnXEiUh8JWU6vAwteZZtj4sMBmGkmqbiHYapUggiQvtpzoNKI/yCe5rSix03N+XHjRajewMIA7U=
X-Received: by 2002:a17:906:3013:b0:885:2313:c8b5 with SMTP id
 19-20020a170906301300b008852313c8b5mr482951ejz.201.1675741874649; Mon, 06 Feb
 2023 19:51:14 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2023 03:51:08 +0000
Message-ID: <CACPK8XdbffU5yRSZF-zR2xv-+6aJK+hEXP8TOkW=SvS+nNTGxg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.3
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the aspeed device tree changes for 6.3

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.3-devicetree

for you to fetch changes up to 1480bcf074d34e754990204240f8473cdbef0072:

  ARM: dts: aspeed: p10bmc: Enable UART2 (2023-02-01 15:10:18 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.3

 - New machines

   * Ufispace NCPLite AST2600 BMC
   * Facebook Greatlakes AST2600 BMC

 - Updates for ethanolx, bletchley and tyan s8036

----------------------------------------------------------------
Ali El-Haj-Mahmoud (1):
      arm: dts: aspeed: tyan s8036: Enable kcs interrupts

Delphine CC Chiu (2):
      dt-bindings: arm: aspeed: add Facebook Greatlakes board
      ARM: dts: aspeed: greatlakes: Add Facebook greatlakes (AST2600) BMC

Eddie James (1):
      ARM: dts: aspeed: p10bmc: Enable UART2

Jordan Chang (3):
      dt-bindings: vendor-prefixes: Add prefix for Ufi Space
      dt-bindings: arm: aspeed: document Ufispace NCPLite BMC
      ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC

Konstantin Aladyshev (5):
      ARM: dts: aspeed: ethanolx: Enable VUART
      ARM: dts: aspeed: ethanolx: Correct EEPROM device name
      ARM: dts: aspeed: ethanolx: Add label for the master partition
      ARM: dts: aspeed: ethanolx: Enable CTS/RTS pins on UART1
      ARM: dts: aspeed: ethanolx: Add BIOS flash chip

Potin Lai (2):
      ARM: dts: aspeed: bletchley: Rename flash1 label
      ARM: dts: aspeed: bletchley: Enable wdtrst1

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |  25 +-
 .../arm/boot/dts/aspeed-bmc-facebook-bletchley.dts |  13 +-
 .../boot/dts/aspeed-bmc-facebook-greatlakes.dts    | 241 ++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts       |   4 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |   4 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |   4 +
 arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts        |   1 +
 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 360 +++++++++++++++++++++
 11 files changed, 655 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-greatlakes.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts

Return-Path: <SRS0=Iuh0=VK=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FE5C433EF
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 06:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E49F9C385AC; Mon,  2 May 2022 06:42:17 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80907C385A4
	for <soc@kernel.org>; Mon,  2 May 2022 06:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80907C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id o11so10477458qtp.13
        for <soc@kernel.org>; Sun, 01 May 2022 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QbcbEFU0Z1L9p+CYAY5GhkPGx/m4T8Xb0TJTTP3V3oQ=;
        b=USojnC1K9L0pp14wEIarZla7/3QV76DGVneAUU8o20QwD1wKMU6FS3fbhbBRYN2Fqc
         KCzhGbLFdiJ13M60ojMSAbFfjqjy8f5zMiXGGvtFz8ERDcApifvrUWdro0DWyU8LCnGu
         DpgY0E0H3x3BNHUcMqTjgSJBDL5oZsK1vbfsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QbcbEFU0Z1L9p+CYAY5GhkPGx/m4T8Xb0TJTTP3V3oQ=;
        b=H0DsFrQeE9X66t7W23oKyY2Q3oTK/S1vXgmOYQaY1ttcIbU7w4wr6WrwElyZY7g7co
         j7FYsz/IkbZWeMK2i6TiN5HGeRUL/bR96tVGEDYBYPhORcDghE06VgBdP6ZYBiiuLszP
         OGFUvajZrx0ogzgYn4L6Ofh4hfZflnNfOFu0hinNQHaPXIFnjfs9MxjM/BLzLWr94qxN
         0IzGxJH76cEWqH51lnMJTcFxLh+arlxNH4REN1S+KYxK5WmNdcJdHYiuGJpG/awykWbV
         9na2DqigpUeW2ahzqPEQywG/jlsNQXQ/xgDDV0YgK8O09eOA3SXyDGdBzXMowBbSTr7h
         rljA==
X-Gm-Message-State: AOAM530l93GWY9RZoUjyhtq1UGQ+IXGUE62V0jSdF+GUjSmItomBAH6k
	5r/HW1Mghqt+Ywm3ouEqsdB6eRRldgMkbV6vxON1+QVVGAc=
X-Google-Smtp-Source: ABdhPJw2d5haWCp22JGGOYyeFjezanqHtJZ1iJOvgBzXFfYeog3X69H7zQkWjOw7hm5u0g7nX1WnCShesYLo+VXQhR4=
X-Received: by 2002:a05:622a:c4:b0:2e1:cb5b:9b5c with SMTP id
 p4-20020a05622a00c400b002e1cb5b9b5cmr9197254qtw.69.1651473734785; Sun, 01 May
 2022 23:42:14 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 May 2022 06:42:03 +0000
Message-ID: <CACPK8XdhLfafOfqvR0r7p6V6AhtNXD4uZGaz7Y+Y4P-rc9p0tQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: Fixes for v5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hi Soc maintainers,

Here are some device tree fixes that I have for v5.18. They have been
ready since the merge window closed but I've not been available to
send the pull earlier. If you'd prefer not to take them now then I
understand.

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-v5.18-fixes

for you to fetch changes up to 32e62d1beab70d485980013312e747a25c4e13f7:

  ARM: dts: aspeed: Add video engine to g6 (2022-04-13 11:53:53 +0930)

----------------------------------------------------------------
ASPEED device tree fixes for v5.18

 - Quad SPI device tree corrections

 - Reinstate GFX node that was removed

 - romed8hm3 machine fixes

----------------------------------------------------------------
Howard Chiu (1):
      ARM: dts: aspeed: Add video engine to g6

Jae Hyun Yoo (5):
      ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
      pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
      dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
      dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
      ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group

Johnny Huang (2):
      pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
      ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi

Zev Weiss (2):
      ARM: dts: aspeed: romed8hm3: Add lm25066 sense resistor values
      ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c              | 17 ++++++++---------
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml        |  4 ++--
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts       |  4 +++-
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi                | 10 +++++-----
 arch/arm/boot/dts/aspeed-g6.dtsi                        | 10 ++++++++++
 5 files changed, 28 insertions(+), 17 deletions(-)

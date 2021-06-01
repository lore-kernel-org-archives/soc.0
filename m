Return-Path: <SRS0=OMTs=K3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23513C47093
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 11:38:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 032CA613D1; Tue,  1 Jun 2021 11:38:07 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD74F61376
	for <soc@kernel.org>; Tue,  1 Jun 2021 11:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD74F61376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f177.google.com with SMTP id v5so18716588ljg.12
        for <soc@kernel.org>; Tue, 01 Jun 2021 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yRcMVunyo933FsJtW1JBN3016xuLkbBPp3vmdlU2ybA=;
        b=Smxc3ZShYoaRgG6i8oM38E4C2V7TbTmdSHeGMh8jRLPqGqXdUDjDoSwYWZdBK7KJT/
         u4oLT4er/9HLTQTBuFWdi9KPWH/5jvBIBojLiY95jzQRxZKBAh9OYxljNUDJkvtZv+oB
         gVarVMXkggXPrwMBqkFHsjDOj4FDq6ReRwaluwRIUAD0rU4obDhE3YjcWFrq0kjq+n8K
         w1I0hQTzCLLd0db6Xve1LyHak8huNughrA/kfkZa+a+RtnI8erxAYrGFbBTk1Kqib7Q+
         gykVXsBDXh+Y6wGXvuhoEpx9xK/f6ke01sIB2v64phEkgZanD0TYX5cl7gcqkhcGXHaP
         WoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yRcMVunyo933FsJtW1JBN3016xuLkbBPp3vmdlU2ybA=;
        b=BR3KgXYDjHyzLR32t2ombrAZ+ijrMBt02FGW1zvnw85FCP0G9RyqYeb27LYXtfohpI
         YaCapuIZouB6bg8X26WH3RvgieKdmeUID7Bfk8blcSktF2+phEHrSqT1/jNqzcFJ/s3A
         M76LHx/3nwrnr1fbo6cK+yPV67VNfFW1ooravlFyO7HJyTl8TIkVWvw1Uf/lmSAObGTN
         jdYVqGfpHNdTeKi751XRaIjYbVhNyC/zJ3h2sr8GLEKDSKa7QuF5gdEs4WRwiRZjy1Dw
         T4pc07Qp4fleATs2IWFVdBAZ8RjlK2iwRjDReYiZSw/fMiUPfhlJDwI/EtM3i7nyHT6o
         2GUQ==
X-Gm-Message-State: AOAM530OLC0TG6vXgMuGmOnG6jXkJK9TuOSQdFPWzO/nmvgg42wHzoW8
	D7mjX+ANcKKuiVcgBcpJIjsYJLvTdMZgckXtHe4deGLtaNZGOg==
X-Google-Smtp-Source: ABdhPJykCbPYjM0GTBMeUtAxmGTRVUlYqHEzVDb4GqY/v94XbmV5Z/2M/kaj55Maq292hDm5OPO37OxhBmeJwPxHSgU=
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr21028842lji.326.1622547485151;
 Tue, 01 Jun 2021 04:38:05 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Jun 2021 13:37:54 +0200
Message-ID: <CACRpkdbmRjGW7vpr7hG+jiRTqNMZAyKZNhtvzj=SqhZmb1+F6A@mail.gmail.com>
Subject: [GIT PULL] ixp4xx DTS changes for v5.14 take 1
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Corentin Labbe <clabbe@baylibre.com>, Zoltan HERPAI <wigyori@uid0.hu>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

this is a stack of IXP4xx DTS changes for v5.14, adding
PCI and ethernet and some other changes.

The PCI bindings have been reviewed by Rob Herring
and are pending merge through the PCI tree.

We have more going on, like crypto accelerator and
hw_random, but we need more review on that before
we merge those changes. A second pull request may
arrive before the merge window, but let's start with
this.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dts-v5.14-1

for you to fetch changes up to e33f8fd9fda9730f5a0f27d1a56c69e1228ed907:

  ARM: dts: Fix up the IXP4xx ethernet nodes (2021-05-21 21:29:07 +0200)

----------------------------------------------------------------
IXP4xx DTS updates for the v5.14 kernel:
- Add ethernet to the boards
- Add PCI hosts to the boards
- Create an expansion bus around the flash memory
- Add the beeper to NSLU2 completing the NSLU2 DTS

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ixp4xx: Add ethernet
      ARM: dts: ixp4xx: Add PCI hosts
      ARM: dts: ixp4xx: Create a proper expansion bus
      ARM: dts: ixp4xx: Add beeper to the NSLU2
      ARM: dts: Fix up the IXP4xx ethernet nodes

 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts   |  79 +++++++++++++---
 arch/arm/boot/dts/intel-ixp42x.dtsi                |   4 +
 .../arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts | 104 ++++++++++++++++++---
 arch/arm/boot/dts/intel-ixp43x.dtsi                |   4 +
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi         |  33 +++++++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |  84 ++++++++++++++++-
 6 files changed, 280 insertions(+), 28 deletions(-)

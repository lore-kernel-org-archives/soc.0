Return-Path: <SRS0=eoMB=LZ=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31EDC11F64
	for <soc@archiver.kernel.org>; Thu,  1 Jul 2021 04:32:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6011C613CD; Thu,  1 Jul 2021 04:32:13 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDBA61476
	for <soc@kernel.org>; Thu,  1 Jul 2021 04:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDBA61476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qv1-f44.google.com with SMTP id fi7so1794317qvb.0
        for <soc@kernel.org>; Wed, 30 Jun 2021 21:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ZDwANdeZngtquubBMny4xTGFmM5ryOv877t1DM8d0eY=;
        b=FkWPmGQX3BLG1gJRHwscUBE0g7ow4mpQOlLBQ0IgCC51x7Cmf3b9OFxJRRtt6Wsi0f
         gD5oFrX+a479C1xGk3wsyVvOEoSIAPsgLq2OqvoO0dyeCl5MeeUu4OqxDGZHHg20Go6K
         hvz2BoEFv5zUeDAlLyhD1+DcbiJRbfIThMcfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ZDwANdeZngtquubBMny4xTGFmM5ryOv877t1DM8d0eY=;
        b=oDGvOtsn8Ft8u1QOLU4Y1EEVqfT7K5ulzXRttv6iFCocc3XwcxOSF+vCisnDRqCE7q
         54TrnJbNevin7I77bvN7eoY0aNRK9rh2W0sOePaIc2WyvhLtJ5WbzEnvImSsM1Gw5QFw
         tqTlexfBAGuTS8M/aY/ySwIniFB2qhe3HwyCbhzXXXeP/4pbBIrx4BThVSGlbwat9To3
         NXkf3newocB9I/Hp9oeyUsO6OgUI9prjTK890VflVh9kLpLGgKOUezgCLdoROvUGGaSN
         s+rbXgVRrO11QzXwYVLF+bDS78A9o1hh1Sy4Welp6yVtCXUDGv2R3GVkVKyTjFGMYYB1
         9X5A==
X-Gm-Message-State: AOAM530vgzWmqVmCdS4NLUjUeT5P0h/00OL3OI+nfW3s5WzMDQg8MP2e
	UW4lJAsoxM6iGlPMHaXyiZPj1lH4NCRnRCK5BO6Y8MISD7M=
X-Google-Smtp-Source: ABdhPJyvbSh42hrNgpYeAMR1+1kC/eGTFXnpd3MmgjT334Jw16Tx7OzUCX/fFZK8JW0WGhgBu0/4Y37FGDUg1bY5AVM=
X-Received: by 2002:ad4:436b:: with SMTP id u11mr6159929qvt.18.1625113930426;
 Wed, 30 Jun 2021 21:32:10 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jul 2021 04:31:59 +0000
Message-ID: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are some minor fixes for the aspeed device trees.

The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:

  ARM: dts: aspeed: everest: Add pcie cable card indicator leds
(2021-06-07 13:38:55 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.14-devicetree-2

for you to fetch changes up to ab4a49d36010564c70fe5586a4c2b1985866616f:

  ARM: dts: aspeed: everest: PSU #3 address change (2021-07-01 13:41:33 +0930)

----------------------------------------------------------------
ASPEED device tree fixes for 5.14

 - eMMC phase corrections so Tacoma and Everest can boot

 - VUART irq polarity fix for e3c246d4i, using new bindings

 - I2C address fix for Rainier power supply

 - GPIO line name fixes

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: tacoma: Add phase corrections for eMMC
      ARM: dts: everest: Add phase corrections for eMMC

B. J. Wyman (1):
      ARM: dts: aspeed: everest: PSU #3 address change

Joel Stanley (1):
      ARM: dts: aspeed: Fix AST2600 machines line names

Zev Weiss (1):
      ARM: dts: aspeed: Update e3c246d4i vuart properties

 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 4 +++-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts      | 9 +++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts      | 5 +----
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts       | 6 ++----
 4 files changed, 11 insertions(+), 13 deletions(-)

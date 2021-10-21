Return-Path: <SRS0=ctD/=PJ=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C85C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 06:59:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EDABD60FC1; Thu, 21 Oct 2021 06:59:23 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C590E60FC0
	for <soc@kernel.org>; Thu, 21 Oct 2021 06:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C590E60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id bj31so6090463qkb.2
        for <soc@kernel.org>; Wed, 20 Oct 2021 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=N//rb+m4pmHWM2In2ypTAyaR2MvFzxgR0R9cpQ84nZA=;
        b=lALUmGpxCJbC96/zmuF9gHKCXTP4nrjuxWYNttCdVFtygtabvSPcmHoo0NT3LKuMKg
         K94P752P5emkntHyXyXxbKi60kcnTjPZPWv/beOtcKrx+lkEkBqNIhlYYnaJiwqugFEZ
         wVt9FuDJ4GGnmWuCdOR4MZN3VlZPHuzTHlLjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=N//rb+m4pmHWM2In2ypTAyaR2MvFzxgR0R9cpQ84nZA=;
        b=ciptKMaKzj5SL6EWqCG6lG4Jh3a+MmhhoSpakePjrGLEgypujJa8W9HAJfQTejMVAa
         15xibJeY3QtQCFvLnrqfJciZGzOdefmfQqzuKsgh620kWux4Wge7SCzEfQ5SskSMJifL
         D3Rz5xwBSZVEKwuIgZGvRUiaZxVz1A2jCeVnjNPOGlyZHVev1BGOvFW6eGXNpbqhn4Mo
         byAzL0d6vNK9FIF5SJBORyC4GQyiWldr4Pjp90Re6vGcKo7Fu730p36ba3rIkt9B20oJ
         1kk4wBQofTnpGX8fVPRivtkztWnmWfHIw83ovi0mRKmAaIuGWUDWQo/ZCSfLx0CFEGlA
         9nOQ==
X-Gm-Message-State: AOAM532kzREpYy6EuHPGLt623XiVmYxF130yqwrMypeqTsNVFRevaBjv
	xit8i0k1qhgC6hGR0V6RUcE9iLxTa5hpaWSojR1/KnQIjTU=
X-Google-Smtp-Source: ABdhPJy7LpdJkyKOVfpFc2II+KybhaG4y7eBWsQMf1M8zZAqipes7m1MQxwVLb6ADiNS2ub2DlQuRD6wRcaRxUlWqEU=
X-Received: by 2002:a37:68c4:: with SMTP id d187mr3020098qkc.36.1634799562103;
 Wed, 20 Oct 2021 23:59:22 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 06:59:10 +0000
Message-ID: <CACPK8Xd=eAMk-S3akhGgL4i_K190Nz9t=_CrdHQMJ+nbW172mg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.16, round 2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello soc maintainers,

Hot on the heels of you merging my first pull request, here's a second
one with some changes I missed the first time, and some patches that
came in since.

Of note the two IBM P10 platforms now have all of their device tree
changes in mainline, so that's a milestone for them. They are our
biggest Aspeed BMC device trees, coming in at 2400 and 3600 lines of
description.

The following changes since commit 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62=
:

  ARM: dts: aspeed: fp5280g2: Use the 64M layout (2021-10-14 18:25:17 +1030=
)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-devicetree-2

for you to fetch changes up to f9241fe8b9652e6751f4ae684efe0148e3c157c7:

  ARM: dts: aspeed: Add uart routing to device tree (2021-10-21 16:59:53 +1=
030)

----------------------------------------------------------------
ASPEED device tree updates for 5.16, round 2

 - New machines:

  * Inventec Transformers, an x86 family server with an AST2600 BMC

 - Updates to the Everest and Rainier sensors, gpios and KCS devices

 - New UART routing device tree description

----------------------------------------------------------------
Andrew Jeffery (2):
      ARM: dts: aspeed: p10bmc: Use KCS 3 for MCTP binding
      ARM: dts: aspeed: p10bmc: Enable KCS channel 2

B. J. Wyman (1):
      ARM: dts: aspeed: rainier: Remove PSU gpio-keys

Chia-Wei Wang (1):
      ARM: dts: aspeed: Add uart routing to device tree

Eddie James (7):
      ARM: dts: aspeed: p10bmc: Fix ADC iio-hwmon battery node name
      ARM: dts: aspeed: rainier and everest: Remove PCA gpio specification
      ARM: dts: aspeed: everest: Add I2C switch on bus 8
      ARM: dts: aspeed: everest: Add IBM Operation Panel I2C device
      ARM: dts: aspeed: everest: Fix bus 15 muxed eeproms
      ARM: dts: aspeed: rainier: Add eeprom on bus 12
      ARM: dts: aspeed: rainier: Remove gpio hog for GPIOP7

Isaac Kurth (1):
      ARM: dts: aspeed: rainier: Add 'factory-reset-toggle' as GPIOF6

Joel Stanley (2):
      ARM: dts: aspeed: rainier: Add front panel LEDs
      ARM: dts: aspeed: rainier: Enable earlycon

Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO (1):
      ARM: dts: aspeed: Adding Inventec Transformers BMC

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 735 ++---------------=
----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 634 ++---------------=
-
 .../boot/dts/aspeed-bmc-inventec-transformers.dts  | 328 +++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   6 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   6 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   6 +
 7 files changed, 470 insertions(+), 1246 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts

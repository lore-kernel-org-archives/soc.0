Return-Path: <SRS0=4Pft=AE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B82C77B61
	for <soc@archiver.kernel.org>; Thu, 13 Apr 2023 07:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACA7BC4339B; Thu, 13 Apr 2023 07:23:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38665C433D2
	for <soc@kernel.org>; Thu, 13 Apr 2023 07:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38665C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id jg21so34696313ejc.2
        for <soc@kernel.org>; Thu, 13 Apr 2023 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1681370633; x=1683962633;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ql5Do4NIOwiBMn1MBftygs4Legcy5XT8a+gOumAZ0g8=;
        b=fGPEP/BxnivPQ4bemAIXIqVAeQ1yZlvRk2w0VGdvzRQt6DbHLvPth4OLy3bLTqiO5/
         gxK0UiO4+SORJy4LOWI+qzVhjycACgATb5JPBiA4RPfmef8U4cAnUeA/+z8FcjduiBXR
         6k57Y/Lk5aH+3Pku9dkeyAqD1uSYgBzUECOQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370633; x=1683962633;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ql5Do4NIOwiBMn1MBftygs4Legcy5XT8a+gOumAZ0g8=;
        b=RpCxIa9lEpoJR1D7n0bB8FsWyt2gTurGo7/wkPC94BlwHo1YBCwUmYi12k9NqUXjK/
         CRtnC+owJng2yz1QE/6ZIzU+NgraGwNwIoV6rk7cxHvUR1wjxLpjdenkqZH6EW7+7ixD
         k2sbkQ+UUxQ8JfXQCbRzfc+7kIR4TUW9mjesait2A5Nap8SDPtQ7MYmd9dH78NKZat6V
         SNf32GzWKR/k+6oYoIy9U70eKqIqlqqqWpKzrnKA8FeM8K+3EkNlbH3JCDBLi/XMZFYS
         vDni/G10KMV0BQcvcNc5txfD+p3kaBQf8kwNOQrv3YXDfT+Ov6SVg0VFn8lR98kVeZl1
         ty1Q==
X-Gm-Message-State: AAQBX9cF0FKM6qHyttmVmP34pjcB+W6DUHw2XmWEnUqufVdTCWicvtYW
	c7LaWMV5KiuxhoG8EnJf4kCZ/MNWTFYuHeIPr3qXkq8eOgE=
X-Google-Smtp-Source: AKy350ZRdbvovOQMYN2DjpLBfPxvrpd+xwRinIn1FhDpSfW+DBSoFUUjrwEKFA3aH42hsnhCSYb6gZMZaxKVY/uOW9E=
X-Received: by 2002:a17:906:c455:b0:94a:5691:b12b with SMTP id
 ck21-20020a170906c45500b0094a5691b12bmr767712ejb.11.1681370633503; Thu, 13
 Apr 2023 00:23:53 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Apr 2023 07:23:41 +0000
Message-ID: <CACPK8XfmK5S=1PQjBQHb6daDR3qTWN-_NLoXP7+ZDCk13wDxcA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.4
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here's the aspeed device tree pull request for 6.4. A bit late, I lost
track of time.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.4-devicetree

for you to fetch changes up to 7d4f0b0df7c5ec0cec834f87591423a7bbd1bab2:

  ARM: dts: aspeed-g6: Add UDMA node (2023-04-13 16:43:15 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.4

 - Fixes for romed8hm3 GPIO, asrock SPI clocks, bonnell eeprom

 - Misc updates for various BMC systems

 - Add AST2600 UDMA node

----------------------------------------------------------------
Chanh Nguyen (1):
      ARM: dts: aspeed: mtmitchell: Enable NCSI

Chia-Wei Wang (1):
      ARM: dts: aspeed-g6: Add UDMA node

Delphine CC Chiu (2):
      ARM: dts: aspeed: greatlakes: Add gpio names
      ARM: dts: aspeed: greatlakes: add mctp device

Eddie James (3):
      ARM: dts: aspeed: everest: Add reserved memory for TPM event log
      ARM: dts: aspeed: bonnell: Remove MAC3
      ARM: dts: aspeed: bonnell: Update eeprom size

Lakshmi Yadlapati (1):
      ARM: dts: aspeed: p10bmc: Change power supply info

Zev Weiss (3):
      ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
      ARM: dts: aspeed: e3c246d4i: Add PECI device
      ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks

 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |  6 ++-
 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts  |  4 +-
 .../boot/dts/aspeed-bmc-facebook-greatlakes.dts    | 53 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts       | 24 +++-------
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |  6 +++
 arch/arm/boot/dts/aspeed-g6.dtsi                   |  9 ++++
 7 files changed, 118 insertions(+), 21 deletions(-)

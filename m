Return-Path: <SRS0=AXLp=FX=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C536DCD6136
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 20:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82183C433C9; Mon,  9 Oct 2023 20:53:24 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AD86C433C8
	for <soc@kernel.org>; Mon,  9 Oct 2023 20:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AD86C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f7f2b1036so60744847b3.3
        for <soc@kernel.org>; Mon, 09 Oct 2023 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696884802; x=1697489602; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QfwhA5LSzvT+ExWyYrNo/TB0dbRgq1oVptPQ16FBBbg=;
        b=q8UF86eTh38CC8WCVEuj9QvgryTwddfx/KA/RmdM6M5AwPJ7IpB01ipK8cnSqZwEpQ
         Mk3nWpKC1Lt5txcoWdTYGB34dV87pUfg7C5xkGzxtqTRUGuNnOseBi6MtPkNX7S2slUE
         i99cWW5dAXfoJudcoMwhxHBUx+8l+b2MgaH37DWXLntZhdjPimBn4dNqhLip4MVmZPEW
         D096cHrAfTdQGvWY87mcsV5+PUtj+dkEz0hyPvKJrMxx6OlKrHvPEuzN/8e3ciONHgAg
         2dCCTS9NriwzD7fKfM1Ii8XBsisscV4g6tcA6V7JQ0cyX14vPdUq9hCrH5OYYLr/Jcoy
         s4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696884802; x=1697489602;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QfwhA5LSzvT+ExWyYrNo/TB0dbRgq1oVptPQ16FBBbg=;
        b=IhBvc8J0Bbektir6e647ph6qVsCjeef0rYwLadibXE4rIMf1p7/ZuoMOrq4V/WfvMe
         Xlqim8iQp48fyfcmk7Xw+ivcovSrR+cN/oVPfP/i4pC9siKrp1WIpxtYmsC1lDJkgteI
         enP2O4LnGVOwAdiJu3nHp+Sr/u/0xWpKvOhQVGiDIwUEuZDnHVSFAXnsw0OMMa4gj+sc
         o4Upj/pfF3uOZtzy+v89qaXcdR0MTMj/lmazHOPvAatHD0jEZ1bKwgZq6WFZ9o4YVzoJ
         D1qakhdCf+Xx2WFyDa5wYYewThQ6Y2Bf/cmIEIi58UVeA+nWqgK1o3gDpzwZZITd0yyW
         Nnew==
X-Gm-Message-State: AOJu0YzUAkmMM5RKzFmqGRzT59HQ8sFbEnAmRlFg63K1aYLXXw0iGAF5
	4QWRtQcCWlCK8X415FZLQp1osKmziv/ZKtwFGGi1x18fFX4vDqr0LIo=
X-Google-Smtp-Source: AGHT+IH5IcBY1Hc9GiqcsFMcb4MwHMErrt+cCQng9pUhSmqjy8F0RXhL36iZghB0p9tOxbKYAP7jA2sJEJ0u1tBII5A=
X-Received: by 2002:a05:690c:a8a:b0:589:f8c7:244 with SMTP id
 ci10-20020a05690c0a8a00b00589f8c70244mr11979168ywb.33.1696884802265; Mon, 09
 Oct 2023 13:53:22 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Oct 2023 22:53:10 +0200
Message-ID: <CACRpkdZZ6W8uic97S9=Aa+S+s0-0k50TDw1e00u6gFcQfAVDdw@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS updates
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here are some updates to the Intel IXP4xx device tree files, and some
bindings that go with those updates.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-for-soc-v6.7

for you to fetch changes up to d3c849020b6a5c7d8cb975844d26b3223f57047e:

  ARM: dts: ixp4xx: Use right restart keycode (2023-10-09 22:29:42 +0200)

----------------------------------------------------------------
Some IXP4xx updates for the v6.7 kernel cycle:

- Provide proper bindings including missing vendor prefixes
  for the device trees in use and one more new vendor.

- Add a device tree for USRobotics USR8200 which has two
  active users.

- Augment the "reset" GPIO buttons to send KEY_RESTART as
  appropriate.

- Enable write on the NSLU2 flash so we get a writeable
  rootfs on this device.

----------------------------------------------------------------
Linus Walleij (6):
      dt-bindings: Add vendor prefixes
      dt-bindings: arm: List more IXP4xx devices
      ARM: dts: Use only the Linksys compatible for now
      ARM: dts: ixp4xx: Add USRobotics USR8200 device tree
      ARM: dts: ixp4xx-nslu2: Enable write on flash
      ARM: dts: ixp4xx: Use right restart keycode

 .../devicetree/bindings/arm/intel-ixp4xx.yaml      |  16 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |  14 ++
 arch/arm/boot/dts/intel/ixp/Makefile               |   3 +-
 .../dts/intel/ixp/intel-ixp42x-dlink-dsm-g600.dts  |   2 +-
 .../dts/intel/ixp/intel-ixp42x-freecom-fsg-3.dts   |   2 +-
 .../dts/intel/ixp/intel-ixp42x-iomega-nas100d.dts  |   2 +-
 .../dts/intel/ixp/intel-ixp42x-linksys-nslu2.dts   |   4 +-
 .../dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts  |   2 +-
 .../intel/ixp/intel-ixp42x-usrobotics-usr8200.dts  | 229 +++++++++++++++++++++
 9 files changed, 268 insertions(+), 6 deletions(-)
 create mode 100644
arch/arm/boot/dts/intel/ixp/intel-ixp42x-usrobotics-usr8200.dts

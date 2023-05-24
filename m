Return-Path: <SRS0=z7KL=BN=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0D4C77B73
	for <soc@archiver.kernel.org>; Wed, 24 May 2023 13:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65E7CC4339C; Wed, 24 May 2023 13:07:17 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 462C8C433EF
	for <soc@kernel.org>; Wed, 24 May 2023 13:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 462C8C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-561bb2be5f8so12809857b3.0
        for <soc@kernel.org>; Wed, 24 May 2023 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684933635; x=1687525635;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7T2td/HP9EXHaURHSmB+HEKZGzkbT+5xCwINot9A/Zw=;
        b=yi4ylD8eJiuNjIP4eECWuk48rWL8P+wmAU25nBZw8BFzcQxO/1sEfVaA4MIDtb6MS4
         6/0f5keWIZkT3bhRaOiauFkWFsWhIw7oytk+6wcwpw2KIEN2qo9IBdrVTCprGDuqNHZa
         NyrQBt5ZOzZJPwqY51BH8KDf2207rT44nuK64dPXCtudLUrHyWwtQS2jzJXLne6uTAK3
         YnNH2yVpOv4leOAwC4ti6kylg8HxCXWiqleqTRgjXHl8AZ9oYBMXJINWS50kU7rgdds2
         jVbpKicozPdhF8/H3MSha9f3LfVDSYTVjhvp1PK8TtBpwjSxnOJ3zAPNVlzR3b/UOU95
         koWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933635; x=1687525635;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7T2td/HP9EXHaURHSmB+HEKZGzkbT+5xCwINot9A/Zw=;
        b=jHgDtLchc+zWytBeo97tlyiLOvP8/tHBv04VjxBfIDc4ux1LJKM5l1YErosgUt2cH5
         3pkvAuDklYKTy13/49wIKakXhyGGEZjTvbbqDmI83rdFmJ3TOJ/0dn8d521uOPUamRrb
         JTBkXPooaDl4tp+0AzFkezJmww+3ZfB94lis5sDjFiqv86rdQyCZ237EknYExYwo63xY
         lmG3PlOlZ3rg5GipJUU9tRQZvXeI53uIxtMTZsiadDGGJbJ1vANmuW8TvA1KMZBaWAuP
         WHigxg8uQD2aYTSE7n8ecSxTr7Hz9BrBnaP7+RMCv32VrWRrcyxZNWSEzUckWH/5+3zO
         TRVg==
X-Gm-Message-State: AC+VfDzTae6wstURBWzs+O8U9otHWBsES/YIHQb/DliHat9clQC0RSk2
	ThzzYwwotLmzl++Lt/OCynz8JEgY9Afzhq72Nla1x3PXFN8jguJPOd0=
X-Google-Smtp-Source: ACHHUZ7V57h9injTXnZtjgFdZ71gBB4fHagZfU55PK9k8FuPbaFmWuRLP+stVoaf5OMAO0zgAhir1Y7zuTPJQeqN7sg=
X-Received: by 2002:a0d:ccd3:0:b0:562:7f3:beee with SMTP id
 o202-20020a0dccd3000000b0056207f3beeemr19710027ywd.45.1684933634934; Wed, 24
 May 2023 06:07:14 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 May 2023 15:07:03 +0200
Message-ID: <CACRpkdbtE9yfx9kZqGwsHim91WsxHERecrGwjnr6TQpCUMsQwg@mail.gmail.com>
Subject: [GIT PULL] OMAP GPIO numbers cleanup
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

please pull in this cleanup of the OMAP board files removing all
usage of the global GPIO numberspace.

It's reasonably reviewed and tested, any remaining issues can
be smoked out in-tree.

Required subsystem maintainer ACKs are in place.

Yours,
Linus Walleij

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-omap-descriptors-v6.5

for you to fetch changes up to 8e0285ab95a9baf374f2c13eb152221c8ecb3f28:

  ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
(2023-05-24 15:01:59 +0200)

----------------------------------------------------------------
This removes all usage of global GPIO numbers from
arch/arm/mach-omap[12].

The patches have been reviewed and tested by everyone
who showed interest which was one person that tested
on OSK1 and Nokia 770, and we smoked out the bugs and
also addressed all review comments.

Any remaining problems can certainly be fixed in-tree.

----------------------------------------------------------------
Linus Walleij (13):
      ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
      ARM: omap1: Drop header on AMS Delta
      ARM: omap1: Remove reliance on GPIO numbers from PalmTE
      ARM: omap1: Remove reliance on GPIO numbers from SX1
      Input: ads7846 - Convert to use software nodes
      ARM/mmc: Convert old mmci-omap to GPIO descriptors
      ARM: omap1: Fix up the Nokia 770 board device IRQs
      ARM: omap1: Make serial wakeup GPIOs use descriptors
      ARM: omap1: Exorcise the legacy GPIO header
      ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
      ARM: omap2: Get USB hub reset GPIO from descriptor
      ARM: omap2: Rewrite WLAN quirk to use GPIO descriptors
      ARM/musb: omap2: Remove global GPIO numbers from TUSB6010

 arch/arm/mach-omap1/board-ams-delta.c   |   1 -
 arch/arm/mach-omap1/board-nokia770.c    | 207 ++++++++++++++++++++------------
 arch/arm/mach-omap1/board-osk.c         | 146 +++++++++++++++-------
 arch/arm/mach-omap1/board-palmte.c      |  51 +++++---
 arch/arm/mach-omap1/board-sx1-mmc.c     |   1 -
 arch/arm/mach-omap1/board-sx1.c         |  40 ++++--
 arch/arm/mach-omap1/devices.c           |   1 -
 arch/arm/mach-omap1/gpio15xx.c          |   1 -
 arch/arm/mach-omap1/gpio16xx.c          |   1 -
 arch/arm/mach-omap1/irq.c               |   1 -
 arch/arm/mach-omap1/serial.c            |  30 ++---
 arch/arm/mach-omap2/board-n8x0.c        | 156 +++++++-----------------
 arch/arm/mach-omap2/omap_device.c       |   1 -
 arch/arm/mach-omap2/pdata-quirks.c      | 132 ++++++++++----------
 arch/arm/mach-omap2/usb-tusb6010.c      |  20 +--
 arch/arm/mach-omap2/usb-tusb6010.h      |  12 ++
 arch/arm/mach-pxa/spitz.c               |  11 +-
 arch/mips/alchemy/devboards/db1000.c    |  11 +-
 drivers/gpio/gpio-twl4030.c             |  52 +++++---
 drivers/input/touchscreen/ads7846.c     | 113 +++++++----------
 drivers/mfd/tps65010.c                  |  14 +--
 drivers/mmc/host/omap.c                 |  46 ++++++-
 drivers/usb/musb/musb_core.c            |   1 -
 drivers/usb/musb/musb_core.h            |   2 -
 drivers/usb/musb/tusb6010.c             |  53 +++++---
 drivers/video/fbdev/omap/lcd_mipid.c    |  10 ++
 include/linux/mfd/tps65010.h            |  11 +-
 include/linux/mfd/twl.h                 |   3 -
 include/linux/platform_data/lcd-mipid.h |   2 -
 include/linux/platform_data/mmc-omap.h  |   2 -
 include/linux/spi/ads7846.h             |   2 -
 include/linux/usb/musb.h                |  13 --
 32 files changed, 636 insertions(+), 511 deletions(-)
 create mode 100644 arch/arm/mach-omap2/usb-tusb6010.h

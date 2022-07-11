Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1A4C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33541C34115; Mon, 11 Jul 2022 16:45:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 459D5C341C8;
	Mon, 11 Jul 2022 16:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 459D5C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id b9so5224701pfp.10;
        Mon, 11 Jul 2022 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0YB8njkT+jmGf5UJpj4fLZRYdH8i+T0PjbK3aknvxKw=;
        b=jOBOemgJWVwTYPkm+472BhcXS4jTnIAsb7oUdProCLYxcsKCqeBNi1Fd2kswPB0jLp
         gDZ12HS6Nj6z3pw0uYDDWKvHyKNOUx36p4/AngFGo1vI8o71qCEzQojVB6fPW+A/LFYN
         CeZ6omKE/DwDZnXq+gxssjzeS/yLtyFwDIHnswfa6mHDGzuZ4HGYQYBLAj/S2cCvH24L
         5efkH3EP7xTNVZCi2dJxzlfqhMb+/LS3Hf83Z45g05EiZrCPctLodGsOUP/OSdBx/Q3j
         wup/tGdk+ALCCWojokLyLg8AbO4+R3F0C8Nm7uqEIMrTfff99Lhx4zfFxZJ1GjkMTAIR
         TTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0YB8njkT+jmGf5UJpj4fLZRYdH8i+T0PjbK3aknvxKw=;
        b=st83KO7nnihTW/k1ADWt+nIL5OIPp5x74mpGuEGTIXaHFSuwzmb4j9flP3baPtvHt8
         Cb0cz1hSvKbmkDMoBSRLqESB7XDWMdiNGmIiQFCNX8DDPrmkFjIjgbMcxrzkgwNyR45m
         HIfrpUtXiRxOTgjNxIJ5pPzviZT7gj+JbXAOkkIwLHnTzj2BaqHwzEQSv+E2H5tQubPn
         hECIKe37in7Kh8eq3QXUuJGvaNMhimf8h9CbTp67NrZZ+zQwE7IPrCyu4Gfn4RhOtxSE
         EKfnR3YtEOdlsCEEiuCg/WTlqYEhkgOqP2ehcljkth+hipmbOAkk05F9BQuF2mb+XIUc
         cm9w==
X-Gm-Message-State: AJIora8Zv75CMzoUlVmBWQHQGyE9Oep/JD6lqOzWZqy/RXYaji8SuqZX
	quUgFVD7Z29r/0pSy1LAoXWogQCYx34=
X-Google-Smtp-Source: AGRyM1s7a2P3KPDwMktiqJ5wem4WRkPoVakobIOFdbq2Zs2+mKHC7qDGq0rdv/OWG3qTC14iVhdP2A==
X-Received: by 2002:a62:864f:0:b0:52a:be82:6b60 with SMTP id x76-20020a62864f000000b0052abe826b60mr12084344pfd.48.1657557913310;
        Mon, 11 Jul 2022 09:45:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:12 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Liang He <windhl@126.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/7] Broadcom drivers changes for 5.20
Date: Mon, 11 Jul 2022 09:44:49 -0700
Message-Id: <20220711164451.3542127-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/drivers

for you to fetch changes up to ef4ef28acb42ec77829e842c6f30a33526daf520:

  tty: serial: bcm63xx: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA (2022-07-11 09:14:11 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers updatse for 5.20, please
pull the following:

- Julia fixes a typo in the Broadcom STB legacy power management code

- Liang fixes a device_node reference count leak in the Broadcom STB BIU
  driver code error path(s)

- Nicolas and Stefan provide updates to the BCM2835 power management
  driver allowing its use on BCM2711 (Raspberry Pi 4) and to enable the
  use of the V3D GPU driver on such platforms. This is a merge of an
  immutable branch from Lee Jones' MFD tree

- William removes the use of CONFIG_ARCH_BCM_63XX which is removed and
  replaces the dependencies with CONFIG_ARCH_BCMBCA which is how all of
  the DSL/PON SoCs from Broadcom are now supported in the upstream
  kernel.

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/ib-mfd-soc-bcm-v5.20' into drivers/next

Julia Lawall (1):
      soc: bcm: brcmstb: pm: pm-arm: fix typo in comment

Liang He (1):
      soc: bcm: brcmstb: biuctrl: Add missing of_node_put()

Nicolas Saenz Julienne (2):
      mfd: bcm2835-pm: Use 'reg-names' to get resources
      soc: bcm: bcm2835-power: Bypass power_on/off() calls

Stefan Wahren (4):
      mfd: bcm2835-pm: Add support for BCM2711
      soc: bcm: bcm2835-power: Refactor ASB control
      soc: bcm: bcm2835-power: Resolve ASB register macros
      soc: bcm: bcm2835-power: Add support for BCM2711's RPiVid ASB

William Zhang (7):
      ata: ahci_brcm: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      i2c: brcmstb: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      phy: brcm-sata: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      hwrng: bcm2835: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      clk: bcm: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      spi: bcm63xx-hsspi: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA
      tty: serial: bcm63xx: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA

 drivers/ata/Kconfig                 |  2 +-
 drivers/char/hw_random/Kconfig      |  2 +-
 drivers/clk/bcm/Kconfig             |  4 +-
 drivers/i2c/busses/Kconfig          |  2 +-
 drivers/mfd/bcm2835-pm.c            | 74 +++++++++++++++++++++++++++----------
 drivers/phy/broadcom/Kconfig        |  2 +-
 drivers/soc/bcm/bcm2835-power.c     | 72 ++++++++++++++++++++++++------------
 drivers/soc/bcm/brcmstb/biuctrl.c   |  9 +++--
 drivers/soc/bcm/brcmstb/pm/pm-arm.c |  2 +-
 drivers/spi/Kconfig                 |  2 +-
 drivers/tty/serial/Kconfig          |  4 +-
 include/linux/mfd/bcm2835-pm.h      |  1 +
 12 files changed, 119 insertions(+), 57 deletions(-)

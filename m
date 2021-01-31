Return-Path: <SRS0=OvMt=HC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5665CC433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2DF6664E2B; Sun, 31 Jan 2021 22:18:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23B564E29;
	Sun, 31 Jan 2021 22:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23B564E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f54.google.com with SMTP id d2so3790502pjs.4;
        Sun, 31 Jan 2021 14:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azUrymzYkMpG3QdawuXg9B9eTIWCZ4nx4P4ZI0Sx6Pc=;
        b=Fi5Garo7fYRiZD2Gf5igCyIHildypmTMl3mHuRio4GC9o0hd8qRBrOVzTONiX17INl
         7GZVO/hHLpL8DgnGknCuEIetw2l9KPXgjFnoUuNU3VvwXRgMineCpnpAkXe/WrJ9h6dk
         1xUDVrdHJ00eBuTW5vk7Tcp1UMhNJf24JEkD5G3CSB0aftg3B4aX0Ul87Jiq4PxcUfPs
         IWoQCdjPJetYGiPvijEAi0KI8jtBpjiGRc52ciRUXg0HBCNTdBN3u0+OBwHYG4ElxT/9
         jnejqg893XLVixfLqEXgbkzSDAf6ZVe6XfKzuI9W0lcNNKwvV7HCkdix4K4UE4dgl7In
         +bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azUrymzYkMpG3QdawuXg9B9eTIWCZ4nx4P4ZI0Sx6Pc=;
        b=nBDelV7HluBYpp0qY/G/iEEQ+wE2jmAez4i4R3TByqgA0/w0XwFfCWOcu9UNNS/nVs
         Gc5vjJBT7hz4SP9XxtpF4a/6+GHsbl3fkCPMnQh+Cbf3ktn9vQUzUqHqg1y47p+5Vn8l
         Q/FRMNTfn3bZFHYLNxxX3vF8oV1R6dSOQRLDirk9AVUpM6/8ZXpwAGnSWiXImkkaI/dT
         /cjU3FZ7tot5YF8jPlHtfG9zyqJ4rgB1ae5fG6ChXtqSfhjLhnGSKb7GsyeEqOMk6Erq
         htH87Gka5L2Ufg0K7sn984WvDuqF7V/cgRbk+RjICCFQ8zbUl3xgxUaGUeYUa6MpobZd
         oejA==
X-Gm-Message-State: AOAM531UYPgRNzf8Hp9oBivd2p1Ud1Xk0Hc56ozTxRswQS3Z1yoPlPrB
	nywyIvSFBuc9zjr/j3Z6K6C+GuZv7mc=
X-Google-Smtp-Source: ABdhPJznS1Ur/1MiAJ+AKUoYzomujL9QNccE+rJLDi+mSPNdYXJpJCCxvwbgUdsr5E+dDCKsSvXrDA==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id o2-20020a1709026b02b02900dac6c0d650mr15206734plk.74.1612131489147;
        Sun, 31 Jan 2021 14:18:09 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:08 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/6] Broadcom drivers changes for 5.12
Date: Sun, 31 Jan 2021 14:17:19 -0800
Message-Id: <20210131221721.685974-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/drivers

for you to fetch changes up to 8b8f095b9076ca61107c0910c9273afd1dfa1f04:

  soc: bcm: brcmstb: Remove soc_is_brcmstb() (2021-01-27 09:36:41 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers changes for 5.12,
please pull the following:

- Rafal adds support for the Power Management Bus (PMB) which is used in
  a variety of DSL/Cable modem/STB SoCs with a primary target being the
  4908 Wi-Fi SoC from the DSL organization. He also adds empty stubs to
  get the chip identification (family and revision) to permit the
  Broadcom STB USB PHY driver from being decoupled from ARCH_BRCMSTB

- Florian removes an unused function and its header

----------------------------------------------------------------
Florian Fainelli (1):
      soc: bcm: brcmstb: Remove soc_is_brcmstb()

Rafał Miłecki (3):
      dt-bindings: power: document Broadcom's PMB binding
      soc: bcm: add PM driver for Broadcom's PMB
      soc: bcm: brcmstb: add stubs for getting platform IDs

 .../devicetree/bindings/power/brcm,bcm-pmb.yaml    |  50 ++++
 MAINTAINERS                                        |  10 +
 drivers/soc/bcm/Makefile                           |   2 +-
 drivers/soc/bcm/bcm63xx/Kconfig                    |   9 +
 drivers/soc/bcm/bcm63xx/Makefile                   |   1 +
 drivers/soc/bcm/bcm63xx/bcm-pmb.c                  | 333 +++++++++++++++++++++
 drivers/soc/bcm/brcmstb/common.c                   |  17 --
 include/dt-bindings/soc/bcm-pmb.h                  |  11 +
 include/linux/soc/brcmstb/brcmstb.h                |  16 +
 include/soc/brcmstb/common.h                       |  12 -
 10 files changed, 431 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/brcm,bcm-pmb.yaml
 create mode 100644 drivers/soc/bcm/bcm63xx/bcm-pmb.c
 create mode 100644 include/dt-bindings/soc/bcm-pmb.h
 delete mode 100644 include/soc/brcmstb/common.h

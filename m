Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43978ECAAD5
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 15:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15DA1C433D6; Fri,  9 Sep 2022 15:30:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 273F7C43470
	for <soc@kernel.org>; Fri,  9 Sep 2022 15:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 273F7C43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id s10so1642628ljp.5
        for <soc@kernel.org>; Fri, 09 Sep 2022 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Qqz7LHKRHVaoBiZoiumJLitP17O6Oint8yglVlrai4s=;
        b=PSpFpfjKN2y/TrOsKNxcmdgd+5wXlNhYGsbAqWLPETGjp4CDScRHLyqVZ5wL6BU42t
         +h0PkVRBFgZ8/9Uz74k8hYYg7XkVGGmm9/eGijvPyEX8MV6hd1lbUNDem3G4rFuui78A
         JrJrlU0E+XPAxRnwzvGJ5yLggMgpHPpycOwxeWww45DVJGvjEM6u8hsz0N7kKtomErvt
         6158pRR9MglwLw0z3pHXP8F7FA7duWG2lsyhzHayP7M/n6vVs0s1DSc5U/EPS5gq2Sb/
         HZ2XOCYy1s2GYfZRQnlk/bvIPvEfH5W0mE0WoITMF+X8f2rb4JrxKaPRK9QCdBmGp+EH
         BC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Qqz7LHKRHVaoBiZoiumJLitP17O6Oint8yglVlrai4s=;
        b=IdemT7iuKR/UuG69fi3gg7nR4VbYvrfcxAy6dF56wAP4sXgMequWahAtHJL2avDIW4
         021STnP5XMCi6CUt686i8z+5RIK8/cTvot2Lac9ohsUsPdERc87fllYth/l22m6iFAR5
         7hFHqQ1DpClMl2GYbJ/i9fkJEhPs3B3VEDDzj0Ghtj97/j1cj1Uv+5uZ1QJuQF6XnOSf
         D8vY0dUv3eVxIfImivkisi6Qmqf7YKJDj/HiYzFyqgbBs2gAPWWEeKBAVRA3rBD3TBW9
         hrb4xJ7xsGfrl0SOrwFpkZ0kBGcFxmzrYkArP89KFBTN34YMS8sIL6elwE4I+a4fi63B
         donA==
X-Gm-Message-State: ACgBeo0tnYSXnQ/WGw6b13AWoG0XH8jOWX3cXTcXg2d5q4mR64V3/Gqo
	/XN2mH51PUxiEYdMfT+QzQBqmQ==
X-Google-Smtp-Source: AA6agR6jeR9XLXaOttj2Wp7lcRgPEsrFlZ8hWAwELjUJ5ux5burtC8n4cUVGvnuyBFny/FoBEhCV8w==
X-Received: by 2002:a2e:1f12:0:b0:261:962d:26a1 with SMTP id f18-20020a2e1f12000000b00261962d26a1mr4350368ljf.521.1662737447264;
        Fri, 09 Sep 2022 08:30:47 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6-20020a05651c00c600b0026ac3fedd20sm117314ljr.86.2022.09.09.08.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:30:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] memory: brcm for v6.1
Date: Fri,  9 Sep 2022 17:30:36 +0200
Message-Id: <20220909153037.824092-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
References: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Topic branch.

Best regards,
Krzysztof


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-brcm-6.1

for you to fetch changes up to a4be90ff7a7d22a5a781ed2bb3c2d4b2f535a515:

  memory: brcmstb_memc: Add Broadcom STB memory controller driver (2022-08-18 09:11:45 +0300)

----------------------------------------------------------------
Memory controller drivers for v6.1 - Broadcom

Add support for the Broadcom STB memory controller (BRCMSTB_MEMC).

----------------------------------------------------------------
Florian Fainelli (3):
      dt-bindings: memory-controller: Document Broadcom STB MEMC
      Documentation: sysfs: Document Broadcom STB memc sysfs knobs
      memory: brcmstb_memc: Add Broadcom STB memory controller driver

 .../ABI/testing/sysfs-platform-brcmstb-memc        |  15 +
 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   |  11 +-
 .../memory-controllers/brcm,brcmstb-memc-ddr.yaml  |  52 ++++
 drivers/memory/Kconfig                             |   9 +
 drivers/memory/Makefile                            |   1 +
 drivers/memory/brcmstb_memc.c                      | 301 +++++++++++++++++++++
 6 files changed, 380 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-brcmstb-memc
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
 create mode 100644 drivers/memory/brcmstb_memc.c

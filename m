Return-Path: <SRS0=Ww/W=IA=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798A0C35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 10:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3936FC433CB; Thu, 21 Dec 2023 10:20:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13BD2C433C9
	for <soc@kernel.org>; Thu, 21 Dec 2023 10:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13BD2C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d352c826eso7728875e9.0
        for <soc@kernel.org>; Thu, 21 Dec 2023 02:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703153999; x=1703758799; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ncgABTCdGBw0CAzWbFnnfumaUfHdt8Nbmu7o0Ioedpw=;
        b=MwxKd4U2QnmnPw3bt+H2TkaBbdFIurdTomonDkV1NJeFSta57Q+1YHPaE78LgEUBm9
         rHnHwE8jD1cWrp18hzO6BcYw4gECUdHjtS/tOPyU36tiDpb5KE0/u5MPPoZdViZPerl+
         WxEwmcoMGXq87nRFUF/u9FmXuq6bfjOWxOeV/k5bvNksoeA6v76ficGoNvulFSqBwRXw
         0cUhX7XqIrT85Ze9IKvmiHP8hJtPpNgy5l9PCO1pwnI+fsuhA6b4gWkVjQvHYlzr10Rl
         ZEBrIgrIiy9cWm4sYZ4k9jB7GEFHeAjHIBMYCLjfGF1gd83WVZNHeog42jkRpjRP05ly
         fgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153999; x=1703758799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncgABTCdGBw0CAzWbFnnfumaUfHdt8Nbmu7o0Ioedpw=;
        b=a283A/ZayAac1i71TnHCbZmOo3gIFB0J4ue/eHcbUZ+DHowjlwlWJUafRTnvni2/bK
         jfiwZPo0KpjSydDobQP7oAwh0MjvOcJ5LlwuC4tv5eBoT3I5SRPUNuqOtofx7gYVswSv
         qwqRmOUemKEt2nRM5MQ0Exr60Cm+24vBii4/kCdylutvy5FfT134Q5PBY+1YGnZ3NPkr
         YQZ/VJylL4KplCR2rGrY3ZueCyYdA+qHuzuDe9aorjy8dEm7U4ZbrkohFBXLvkSLyR6A
         lJrRwmaFEGLICAP3L8AkPNEH80G5p0TJCRTdXN6CX4BvEuBM/9DdRmwlmEO9AoVe/rpd
         qi/w==
X-Gm-Message-State: AOJu0YyH+CCcdLWAPrLXxeIgTHANh/cjfQCAIGk86CftX3jkaav62DeE
	2vV9KMakzB69Dm99drKO9DEsVg==
X-Google-Smtp-Source: AGHT+IFg88O/OHFdh5msbuWj8UlRrpIJ55OkeR2K7Sdmc5pIObNzWxGViQXX4T11YRZDFKQZ5NwONw==
X-Received: by 2002:a05:600c:34d3:b0:40d:18c4:d744 with SMTP id d19-20020a05600c34d300b0040d18c4d744mr634990wmq.97.1703153999252;
        Thu, 21 Dec 2023 02:19:59 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id p9-20020a170907910900b00a26ac5e3683sm125186ejq.100.2023.12.21.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:19:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.8, part two
Date: Thu, 21 Dec 2023 11:19:56 +0100
Message-Id: <20231221101956.16351-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 4a23d0f9814c38308dc82b6dbc466666a400b27d:

  memory: tegra: Protect SID override call under CONFIG_IOMMU_API (2023-12-06 11:22:24 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.8-2

for you to fetch changes up to 365fcc03b6321f36eb7cbda8baa737238c387907:

  memory: ti-emif-pm: Convert to platform remove callback returning void (2023-12-19 09:05:19 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.8, part two

Convert all drivers platform remove callback to the "remove_new" which
returns void.  Usual rationale from Uwe:

  The .remove() callback for a platform driver returns an int which
  makes many driver authors wrongly assume it's possible to do error
  handling by returning an error code. However the value returned is
  ignored (apart from emitting a warning) and this typically results in
  resource leaks.

----------------------------------------------------------------
Uwe Kleine-König (15):
      memory: brcmstb_dpfe: Convert to platform remove callback returning void
      memory: brcmstb_memc: Convert to platform remove callback returning void
      memory: emif: Convert to platform remove callback returning void
      memory: fsl-corenet-cf: Convert to platform remove callback returning void
      memory: fsl_ifc: Convert to platform remove callback returning void
      memory: jz4780-nemc: Convert to platform remove callback returning void
      memory: mtk-smi: Convert to platform remove callback returning void
      memory: omap-gpmc: Convert to platform remove callback returning void
      memory: renesas-rpc-if: Convert to platform remove callback returning void
      memory: exynos5422-dmc: Convert to platform remove callback returning void
      memory: stm32-fmc2-ebi: Convert to platform remove callback returning void
      memory: tegra186-emc: Convert to platform remove callback returning void
      memory: tegra210-emc: Convert to platform remove callback returning void
      memory: ti-aemif: Convert to platform remove callback returning void
      memory: ti-emif-pm: Convert to platform remove callback returning void

 drivers/memory/brcmstb_dpfe.c            |  6 ++----
 drivers/memory/brcmstb_memc.c            |  6 ++----
 drivers/memory/emif.c                    |  6 ++----
 drivers/memory/fsl-corenet-cf.c          |  6 ++----
 drivers/memory/fsl_ifc.c                 |  6 ++----
 drivers/memory/jz4780-nemc.c             |  5 ++---
 drivers/memory/mtk-smi.c                 | 10 ++++------
 drivers/memory/omap-gpmc.c               |  6 ++----
 drivers/memory/renesas-rpc-if.c          |  6 ++----
 drivers/memory/samsung/exynos5422-dmc.c  |  6 ++----
 drivers/memory/stm32-fmc2-ebi.c          |  6 ++----
 drivers/memory/tegra/tegra186-emc.c      |  6 ++----
 drivers/memory/tegra/tegra210-emc-core.c |  6 ++----
 drivers/memory/ti-aemif.c                |  5 ++---
 drivers/memory/ti-emif-pm.c              |  6 ++----
 15 files changed, 32 insertions(+), 60 deletions(-)

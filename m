Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2AFC4167D
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 06:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B8F4C433CA; Wed, 13 Dec 2023 06:15:28 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49025C433C9
	for <soc@kernel.org>; Wed, 13 Dec 2023 06:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49025C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a1f6433bc1eso1027284266b.1
        for <soc@kernel.org>; Tue, 12 Dec 2023 22:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702448125; x=1703052925; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFLJyY/AoSsrATUYN2/LL/H3Uqh2viH08QvQNsb6evo=;
        b=aM6Fa9h1ygizD4wtHxgYYvM4/faWHZYeXyah3UWm8y8147GMYOXat9v8vlgu0ztEYY
         E6HGzESjAFKZo+wGE7/sWDNn2ogq1x2Rw9ZxfHzCLUJbKbSfQRkdBkatv6bDc2Ba4+qZ
         1ZUtT9+pWloLB1Nk6QcdPHDdtya9NpTK7kBY3F0qrQMiYh06R89FF95B0xxDlWRKbzkb
         YOJn9UkN2yV0cdtQVcgpWhgjIhHcfKbL3YWSsj4JkOklClj9/z2xVPCejTwsUZmNASnV
         y6Jv4WnFSSZEI6NuOyLeVtl17unv8jqX6sqD/LVXvkgbLF+723ZIODhZxEX+IOEYapgD
         tZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448125; x=1703052925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFLJyY/AoSsrATUYN2/LL/H3Uqh2viH08QvQNsb6evo=;
        b=hdzvLd8eSyyE31bKHLlnHeWIREdRHyfArE5d8HV+31eDdS1xx+qpfZvuRb7NWAK8+I
         a5LnAclVEsM8aWQ+3cbXwFOFO1f19d7zqHdbMfYI2GJXeQDr3G+4BMeu9YsfhCSwcyD8
         ymmAgZKa/gyZiFpbRc7zvG9O+8Ic2iHhPIL4qIpPtntVVrzwWXCacn3RsBLvCLozBybB
         Fsw2Afuj4Jupgv7KaDWA91qwoQWspNFuWN1MRuKVMfYIY4cl90Hax9R7VqWCIr3gEJBz
         U7hNhv5iMOZe3DR3X3SNNSMs7u4/eHlbSfkZSmVQWjsXTjD0nJNGcxcfHhT2umjY9b5B
         oiMA==
X-Gm-Message-State: AOJu0Yw8u89/zW6SiSpXS84uQoiiRTCV7ALJSLx1VE5Tbx10OgtGLU3V
	KYjmTo+azG+hZxxwFdlkZp6z6A==
X-Google-Smtp-Source: AGHT+IHGwghhhqakImxuubxRqXzBGnSektPNowNWBqz9BZDJDu/14/SoeddJwpQ2DwkxYnh76dAJMQ==
X-Received: by 2002:a17:906:51de:b0:9f2:859f:713e with SMTP id v30-20020a17090651de00b009f2859f713emr8317782ejk.3.1702448125555;
        Tue, 12 Dec 2023 22:15:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tx27-20020a1709078e9b00b00a1c85124b08sm7303185ejc.94.2023.12.12.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:15:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.8
Date: Wed, 13 Dec 2023 07:15:23 +0100
Message-Id: <20231213061523.4803-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.8

for you to fetch changes up to 4a23d0f9814c38308dc82b6dbc466666a400b27d:

  memory: tegra: Protect SID override call under CONFIG_IOMMU_API (2023-12-06 11:22:24 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.8

Few improvements for Tegra Memory Controller: Override the SID
programming in the device, if firmware or bootloader left it in bypass
mode, e.g. after resuming from suspend.  Skip prorgamming the SID, if
given Memory Controller client does not support it.

----------------------------------------------------------------
Ashish Mhetre (3):
      memory: tegra: Add SID override programming for MC clients
      memory: tegra: Skip SID programming if SID registers aren't set
      memory: tegra: Protect SID override call under CONFIG_IOMMU_API

 drivers/memory/tegra/tegra186.c | 19 +++++++++++++++++++
 include/soc/tegra/mc.h          |  1 +
 2 files changed, 20 insertions(+)

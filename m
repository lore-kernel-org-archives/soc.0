Return-Path: <SRS0=AmXx=5G=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E9C54EBD
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 15:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F8CDC433F0; Mon,  9 Jan 2023 15:03:29 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 960D8C433D2
	for <soc@kernel.org>; Mon,  9 Jan 2023 15:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 960D8C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id bp15so13377608lfb.13
        for <soc@kernel.org>; Mon, 09 Jan 2023 07:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw0Nabwis8nZFJhL3dT5aarZI1LrhYRX+Cvdj6bBSXY=;
        b=Ph0KeMW9SdSz5EEupchb6zMNlMrk+LwhbzEukR97CnovrcQtWZObFSK6xHcmGZzfj4
         vYQeTFjLm6YtIDVONeLhi10jrZC4KJbqS050DDOppOf3fT1lYg2qtIeqoeEb9YBvGPxe
         EiFsL0pv5eil1RF75TYXTJIq8NtH0/ZZ8/MiN30vrG3PWKaF7pfPZxv9NTrAfbDGCOB1
         4jkRDSReI86V+pKTvvLmg3HOdXB2n2TRkFCtTxG2Xoa/2DyHN3lytLasB72G5A0jX7mh
         MgGu7FNTf6YfHpRpKEJj0pi1zCROeP/wUYrg7xGOvEy5xmC+j5of3IacyyVev82RqQnp
         MCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw0Nabwis8nZFJhL3dT5aarZI1LrhYRX+Cvdj6bBSXY=;
        b=Pq+RXqBrbUUTgdE+hhg166kAlZg/ng9lWblhCCOJOipdCKSkPMOzcwQD8o8+7KdIrj
         wsJPuh8EwT7zzbiXWalaWw9M5apWD30YQ33FozYpyRJFUKvVoQ/B3NUnYnnXHBwiXUvE
         L5+6LqPO2eIPEcCimGLh8/9w0SLD6kPIv5+adF7ZDaO9agBvo/0Y9eK1vIDGgxmKLLPj
         YrnSCG/KjitIWArxYmCKEaSerhcqz6AWKo2YNRzfzlXiIrjdxUnfms+9lr1/JrOB70pG
         qY516hsMcxa3F9Z7pmx7yBT3q/SVdC+p9gy2QsWISCf10p0wx2ZRa8yIZif73c6u69aG
         Q1kw==
X-Gm-Message-State: AFqh2koukjrMS0XRV4XyZPM+GkFTUEbYue0fB9tyVs8WSjDs/rE2wd6G
	dWggiLbfeMRJ6Pivj+kcbFnZwA==
X-Google-Smtp-Source: AMrXdXt56g+/SbNOrq1lyMbVPkBMyV0C2TXhgpSaj8ud3LwBAMryXyBCIp7wPikUmVCbKZ+efHmQ4w==
X-Received: by 2002:a05:6512:20d0:b0:4b5:88e4:2ba4 with SMTP id u16-20020a05651220d000b004b588e42ba4mr15866201lfr.15.1673276605590;
        Mon, 09 Jan 2023 07:03:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x14-20020a1c7c0e000000b003d9f15efcd5sm2956202wmc.6.2023.01.09.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 07:03:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: fixes: Fixes for v6.2
Date: Mon,  9 Jan 2023 16:03:22 +0100
Message-Id: <20230109150322.329614-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

One thing broken in merge window, few commits for older issues.

Best regards,
Krzysztof


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-6.2

for you to fetch changes up to cb8fd6f75775165390ededea8799b60d93d9fe3e:

  memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe() (2022-12-27 09:54:32 +0100)

----------------------------------------------------------------
Memory controller drivers - fixes for v6.2

Broken in v6.2:
1. OMAP GPMC: do not fail if "gpmc,wait-pin" optional property
   (introduced for v6.2) is missing.

Broken earlier:
1. Tegra MC: Drop SID override programming as it is handled by
   bootloader and doing it in the kernel can cause unexpected results.
2. Atmel SDRAMC, MVEBU devbus: Add missing clock unprepare/disable in
   exit and error paths.

----------------------------------------------------------------
Ashish Mhetre (1):
      memory: tegra: Remove clients SID override programming

Benedikt Niedermayr (1):
      memory: omap-gpmc: fix wait pin validation

Gaosheng Cui (2):
      memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
      memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()

 drivers/memory/atmel-sdramc.c   |  6 ++----
 drivers/memory/mvebu-devbus.c   |  3 +--
 drivers/memory/omap-gpmc.c      |  3 ++-
 drivers/memory/tegra/tegra186.c | 36 ------------------------------------
 4 files changed, 5 insertions(+), 43 deletions(-)

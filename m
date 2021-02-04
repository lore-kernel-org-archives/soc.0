Return-Path: <SRS0=wwgT=HG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E17EC433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 05:22:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 063ED64F55; Thu,  4 Feb 2021 05:22:39 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC6864F53
	for <soc@kernel.org>; Thu,  4 Feb 2021 05:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC6864F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f52.google.com with SMTP id d7so14605otq.6
        for <soc@kernel.org>; Wed, 03 Feb 2021 21:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNhjejt95hLlQiht+V60b6s/E974FjQJnxFYdOCYRnM=;
        b=DlwUkuVf8orbvgDKQ3JiFiCFhhM03z+4fon31xQD9E7LR7lhDRcydiyfIP+RzBxXH9
         CFomCtcZ8EbliBh3JC0hjnr73tnuePIP1zQmYMHp6aHeqER0siPM1muyQEhOl/2QCWx8
         p+aRjMfafNr2AQC4HegZJ/Up3hQ5iALsYLe+Lis7DNK6VToMAxeVE8rJG974vkj8nnF+
         dXi1OIPCUpZbqvO3Rh3wYwM2CuJDIMeZzrTaaK7loyYyJ7Wo858hSRG1PdEq4a3femrI
         n3mzolNijWn6BGD5nVjm4DJ377ivV4DjZQsqKDZ1Thk5G1wqgj0WBdLvsQbAbJY4xkJ0
         CELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNhjejt95hLlQiht+V60b6s/E974FjQJnxFYdOCYRnM=;
        b=lPmBdTp3sepgc/0CsfGMJTFPDKoELmCoxNC+y5UbjjxQqF9zKtayL/zbCU2svbne9k
         6qGVuMjYhcubvna3xIFzOxrUL4U17zdLTvriQKWlP7UIdLlvx6Z4cmN6vhSD3rtEHc47
         hQebiPI19ljpi2bP2DjWNguUZx0DDvrhjV7Le5drR9jd0elyKJ/BwLpXpCq/CIYTh5bI
         FNU61fcZoyyU/8Olb+Xj3gk9wwSxRxRNuLPgwQwmZKYMlR8FEUPHdo5fRfYqPRQ9q9H9
         KV6is18nXbbumfVIvd6S7t6B5I+GSPkY+YKPXHC2A83xqsTDfs7Y/fyfLMNJIr+8vsG1
         0aTA==
X-Gm-Message-State: AOAM533NJuH03bW2R0WIkKqUfNk4k47Ey/gskXqvIDlGVIHMbfr2r7ka
	CEYNSm8jEjxMDnz1KZx3j9iwIw==
X-Google-Smtp-Source: ABdhPJwRk5FvjI2WqtUWF/xkdj1I5szZZNy6I+YTkeIM7qbNATHuL7tJDSF/ybx+XIOUR6VYuML9UQ==
X-Received: by 2002:a9d:4b0d:: with SMTP id q13mr4581587otf.325.1612416157957;
        Wed, 03 Feb 2021 21:22:37 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f6sm922390ote.28.2021.02.03.21.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:22:37 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 5.12
Date: Wed,  3 Feb 2021 23:22:36 -0600
Message-Id: <20210204052236.388783-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.12

for you to fetch changes up to f147d717b133bbecded354b28afff9f2c3e9164f:

  ARM: qcom_defconfig: Enable Command DB driver (2021-01-22 13:50:47 -0600)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 5.12

This enables various device drivers found on the newly introduced
Qualcomm SDX55 platform in the qcom_defconfig. Due to kernel image size
constraints the qcom_defconfig is used instead of multi_v7_defconfig,
for now.

----------------------------------------------------------------
Manivannan Sadhasivam (13):
      ARM: qcom_defconfig: Enable RPMh drivers
      ARM: qcom_defconfig: Enable SDX55 pinctrl driver
      ARM: qcom_defconfig: Enable SDX55 GCC driver
      ARM: qcom_defconfig: Enable SMEM partition parser
      ARM: qcom_defconfig: Enable MTD UBI driver
      ARM: qcom_defconfig: Enable UBI file system
      ARM: qcom_defconfig: Enable DWC3 controller and PHYs
      ARM: qcom_defconfig: Enable ARM SMMU
      ARM: qcom_defconfig: Enable RPMh regulator
      ARM: qcom_defconfig: Enable watchdog driver
      ARM: qcom_defconfig: Enable ARM PSCI support
      ARM: qcom_defconfig: Enable RPMh power domain driver
      ARM: qcom_defconfig: Enable Command DB driver

 arch/arm/configs/qcom_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

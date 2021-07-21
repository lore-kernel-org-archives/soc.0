Return-Path: <SRS0=8gIh=MN=gmail.com=digetx@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC06C6377A
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 23:26:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 08D686121E; Wed, 21 Jul 2021 23:26:50 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCEAD6120C;
	Wed, 21 Jul 2021 23:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCEAD6120C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=digetx@gmail.com
Received: by mail-lj1-f172.google.com with SMTP id e14so5080093ljo.7;
        Wed, 21 Jul 2021 16:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Il8UJhGjpnmDj53189lXqkD37q5sKtSo66wNqc5Vg6s=;
        b=FETA6EXuOLfRCzWuWoDNBcuxD19MHcO7al3jDz2bgwQbnkgcyBmyBV5UmVtUVMvjv4
         YFz17ZeOTPHL9VSVRwQxIGWsss030dCcd+mlkzJQmbRFmqB1kLLWmwwey09xzVVyXTtp
         psZsVLgdvoNLTrRmySx6j28CgbK8i1V8xRx1V4AoJr3hNdJemw1Qv0HbfEiJS7h8h9Be
         MksqFXVecOch1uCbtNHPbqN1El74Qxd1gVenS585EP+J4qggxDAGfgsXKIZSSnDL45/y
         Z/rUngHbohqmg2RtFcPhtXQvhCDNlr4ouJ9P0cthSqNdbFittrp30JPW5Vtsq1eB+4Ou
         q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Il8UJhGjpnmDj53189lXqkD37q5sKtSo66wNqc5Vg6s=;
        b=uH0AYMVxOlc/Fwyw0L61Qw38eR8pEoFzIPdgCn9j6NKrvV8R2DkcREB1pbkgcl992P
         W5xB61BRedhp1/8bmlyBhuARs4ckLpYVX9CNkmH/zZhOVRufWLmzu+/RcAk0uB0BkuO6
         INXmB5U0pqLX5yomaKsq/uRTHMvj4gHd3urp7eIrP70q25at0qPmJQi3bjPXjjmXJG0E
         KVsjpB9MHNU1U7RhzxxnXu/Z+gjf7uNbchXRL1X1vsCT4E3dDlhBjFYNMcZffg8DhS9l
         TtCXHz06aaOKlS8KVVB4xmg4ClNR9dytDWhs8mbdTBdQojzyrSAp+tZV9QR9WH0VzeZW
         cxEA==
X-Gm-Message-State: AOAM531bazbLio9iQAeiFmBWlFmhIMkKDdeKRFLficok1VLTorWvpnK2
	ytj5shFCiZxdOTPHRRActIU=
X-Google-Smtp-Source: ABdhPJwuJINA3x8dOeYPlYtlUIejwdIani8/VDGazBclVy2E9Kr3PNSAFVIBVHnB2LJlhwalaUG+yA==
X-Received: by 2002:a2e:9695:: with SMTP id q21mr5223735lji.509.1626910008292;
        Wed, 21 Jul 2021 16:26:48 -0700 (PDT)
Received: from localhost.localdomain (79-139-184-182.dynamic.spd-mgts.ru. [79.139.184.182])
        by smtp.gmail.com with ESMTPSA id u10sm2940026ljl.122.2021.07.21.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 16:26:47 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2] soc/tegra: Make regulator couplers depend on CONFIG_REGULATOR
Date: Thu, 22 Jul 2021 02:26:16 +0300
Message-Id: <20210721232616.1935-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator coupler drivers now use regulator-driver API function that
isn't available during compile-testing. Make regulator coupler drivers
dependent on CONFIG_REGULATOR in Kconfig.

Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system reboot")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - No changes. Re-sending to Arnd Bergmann and soc@kernel.org.

 drivers/soc/tegra/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index db49075b1946..1224e1c8c2c9 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -15,7 +15,7 @@ config ARCH_TEGRA_2x_SOC
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
-	select SOC_TEGRA20_VOLTAGE_COUPLER
+	select SOC_TEGRA20_VOLTAGE_COUPLER if REGULATOR
 	select TEGRA_TIMER
 	help
 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
@@ -29,7 +29,7 @@ config ARCH_TEGRA_3x_SOC
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
-	select SOC_TEGRA30_VOLTAGE_COUPLER
+	select SOC_TEGRA30_VOLTAGE_COUPLER if REGULATOR
 	select TEGRA_TIMER
 	help
 	  Support for NVIDIA Tegra T30 processor family, based on the
@@ -154,7 +154,9 @@ config SOC_TEGRA_POWERGATE_BPMP
 config SOC_TEGRA20_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra20 SoCs"
 	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
+	depends on REGULATOR
 
 config SOC_TEGRA30_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra30 SoCs"
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
+	depends on REGULATOR
-- 
2.32.0


Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989A5C678D4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 15:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C447C4339E; Mon,  6 Mar 2023 15:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F45C433D2;
	Mon,  6 Mar 2023 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678116871;
	bh=ouELPa2aI3ivJYhsoRIXEPjaBwaOw6IgYkQLHxSAZ+g=;
	h=From:Date:Subject:List-Id:To:Cc:From;
	b=Z87b9gaB7bNVwA1FHe0FEiDWbXkI8LxmXUqSw6Rt+cQt2PAmoQkEBgWDTnJ7fq14L
	 FFhlTVOy74+m/RhbuFQml9BEQgPm2uLbg81YAOc4G5ZT7TXTsm+XMwHqrror8CCRL6
	 m8LNn0VMvAG8fPHOispMTz6mrQ3eANh3swu/R1+PF+UT1tFf7RthM+g5P9Wa1R0VJA
	 xkFs+cq4TlOtVhReKUmMEu95sKQ6Zw3mrpHGGo+c8yBKyILWDKX5jEwgtFlH6en2d1
	 LTRdPbxG3IuQZ5PEBDpBYPExDehwEYTtHmzKjCN9+RYj4OUvoDdJuQ0m6Lt2wNiwZL
	 YrQXxItXhkfzA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Mar 2023 15:34:21 +0000
Subject: [PATCH] arm64: virtconfig: Further shrink the config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230221-arm64-virtconfig-slim-v1-1-604b64be7ec3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPwHBmQC/x2NywqDQAwAf0VybmCNZQ/9ldLDPqIGuqskIgXx3
 7t6nIFhDjBWYYNXd4DyLiZLbdA/OkhzqBOj5MZAjgZH1GPQ4p+4i25pqaNMaF8pSBxdzi54nz2
 0NgZjjBpqmq96K+tlV+VRfvft/TnPP7EdQYV9AAAA
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bd1bf
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ouELPa2aI3ivJYhsoRIXEPjaBwaOw6IgYkQLHxSAZ+g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkBggEm4/VesX3gTj1spAqAJNRYOxI7FH6aIQJ7YC1
 XY53bLKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZAYIBAAKCRAk1otyXVSH0AjyB/
 9VSTXcFvWyNM06zfuxfinVvMBkScBb18GM7E+AGPB4w+zETs3G67OkhmUIHx10BXIZvSVq2Piwf8n7
 70IyDrWwkf5uHW0McAybvnBa6vmdtospNOT6aY9jztnxrJtSIuStfTX+dH5O9JtCAaS/LBFl343fKz
 QkEv56YRLA0SqD8bs8klNPXRSQLhTTFKG3QvmMjx857D1xCXeup8Rd5FbJHdPPQsL4KEe8rjh+Ig4e
 SAouTTrOWB9iu/HdiLSZDUQ+MCMQ5hT5i5DKah56WKwgCoH/8Cuo9Sx7RG8jCONTar5zwpusbLpOCk
 RM54l4aMsMMrOBhbahjp5DOsd0vpOH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

After disabling platform support there's still some more pruning we can
do to the virtconfig size, there are a number of drivers and subsystems
which are not likely to be useful on mach-virt and so can be disabled in
order to further improve build times. Let's do so, noting that having PCI
device assignment means that PCI devices might potentially appear.

This is just an initial manual passthrough, there will be further savings
available especially if we take a much more focused approach.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/configs/virt.config | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
index 6ef0a739717f..6865d54e68f8 100644
--- a/arch/arm64/configs/virt.config
+++ b/arch/arm64/configs/virt.config
@@ -1,3 +1,7 @@
+#
+# Base options for platforms
+#
+
 # CONFIG_ARCH_ACTIONS is not set
 # CONFIG_ARCH_SUNXI is not set
 # CONFIG_ARCH_ALPINE is not set
@@ -37,3 +41,20 @@
 # CONFIG_ARCH_VISCONTI is not set
 # CONFIG_ARCH_XGENE is not set
 # CONFIG_ARCH_ZYNQMP is not set
+
+#
+# Subsystems which can't be used in mach-virt
+#
+# CONFIG_CHROME_PLATFORMS is not set
+# CONFIG_EXTCON is not set
+# CONFIG_IIO is not set
+# CONFIG_MTD is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_PWM is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_SLIMBUS is not set
+# CONFIG_SND_SOC is not set
+# CONFIG_SOUNDWIRE is not set
+# CONFIG_SPI is not set
+# CONFIG_SURFACE_PLATFORMS is not set
+# CONFIG_THERMAL is not set

---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230221-arm64-virtconfig-slim-2eb0dd0a66d6

Best regards,
-- 
Mark Brown <broonie@kernel.org>


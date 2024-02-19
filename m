Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB59C54764
	for <soc@archiver.kernel.org>; Mon, 19 Feb 2024 09:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFF86C43399; Mon, 19 Feb 2024 09:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82908C43394;
	Mon, 19 Feb 2024 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708335506;
	bh=LkDFMgrk7Th+N3vQSprqGTyuxUeNhHvf7vzI5mE/Z7c=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bFLop4tMdf1YUkZ/vhzIhrBjr+F2hheGHi3LWAfeOi9pwhjX2eqpEBD5t1aUvrK1B
	 KEnVfRe+92U0v33PWd1XVTwX6fjM6zbxYOVjVuy2jt+JxJvLA597ujaVGEDfqagb+F
	 RCqg9d1RtCZrqeZ4wQVDK6615jbBLhxEAe1D2l+ZZC+yNmSjwk3MmZ7nM4fTlORhFx
	 HBqm0moXf2Nj912msQyzGl7VUnNGGtMlwHKBsdxIsB2GGSt99AJn/JU1nZxKCRCiTi
	 yRvJrW9w5icULfOSLs8TMCNFP4HSbcfRgRJo+3yF0PDGcgcmFrT1ifhAH6vdYJtzso
	 6Z3qpuKvv7CDQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: config: disable new platforms in virt.config
Date: Mon, 19 Feb 2024 10:38:04 +0100
Message-Id: <20240219093819.644324-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A couple of new platforms got added since last year when Mark
added virt.config, so turn these off as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/configs/virt.config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
index c47c36f8f67b..2d1d2ce7ae2a 100644
--- a/arch/arm64/configs/virt.config
+++ b/arch/arm64/configs/virt.config
@@ -14,6 +14,7 @@
 # CONFIG_ARCH_BERLIN is not set
 # CONFIG_ARCH_BRCMSTB is not set
 # CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SPARX5 is not set
 # CONFIG_ARCH_K3 is not set
 # CONFIG_ARCH_LAYERSCAPE is not set
 # CONFIG_ARCH_LG1K is not set
@@ -23,14 +24,17 @@
 # CONFIG_ARCH_MESON is not set
 # CONFIG_ARCH_MVEBU is not set
 # CONFIG_ARCH_NXP is not set
+# CONFIG_ARCH_MA35 is not set
 # CONFIG_ARCH_MXC is not set
 # CONFIG_ARCH_NPCM is not set
 # CONFIG_ARCH_QCOM is not set
+# CONFIG_ARCH_REALTEK is not set
 # CONFIG_ARCH_RENESAS is not set
 # CONFIG_ARCH_ROCKCHIP is not set
 # CONFIG_ARCH_S32 is not set
 # CONFIG_ARCH_SEATTLE is not set
 # CONFIG_ARCH_INTEL_SOCFPGA is not set
+# CONFIG_ARCH_STM32 is not set
 # CONFIG_ARCH_SYNQUACER is not set
 # CONFIG_ARCH_TEGRA is not set
 # CONFIG_ARCH_TESLA_FSD is not set
-- 
2.39.2


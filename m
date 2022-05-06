Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B80C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 22:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 600C1C385A9; Fri,  6 May 2022 22:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE25CC385A8;
	Fri,  6 May 2022 22:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651876029;
	bh=Ng2XjZTbdHRGxrGfBEMuahf8wfw8z7tvqdYctoPsB70=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=PsvOo8CGXNToAnEv0LhEHN60p/Y/0tZ+swxs4GwMNF4zHqk3iPZmXNs5Io4rm1tTR
	 N0uGm4y2N56X3lbij+cj6hKHgxDrvF6AlctUTLyqtlicO+i3/S12ffdgFOxpYX9b3x
	 oh78OgJZgNDMr3NESR8RrgXRrMwbvk94jffYIssd+vhWPfraAAus7AGtYXzUEmdlnh
	 rTaH/DulyzBfQ0FyHm3QzkKrVbDTEutPoEyK/e/vsZR+TaQ3GejS2UT/QIXexq6kBe
	 LKipZNlPjXfoJw2qNrI+QwSwaUvYDQIdJ1gC3PL+M+yiI9NH5tSHglwfkUurfwKBPU
	 FHeZS94K5AzCQ==
From: Mark Brown <broonie@kernel.org>
To: Sekhar Nori <nsekhar@ti.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: configs: Enable audio on BeagleBone Black in multi_v7_defconfig
Date: Fri,  6 May 2022 23:26:46 +0100
Message-Id: <20220506222646.1671474-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; h=from:subject; bh=Ng2XjZTbdHRGxrGfBEMuahf8wfw8z7tvqdYctoPsB70=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBidaA7qIrpZ6wtEJvbMsyurkNu9IFNLj0gRLyeNpig oZjb9e2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnWgOwAKCRAk1otyXVSH0PCEB/ 9M+Eg5tDK0r5P6bKPeFvBOoPtxG3wwjcnLsmi/IHty0A9KixB7xtroeOEhpq02A94qGFMqWW3upIKW bxezf8uz6DM9msDCHZHyuSVQPaK2ZT1rsz1tP1iLNjMyRY7XOMhHopW/kVv9tiZk5g5/BQy5CfG+Il Cdk1hNsHL2fAlPsglrkrdIZ6R1IMQjPy/C/KgjSGX1KeiyFuWsZ6yMBd1HNFQAsUXZUje5CGkcRgDB zy6y40fdSs7m9skNpH0nCDa9HrYItCm82kObMIFa3LEbFH7S5UVKVV10mc4d5BXbm8ZwOBVaQKRARg Caz7D6M4SY6PW9jfDzH/6FM5QCZ47T
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

The BeagleBone Black supports audio over HDMI, using a combination of the
DaVinci McASP (used for audio by a very large proportion of DaVinci systems
with audio support) and a TDA998x device driving the HDMI link (this is a
very widely used driver). Build both drivers as modules in multi_v7_defconfig
so they can be more easily included in testing.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d6a6811f0539..2e0384a31e4e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -684,6 +684,7 @@ CONFIG_IMX_IPUV3_CORE=m
 CONFIG_DRM=y
 # CONFIG_DRM_I2C_CH7006 is not set
 # CONFIG_DRM_I2C_SIL164 is not set
+CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_EXYNOS=m
 CONFIG_DRM_EXYNOS_FIMD=y
@@ -798,6 +799,7 @@ CONFIG_SND_SOC_TEGRA_WM9712=m
 CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
 CONFIG_SND_SOC_TEGRA_ALC5632=m
 CONFIG_SND_SOC_TEGRA_MAX98090=m
+CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_CPCAP=m
 CONFIG_SND_SOC_CS42L51_I2C=m
-- 
2.30.2


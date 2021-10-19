Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B65C433F5
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 15:42:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3D08E610D0; Tue, 19 Oct 2021 15:42:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5435610C7;
	Tue, 19 Oct 2021 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634658172;
	bh=M2/DuCNHUjvCKFyP3G3bM4ucVMkbsqwMpxtgwkUAdV4=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=TGYxGhZP3QNX+PVQnpvdd55aC6FI7RSV/BNGegiUx6dfWI3c+cr0zfoumxmXLVGnZ
	 Ad5P8xVF1/boXaxkAdFVRaHx5xDOwkMkBz4KDDsY8rkVIFP81tqQdwEFieL9TwWc94
	 99Wqjp+O1+ojOU6VPC3aOTKXJ0KChLTj1vhwF6q10nVisbF09vPH/HSz6tMRjQm48S
	 2T61OLeUd7UULGLkbKNI+TG07WjOkcGAlohqTMvvyb39/NOOxDwfM+yD2SU8sWUOBx
	 /rR7qJySE9w9DMeK0TR2ThBoy1pK1Ml1lW3/ojhiCNlWeNV2DhJJmrfDmoXuxU+rra
	 UwB/X0nhf1R4A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	He Ying <heying24@huawei.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] cpuidle: tegra: add ARCH_SUSPEND_POSSIBLE dependency
Date: Tue, 19 Oct 2021 17:42:03 +0200
Message-Id: <20211019154224.624204-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211019154224.624204-1-arnd@kernel.org>
References: <20211019154224.624204-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Some StrongARM processors don't support suspend, which leads
to a build failure with the tegra cpuidle driver:

WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND
  Depends on [n]: ARCH_SUSPEND_POSSIBLE [=n]
  Selected by [y]:
  - ARM_TEGRA_CPUIDLE [=y] && CPU_IDLE [=y] && (ARM [=y] || ARM64) && (ARCH_TEGRA [=n] || COMPILE_TEST [=y]) && !ARM64 && MMU [=y]

arch/arm/kernel/sleep.o: in function `__cpu_suspend':
(.text+0x68): undefined reference to `cpu_sa110_suspend_size'

Add an explicit dependency to make randconfig builds avoid
this combination.

Fixes: faae6c9f2e68 ("cpuidle: tegra: Enable compile testing")
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/cpuidle/Kconfig.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index 15d6c46c0a47..74df12e23546 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -100,6 +100,7 @@ config ARM_MVEBU_V7_CPUIDLE
 config ARM_TEGRA_CPUIDLE
 	bool "CPU Idle Driver for NVIDIA Tegra SoCs"
 	depends on (ARCH_TEGRA || COMPILE_TEST) && !ARM64 && MMU
+	depends on ARCH_SUSPEND_POSSIBLE
 	select ARCH_NEEDS_CPU_IDLE_COUPLED if SMP
 	select ARM_CPU_SUSPEND
 	help
-- 
2.29.2


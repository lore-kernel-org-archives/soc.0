Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317E6C433F5
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 15:43:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 136D2610D0; Tue, 19 Oct 2021 15:43:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53BBD60FC1;
	Tue, 19 Oct 2021 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634658184;
	bh=rCk56Q0Aiym91RUACht5HuPWcUT81DkZGP8YO/HnRAg=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMYAwNGt3AKDlyheUH55Gm6Gtci7bGCU38T/xVIr6pyiR815HLSszjkq2uS+f67Iq
	 ytVp8K4WGOKdh2KOx2NZYVlgAeqPqbi8gPcxNWjPNbERKDpfN03moxQBj+H9J0GHtJ
	 XC4nL9sE+PGXdapPcN+YHpJHwWipvdz5043Vmaw9nXXS6RamiEzrZkfAJBx6oj4UEu
	 +1ZobNG3rtXuaRdKHj5q0PbSlDqTWMg3xrl9RRJZj5oWeCV2Q3/reDk4ZIMKiawONO
	 mLBjG9wYJfvLbz3r9+xFpwCObFTSNFKcTFalKLnCGeaREmGQc+I2Ncc2jZink55Yx7
	 vZA6oMee5R6ng==
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
	Thierry Reding <treding@nvidia.com>,
	He Ying <heying24@huawei.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Lina Iyer <ilina@codeaurora.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] cpuidle: qcom: add ARCH_SUSPEND_POSSIBLE dependency
Date: Tue, 19 Oct 2021 17:42:04 +0200
Message-Id: <20211019154224.624204-3-arnd@kernel.org>
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
  - ARM_QCOM_SPM_CPUIDLE [=y] && ...

arch/arm/kernel/sleep.o: in function `__cpu_suspend':
(.text+0x68): undefined reference to `cpu_sa110_suspend_size'

Add an explicit dependency to make randconfig builds avoid
this combination.

Fixes: a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic CPUidle driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/cpuidle/Kconfig.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index 74df12e23546..1b4f5ae1ee05 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -109,6 +109,7 @@ config ARM_TEGRA_CPUIDLE
 config ARM_QCOM_SPM_CPUIDLE
 	bool "CPU Idle Driver for Qualcomm Subsystem Power Manager (SPM)"
 	depends on (ARCH_QCOM || COMPILE_TEST) && !ARM64 && MMU
+	depends on ARCH_SUSPEND_POSSIBLE
 	select ARM_CPU_SUSPEND
 	select CPU_IDLE_MULTIPLE_DRIVERS
 	select DT_IDLE_STATES
-- 
2.29.2


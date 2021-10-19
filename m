Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE89C433EF
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 15:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BCC67610D0; Tue, 19 Oct 2021 15:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34C4A610C7;
	Tue, 19 Oct 2021 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634658152;
	bh=PzKP3/tt8FyXJKALEVAz3Lzi8tiJUSHRmqxuTbhlj5A=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=HmCMkgqKwEn05FCXBNK9w77enTzERmW4F0dO1h3jQEgTuP9Trg6M7FapzjzpTt+o4
	 jsN87ioTkEOcVDXc59WL1kzsgJ55v9AgS528cQlAO4xz2/BOv6pq59hIhmrpGxTbZp
	 HPiwqKzpzKLpiEGDY5NfhA7WGlZzZ7keC2qOPGjuFciXi+toweBX7dL8XQKOA5JJs8
	 t3kb/72wuz9cNc57mKFMQ5AaWOf/2Zt0RveauI2WgqqdO3Y9yfCpTguk4BOG4MRcKG
	 sn1OpJDLpSpJZSrPscdGBYaLm70+tXO07wvNk2seqJdolliGJOqiYrbCjc8zf7WJlc
	 yIWiKT1hkn75A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-pm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Lina Iyer <ilina@codeaurora.org>,
	John Stultz <john.stultz@linaro.org>,
	Maulik Shah <mkshah@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mahesh Sivasubramanian <msivasub@codeaurora.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	He Ying <heying24@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] qcom: spm: allow compile-testing
Date: Tue, 19 Oct 2021 17:42:02 +0200
Message-Id: <20211019154224.624204-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

ARM_QCOM_SPM_CPUIDLE can be selected when compile-testing on
other architectures, but this causes a Kconfig warning
for QCOM_SPM:

WARNING: unmet direct dependencies detected for QCOM_SPM
  Depends on [n]: ARCH_QCOM [=n]
  Selected by [y]:
  - ARM_QCOM_SPM_CPUIDLE [=y] && CPU_IDLE [=y] && (ARM [=y] || ARM64) && (ARCH_QCOM [=n] || COMPILE_TEST [=y]) && !ARM64 && MMU [=y]

Make it possible to also compile-test this one, which can
be done now that v5.15-rc5 lets you select QCOM_SCM everywhere.

Fixes: a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic CPUidle driver")
Fixes: 498ba2a8a275 ("cpuidle: Fix ARM_QCOM_SPM_CPUIDLE configuration")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Bjorn, if you think this is the right solution, let me know and I can
apply it on top of the drivers branch that I have already pulled
into the soc tree.

Alternatively, this could go through the cpuidle tree, along with
the other two patches.
---
 drivers/soc/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 3cf3a6b41182..e718b8735444 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -192,7 +192,7 @@ config QCOM_SOCINFO
 
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used
-- 
2.29.2


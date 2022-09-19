Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A592DECAAA1
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 16:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73D77C433D6; Mon, 19 Sep 2022 16:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DEBC433C1;
	Mon, 19 Sep 2022 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663604900;
	bh=b5kFTWEp1NY+JTtalYFGzUn0Ye/NB+VYl+o6y4o1RtY=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=r23ONk7N6LLt6zOGs1tpaP9LHU0dVJJMrVppl5u1+9pZ5tdFEyJrcug73kOaPWm7T
	 cuCBigyxo88YH2fgwXrn4tki7bKM7Fqh/PtLkc6Ll/CohuZubDbv33cc3zipN1B3aA
	 ocJb5I40sQ2JztyTDm0IKkFpi1NDYv1JurAJ9U8gsIapMoFuGgktaKNiy5z3pS+8c6
	 xGSFsuRRsFJaUInCn249739GW1vfRT7zsgpqbKkrnYcdvp+cVWhIEMvj6Qgyg3OeGa
	 Dz+Hl8JqSfS/Q+CGDSrCEMFwEgYPuzOs+Hsc0k/wrEW+LTFIKDfawKlAyZb9tw8QKV
	 w/CN50F3lsrAg==
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: configs: Enable all PMUs provided by Arm
Date: Mon, 19 Sep 2022 17:27:53 +0100
Message-Id: <20220919162753.3079869-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=broonie@kernel.org; h=from:subject; bh=b5kFTWEp1NY+JTtalYFGzUn0Ye/NB+VYl+o6y4o1RtY=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjKJgQrTbUbzsVcKnPmg/jJhimWk0MzNLwhp0Pr35N dCzbhU+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYyiYEAAKCRAk1otyXVSH0NwoB/ 90HJROZzSJ3RXITVNVmJ4Ob6eXZACyfs7wWNv2QQ4rggg4+xG/rScOsoHqd1DVMwj4xkxfApasO5Zi KxNIA3vG/VuFUU7A6cykh54BnNZMIFqqXJivlBeXLxIpkkuvklOdhr37KqqzgSmViYzzxZ9JHwYUkm Jj/ELPVEO08gPwcXQ26rgsRHUWDuJFBMzNvaduFRd8jqwMZ3wsBsXByBgec7HPKdkU/cXPdl7iHL7E RW18lrF66OY1k/3x6b9adV7fzMnnNCkskn6VnQK43so9fK8keYK8zI6FAuk9CKUb7LBfSm5nMKT/uz tX8BJmuH+IHisKJE6wa9i/QBR7W/48
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

The selection of PMUs enabled in the defconfig is currently a bit random
and does not include a number of those provided by Arm and present in a
fairly wide range of SoCs. Improve coverage and defconfig utility by
enabling all the Arm provided PMUs by default.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5a4ba141d15c..91116804e488 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1241,8 +1241,14 @@ CONFIG_PHY_UNIPHIER_USB3=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_PHY_AM654_SERDES=m
 CONFIG_PHY_J721E_WIZ=m
+CONFIG_ARM_CCI_PMU=m
+CONFIG_ARM_CCN=m
+CONFIG_ARM_CMN=m
 CONFIG_ARM_SMMU_V3_PMU=m
+CONFIG_ARM_DSU_PMU=m
 CONFIG_FSL_IMX8_DDR_PMU=m
+CONFIG_ARM_SPE_PMU=m
+CONFIG_ARM_DMC620_PMU=m
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
 CONFIG_HISI_PMU=y
-- 
2.30.2


Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2142CC433FE
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02AB8C34114; Fri, 13 May 2022 12:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3177DC34100;
	Fri, 13 May 2022 12:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652443983;
	bh=eyk6IoI5dZBbsL6BxncGnkdMnux/TQYOGeyJoWw97Vc=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=QmZQKFSxuKAewe8A5rwnnwiNkfv00iDEfAM8HLUWQUrTDdgPXdhL0lbCGitTLeZ8R
	 wDOwzwVpEEbYl3wJZQLPRVagnH5DCCTH9GlURaBdlIG4oMdB7Xm3/sRIXieHxtpjXQ
	 q6CoQqWZmQmPzIgi7EYDUQR/dol7j+pcJBJoR7MangHms381abFyRoStjcFu9lVvWn
	 YtzJ0rPYynRSJGHSnh5ebz/XYL3g91M9KRcbCP9P4hr61w0JhIh+5wwgU+tHbpqcG0
	 dV6MlapBMhkdRjCbGL/07KahFzrf0/1KSKTcefQN/StvGTZ0f6o5D5K04Fyx3sFphU
	 wj57gn0M5oSOw==
From: broonie@kernel.org
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: configs: Enable more audio support for i.MX
Date: Fri, 13 May 2022 13:12:58 +0100
Message-Id: <20220513121258.168364-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; h=from:subject; bh=boBgPn4QMP6DuhUpoHpkJ+Fs3PSOLdRepzDQ4mvji14=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBifkqCK8fLFASdkoed41OG/hAIKJTDKSK7EP6l0Bc5 4ghP7I6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYn5KggAKCRAk1otyXVSH0H7JB/ 0bSRegs3MWB3N3x1lfmzOFxjs3E7cIVdDWo2+GEy6uXu26ml1d85v0jN9Qx4OYhtWuGHD60sDZq4sP NJ0j0KBv7apAgbfNbVzqeXe1HuqyN8a+L/nBnleFvBsTMvIbC0RCo3EoRH2OH5Xy5o9/rO3UQB8xxt r+hjnS4rATIRvJxBrkMVcA/4O+q7eJsnyO+4upRC7/4jT+NWoTlcVxtK4Y8goFwzlYbpGtlTsTVfan QFb7IE+I+brj/ABE189hOu0X9FMnAhKRD7LTyciYN2K6YDJDCVDVHVO5q+6HSxNF2/KjPO33h1ABcc 4HzkdCuExwH5XWrTxoUwl3Y2ce1sEx
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

From: Mark Brown <broonie@kernel.org>

The generic audio card for Freescale platforms is used by a wide range
of i.MX systems and also has selects for the various audio controllers
used on them so will help with systems that don't use that specific card
too.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 547918170f1f..cbd5173d370a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -767,6 +767,8 @@ CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_ATMEL_SOC_PDMIC=m
 CONFIG_SND_ATMEL_SOC_I2S=m
 CONFIG_SND_BCM2835_SOC_I2S=m
+CONFIG_SND_IMX_SOC=m
+CONFIG_SND_SOC_FSL_ASOC_CARD=m
 CONFIG_SND_SOC_FSL_SAI=m
 CONFIG_SND_PXA_SOC_SSP=m
 CONFIG_SND_MMP_SOC_SSPA=m
-- 
2.30.2


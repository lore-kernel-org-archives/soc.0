Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD15C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 948CCC34115; Fri, 13 May 2022 12:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E260C34100;
	Fri, 13 May 2022 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652443597;
	bh=X+pBdNwwSoXoAidbVZoL5p+qUV7ZKdUdzIZDXkmqGRA=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=A3M+D3N08MAugeBLTvEmG0YDRwaJZkw1e+AHyMlhN1TBXcYKqqIBqS0FueMXiF/Zm
	 UN0PfEune+hjyQMeRCPfMmhR3gyUU2aR5nOCQLxnVwriwgwMXaA7C+g3/DHKHxZIv8
	 MWEc4GJreGzXYdBE6f04U0RpPvM0SIeGH8Y+pMEV8JEfMUx7XTk8rKzYW1dwbiy+7O
	 I7126ANqMfcmFa4R60D/jNiNRjWPjdTO2v/Z6syXTkRcUcZ1zRAecJa3lWFP5bA+7R
	 O+sMbj5WQEoNTrNB3ZV9oIlMUVeN/WOmq19ky/6SOlvAfkI+q1/JndUEEVPFZ6NAe2
	 PXJpQN0UILIjw==
From: broonie@kernel.org
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: configs: Enable ASoC AC'97 glue
Date: Fri, 13 May 2022 13:06:32 +0100
Message-Id: <20220513120632.168148-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=782; h=from:subject; bh=amGeBVT+GIsE8OFqVs20gdO3YNZaMeDRRkXqd/KQlUg=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBifkl2LnBqClaKBSPIXUD8FdavKkMAU9jOyM2kn+gd lYu2sjSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYn5JdgAKCRAk1otyXVSH0OUYB/ 9AtyQNAoXAMt+ZaenEI8l/IPiVFnqevNoTLRxTtUfXblFiIPezppZ048N/3GKVZTXlPWXgZR981QPZ tCmjd2ZpXG3DzUDmQbTU45kSLriAK5x8q8+6iFFDlJPhNko70XewOCYErml+uqFk0BaNIr/VsPivpY Zgcps3sxEL/uq+fgwhHN5+Y9RAPet96LC+rcLCeFZ7eRiB6lTKhqbXpXvQv4gYtUf0+KZe5ToIZhb8 yALGv7jSSVXS23UXA939V/tPhggcMoyjYl59d0iq7rUqUvYwh5DypesyqdIqMmn4ltVWwSLCMvro9b 7galUtAEAc50cnMxlm5l/aUcliEOz+
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

From: Mark Brown <broonie@kernel.org>

AC'97 was quite commonly used on at least i.MX designs so enable the
glue code that allows use of AC'97 with ASoC based designs to improve
testing coverage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 956f1c8e230e..547918170f1f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -804,6 +804,7 @@ CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
 CONFIG_SND_SOC_TEGRA_ALC5632=m
 CONFIG_SND_SOC_TEGRA_MAX98090=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
+CONFIG_SND_SOC_AC97=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_CPCAP=m
 CONFIG_SND_SOC_CS42L51_I2C=m
-- 
2.30.2


Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0945C77B7E
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 14:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A74CC4339E; Thu,  1 Jun 2023 14:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB48C433EF;
	Thu,  1 Jun 2023 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685628006;
	bh=WKHUvwYa6H+UOFpzOfgjtodDBSsV/P6ewCnAUZQ7EHM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=jVtcuAbTrMoqknloUbVSqBT1e3Sb4i13u2vgmQh8QLkTbsOZDDZB/wdlcRN/pKldV
	 HOIZgrCG98dctvaUgNdBawam79w44IJpY01yeX+RkUjIzwiAVTKj2ay1senTFt4pd8
	 89fhJlUEh7tRtRt1pGPISj82jb+eSbF5QkoMl5/Pc1wDS7yyf4kAI0yPDDH1gsUzyK
	 nzIkNpKUJ3fd+7S+4Tw/js/y32GsA46w+0ENnw6v94ASP5X9W6FVguaOX5/NajqkOj
	 mkbAU3hHMrGUwDvY5qDm5Iq8VehQQvnKxV8SzsbSH9NVWGXCROPX+7/uaNRKs2DyT/
	 6XmwEY0OOS0Wg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm ARM32 fix for 6.4
Date: Thu,  1 Jun 2023 07:03:47 -0700
Message-Id: <20230601140347.2245680-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-6.4

for you to fetch changes up to 925a80af6106a55fa6bcfedc5bd2f02b0b835495:

  ARM: dts: qcom: add missing cache properties (2023-05-17 19:21:59 -0700)

----------------------------------------------------------------
Qualcomm ARM32 fix for 6.4

A range of 32-bit Qualcomm platforms are missing cache-unified, which is
now required by the binding, this is now corrected.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: qcom: add missing cache properties

 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
 arch/arm/boot/dts/qcom-apq8084.dtsi | 1 +
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 1 +
 arch/arm/boot/dts/qcom-msm8660.dtsi | 1 +
 arch/arm/boot/dts/qcom-msm8960.dtsi | 1 +
 arch/arm/boot/dts/qcom-msm8974.dtsi | 1 +
 7 files changed, 7 insertions(+)

Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37D9C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 20:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B01BC433B5; Tue, 22 Nov 2022 20:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34C7C433C1;
	Tue, 22 Nov 2022 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669149294;
	bh=iFlBrm1tEyxYVegEBdALvCjAmpjIIdO/ffSyzQr/03o=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=IdYJdY0d0PJ9OcVHfMgAZEwEjWaMTy7pSxlatJF4zOI26O4EeLv/O7Aba4AhaPZWT
	 /gZUaTTsEx94B3IfbfIL7Qe/wH1Gyjnqu5Cp1Q7CjFmJS72uGXxpv3HeCRJlvCQsrk
	 zx8h2tmjyeEXkAswvZqP6kJrjOtFal/lEhFoxqFnwcWSzMA0psLSfcHcMEZnIG05Me
	 b4Mk4LpYfH9dc355hpDoBHQ5K4otNcDUfTDCnm34HI/RXvCrMvZTpbTPJ8Il8yD4ao
	 w0Iz5GC9LLM9hRU7psHcWTUlKxRdVZqQBcAbVeAxcU6G56qua7BT5zNKS0C9237ckT
	 0Rcn2W+ahKwMg==
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
Subject: [GIT PULL] Qualcomm ARM defconfig updates
Date: Tue, 22 Nov 2022 14:34:52 -0600
Message-Id: <20221122203452.1855254-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-6.2

for you to fetch changes up to cea42b8d79663fde7a7138b838dab0b931f4e128:

  ARM: qcom_defconfig: enable rest of ARMv7 SoCs pinctrl drivers (2022-10-17 17:22:53 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates

This enables remaining Qualcomm TLMM pinctrl drivers in the
qcom_defconfig.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: qcom_defconfig: enable rest of ARMv7 SoCs pinctrl drivers

 arch/arm/configs/qcom_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

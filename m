Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF757C48BF6
	for <soc@archiver.kernel.org>; Sun, 25 Feb 2024 02:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B800C43399; Sun, 25 Feb 2024 02:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE2FC433C7;
	Sun, 25 Feb 2024 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708829527;
	bh=adKQk8IQu/VzxOGNCArekvRYJ/UhLYvCr94PFG2f6vA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hwcWXWh3vD3mfUrXoVMF+MO8ZOTFHsrzqUzK4RKW1novQ2RLz75hh18lqCPKXhTh6
	 W31RSdSErEbe8qkVpAhmPOjHWqfmMcsTqcKFRdHJgg8qIJEXN1UM+azm8CtPZvjIcY
	 KY25+nZDXIQBM7nXgCLNL9Scpt+vbtDxZU1O90buNFr520Zir9BEFgXeiQx5yIeGpB
	 L9Q+wBW9KC7R0mrXPw2VK0maRABVFXTgRyQwwlGs1l+KlUG+lUvkzzdJzGL52Vn/+U
	 CoQ/7SGF8KzIv87JQ8l0X5ZBEeIfkRA8UD5hrgTWgK5Xwed7Wq7GTfUtbBUklBMuOE
	 ty2Tn7BEPrNCQ==
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
Date: Sat, 24 Feb 2024 20:52:04 -0600
Message-ID: <20240225025205.479589-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8

for you to fetch changes up to cb0bbdc4cc327ee91ba21ff744adbe07885db2b8:

  arm64: dts: qcom: sm6115: Fix missing interconnect-names (2024-02-03 11:37:47 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree fixes for 6.8

This marks an additional GPIO as protected on SM8650 devices, to avoid
a system reset caused by a security violation with some firmware
versions.

It also adds the missing interconnect-names, which resolves a regression
where one of the I2C busses on SM6115 devices would no longer probe in
Linux.

----------------------------------------------------------------
Konrad Dybcio (1):
      arm64: dts: qcom: sm6115: Fix missing interconnect-names

Neil Armstrong (2):
      arm64: dts: qcom: sm8650-qrd: add gpio74 as reserved gpio
      arm64: dts: qcom: sm8650-mtp: add gpio74 as reserved gpio

 arch/arm64/boot/dts/qcom/sm6115.dtsi    | 3 +++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

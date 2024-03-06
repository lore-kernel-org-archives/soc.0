Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C0C54798
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 03:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C438C43399; Wed,  6 Mar 2024 03:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66BCC433C7;
	Wed,  6 Mar 2024 03:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709694893;
	bh=Mi8Pps2ER29aS/cGDIlCdrUKl672t/QELQjvrPfPrOA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=MxXdAUKpoxK1O7z4o+qNy8OYXMQDj4ikarlEwiH3LzDMFe34gdtrMyUMpHrWYAKnT
	 EGsgHjiAIs+GMFUnLNONRRvB4s/e86VIY0GEetxKnAkH2Bh3b6cPcJmvnJSTgQC2Bt
	 bpJgXUaqxC6yL096KeoxfJKS7rFJRzjJ9l+KghdYyLZBj+J87ynGknk7gXXvmumFYS
	 0Jcfv5YQiuheUUhRuZlcBHKCgAOmBodjARTQnx5k280b8p0hiWabM8lP5fFP7CnEc0
	 YZZhl2tJZ2ElMUCYMRjf+/xKzScyhBU1JFKxfn9j+txjwtKamenrvPMSCHzdTtZQqx
	 XR0vl+ZQV2C3Q==
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
	Abel Vesa <abel.vesa@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [GIT PULL] A few Qualcomm Arm64 DeviceTree fixes for v6.9
Date: Tue,  5 Mar 2024 21:14:50 -0600
Message-ID: <20240306031451.4545-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit f176168bcb95bd1fdd32f5a794e68b7a36ac8740:

  arm64: dts: qcom: sm6115: fix USB PHY configuration (2024-02-20 11:54:53 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.9-2

for you to fetch changes up to 2219626708d7300402a46c31e2347d40db7c4971:

  arm64: dts: qcom: sm8250-xiaomi-elish: set rotation (2024-03-03 20:06:13 -0800)

----------------------------------------------------------------
A few Qualcomm Arm64 DeviceTree fixes for v6.9

This corrects the orientation of the panel of Xiaomi Pad 5 Pro, and
corrects a typo in the size of the SPMI channel register size in both
SM8550 and SM8650.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: sm8550: Fix SPMI channels size
      arm64: dts: qcom: sm8650: Fix SPMI channels size

Jianhua Lu (1):
      arm64: dts: qcom: sm8250-xiaomi-elish: set rotation

 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

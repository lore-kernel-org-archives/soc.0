Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FCC54798
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 03:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C19B1C43394; Wed,  6 Mar 2024 03:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABD3C433C7;
	Wed,  6 Mar 2024 03:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709694730;
	bh=02cMmXsDdW1gVgqMD4VAOemGW7i9TpF85kHhYBvLZW8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=S9l9fHIqRPQBv5DCKMAzqnyF7GGcDC8l8BrvRrsc+oIG2wIaUD5AeMPgKoGgQIJoN
	 TwWOHb/QoISsD/AISmlFa+HUv3+scUhWXiNTomIuU/cK/NT/lPBFvLbm199WKQ3tTs
	 YGSWGvI1SEvQ0wXyfDxyKG24Ryaf4LLEyeL+RJh0VHRAumTTU6mq0LAtZnfr07FeKj
	 O0U2D0xJEa3avwAgSCGwuQTmcNEeC6EosK4+gDOqUgCWW2Dsm27YxnwugQHarxc+59
	 dg++15qlXIKgPKfF+eA/wJSAgdE0jd4cyvHDhLv3dPzBI29Z4JCNUFTyzb06TnXPN2
	 4RXa08pxb1+pA==
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
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] A few more Qualcomm Arm64 DeviceTree fixes for v6.8
Date: Tue,  5 Mar 2024 21:12:07 -0600
Message-ID: <20240306031208.4218-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cb0bbdc4cc327ee91ba21ff744adbe07885db2b8:

  arm64: dts: qcom: sm6115: Fix missing interconnect-names (2024-02-03 11:37:47 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8-2

for you to fetch changes up to 4f423c4cbe26d79d8974936eb01e0d6574c5d2ac:

  Revert "arm64: dts: qcom: msm8996: Hook up MPM" (2024-03-03 19:49:51 -0800)

----------------------------------------------------------------
A few more Qualcomm Arm64 DeviceTree fixes for v6.8

This reduces the link speed of the PCIe bus with WiFi-card connected on the
Lenovo ThinkPad X13s and the Qualcomm Compute Reference Device, avoid
link errors and initialization issues reported by users.

It also reverts the enablement of MPM on MSM8996, which is reported to
prevent boards on this platform from booting for some users.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      Revert "arm64: dts: qcom: msm8996: Hook up MPM"

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-crd: limit pcie4 link speed
      arm64: dts: qcom: sc8280xp-x13s: limit pcie4 link speed

 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 39 ++++------------------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  2 ++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 ++
 3 files changed, 10 insertions(+), 33 deletions(-)

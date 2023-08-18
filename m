Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BF9C71133
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 02:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0822BC433C8; Fri, 18 Aug 2023 02:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCD6C433C9;
	Fri, 18 Aug 2023 02:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692326049;
	bh=hIg/Sfi4ezo9hjT06HqBsqWkjiTtOTk464INXUPJDtU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=lOLqar6snPuFNFQHLjNxvc0VK2q8LyhW+GKOFEaep50zQ7wuIpH1vxUPFc1tkDp8+
	 oYLuTCcby6FCcq/ayZaZ0eMz7MbnP/SDS9/9c1yjHgc0yEhesFKBSw+RD/x06JSdUI
	 VJtdpWCiwYarUiuQ3hTV+Yhb4XKkl+1eAmg5ds90/M2+y6ziP3qbxHuh8DEFQ9x5vw
	 Kde691h1dMeMASWndwIs6G4ZPEd3b8wdJAkE7TFIVcMDgha5gnY+3j2Q4bm7ecK4pw
	 UO1IyEAzdHLERo94ILSaZn1D617qA1gqY69nHz18iTbuzpdtKlOp8lO1vOH/4sIe82
	 01P6DfVM2kjsA==
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.6
Date: Thu, 17 Aug 2023 19:36:50 -0700
Message-ID: <20230818023651.2484774-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.6

for you to fetch changes up to 7f0c87348fb52d575295d16d4656ecd4c00bad87:

  arm64: defconfig: Enable IPQ5018 SoC base configs (2023-08-11 13:04:15 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.6

This marks the MSM8996 global clock controller as buildin, to avoid boot
issues. The SC8280XP GPU clock controller is enabled, to enable GPU
support. A series of drivers needed to boot the IPQ5018 platform is
enabled, and the ethernet PHY to enable Ethernet on SA8775P is enabled.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: defconfig: enable the SerDes PHY for Qualcomm DWMAC

Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SC8280XP GPUCC

Dmitry Baryshkov (1):
      arm64: defconfig: enable Qualcomm MSM8996 Global Clock Controller as built-in

Sricharan Ramabadhran (1):
      arm64: defconfig: Enable IPQ5018 SoC base configs

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

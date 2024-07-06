Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1883EC2BD09
	for <soc@archiver.kernel.org>; Sat,  6 Jul 2024 15:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C84DBC4AF0B; Sat,  6 Jul 2024 15:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3498C2BD10;
	Sat,  6 Jul 2024 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720281221;
	bh=DSgK/uIZsRaqTPO+UbUD+8dlVfjeD6hu7UxOl734TZE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=fos8gvvr+UnxrV8EXI8CNej7u350abPDNTsFNVL73V09uUzQuSqgqfzsrZVx7y/RM
	 ORB2E3rvwuxq4/F++jkN6gTZ4rb5V5OLC6BzKzGYx6CPTj707hQXVLRAX6Vxnp+11A
	 ysDhDUpqIkTP5vcWwTlbdKFmxe7tyGrgAmGx04S0eey4VjGaNwPJg9aMBwBk7IWLEG
	 Q/49q8LSe1NdorEb/sezFvs05rU1kZb02WLVkVPFDT8jAYrvLMzFavrPOU5pklvXZd
	 j/tB92JaxEs8HjNk+th8z0cvUzFi5I4w8N/EWkTzMdVROAS18a8rW7fjT3CUANBpWJ
	 m4v1y1EROmA6w==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.11
Date: Sat,  6 Jul 2024 10:53:46 -0500
Message-ID: <20240706155347.16207-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.11

for you to fetch changes up to f5a27053293fa027349f8fdfe81b314cc709158a:

  arm64: defconfig: enable SHM Bridge support for the TZ memory allocator (2024-06-23 16:09:37 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.11

This enables the newly introduce Shared Memory Bridge driver which
improves the mechansim with which buffers are shared with TrustZone.

It turns MSM8996, SM8150 and SM8350 interconnect providers to builtin,
as debug UART now depends on these.  The SM8350 GPU clock controller is
enabled.

The secure QFPROM driver is enabled, to provide access to OTP
configuration for the LLCC driver on the QDU1000 platform.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: defconfig: enable SHM Bridge support for the TZ memory allocator

Dmitry Baryshkov (3):
      arm64: defconfig: enable CONFIG_SM_GPUCC_8350
      arm64: defconfig: make CONFIG_INTERCONNECT_QCOM_SM8350 built-in
      arm64: defconfig: enable several Qualcomm interconnects

Komal Bajaj (1):
      arm64: defconfig: Enable secure QFPROM driver

 arch/arm64/configs/defconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

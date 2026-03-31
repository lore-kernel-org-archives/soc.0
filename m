Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAB03B47F0
	for <soc@lists.linux.dev>; Tue, 31 Mar 2026 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994125; cv=none; b=oZae8spUzBho4Xq6+jMw4rGDihQRokCxmNAMZEDPwEEvwSMbpkG21bdc3POh8w8EGleliYTsQPvlPPsCrIAI/aSuArX4frjphGms1c2CcCJNkk+aJXrgIFdxyqgt9viAzpxXqsOH2bwWJ9UhSpE9LmAVIFvD1KzLhubx3lJTX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994125; c=relaxed/simple;
	bh=NhuFMXlvIvwXGeFlkQZ4EjJD7dqZdKtt1rvST/wuTUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=km55DGN9NOhW1VECjxYWQ8aqtA8xVX7kwJEZZ+unJgukgSoLAOV5ZtfBBDVxvPJj2fhH3+9kUvrSi1f0DuUK5eg1XPrvHXdLzdUalPRCvZfSY16wzrfBlOiAODWvUDW7E2R8W7nwe19KwqLYH8FVJoyiPLH1UlgIOpe0X8LnJqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efKmWD2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efKmWD2c"
Received: by smtp.kernel.org (Postfix)
	id E696FC2BC9E; Tue, 31 Mar 2026 21:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE9FC19423;
	Tue, 31 Mar 2026 21:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774994124;
	bh=NhuFMXlvIvwXGeFlkQZ4EjJD7dqZdKtt1rvST/wuTUY=;
	h=From:To:Cc:Subject:Date:From;
	b=efKmWD2cojixGjWSKPS4XFjSeeurzqKxFKT2Kai1csXNtIGcwLixJlLqXmHbvrwFx
	 eEmNzdQmdzaYXxQ1cbOCDm/JrH+v5d2LcDFnJTP6j4R1xbJxx2o19LxCc/hlDJB6Mw
	 9/NxcX+4nV+V1he4Tr47kfC33r6CkPQEoo/IqIQiCo6JNjUbTrmci3fYjBi4aCf5Aq
	 tG65bkzjF9QoENSqfAlX6Ln+edmUcRGsFVmoUs5XyQR64cLB8BzoMEynpe37+NqOrb
	 e8bcyJG5mgqmUtunYLjgWl1cGr6TIf6D4qEr7UsfFwzUT82QkuwfMVEfaVEIQWEHzg
	 HGaVcy0vJhaPw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.1
Date: Tue, 31 Mar 2026 16:55:21 -0500
Message-ID: <20260331215521.968341-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.1

for you to fetch changes up to fdeb077b8ae53a6ef772c5b3c4d1f3a408dac2a0:

  arm64: defconfig: enable pci-pwrctrl-generic as module (2026-03-23 21:40:52 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.1

Enable base drivers for booting boards based on Kaanapali, Glymur,
Eliza, SM8750, and IPQ5210 SoCs.

Enable the Milos LPASS LPI driver. Enable the Qualcomm WCD937x headphone
codec driver, used on QCM6490 boards.

Enable the QCOMTEE driver, to support the interface found in various
Qualcomm SoCs.

Enable ethernet and analog codecs used on the Arduino Ventuno Q.

Enable the Lontium LT8713sx driver, used for the Monaco EVK board.

Enable the PCI pwrctrl generic driver used in a few different
Qualcomm-based boards with USB controllers on PCI buses.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable Qualcomm Eliza basic resource providers

Ajay Kumar Nandam (1):
      arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module

Harshal Dev (1):
      arm64: defconfig: Enable QCOMTEE module for QTEE-enabled Qualcomm SoCs

Kathiravan Thirumoorthy (1):
      arm64: defconfig: enable IPQ5210 RDP504 base configs

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller

Luca Weiss (2):
      arm64: defconfig: Enable S5KJN1 camera sensor
      arm64: defconfig: Enable Milos LPASS LPI pinctrl driver

Neil Armstrong (1):
      arm64: defconfig: enable pci-pwrctrl-generic as module

Pankaj Patil (1):
      arm64: defconfig: Enable configs for Qualcomm Glymur SoC

Srinivas Kandagatla (1):
      arm64: defconfig: Enable configs for Arduino VENTUNO Q

Taniya Das (2):
      arm64: defconfig: Enable SM8750 clock controllers
      arm64: defconfig: Enable Kaanapali clock controllers

Vishnu Saini (1):
      arm64: defconfig: Enable Lontium LT8713sx driver

 arch/arm64/configs/defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

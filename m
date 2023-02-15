Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB2C636D4
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 05:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAA5BC4339C; Wed, 15 Feb 2023 05:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22386C433EF;
	Wed, 15 Feb 2023 05:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676438152;
	bh=1WLF0ceX+RK5Xz/Lzus/NB5BHp/oF/3HktBH2FjFsXM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=B/FwDae3b54Tz3vaR6GoV/dBWXFhiLNYe9evQLuyDd3Q/DolBwZXYN5M/m3ucZciB
	 rNMZ+Whj38P2SbihDXhJxVzfvyxTJsV0/gc+3/rXCoyv5n1rWG9KN1drzRXe9SrS+E
	 EaTGWaCoceWgOm4WeWduWPE0ulKaec0kf9Hal8uEYK/seVqDUtWwzPNkXdIlXO+ckB
	 IZb7HiMoTklKq7mcpH0UZ5S/8ncsaf8eTFTZ1DU24oAkPLfpjwieUSWgeufHdFOv3N
	 fOS4hsAaTYuRm+sk6sDCE55EmkeS9HGm95LT7MKGkyjhxznJdWvBF/oXwnFh4hWhB1
	 //h6Dah+ORudg==
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
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [GIT PULL] Few more Qualcomm ARM64 defconfig updates for v6.3
Date: Tue, 14 Feb 2023 21:17:57 -0800
Message-Id: <20230215051757.1166709-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 480ba14b9a95641647a6561d5b246de661589514:

  arm64: defconfig: enable Qualcomm SDAM nvmem driver (2023-02-08 19:05:49 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.3-3

for you to fetch changes up to 687bcd03a047e65fcf12ae2b693043ee44acad4c:

  arm64: defconfig: enable drivers required by the Qualcomm SA8775P platform (2023-02-13 14:20:27 -0800)

----------------------------------------------------------------
Few more Qualcomm ARM64 defconfig updates for v6.3

This enables the drivers needed to support USB Type-C based external
display on the SC8280XP laptops. It also enables a couple of core
drivers for the Qualcomm SA8775P platform.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: defconfig: enable drivers required by the Qualcomm SA8775P platform

Bjorn Andersson (1):
      arm64: defconfig: Enable DisplayPort on SC8280XP laptops

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

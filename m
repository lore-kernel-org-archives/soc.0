Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F5DC636CC
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 04:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1372C433EF; Wed, 15 Feb 2023 04:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4080BC433D2;
	Wed, 15 Feb 2023 04:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676435693;
	bh=xVbVESUJIuOxfY6hZvTedfrZ9+t7jVKyC2mofiF7mWg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Zm2KMfbN+OflJHCsInTLYCXFsjVTBYzhm7PWO659dRXtEIT4PX0vGODF6QsLEhGY8
	 oR08o9m7KEdqA7SG6mEDAQcPrXS7lRZVMN4Pk5ovK+f/Bt+MIABP/4yrdNFkQfi1RG
	 YHcyhYNRs7d+3fa8s1XwnTQCSPOsxSgOeL+TzcSiiW7cGiy6T1aWo/D/C6U9ZpFkRy
	 d0LBibo6UWBFNE5lQq+wZZOcrZrX5kbMaU3jDv+8j2KeEe7lwM0hCL/g8nVtIB+G+H
	 9XE4SYb29kYTXD225zFl9nBJ3E4o69udH2Fjjja4Dye291zdFOb2+AoCgIH02WKfkm
	 ZQkx/hplSfQjA==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] One more Qualcomm driver update for 6.3
Date: Tue, 14 Feb 2023 20:36:58 -0800
Message-Id: <20230215043658.1156472-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arnd, I hope you're okay with a few more last minute updates for v6.3; bringing
battery support and, in the DTS patches, support for USB Type-C based external
displays on the 8cx Gen3 laptops.

Regards,
Bjorn

The following changes since commit b0bc8c893ae07acd4829a158e83902897a31a490:

  soc: qcom: socinfo: Add IDs for IPQ5332 and its variant (2023-02-08 19:36:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.3-3

for you to fetch changes up to 29e8142b5623b5949587bcc4f591c4e6595c4aca:

  power: supply: Introduce Qualcomm PMIC GLINK power supply (2023-02-13 13:45:37 -0800)

----------------------------------------------------------------
One more Qualcomm driver update for 6.3

This introduces the power-supply driver providing battery and power
supply status on many recent Qualcomm platforms, including the Qualcomm
SC8180X and SC8280XP laptop platforms and the SM8350 mobile platform.

It's introduced through the Qualcomm tree due to its dependencies on the
pmic_glink driver, which was merged already for v6.3.

----------------------------------------------------------------
Bjorn Andersson (1):
      power: supply: Introduce Qualcomm PMIC GLINK power supply

 drivers/power/supply/Kconfig        |    9 +
 drivers/power/supply/Makefile       |    1 +
 drivers/power/supply/qcom_battmgr.c | 1411 +++++++++++++++++++++++++++++++++++
 3 files changed, 1421 insertions(+)
 create mode 100644 drivers/power/supply/qcom_battmgr.c

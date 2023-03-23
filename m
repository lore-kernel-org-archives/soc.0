Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E01FC6FD1D
	for <soc@archiver.kernel.org>; Thu, 23 Mar 2023 14:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E3C2C433D2; Thu, 23 Mar 2023 14:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F3FC433EF;
	Thu, 23 Mar 2023 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679580971;
	bh=OI/gIDwVOaeciXoCCR1l4cOMsY9vfdoe+NBO8YSbd3I=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=iWL1smyIJ03eupt+70BGkXaOhESn+6yLodO0oU5UllYq9wiyZnhjPhL+rFbsuuV2t
	 Sm+Fi19ZJQIAcUCoTB+76HVdp0LurRkXCjgr4QAEKvkdtLJE77CJs5VTgqobLQyBAI
	 X/RVt5nPdP+p4cgiqlKDoLABDuDGbWbRlXOCA7hLn6rW9MM43uwTM1ybdT690N87zs
	 2ZTbfwpdssH+h5DKBxr1tuLyVETrz1OQL8e0EprJFK3k1w2qtVkbbO2UEb/9d8nqIi
	 itHhDzB0rx/+fDG+bjyBwUfgwagMNx2oF3ZiBQTouFXetji8Q5/9qkC8V173011sfD
	 SZ9ZGblOL7kkg==
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
	Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm ARM32 Devicetree fixes for v6.3
Date: Thu, 23 Mar 2023 07:19:22 -0700
Message-Id: <20230323141922.1085875-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-fixes-for-6.3

for you to fetch changes up to ecd240875e877d78fd03efbc62292f550872df3f:

  ARM: dts: qcom: apq8026-lg-lenok: add missing reserved memory (2023-03-09 12:12:16 -0800)

----------------------------------------------------------------
Qualcomm ARM32 Devicetree fixes for v6.3

This introduces missing reserved-memory ranges on LG G Watch R,
resolving stability issues caused by Linux reusing memory used by
firmware.

----------------------------------------------------------------
Luca Weiss (1):
      ARM: dts: qcom: apq8026-lg-lenok: add missing reserved memory

 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

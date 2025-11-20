Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E927AC57
	for <soc@lists.linux.dev>; Thu, 20 Nov 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763625436; cv=none; b=A1t9gmIWVQwR1XYhyYHfHXrSeTxe0HjlcF5miz2PecbbCcrsLWuG+GepuegMkAO/Y22JNzynrQ8X+YynIZmrRZXouHb1v4UD3VtU2Ze8QEtFi6s1XHbTvnEW93i62IjS1t5pwqWi0WSsPecH//RP7uqvkbevGSVbCoT0xBFiGX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763625436; c=relaxed/simple;
	bh=nGXT4V0USEwybvSYE5mT02kTqiv1b0Ij4hOZ+xqcZUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXPKBIWsLpli4aq4OIB4QN1NdkexLqBT6PlIq0bt2c6VjlT6keJdKwzZClOacpXzdUXEeXNTGCYiyGiHouPt6ibv3WRavw9fLnqZEu0TOlDtULEOFep56lsfBy6lXEoS7r9BAg+KYpY1cZo2hVVO95l1IX/MsDTahZligUAlQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXp37duz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXp37duz"
Received: by smtp.kernel.org (Postfix)
	id C7252C116B1; Thu, 20 Nov 2025 07:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1011C4CEF1;
	Thu, 20 Nov 2025 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763625435;
	bh=nGXT4V0USEwybvSYE5mT02kTqiv1b0Ij4hOZ+xqcZUo=;
	h=From:To:Cc:Subject:Date:From;
	b=pXp37duz7aNJvEQZRK1tATItSsj/6U9SYIpOFa7Ec2qvYabMnLFOue9XYAietrX6E
	 lH+JtojRWQbmZbLhap6K/e10pz7Rsom7nxqeLGf18bRm6pHCw8Q/y/afqFXMtksLW8
	 3f+1el2gmttJ2P47SFHzttjJ8RnIGRb4//2NTwO3W5Cl+Fj9OUW4/3t+WdzUmI4lWP
	 c8KQUl8Mp/mFSjY1oG0iiCM70NM/bu5ijdId3mpbvBjXiTTF8ht1ECfBgl2KqVteI3
	 mmwQDCyIhwViU06BztNsQgCZRjLiu1SKL1iAxeEo/2ZQPjoPIcAAHe731z8juXmNc/
	 pdOGIPdBBVOqQ==
From: Michael Walle <mwalle@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: defconfig: make TPS6594 support build-in
Date: Thu, 20 Nov 2025 08:55:39 +0100
Message-ID: <20251120075656.2396371-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kontron SMARC-sAM67 module needs the TPS6594 regulator driver to
boot from SD card, i.e. for its root filesystem.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Arnd, the PR from TI [1] (which contains the device trees for this
board) is already out, so I'm sending this to the soc ML directly. 
Let me know if this can still be applied, if not, I'll have to wait
for the next window.

[1] https://lore.kernel.org/linux-arm-kernel/a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com/

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f8bcae89c260..e29a41c54b8f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -824,7 +824,7 @@ CONFIG_RZ_MTU3=y
 CONFIG_MFD_TI_AM335X_TSCADC=m
 CONFIG_MFD_TI_LP873X=m
 CONFIG_MFD_TPS65219=y
-CONFIG_MFD_TPS6594_I2C=m
+CONFIG_MFD_TPS6594_I2C=y
 CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_STM32_LPTIMER=m
 CONFIG_MFD_STM32_TIMERS=m
-- 
2.47.3


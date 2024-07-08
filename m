Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D063C3DA41
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F062C4AF0B; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75394C116B1
	for <soc@kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468245;
	bh=ThGRmHMoc7uitIcyyywgICOB7xVH0tSWY+kTr4Vxb+U=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=eoraoy0QlLjKZDyop+KtXK9v0NNtpWR+5XFkOVzVv16w65uiRpHVQmvAToP96PVxs
	 FEblnX6h/4SgWvjRsGlYNI+fsu6oa8izapAoVIsR1+PNZbyuztQAvvZi0Th+83H9Lo
	 rK6O/l/qJy3krjlnSby18XoLbP88JIEhb0jcwlFFXC/odHqIY5Pqs2R+Qsp0OvR5gH
	 97m6u6lxvxrSw3SiNDSK0Vaw/nDeAqlm7VlUPDNx/K0OnLjcG/uyq3jWMLN5Xvls1E
	 aMyNo/ld6VBribC9jwWbDv0v8NDecuzQ/IxH3T+aMWKyWRz34qR1wn4MwUXy+dGjS3
	 FXsFAXZpGpsbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65E87C433E9;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046824541.24660.17457783533944765061.git-patchwork-summary@kernel.org>
Date: Mon, 08 Jul 2024 19:50:45 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868829
  Lore link: https://lore.kernel.org/r/20240705134407.2833659-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] RISC-V defconfig for v6.11
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869098
  Lore link: https://lore.kernel.org/r/20240707-unused-outflank-aa127ccb2cfe@spud

Patch: [GIT,PULL] Microchip AT91 defconfig updates for v6.11
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866848
  Lore link: https://lore.kernel.org/r/20240629173634.664081-1-claudiu.beznea@tuxon.dev

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.11
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868853
  Lore link: https://lore.kernel.org/r/37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.11
             [GIT,PULL,2/2] arm64: defconfig: Updates for v6.11 for TI K3 platforms

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869012
  Lore link: https://lore.kernel.org/r/20240706155347.16207-1-andersson@kernel.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



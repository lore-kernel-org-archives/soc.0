Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBE5C47077
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08AD1C433C7; Thu, 11 Jan 2024 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7D1BC433F1
	for <soc@kernel.org>; Thu, 11 Jan 2024 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704988827;
	bh=sAmt2VjgswAhdajusyDpKoZ0I6OY7yGNAoqVMWOnhUU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pGVVu2gvibC+b/dFIbVrkNEG/Z6PJYzvDBe2WsTeqDXPkwA4DmBTQnPHgtu9dLKLN
	 QvgZmlLnl4FqFOwwwqcXiDyIwORWVtS0R8X7Mw9USAK7bEfCWClnJTBj7SXUWeOUVP
	 RW7gRsveBCdrmjf59rZgBDgRg+Iz55CPJMqkP3LwnnMpulVeokiqRzUuk/dN4/DMk4
	 S0sPXkVmhUuFTy/C/xAhVlIppR4vV40g/0Qoe8nxAdCJaJ0XSu3J0cbvAArdpGRO4q
	 wcoFdcIF2BFXo8WEyPzee9pLiEsysMbzqRPX4yfg1UzxlJ19iUPvN//skYmJNMTPA7
	 C8KSBU7v0tJ9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C60D7DFC698;
	Thu, 11 Jan 2024 16:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170498882775.27164.2220523306372448079.git-patchwork-summary@kernel.org>
Date: Thu, 11 Jan 2024 16:00:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: refresh config files
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=816067
  Lore link: https://lore.kernel.org/r/20240111092550.1313277-1-arnd@kernel.org
    Patches: [1/6] arm64: defconfig reorder config lines
             [2/6] ARM: defconfig: reorder config lines
             [3/6] ARM: defconfig: remove sysfs-deprecated entries
             [4/6] ARM: defconfig: remove CONFIG_NET_ETHERNET references
             [5/6] ARM: defconfig: remove CONFIG_SLUB references
             [6/6] ARM: defconfig: remove dead platform options


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



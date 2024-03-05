Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84458C54798
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46C09C43390; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AB3FC433F1
	for <soc@kernel.org>; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659229;
	bh=F5ixpYSAj1g8zijIY88NAxl5JqaKbvAWraT2WTTjhm8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=urjdAmJA9Wz+GGTyoUj6Fe/beVHdvEg2e6QtRJKyZ6Y6Pn8t5rfDBCZN1SFma8V41
	 T2sQlg4z76DsiYbxqBt3gMbzj61DxD/8fxXcNAV82v9SjpH7P3X2Wy7HHcQafs7klc
	 x6VvJLDCO8fe0OJyJk75YzxmaAsWB2tTqJoAeAUKD8pcjPpo1R5ZFsEe8qevUxhxqo
	 80ZoRwC74OWLq/uf4gio3RiK4e1Z3Cwb2+sdcwfyurLKk9oARRUQINKGtEfGnUNbGx
	 2TBFM1Q62mOvkb34lMQ2PJ6HFksI+I5gDFDRIqS7t/A2S5//CDeyeqG9h5rpttq9Bx
	 0rsumlKhI35ow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03D6CD9A4BB;
	Tue,  5 Mar 2024 17:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170965922892.19661.1127542365052957097.git-patchwork-summary@kernel.org>
Date: Tue, 05 Mar 2024 17:20:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: s32c: update MAINTAINERS entry
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832244
  Lore link: https://lore.kernel.org/r/20240304204249.936140-1-arnd@kernel.org

Patch: [GIT,PULL] Rockchip driver changes for 6.9 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828482
  Lore link: https://lore.kernel.org/r/5997473.alqRGMn8q6@diego

Patch: arm64: defconfig: Enable support for cbmem entries in the coreboot table
  Submitter: Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832200
  Lore link: https://lore.kernel.org/r/20240304-coreboot-defconfig-v1-1-02dc1940408f@collabora.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



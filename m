Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79E8C433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 923D9C36AEA; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D021C36AE7
	for <soc@kernel.org>; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639754432;
	bh=cWEUcBLuoP0ebwQAlcefGJ6J92Gj5KTHyGg6Drvhg8M=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=m+xEnB3epUp6dXcU+4PXPD62c6ZPMHxH0XK6bi5hC2REBMDFo68L+UaJj3hscyntn
	 DIUN3YbvLMwcbQTGz18e9NDC4iR7s9DYg7+BmS/lnv2++1e4EhJrz4HAatIy75DF2Q
	 nm9VrzcjkM+bZOr+GOD943OdYpyfLqNBnJCNGG6N/SVOAOvG5DOeMKCROmGvqAocWn
	 6ednMPePMDRHwcKpGw16VG12kppN4YIo89iDuD8n1dq+vlIqVgSnHCTbksG2fL14Bl
	 IAg+ka12veH02r+PNxj8EnDSJFxloS6jqsx7G578lR0KS8UYX2NDeovMdyjDRyFDoA
	 J8yrUk3y058hg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6064C60A2F;
	Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163975443238.14717.552220581336637094.git-patchwork-summary@kernel.org>
Date: Fri, 17 Dec 2021 15:20:32 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v5.17 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597291
  Lore link: https://lore.kernel.org/r/cover.1639736716.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.17
             [GIT,PULL,2/4] Renesas ARM DT updates for v5.17 (take two)
             [GIT,PULL,3/4] Renesas driver updates for v5.17 (take two)
             [GIT,PULL,4/4] Renesas DT binding updates for v5.17 (take two)

Patch: [GIT,PULL] TEE and OP-TEE fixes for v5.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596729
  Lore link: https://lore.kernel.org/r/20211216150745.GA3347954@jade


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



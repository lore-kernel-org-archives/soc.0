Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A78C4708D
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54E38C433D7; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BAA3C433C1
	for <soc@kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670448029;
	bh=O+/27IW8PBFVgB2O7o0NI2bX7jK7H0w5AKaOCxqZ+UM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uQ+F3vXKpvwWG5ttynew7QE4BYYmngAVX+ejBN/ZoAtHh3BoRE7kNeTeoxy1s0l+O
	 zf4w1s9Mhgsl3Jw5FXhfZfrd2aawYGITGriBQ8RinWWB+bOtRmuPQS5aZPmLCYD5Gt
	 A8KAyQHckkLrQDBjrOeSOebSXJMkoFKRz1GjJMPucoi3ojP7/XOWtfVT5WbzTahAGL
	 PSFBSWHTYpka7pvUnHQNWSlI+wUDvq4HrxyCZUmBDzwyRnJxMSji/NM1GtvFg6N8up
	 Rk0rD/QaePQYQKloTb5XPWGL7N5vshUkgAHd/MuZzphU/unpk0GjLcSYDJqxqHh8aG
	 dRNAy2jXB615Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C8A4E270CF;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167044802895.32577.13514807244109904888.git-patchwork-summary@kernel.org>
Date: Wed, 07 Dec 2022 21:20:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm: dts: socfpga: dts updates for v6.2, part 2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=702310
  Lore link: https://lore.kernel.org/r/20221206214006.590562-1-dinguyen@kernel.org

Patch: [GIT,PULL] More Qualcomm ARM64 defconfig updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=702650
  Lore link: https://lore.kernel.org/r/20221207154339.3234068-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm driver updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=702647
  Lore link: https://lore.kernel.org/r/20221207154134.3233779-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm DTS updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=702645
  Lore link: https://lore.kernel.org/r/20221207153201.3233015-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm ARM64 DT updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=702644
  Lore link: https://lore.kernel.org/r/20221207152554.3232434-1-andersson@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



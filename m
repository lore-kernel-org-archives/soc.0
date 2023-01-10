Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0737C54EBC
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85BD4C433F1; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F827C433D2
	for <soc@kernel.org>; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390529;
	bh=iAsyF54MXwBHlQUhcxzPjvXh+b1DyxDBJSF4uhxOutg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gyzeNbd5a/yP+1EpqxUv4+sbazEzNI3zSJCRoRz233chAWz9zP3b0bDbGxf/KGLUD
	 +7w42Ze0XBMBwBpNdDkwStRBqdbC33fedJiIvFCjBhd5kAVbb/pzybPDv71ZGmE5Q+
	 QhQzknVP71ONwdCEVFZJLyo4v4Esr4oDI6n9HlwQucfH3juwq6UD7Ely5VgjK1GPho
	 cx3Us73PxK+B36AV2G3tcoTOorhDRbP3Ecg7QmbBHZ/mwktKCN0Spg5Q7e0HB2TWrh
	 zXMe+mMiZ3qMged9LRK1DL4vpFnQTSQHWPf9RN0S2uYiOLSgkAOuy6YqlEHA2EpRxr
	 k02jt7vlsZdLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54A8AE21EE8;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339052923.5083.15213056568042310742.git-patchwork-summary@kernel.org>
Date: Tue, 10 Jan 2023 22:42:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm driver fixes for v6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710702
  Lore link: https://lore.kernel.org/r/20230110213946.2183982-1-andersson@kernel.org

Patch: [GIT,PULL,1/1] Broadcom drivers fixes for 6.2
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710704
  Lore link: https://lore.kernel.org/r/20230110215025.1008437-1-f.fainelli@gmail.com

Patch: [GIT,PULL] Qualcomm ARM32 DTS fix for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710694
  Lore link: https://lore.kernel.org/r/20230110212750.2182904-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710701
  Lore link: https://lore.kernel.org/r/20230110213724.2183668-1-andersson@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



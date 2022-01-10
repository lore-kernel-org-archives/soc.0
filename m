Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F00C433F5
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB374C36AF3; Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D493CC36AE3
	for <soc@kernel.org>; Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641840009;
	bh=KJBoUbVaF8HRV3RyVvoUX0dxD3Bt0jq8zfyblVtXfCk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=nvOv730/pN34Mma3szolc3akp7LPML+giinTlTI0UnBo3R5vPZDrK90BAAQvqfDrZ
	 qTHqSHswEWngI2ffF6wiE3RCDZwaCigeFu3h38Kz1vsXDOmioxVA6XRoKy4QcIANFq
	 szFFH+fi+9CncqllxsikE44Ou9RtMVNx0ErGkne7ImhJ57TROMnayia9hOBkfPMNtE
	 a4zDuz9YC+gjZGf4XXmWbxk8i+84NdeCPSRfxro4J5dMkRB7pDGonOicr90W+xbR97
	 vpLuIqYsiNutRxBEyphdoD4nZz+bD3+8+9Jt1qsq+K3+RspL+yWi/hrCK7/DKh/0qY
	 CLNmjlwSrd8Eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B95D1F6078C;
	Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164184000961.18694.8252887653562659489.git-patchwork-summary@kernel.org>
Date: Mon, 10 Jan 2022 18:40:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic fixes for v5.17-rc v2
  Submitter: Neil Armstrong <narmstrong@baylibre.com>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=604082
  Lore link: https://lore.kernel.org/r/746a7f25-1c96-9d27-3a08-e86b2af608ef@baylibre.com

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=604033
  Lore link: https://lore.kernel.org/r/pull-1641801310-149268@atomide.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



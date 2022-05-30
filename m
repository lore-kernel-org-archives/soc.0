Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC69BC4332F
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 09:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D79EC36AEA; Mon, 30 May 2022 09:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88C46C36AE5
	for <soc@kernel.org>; Mon, 30 May 2022 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653901815;
	bh=whu6xyo/Z/90cXXwZfdvUi79BMOBQXxAZ6XCJeVd/QY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=nPlGp034SWYGJlKMGKGfQWIy3rWsh9nXTfY8hyJxqbfDO5KOrZp6fdlfKG69xdqpS
	 zuou33WRzfx2WyXzWnES93HvKjFmVtIai1zrGcGc6FtcnyC2fgOdN2qK+Cj23cTOe4
	 8hIi9koE+28o/OlxRefpOHAMgJ55JsT577Qyyyau41dzH4gnBMsP2VUo9AXuvPaKhe
	 /lWydCBuA9m0SUhJm7L3q2duR2NN0noHil788YlH93FBTajiFL73vN1TAi31pLMAVL
	 sXXoHdZO3QIjxARPuOhR4+18sm6PkbMwnAO7zpy5TXUxgwHSGPiIH6vKt9d/khwJO0
	 k2wy8NDuffPEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5BA38F0383D;
	Mon, 30 May 2022 09:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165390181431.1903.13173278077655823224.git-patchwork-summary@kernel.org>
Date: Mon, 30 May 2022 09:10:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 5.19
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=643414
  Lore link: https://lore.kernel.org/r/CACPK8XfUmFxU8Y6C+aZ2+=dT7=fCfs2=2_aYqyRjoXCoeQaUWQ@mail.gmail.com

Patch: [GIT,PULL] ARM: socfpga: updates for v5.19
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=643358
  Lore link: https://lore.kernel.org/r/20220519232317.16079-1-dinguyen@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



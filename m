Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA4BC433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 11:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFD69C385AF; Thu,  5 May 2022 11:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B84ABC385AA
	for <soc@kernel.org>; Thu,  5 May 2022 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651749013;
	bh=tMHltRfce0Q4J4YKYpzqWQK3EHr6w9n+Moc4Bh+a3fI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Do5qoulLXyz8EPdxVzFognSJ0fEY8XXShDZ+PlCb3FjFaeo4szV8d9+jsx48W9Uxb
	 tjIA9FF/SMlBf/XWLe7j5FhrWqXF4KE3AtIUuvaHgheIPFZ74LXWAEEdRfh5rwBc2i
	 ijYzljZKxK6Hkz1AZRcts2jKhsLoV9yvpwUiLZCkWiya/3i6l+NW97KjaWSel9gmSa
	 PHu1Pv3ZHDG4akcMh78Kb2efAEaNF9wPPSICeytFT5+bEHtPSeHXXqsiAj32Ey27hG
	 qTGsDnny8Nc6hDVH8jBH5KkHmoLkPV+HTwOkYDxiFWdcqBMXujY1wgf9Kl1tIkIwSo
	 vhH2Q4UXLmSVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89C1EF03848;
	Thu,  5 May 2022 11:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165174901348.921.9058056358674129022.git-patchwork-summary@kernel.org>
Date: Thu, 05 May 2022 11:10:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: versatile: Add missing of_node_put in dcscb_init
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=636749
  Lore link: https://lore.kernel.org/r/20220428230356.69418-1-linus.walleij@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



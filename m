Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B408C43217
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61D91C433B5; Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A223C433D7
	for <soc@kernel.org>; Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669106415;
	bh=SYuw6UREO/c/pakb1USfaNUxcQJKbP+qtDpZs1VQ6nQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=REZ0qyZYXhJFqSupE42Fdau8euOA3IIYI/SwogdN8ioLEebi6Uz2thqZCQ8P3eZ/h
	 8UZSZOXC3lC7gGz6DQBvAxlW6p3BpW26vf3yUs/id9/ZtrXD3Fg+prYV0WBEwJR0zK
	 s9DoPkSCRjWJ9bhqWSGGq0z6De77JNdZe96f2hl55qGSZDTHNjhuEG4QTbpG8R4vS2
	 a3cIJCkCDopZZfJsu8qxJMM20kvDfzBSBuUzQa2hECMtfYZ0JDawt8NvuDoXR/Cqzq
	 m5ByIiTO9BOKxo7t0bJkV4FJaFJKIzeooeypSY6hLb1Def+UMNpJrT8WB+av5jsz06
	 rLmFbguUchXeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D656E29F42;
	Tue, 22 Nov 2022 08:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166910641503.28730.971922818982761620.git-patchwork-summary@kernel.org>
Date: Tue, 22 Nov 2022 08:40:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Regulator changes for am335x-pcm-953
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697619
  Lore link: https://lore.kernel.org/r/pull-1669036672-530717@atomide.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



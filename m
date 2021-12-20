Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07132C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA391C36AE7; Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E78C36AE9
	for <soc@kernel.org>; Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010610;
	bh=pn6/5rwxHt01xu1NDXeyLC/lzPgJqCDq3FhsRYzI9Y4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lO0qQTDrsayS+5FrMBMN1ijYOKI9bnJ+/eDxKhSck21ZrYLtYEtauOAQ7ASVvZnOc
	 y7jrtbs+0Dvf/xdKpyOG19GoX32Kb8bPxkUYrLRR7TS+AqppdM9J7teA3j5BZN559O
	 z5obvDJxTrsCmuJF0m7HrM1qkm44OMbnKwaDtcS797trSsSevyT6UCwuIm6sIw16qd
	 /NWq9/eJO6h8ZFEAtq76mJ+kamYOZkouZLk3zn8DqwAnVdV50wyc7Mf2v3CmcmMXrb
	 S7KBi9H4GxgYW+zr+flDrZi5RcksbLHPb88hOI316NBIH1xuaRjSH7xSv1lD1DIFan
	 sWtXImUbSL+XQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6B64C60952;
	Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061038.9073.7500209376266848748.git-patchwork-summary@kernel.org>
Date: Mon, 20 Dec 2021 14:30:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.16, round 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597779
  Lore link: https://lore.kernel.org/r/20211218052003.GA25102@dragon


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



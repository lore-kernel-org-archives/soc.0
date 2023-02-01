Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6DC636D4
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 20:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E00DDC4339C; Wed,  1 Feb 2023 20:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA592C433EF
	for <soc@kernel.org>; Wed,  1 Feb 2023 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675281618;
	bh=mWHjJ5ITqyjYzA07mHj5nShE+YSag8ESxKPGkfBxz1o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=L6qbDvx7/CJFIzEqcTgkn9liVTn3pDMTQqUBIr/rZsmdd4IIIyIARPXczrts6jtfZ
	 znCT7ZNrBXQs0/3oKbhAsM0tl+WACE7FJVhcolR8U1mfausPe88w36QSJxxprC7UGN
	 Ys93irKHCW3sQbRXrsJ1Xp6JCuOs0jk190p/LErb4xF0wvtcMNWMmWqj47rpxbaqOW
	 XEg/6ovIPOlhQ4MgGy3hCbzgK+kB3DA5PkYTisApUYnx7+ac9QC54AIvaVemop1SU6
	 5xZ3skeuf31pLIX5c6psJwOrgi1I0m2dyxr/8m+UnkWeoGJem6Xk8N3eQwzHAp6h6L
	 V19fQreeaSlfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A76ABE21ED2;
	Wed,  1 Feb 2023 20:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167528161860.24557.17906392716649764118.git-patchwork-summary@kernel.org>
Date: Wed, 01 Feb 2023 20:00:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: Add wpcm450_defconfig for Nuvoton WPCM450
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717581
  Lore link: https://lore.kernel.org/r/20230201051534.1005847-1-joel@jms.id.au


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



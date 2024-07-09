Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D5C41513
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E68B6C32786; Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D062EC3277B
	for <soc@kernel.org>; Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720522230;
	bh=435Dny5KjbZE6CBcuhJzxfM3sTUBqs/aimXxnz9K1fw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Svd0ohyG/IRA7oYFhFhuAUfuSJv4bqm7nqISVeBnfuNh0QLLlswAonjOUuiQo8VE0
	 J82sUPnTTwiLJG074HwG605nOXnpWMscDGv1qvXBye1NMuoT5iyHiN1j24/GgIg9rP
	 kddbomtTw4swjRTzNtm4ClANO7BiN+BdfFUvS4y4WUhvEIbK/8Xi379MeA6nLe8dQ2
	 OKcbb3b4pm5Qj4a83pM5s1i0UHV4xrxcwLNBJDYlTGrioEJwFjqSLOd4+rgxiIUiqk
	 14JgPan5BJrI3xTek1BJNf3jJ6oKdfeIHmKfR0EC6QLiMU3NZg4OZ7Rb5tjIvYPAJb
	 C8SE2w3hQDYSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BDD66C433E9;
	Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172052223072.24318.4408752628713486798.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jul 2024 10:50:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.11
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869456
  Lore link: https://lore.kernel.org/r/PN1P287MB281861EA2B1706B430D2FA3EFEDB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



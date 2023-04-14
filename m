Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F0C77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76F43C433A0; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60B38C4339B
	for <soc@kernel.org>; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681505423;
	bh=z3ZFsuEnP67gCWC6HZD6HH1vFUULXPMmv7HzpqAg6RA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LIWx9MsmztnSlSLs46rDZRrW8bjaxw14B32kQKXveu0pJhJxfeSqSs3Gkia2K918u
	 NN0kykZUlQAdZTbVXb9Tvg2zTF7aEkRgpskeSaFRiPQHWZXto1PuHPl6aJ9YWrWM/j
	 hJ7IPKc+bJP3gVRSvOdk4ZWVUvWfbKkKo8ZfaeIe13wM6jnp1qUb8dituCxPye/WKs
	 v3ZtBlAXbtRLUcZeHKOKIHqzNTN2LzKdT+Dreld6MVJRE42iFzJ6krIL6f1A36dHnr
	 clcerkBqW/PEIAeVl9jnzb/2kvzjh0V+5xGC2QMWCSuNuhEIXNJze5GtTTgLZVDxeS
	 yfMIBGssJVo/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35D1AE52441;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168150542315.1155.127770134900346577.git-patchwork-summary@kernel.org>
Date: Fri, 14 Apr 2023 20:50:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] MediaTek ARM32 DTS updates for 6.4
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739935
  Lore link: https://lore.kernel.org/r/c3b17357-e08d-da7e-def0-a7f9e0b95cb7@gmail.com

Patch: [GIT,PULL] MediaTek SoC driver updates for 6.4
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739943
  Lore link: https://lore.kernel.org/r/bc9f7a74-ce12-b323-021c-ff2c0473e979@gmail.com

Patch: [GIT,PULL] MediaTek ARM64 DTS updates for 6.4
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739937
  Lore link: https://lore.kernel.org/r/3626ebcf-d64f-cfd1-517b-b6bf8665a227@gmail.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



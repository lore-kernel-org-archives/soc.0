Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7029DC433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53397C34608; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BB9EC34604
	for <soc@kernel.org>; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639581010;
	bh=iO1o2Z7dR2tVH61aE4D1wLBxdV7N/L9yOz5br0hT9x0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=jWLepCiCbvzAnq0e28R2MuX5xwsxZZKX2zHIOH4WwHmfeu+1b4GFW+QKUdeLSd8gA
	 EKS+Ynigw2HQ+aA0vu8MMke9vMvXg5fQz2ugO1zCvuMbpaOLyYms9CiB9Ra8CPGxsO
	 V8OAJpY7BA39I0YZipEkyc2iujPCz3w9V8PiUjm3skm79FLaGJ3J5aIZ/mvdKLuqmp
	 xAe2r4XgWwiroOysbm3F9v3tgEPtpj96Kay9s0AryezCg7+CIagZmvXEiomzKv9Gbu
	 9tCPjWvW9/WbvOJ//E9Qs6xexsr6ncNWw7XmYa0H3/SWk8Hm65KRGLc13Wleh0PjGv
	 t7vDNKfvb6zVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E83760A12;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163958101000.23013.2884018684484408475.git-patchwork-summary@kernel.org>
Date: Wed, 15 Dec 2021 15:10:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC PMGR driver updates for 5.17 (v2)
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596035
  Lore link: https://lore.kernel.org/r/660f6f7f-0857-b54c-c415-79bcb93f0e02@marcan.st

Patch: [GIT,PULL] Apple SoC DT updates for 5.17, v2
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596009
  Lore link: https://lore.kernel.org/r/a24faafd-f2ae-c3a7-5327-b27da7d9e34b@marcan.st

Patch: [GIT,PULL] STM32 DT changes for v5.17 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=595913
  Lore link: https://lore.kernel.org/r/dfe942db-5af7-bb82-22b6-3bd866c9017d@foss.st.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



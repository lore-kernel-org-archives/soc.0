Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED47C636D4
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36DCCC4339E; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21A7AC4339B
	for <soc@kernel.org>; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675714819;
	bh=JQe6NK66cFXUWUcq+dD9SFrRRMaPezd9i11Ib+MJfDA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pAH/Qesg8ENytyO1RcfepwxTLxo2CiSjfukkxBZiW7hnQGz4/b2MoIg9KWNQar7Iz
	 +3nNNqjFCFeQEhbY40ie0IP3aAlyyUWF0fio3iRKyCv6GHENyYNPRR+Cg29JVfiOqa
	 Ue5kcDhlUWOSV9awvfXvRvLoVsNE4XvDC/faipcaqC0ya7ucF6qGvqzFD3nPmwfQeq
	 tqOT4+itvWskfpnEtkfIssW8XXay9+gXNn0/z2tUEtvHV9MM0R6TWzW7B6Ksp9ZbTS
	 qN6XzcNpNQBpZ9NY5534ntOqpZq6BW8AFTwKh2si9M1GK2+fqNINKIzuy92tKzRSkJ
	 m1XupvP+3s0bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E93A2E55EFC;
	Mon,  6 Feb 2023 20:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167571481887.10318.11684294594171472096.git-patchwork-summary@kernel.org>
Date: Mon, 06 Feb 2023 20:20:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] TI K3 device tree updates for v6.3
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718650
  Lore link: https://lore.kernel.org/r/642cf238-43e5-d6fa-68b5-a9dfbc0277bf@ti.com

Patch: [GIT,PULL] STi DT changes for v6.3 #1
  Submitter: Patrice CHOTARD <patrice.chotard@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718593
  Lore link: https://lore.kernel.org/r/8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com

Patch: [GIT,PULL] arm: dts: socfpga: dts updates for v6.3
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=719202
  Lore link: https://lore.kernel.org/r/20230206162425.311593-1-dinguyen@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



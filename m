Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B28CD5BA7
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E550EC4CEC7; Thu,  5 Sep 2024 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE40C4CEC3
	for <soc@kernel.org>; Thu,  5 Sep 2024 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725533427;
	bh=MydKdgSt+qB8ZoXp/fPfTjzYxXMXSqQy1GTu0BdXQa4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=hlCDUlc4e5ybg+YsntsKOVE7qBUm1JcsI+Xsr5EL06MrDCHipf1oPofppTWCpBmoP
	 P5/qOXm1C6GF0HV7htKcG16G00MfnbFJGDWhvmikcZFrlMfsmOb+YP4E5dI9A5KAdm
	 Me6veJ5L8Z6P6Ib4K5U90YXxVIitkdGuFCCJtOwJfMFQ8hCoHxsgW6f/5B9/ckdtj/
	 71wua3pFF9/HXHMR6/07S23SQKlh7xWmMXMc4GCAKOrZ29LSehicIHQnnaScC9ITGe
	 sALVEls5E3W5izhT9hYaP5XEt1RCQUsQfvJ+BshtrfPjMDVaIE/7TrwrdKmjmRr+nS
	 F5PewOAgF3MOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B582B3806644;
	Thu,  5 Sep 2024 10:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172553342810.1354535.1547799590348353192.git-patchwork-summary@kernel.org>
Date: Thu, 05 Sep 2024 10:50:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] One more Qualcomm driver fix for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886867
  Lore link: https://lore.kernel.org/r/20240904145214.4089-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



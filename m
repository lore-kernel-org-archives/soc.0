Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91910C433F5
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 20:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52C74C34100; Thu, 12 May 2022 20:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 377E6C385B8
	for <soc@kernel.org>; Thu, 12 May 2022 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652388015;
	bh=4GHWm+ZlCFtQiRx6YGzq5CsqOJ9avhA5kRtr8MXEoys=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=nKRq55KpGzncriFHYrn0Yn+wOhpgvpvLyUTl9vEWYdxmYaO6ZtDVxdM5iRnKDAkKQ
	 mxDfSbz+Jn1tJ4fqNKWOIdMHHPqIy392KIGso3Ogei+X5mhsD1ZrQE6+T5bMcLuguC
	 sBSj7PenloP95SK5NYNeJpfE74f0PiBDoy2GYqYalNM6TvSatgL4PDnB4FWbj9IHfY
	 9OD3KirNsS7yrHAQmyhm05GwyxikwxAv9feAg/NCIj5t7Ec7/iq5BGpCmHBLMP4cke
	 HaTDZYhZ6XElC83VzKG5Wkad/IT5xx0N/hO4ZikLrlam4E6q+gY4j3iRI8lGBZVn98
	 /X2U7sgSQvWrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 11E21F03934;
	Thu, 12 May 2022 20:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165238801502.21441.13032043191043527586.git-patchwork-summary@kernel.org>
Date: Thu, 12 May 2022 20:40:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 5.18
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640420
  Lore link: https://lore.kernel.org/r/2300256.NG923GbCHz@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



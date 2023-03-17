Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C92C6FD1D
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 812FCC4339E; Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60F7FC433EF
	for <soc@kernel.org>; Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679070018;
	bh=8AbRgZl6coCCKdxhx/HdUsykLXLn4JpoDsMiK31XG6A=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=eGp49/+6OhPQTnABqRgqXpcl9uKKUuUMbEMlh/Okl932WsUo6dzJ4BQnaBqVXsRuC
	 SGwzJFRWIdFXwL8lXnH39hd6s+Scu1T5cYks0w4dCsKBlM7Tye4BUABOUo+1aI1wYY
	 htSmyYjZ6WIJTHn8axeKzbtFL1lz600APNJzJe6OecUdu6piS3fQIj6WpsNIk0UbAN
	 6LBBl37fjCU9okHBa40WYNPXEKAqJvXfN41peWau3sVUF7fjvmnxyASOxdg8msf7au
	 6bCJh2rG2uzFIfaTH5GmvkSvKB50iV0ICg3SEWl1PePLiDuo7r3Ja0XPIYnQvRWEPt
	 LJti/i7Xrn4oA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B2E2E66CBF;
	Fri, 17 Mar 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167907001817.31956.13770102782259951521.git-patchwork-summary@kernel.org>
Date: Fri, 17 Mar 2023 16:20:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.3
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=730485
  Lore link: https://lore.kernel.org/r/20230315193557.1709241-1-sudeep.holla@arm.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



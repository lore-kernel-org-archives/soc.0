Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10FFC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7DAAC385A8; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CADEC385A7
	for <soc@kernel.org>; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334899;
	bh=oRpe5pEqkYUIXy6kHJ+wweahqXWGNLcJsutc1/ueRGM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=peibmWRBs4v3XtlUSzT63bgykIZ5igxMD3hdH6NJ46pTw5/PZ8AF45DH8zUs8KCGG
	 3Kgw2FwOssZUbtC7Dmd60ZVIVkU+KrMR/c6brjkvaKiBepEtLd/lUMRw2hXIG32q01
	 7qeT9cKmy9CIDf2e92+yipsx+1EDe34vRJxXhOmTMLwKHWHRO9lI7HkXI8ejnOixNa
	 FOeguybINqYnNswCUdn+m70TMWZ+u5r39G9GByz/uptnHgpnNbR6r2BrIFrm0G4cW0
	 VJyp6sXHc3hHFUnki9gqRhxIiD06GARIDsu+a79yIKS9CBUMJkOWfE921cI+a+G692
	 uxOTjP/goaKKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 636FCE85B8C;
	Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933489934.10369.8693971935628962502.git-patchwork-summary@kernel.org>
Date: Thu, 07 Apr 2022 12:34:59 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629976
  Lore link: https://lore.kernel.org/r/20220407110818.1436181-1-sudeep.holla@arm.com

Patch: [GIT,PULL] ARM: vexpress: Fixes for v5.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629977
  Lore link: https://lore.kernel.org/r/20220407110828.1436206-1-sudeep.holla@arm.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



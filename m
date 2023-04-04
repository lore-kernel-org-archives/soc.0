Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14866C6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC98CC4339C; Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3B3FC433EF;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619283;
	bh=W3aScaarXU2hKu8O4QqvZnNFaLxvunxZBaoBMaKI0lc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EQU5c68omroCKCtKPucXyZTs0MDVz7sKKxUpGnn02iyUCF6GejK+9o7T7SgBkiNk8
	 okbRHzXiPoR8kfSaBZOviX93xmtKpL/VMxVLGC9f8vfhtF8qRSbwDfjtFKPrDxpXnP
	 diuWpHtNh6wwATrxRGTZMr6twZX7vAWmDcoMBZtXK+Kl631q0b+DppX5+Cj0sGN4NY
	 edp8r/nr81LisGZzSaEGs59ALtD33+FEM0sQ1jBjPjoswPFTfadNybxRnJHsl+qYxu
	 J1cY2KkhHAJe8vdsl1INhUTJa2K8qFUROZ5h2eEco8bxs2QxA0oBr5mTu2LrlawLM4
	 nG667iM70Babg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8103E5EA89;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928368.17322.7038926602987854215.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <aebef87f-e0a3-17dd-12b7-7231ca6b0923@linaro.org>
In-Reply-To: <aebef87f-e0a3-17dd-12b7-7231ca6b0923@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 4 Apr 2023 11:18:04 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic Drivers changeset for v6.4, with dt-bindings
> conversion & fixes, dev_err_probe() migration for pwrc & missed
> populate platform devices for meson_sm driver.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic Drivers updates for v6.4
    https://git.kernel.org/soc/soc/c/748d3c3cce57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866CDC54E5A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B3EEC41674; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54FCAC43142;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=IFE2BmytRr9Kh1S4QYEm7UuVb5EmZ+fs9WzwSMtN8G0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kClGppTLJJJftqHpZXItD07PchNHhsQlnN+CYvW09OUYLgWAW9xOpHUv9962bSY3b
	 Zc4i9ZA6PfG5vdiF7Zc3X6ex+gE1/bG5OfViZoRRlMgarH+hZ8y5QKv7m+h9SVK2qL
	 nJfAPfB6v+QcqFGqCYT7kws61OQI4i5c1jKKP2DE553NK61gk7Vhncfsu3jREui1NC
	 79ZA2g4GvP6yius9476z4PGa/FsBID6mgKbuVKCaNuus1XQBvHrcbgEq0KORuZcz+J
	 6n3yic40Y/6b/kIbhu4hgMvxUrpj7veH/L5aMp6eKKsXypamSLtdSVItxcUncY8zXi
	 H+1jhJtNCYUmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2BC12D88F8B;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403217.23732.14496345088309238029.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240301111300.4038207-1-p.zabel@pengutronix.de>
In-Reply-To: <20240301111300.4038207-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Mar 2024 12:13:00 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:
> 
>   Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.9
    https://git.kernel.org/soc/soc/c/724ad89f839c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



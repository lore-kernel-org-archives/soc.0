Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A77C5478B
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CE4BC4166B; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15717C4166A;
	Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463562;
	bh=6iItUHNDQzgRsQwbujji8Szw+QAq2UeORAkKelwLqs0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZhYtGzPyOpdxuHOBw1yyKACXYuvAuJQdjtvGCLWJmaCVUjnEZ7MYQOplUBTBaR6v9
	 qacuk9ix8MYAiZrphVUmzIwIL6yYHabxidEFyOkRQCaX8Ed8RQwQBh6v/RUBx0UzlZ
	 9qa1W8C+2YC5g16rAVVexjI4kyU3wT/u2IAm3W7OkM4L6uMh/nTvywHakASjHSOfVv
	 udFkMqdz2Psp6z0t43o/V5iNPS0pIZS+5a/dj4ZqQn4lEBgv1l1bqEc7EbuMInMAGz
	 Gx+/ydlxHJtSCyYbx4dpDkiIRpW7YNaMo5awzfKv+k9E0wontNP3Bib9Ck+tl2WB3M
	 pmGMx+qU3vzhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EAF55D990D7;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: config: disable new platforms in virt.config
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356195.4365.10471154067834528340.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
References: <20240219093819.644324-1-arnd@kernel.org>
In-Reply-To: <20240219093819.644324-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Feb 2024 10:38:04 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A couple of new platforms got added since last year when Mark
> added virt.config, so turn these off as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> [...]

Here is the summary with links:
  - arm64: config: disable new platforms in virt.config
    https://git.kernel.org/soc/soc/c/9dcb9e583f10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



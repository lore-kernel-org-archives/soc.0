Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4521CCDB482
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F4CEC433AB; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15AC1C433CB;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=SszKMelWMwjKKkKwA1HcaJu4eb2LDFmSZJtPIs97o4o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KhO7d1TTiGHOsvzIV5b5Bnhi5zdohcZHpU4LgFA3yA+indo+UCSjlzwfIRHS4HbjD
	 8nMOzPAFLPzyNXk104rQGZXV5kE3UEq3m6H91ljHiYmrjoOP98yWqb3/VSfQ+9q+8b
	 szRn1cgdOn7BdKclFFVvfavtGjXJlkIUlrgTE6oKnV/WRibE/WNADFSFEMEsOWQwLC
	 PUD7z1jX87uWJcueuw7PvLpKPBq2BMp/Gis6j2ml7VkbjuB88NRVmyByZhBticStF7
	 5PvT4FxgnMVqy3xxnBlHQ/tQoW7abhJ7NXLNilbUQJtthnS4H+VF0xXKyyf35QyLHF
	 DNkQQSwXAvPLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E906DE1F66C;
	Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083794.14185.17133455676160201466.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:37 +0000
References: <20231010045955.1259843-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20231010045955.1259843-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Oct 2023 07:59:55 +0300 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates for v6.7
    https://git.kernel.org/soc/soc/c/62d3bfa50c51

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



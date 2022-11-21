Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFBFC43217
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 483C5C433C1; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F823C43470;
	Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042286;
	bh=rUMWCse4gy2KDSZ2JbqbF3yATlY3w2++mYgqbrl/aQ0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jzixA5/rADKOG6DXJzWM6v9cFJ3chDH78oRIi0+kj5NbE6QXTQAPua2m12mH2P8yD
	 RMHBSBzHa06Im9jrCee6W3gN354sH4oV3+a3CWeBoAyC17VaYjI9u9yXpl9XTv389U
	 C3AZY85K+ZMam3umAuWiAeQTW4iM29rLO6xuSPBfe1xs8ENQ3NxDe9wk9dxoM+/SnM
	 RkSRZx0UAaWNyPqj3iEjOdwgwK/9/IYYB1EwGdGFQl3eT8Pb7SroRWw6yCqu81oRA+
	 LFn3PBzQlLqyc7q75Q34Al/i3j8MhessKLzpVxLkBNE0lcBEYp6wFt5WaFg+bZ7r9d
	 3Npqr0usVexLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E7C8C395FF;
	Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904228605.4359.15916793893242177102.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:51:26 +0000
References: <Y3ftpBFk5+fndA4B@jernej-laptop>
In-Reply-To: <Y3ftpBFk5+fndA4B@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 21:40:04 +0100 you wrote:
> Hi!
> 
> Please pull following fixes for 6.1.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.1
    https://git.kernel.org/soc/soc/c/e7135a28430d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



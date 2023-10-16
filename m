Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D00CDB489
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30E82C43142; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17FEBC433CC;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=qNfxlpiB4HA/dEoXX7Pkj+Pin2Tmmoj8Ltwg3GQhDio=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NlR5RmeGFhCrlyajFcvuSO0XBcalGC9/Eqhz1bqHaonxz2KzkmpIBYw2b9mB+KdER
	 y4JZXaLUMEjgGpsbfEP36V4sX0fhFY+L4Rsf2Rg/WmCHvoCwAHrlV6kHVofyFCQ50y
	 avTU1uqE4H7CmMy28yvtcJYL2C2U+El1Z/VmdOSL59LzHP2GC8zsZ5R16vX/jRPj09
	 YwojWxbFwg+u9RHMeYc6r8IScqLifTBHwdVAYI5C5Rw1MqsdRT2hDnNQ6e5fvH1CI3
	 j4Gdc36bLXP6Wk5F1zvoYcE/jsSZzNhbwsVg/cgfbE/ln5sKlgPYfkWHDZM/q6AWY9
	 L+NEkNMsZo95g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F17DCE4E9B6;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191798.22284.13425380618342135231.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <CACPK8XcTx9bd7DkguFOZ4qCxk8MJWm-yeNMLGDCnO+wv7dwa1g@mail.gmail.com>
In-Reply-To: <CACPK8XcTx9bd7DkguFOZ4qCxk8MJWm-yeNMLGDCnO+wv7dwa1g@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 12:19:21 +1030 you wrote:
> Hello soc maintainers,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: soc changes for 6.7
    https://git.kernel.org/soc/soc/c/1780d27c7a54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



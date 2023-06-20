Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D677EB64DB
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52CB9C433CD; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AF89C433CA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=Iv5J3pkCrsI4jBNt7gnE/GYuwKeWaIy7M/gIKJ06KZ0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tsfNipdyKkP2yA7KjFsoPLRQi4kjkh6OZw0Y0SMTIGRPM4jxP1c0f0MpcI4pelDvo
	 vFz4gSq0h5ly6If1M74BU+ibTHCoxeRD70J0yG8yBOpCMzxnkIJIuts1ibjRPYLI7O
	 NwSKlp3PBIB+0t0tpwo1qQ0sT91k0rzA3O2uQUNhxs5Cvq76Geir+gLIacFB1WHZia
	 ewlNOFcuLH4PLnl1gYMgQdhiOXkwba6VuLHSnBHOUJtHa03/UideeoKlE9NwLsv2d9
	 mAAfI87UbWT64xrLSXZSM36LlC+fx/mJRtR7+z+B6DyRq8VecgJkp6TSaLBhcQ25Zh
	 1BQcjBCaXAjPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 12FB3C395D9;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.5 Part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611206.12258.17428637429522831122.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230620-fidelity-variety-60b47c889e31@spud>
In-Reply-To: <20230620-fidelity-variety-60b47c889e31@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 Jun 2023 15:39:26 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a second part, if it is not too late for v6.5.
> This lot is based on top of v6.4-rc2, because Randy & Linus did a rejig
> of the MAINTAINERS file. As a result, the diff below includes what was
> in the previous PR. Wasn't sure if there was a request-pull incantation
> to exclude what was in PR #1 (I guess I'd have to do a local merge of my
> first PR & then use that as the base for the request-pull command?)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.5 Part 2
    https://git.kernel.org/soc/soc/c/c9a5aa0e53d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



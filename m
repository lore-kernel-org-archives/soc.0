Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA5CC636CC
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 581E0C433A0; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 423EEC4339B;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470820;
	bh=xeqoY9pNqoIrCjh11TnkCGRDa/L5yvmT1jBjjk4dtNk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ars7coUKkqEQDNUbMPFOSxVObgyKMpL3RuSYon9aQ1bJE8Z/aGW91j6YOeqmHZrWV
	 138BHIbIUpL054k4JGkMs4KjaeJ4P4GaOzm674zyT5k2eGuSgY6nP43SXh4ek/VwLP
	 Z3ugu5wO+5+XOPsVFkvrqpuRungw3RcA1jrWa8V+jhuN3I61ydYgvy1zbeee1H5HaY
	 ySDR7yBM9X8rzZu9EE5ks5hDXLH910MG540rukiGFhwbfwmiG2QSi4dWfe8HZc5gG3
	 7w4E5QLTkchGCgK3XOhfHxurChLfCIl5F75RA6Fg8sVOp/5Rh4qKNTRETurtEJp5Dv
	 cY7KFw1I7UtUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E831C4166F;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Qualcomm driver update for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167647082012.22208.15131642688467729635.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 14:20:20 +0000
References: <20230215043658.1156472-1-andersson@kernel.org>
In-Reply-To: <20230215043658.1156472-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Feb 2023 20:36:58 -0800 you wrote:
> Arnd, I hope you're okay with a few more last minute updates for v6.3; bringing
> battery support and, in the DTS patches, support for USB Type-C based external
> displays on the 8cx Gen3 laptops.
> 
> Regards,
> Bjorn
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One more Qualcomm driver update for 6.3
    https://git.kernel.org/soc/soc/c/524af30c9313

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



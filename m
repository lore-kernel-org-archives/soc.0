Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAEAC77B7A
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AD44C433A0; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23BA8C433EF;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685030320;
	bh=lgDDMsmhUaZVtEWr4l4inuQk8X0dlq6iDAgABK704ac=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BdN6LvfXCZ+Pz9XpEZEzj0IulaRKcLKdaTEgxunX90hvJ+FdvmoTHeeB51vmpgVjr
	 lf6L6jBjdHvAF4hne+Y9EDdCNMs+ETFoH3s4J/d4z/7lSgSIUef7KW6rJB0aainCQE
	 N2dpOuAjvGo/fyFUpkI4V1GJTQp4ECdPAbYZG9a/7YYoacuwCuj39IktNrf+yKUgW1
	 44N3ZuvGd+aG6kpVes7lbqiKD2a9ZriUVCI+0TdznjaNx98Hk70d4knD9LYLxeOg8T
	 GoGdXIC6m0ok8VwChjWwpqonvgvKswKx6RgpiwLuFLVRKe8phJ/RozEHraIH6LydiN
	 SCiaA5Ehc26hQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 045A5C395DF;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix uninitialized variable in OP-TEE driver for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168503032000.27102.8366694161882288572.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:58:40 +0000
References: <20230421075443.GA3136581@rayden>
In-Reply-To: <20230421075443.GA3136581@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Apr 2023 09:54:43 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch fixing an unintialized variable in the
> OP-TEE driver. The error has been reported recently by the kernel test
> robot.
> 
> I realize that this is late for v6.3, please queue this for v6.4 instead
> if v6.3 isn't possible.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix uninitialized variable in OP-TEE driver for v6.3
    https://git.kernel.org/soc/soc/c/9bafc2bb469c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



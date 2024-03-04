Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4EDC54E67
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9265DC32789; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CB9AC32784;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=RzT1/DRHQKQZxglvY3+hDlTOJI9qfJR3cHyDGjTxGR0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=joKTz/CKu2RDQnRaRZm3u1PnyVJsfy2VNjJ8gRZR9awopeBUvrm+cvOgpTG+QVEhd
	 kGFnK7OSl3fU7Ppnwlv9fo7DKlMzBZSBud8H8iJyUGedvA9KzEPMxbbUZgvV1NUJXl
	 A26PM4kN0tfojksGdhyvXwIx+CwobQ/l0LcBRtASf1bz6WQ2g+PEzEWZzBJaNwiXmM
	 De8S7vMlTdMi27m6lV5RzBUAntQmjI8JGP2hyhqY3QUNUO4ULs6IpEiNmkWwFjyByC
	 rPpA0WLSONLl8CiRbEPKOA9uGgoyUpOjnJzYKqr4+/Zl8a/sFEW2sogCSNg5aVcP7p
	 K/9X+stNNs3gA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A57AD88F8B;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers change for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872043.25915.7986728491887115009.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240223205734.GA9027@jernej-laptop>
In-Reply-To: <20240223205734.GA9027@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 21:57:34 +0100 you wrote:
> Hi!
> 
> Please pull following drivers change for 6.9.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers change for 6.9
    https://git.kernel.org/soc/soc/c/c6274c15f9cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



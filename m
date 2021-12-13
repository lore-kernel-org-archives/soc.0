Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66053C4167D
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47B26C34604; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3227EC3461D;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=pMRy/jXKa0b5hQu7Sqf28uYw7CDa36+fjpfaSA1dxPg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YMHvSHJwlRDZdoCQWGZZvqimKKyLFW0PitUJhCn0JTEsZ309bunOsJJ0C4EN87n/9
	 k5Vs0LUHmrgpeDyYSxwZd9uQ2Yk6lvHBWKkyRT6xWRBN/M3WkIY4NFSaxd8gGEyZ5Y
	 PUEUpr/S/47zYgEsovrPDXpQTnAW+raKmdHmvf5V06GiW7B3sSX+4WrcXI1TTko4Km
	 gYjOIviuRKunm2nJ2zqvFlU+ySqHzthxWg0JqeQdC9HAblckFzP/mk1MTYU7vsHKUB
	 QMvaMLNJO93UNJWIgCeGiwHBffYCMS9DBRLEfuqGxFIjlzx3ek6uUr/R1nxknlrS6a
	 ieY4HB3aHq6eA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 160EE609CD;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522908.6863.10439458403350236222.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:29 +0000
References: <20211126100716.GF4216@dragon>
In-Reply-To: <20211126100716.GF4216@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Nov 2021 18:07:17 +0800 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.16
    https://git.kernel.org/soc/soc/c/708038dc3715

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



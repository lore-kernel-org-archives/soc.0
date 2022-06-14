Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C84CCA482
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54E47C3411B; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F1E1C341CA;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=Tii7cqXN8S4OT//+R5Q9qCft/nAorpAlmCKU3VW1qns=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gl2FeYJG/Nx4FXelW0alUD9ONJfOq8seqi/Ww94wBVFN3Tx54IaA+JYOgN9f2jlhv
	 mI0kEu/rqitWa2UC3VfK+8CBnSortncglOVW1Y+vAwlS29jWDoByTj5YdInS09dtwJ
	 uK5ZHhPnj6HUkLpyn1yv1BfwXXp6gn8Ym7Y4QLBCriGlYVVWOzdZd7MF4YHaGUigyx
	 aSRzhGYE6sZeeu5c5E+ZRe5Tso0iPXK1obzEE4Gz0lLAAixuK2AOVWph1EMb594NSX
	 wK9dpxkPR5WkmkcvMTJ/E1/C3h2A1sRnOtq3SXIKQrn6kga3w8aRkq0Q/kAaSujsNC
	 BvbmVZ2zNtDMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D758E73872;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix OP-TEE compiler warning for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903411.29335.17493268202109124843.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:37:14 +0000
References: <20220530112612.GA1511426@jade>
In-Reply-To: <20220530112612.GA1511426@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 May 2022 13:26:12 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which fixes a compiler warning in the OP-TEE
> driver.
> 
> Note that this pull request is on top of and earlier accepted/applied [1]
> pull request in order to avoid a merge conflict.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix OP-TEE compiler warning for v5.19
    https://git.kernel.org/soc/soc/c/9c76d723edd4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



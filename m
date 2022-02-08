Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE72EC4321E
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA3FEC340F7; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B402FC004E1;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=ISm2ivq+BgeLtS7jxm2rFAeWXexkeL0dgnQ4Sxf9QDw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ct8RTEeyS0HV4zS9Q3XgdSwPYDuJtKA5yiaMfwA8UctBosIWyj6QzDm3Tbq3kuUwo
	 6tft5RE9cOQVuX36ATFpO1iiVEJBYmUofJCjPlumlBnRLifINsJnZ41Ik86hB433aX
	 OCIM4BfkQVhQxekS6W7sqIomjgEsD2xFryBfp7I4rRcokrPT+iO753XfFITd5eLwh3
	 6sRpGhLDsVvMNAZE0Ak9GbFEGO9fjVTpBBF9e+FL36XoTIQP2G45hGoyrHXK/yYm7s
	 5AfwRGN5KqtTyUFWYn57CWaAGNWW4lsqM+VhwuTJk2zjFKEZFnjYZ8BM9f/XkwNdMJ
	 fZX6FMLZ1jeYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9CD3BE6D4A2;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210962.18327.16579288614021335266.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
References: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>
In-Reply-To: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 8 Jan 2022 14:13:49 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge this trivial MAINTAINERS change for 5.17.
> 
> This commit was waiting on the watchdog driver to be merged, but I only
> just now realized that it silently did. Sorry for the last-minute pull.
> If this can't make it into the 5.17 merge window, it can be added as a
> fix later instead.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC MAINTAINERS updates for 5.17
    https://git.kernel.org/soc/soc/c/78b390bd5657

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



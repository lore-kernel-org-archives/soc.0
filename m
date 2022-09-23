Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC62C6FA8B
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E235FC43470; Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC5F5C433D7;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950026;
	bh=A0OsA5R/BF0zXuuFR/MW94rb6Z2RR6oEHn239GXPok4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=r6BFyAkbtyiTo0ZvF2IcT8N3M4P7trpuRmJNMIuAqZbyeVcNg6xjobaJGW9BZ9Yui
	 hbpOaD+RVFAnyP27X9yEQPVnxW5uUJ2qRbg7qAlG82s3m/OtXXjSbYehqsIpIab0vn
	 JrbjfrAFZTtMCrX8kUGGwD6ZvYSLKkLsMpkwjKkFGOH6EAbOWyoohnm24sfxgJsUpe
	 ZMrx6iIbHHy7mm9t7a2QZ8uETQfJIAA78PNcH6Tnr03P+NfCvJNykooFFp5JGBJXN4
	 4YwKBrjpZaETkUcOjk31ViyDhUtJYrIXvRIQ0UTqnMkwwrjJ9TsXxysa4rsePu+PM1
	 WQ8wSy7hDLIYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE2D4E4D03A;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: configs: Enable all PMUs provided by Arm
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002670.3905.4864209274570646743.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <20220919162753.3079869-1-broonie@kernel.org>
In-Reply-To: <20220919162753.3079869-1-broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Sep 2022 17:27:53 +0100 you wrote:
> The selection of PMUs enabled in the defconfig is currently a bit random
> and does not include a number of those provided by Arm and present in a
> fairly wide range of SoCs. Improve coverage and defconfig utility by
> enabling all the Arm provided PMUs by default.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: configs: Enable all PMUs provided by Arm
    https://git.kernel.org/soc/soc/c/075ed7b9e408

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



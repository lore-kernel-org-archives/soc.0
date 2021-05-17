Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F72BC43470
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 523AE61360; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A9F76135C;
	Mon, 17 May 2021 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282810;
	bh=0BbURi9ttJDd7yQrW9a0/NJ2BnaDwOAfuezV/EmQWK0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TzkyVoG1XX6pgE/X5xzFG4ttw8NOHMAMjibyQ1fjPzggJ7ttboixRlDABUjbFyhQ8
	 H6fX2JwnNDKX/rpX6UliMSH+BfK4dIOHDEylh3+rO7aQ/0aFIJ2nqajWw4sA0FVXUG
	 6EbmT3+f0+OiSQggu6kXvqvri6gw14JLmPfcDZtNTINcbagGWL5JzL4o3YrOu7baLT
	 /PXy8+nBB7XWbfwxoOkKqbHWl3+Mg66YghJQK9lL1wzsSLUs5b+jk4dblgWLlgGIhe
	 lAbXf0b3zIXdTHnqw8BESaLFKEXWw/OV4CaE/LGROMcZt2IgLTJHA3Y9VwP/C7iITN
	 2RUoJl5DYEQ3w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 368B160972;
	Mon, 17 May 2021 20:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128281021.19328.2842839039767894407.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 20:20:10 +0000
References: <20210428093148.flrcowzr2dsj7byz@bogus>
In-Reply-To: <20210428093148.flrcowzr2dsj7byz@bogus>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 28 Apr 2021 10:31:48 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.13
    https://git.kernel.org/soc/soc/c/e393cc4e9ce0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



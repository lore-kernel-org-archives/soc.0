Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF290C10F19
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7F5BC433C8; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2487C113C9;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=kPLAlxIQCPJ/juNLBsbu1KBB+qzowo+IZBCnbUNXtYA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uURbwwMgUBegVClTKLit7ptJFXb6sKSE44v77Dlww0Fzjzq26Q2uwIkPxpq6L+ZYS
	 7ySA0qEkCrlKa5kFnWt9/Skh69hZlMoShriVDE6vdbo7pn7GtI56yMZKbsOOBweUwC
	 bIdB5YicD69DbLcfHlSHWn4UrVyWL8Mc+wNL/r4zu7WDDnz2oJecVdn0/PbjT3AWcQ
	 DFngu/FS4K1baNRlrb6l4/TA+WfSSObQcWz5PKkuWlhgMk5UCkTRnK1GgdCXU2Dtj0
	 v1riVSBE92w1tMxoKoCnk2q8vaRj+9UNnd9IYubykRarIm4dqn50u3sjmYHfvGRlun
	 7EphcG9IqvFMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF905E3308D;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168971.30475.2196715926560202347.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <d5f95654-ebcd-bd37-02f9-840e50b17e44@linaro.org>
In-Reply-To: <d5f95654-ebcd-bd37-02f9-840e50b17e44@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 15:17:11 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changeset for v6.6 with:
> - Initial support for A311D2
> - AN400 board
> - gpio_intc, power domain nodes for C3 SoC
> - DT bindings fixes & cleanups
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.6
    https://git.kernel.org/soc/soc/c/57af7d51e7e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



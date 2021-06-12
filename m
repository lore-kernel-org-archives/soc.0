Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8D9C49EB9
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B8476613FA; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D856613EA;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=lbsR6O6lOzhAg1kZEH1PEvn7ArIzzp7RQ9GZaglahtE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jvsOTFCWUALOKsYnWwPZb+B/+IsR3eqEIpm7ondjFAT5ngIt2c+nqL78b2LSYG4Q2
	 UEULXtfMki29iom2XynTfMhIQysOE9xlyu3NTEPgGlNAHTDlXUx+ewRD0MiEpA4ijR
	 ZmCID16eaS4GsWUZxEJpLjGIzFUWHMuEHbyYKLvg2UK+PSi7SEiVxnTEAisZHvhx8T
	 rUlv4X1PxgeguaDYnXFsuCDm8o5RuuVqBZZ85r56kZxIJVtjjqyBdtqlYXX2CgEd1D
	 zLaWR09TBxXEhbj+aGqETqs5XIUgsSzJtyZIaSJfdmGh0NoHG6sfzDA4kDEO7eNn+l
	 tjDs+gtQN9nXA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 893C760D09;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.14 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421655.27448.10845123754647313891.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <e4bfb255-63fb-74a8-d591-eb09821c93ee@foss.st.com>
In-Reply-To: <e4bfb255-63fb-74a8-d591-eb09821c93ee@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 10 Jun 2021 18:01:14 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.14. This PR
> provides mainly DT yaml verification fixes.
> 
> regards
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.14 #1
    https://git.kernel.org/soc/soc/c/52b54b06a49b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



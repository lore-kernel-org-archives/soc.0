Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891D0C43331
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B99423ACA; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2425423B1F;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=7QD0hXDEDV8//jvVHCaK3q6sPCx8EHC7MtOf+A7+zog=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=s0TvPh1ioWxY7BAL2EyPkF0WYOMOFQpFBVX8Y4R07ko7xvEO2dOJqiDx83rCbA1ou
	 3eg8VpL+t1+pNjQErh6tiZNu9mv1yR2S8xYvEsTSruEq8m2ZluxxJ4biI3AyfUJJuN
	 JKMxS7o2yxJWeqdv9oYsVb+8toxJwSfKcU5QV7V6whfcaLhspOWLPu5yOP3HqD5Dsc
	 UXJWEefHlP6Cl5ZHz3DdZdxWHqbJ+eZ1jFpQMELKCRZo/XV+eXIceJKU+QjI85gnNl
	 Gtc+uGHm98PsL0OLhJt3DNgLlH5YTzyNJnYz141vqpt2SADA0sY/PL95cZ0zEuAj/y
	 Tq1T9rmWfVOGg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 20EEF652D8;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SoCFPGA DTS updates for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641313.29035.8459399712307152483.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20210120012334.25730-1-dinguyen@kernel.org>
In-Reply-To: <20210120012334.25730-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 19 Jan 2021 19:23:34 -0600 you wrote:
> Hi Arnd, Kevin, and Olof:
> 
> Please pull in this SoCFPGA DTS fix for v5.122.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SoCFPGA DTS updates for v5.12
    https://git.kernel.org/soc/soc/c/7c348d8de831

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



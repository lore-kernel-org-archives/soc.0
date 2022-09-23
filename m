Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8912EC6FA99
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 170F3C43141; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0100DC4347C;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=0l2/3/myTZuF5IkBLFEqacYOpHitnZGDbhhF1XOJP2E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iTfpDl7fmbhnzGdC+UAbyRFaLz8eWHswhGYR0cGwpj/S5z/DNfrhy++CyqlUTXvz6
	 IxrpygpHz11YJxS+cPZoYqYns9wIv6b9+FrY2s+Itp0RbEG+hyDhmJ8/STwdhOS8vo
	 4VJmaU9FQ6G6jXGWQJW7uSFN72qgb051Ymn7KuDFhXCLXgcVuJb3U2jh722raaKz7I
	 KsZWivqvlgqzVLsQPVFhkBtPmEpOo6BBvgtJwZc4VO5DMPJfMZTjq544KCw5du6zop
	 tADmNMhoBnpRurnKo4Hv83t/plSsp5B7RsghgnnTVYhSDWEdA6Bl0lZmTzVzdL06NX
	 xd6w+CnLg4RIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5FB8E50D6F;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002687.3905.7419212959030024162.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <20220921150314.1312358-1-andersson@kernel.org>
In-Reply-To: <20220921150314.1312358-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 10:03:14 -0500 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for 6.1
    https://git.kernel.org/soc/soc/c/d1d48fd18abc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



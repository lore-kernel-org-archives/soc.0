Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF90C4332F
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 21:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E66CDC433B5; Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE504C43470;
	Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668633616;
	bh=vnO+JCObyU4IExd1NlYPyfVWYcwm99PSZms/u4pLm4k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HgAND0KJL4s0bYRhzi2BxS09IGQq1qBOSRmXNFkD/0V+jFt2MDO6PItTqRlfB89+c
	 asQjSeMOLg2hhkFNiNYy3djVADdgx2SjCr2vdGS7TDARhgKrIfd9FTkcVcg2lmemBA
	 xkGTJI+Bdwfm++NPlnKR4X74bFFBarounCr4ootEVn98INy0nPGGBk2jILTny2AK9D
	 LdnCXHU+VHKSmSr90JzGSOGci/AYdUvn/f/KNlAzWNtd4HJx0fCnNqbQxZnHePq2rj
	 69DwyZ8/v7oQ9ohXiatn8e3wU+GauOGyJUPY6t7nTycGNG0e4qORV0bc3NoXIgnQlL
	 sdqwmNgsdgTXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B8A1E45201;
	Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.1, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166863361662.3865.9599232755704930541.git-patchwork-notify@kernel.org>
Date: Wed, 16 Nov 2022 21:20:16 +0000
References: <20221116090402.GA1274@T480>
In-Reply-To: <20221116090402.GA1274@T480>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Nov 2022 17:04:05 +0800 you wrote:
> The following changes since commit d5c921a53c80dfa942f6dff36253db5a50775a5f:
> 
>   arm64: dts: ls208xa: specify clock frequencies for the MDIO controllers (2022-10-29 20:31:24 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.1-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.1, 2nd round
    https://git.kernel.org/soc/soc/c/0d6a10dc2b97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



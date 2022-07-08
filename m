Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A488CCA485
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2FEEC341D1; Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D935DC341CD;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266614;
	bh=J4gOV1bcoN2hmGjGoRD2VKpsNSjFPgbvjywplx0mXpg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Bm1KAupdftkAUu00bhObOlmgbf+JhaboMf+PWiZvUlaHjqeBBkNpcpYWwHxuZafRG
	 6bey+SdePKlwUzm7ZRWx0GXkKCbsRb69z62MjRbraR7+Bu5IZQ3S4CCYksjJofL6MP
	 p0lN9xYYw+Xp57YL2htaEAcBvZHlY3wzsBVoKvcEvjO1eglfzTfL5lBWuCiTi5EuMq
	 GUh3V0+Hnv6xlAllfITY57+CkA/oKDfF1DGfiDbLAPxgB1bZyPBKdB8UqqGfuyNkC8
	 rQ55HVI7JZpNs7EA86FxHk/b1iNrgzLTfxNGXaRO1v++NSWw0wnoTBcJVTtJ/Gku/2
	 u7XY5axYLYoEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7A0AE45BDF;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661481.10888.10971544020756898873.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 07:50:14 +0000
References: <20220707101344.3329314-1-p.zabel@pengutronix.de>
In-Reply-To: <20220707101344.3329314-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Jul 2022 12:13:44 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v5.19
    https://git.kernel.org/soc/soc/c/a902fa8eccaf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



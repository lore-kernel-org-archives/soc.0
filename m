Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E0C001DB
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77458C433BB; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B33C433B6;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=XKokBl3u7wXkOUg3VO7qQ1SpbsubP8o95GNoaUAv82w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a1B1GaFhLAfy74nsvAMkQKlLf9fmAbpFp+oOPLayBjhSqXOgqF2BJygvir0Kw0pvY
	 cwFD5CcL1R+C+Cxgczk7lA4vqdf8ZTJoKO/AVIMCQUveTBingBuzWKZDKsYffU4RGY
	 jKzULwYwFn9EDZxdbftOyk1J813O7PIeTp0Hl81DC/jXHJVb5XSFJgkXZXr86dbV/1
	 tzY/qox57KsBfiYl9xZcuRu7bW953BH43WtDPTk31MYBYrHGqh89ehwzPKj4YyTtx/
	 Bi6zI/Z9iwHME8h2yJiTcMHq0ZcgIpKtcDATEkyJryXepaUrnUd+mLj6FxTHBzZ4Rn
	 xipTz7GsGjk8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4838CC395FF;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/fsl drivers changes for next(v6.5)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745023028.12309.10246506906091088514.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:30 +0000
References: <20230621222503.12402-1-leoyang.li@nxp.com>
In-Reply-To: <20230621222503.12402-1-leoyang.li@nxp.com>
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Jun 2023 17:25:03 -0500 you wrote:
> Hi soc maintainers,
> 
> Please merge the following new changes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/fsl drivers changes for next(v6.5)
    https://git.kernel.org/soc/soc/c/25a31b90a063

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B881C4332F
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 14:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF059C34117; Fri, 13 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B90AEC34118;
	Fri, 13 May 2022 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652452814;
	bh=8h/pON7h9mWY0VcYvl4qdVNJfoOV5g990hp+gWkupdg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ESfx80y9tGcaMRypnlusWbug0Cke3HeRAR5CMH7+oaKcsWeOaX1BaMfc8BTCuZKNq
	 lUhusqwp5NISlQyRHLG9Y89+W3YusgQdAIef4Hm+FEA3MbK3xKegXZt9YCx5PCwgIc
	 QytYw2Cfz09iPG2U6x+xxTZWuWXH/3Z4gw15CbxaFfXLaqvhcPcDqFT4wmWR0ZH3Db
	 M8/IMSl+Dbh21OkfejyytDOtfU2VvnCpgslAbhvuKIVJ9RpzR0cWKE1kSFNl9ydpnF
	 z7EslD3I7rhbPvNi42VAJBaoFCMIMH09CqUOqjMCVTWWCHhxIq0MJuK3TBg3nKEs8W
	 vjwcxjZ3IOIGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8ADECF03938;
	Fri, 13 May 2022 14:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Enable ASoC AC'97 glue
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165245281456.18991.8182809933358967562.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 14:40:14 +0000
References: <20220513120632.168148-1-broonie@kernel.org>
In-Reply-To: <20220513120632.168148-1-broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 13:06:32 +0100 you wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> AC'97 was quite commonly used on at least i.MX designs so enable the
> glue code that allows use of AC'97 with ASoC based designs to improve
> testing coverage.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: configs: Enable ASoC AC'97 glue
    https://git.kernel.org/soc/soc/c/2cc1cd26e913

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



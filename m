Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5378BC7EE32
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3407CC433AA; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E1F7C433D2;
	Thu, 25 May 2023 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029639;
	bh=ugNOtxePSrMJxQVvS+yGaNsZAJtJKBh65/C5FZuBu1c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P2Vb+mtrnPgTm2/28eO0duH8iR9tISztquFDPkqjfht2c2+528YhwYU7yC6q54yJi
	 1mjrLXMO19TZjDPC1GDvJLMY2PaRud4gLOUGn58qZ9xGXlavW7Ro+5ghIMq0D825P5
	 i6ogQqnEna0tEl88kzWJ454MIAvtpBlPZ5kyCyNRHvNdhEZxUxz9UMKogZ6wiqIqIY
	 22SlxAv/4CnkF9pnk7d8dFXuHNbe+cArT1u7TRMF5YxLz6yH7vNuxj5VqdWRBwvbSv
	 Dm1sELo72n+2WGf6s8sdXJbgJ/J/YJVpI0p+0JQHupY+QUo0aYDjb+oEcTjigm9rvZ
	 3jlHATSKleKQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02BE4E4F13B;
	Thu, 25 May 2023 15:47:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168502963900.27102.4910960329853904862.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:47:19 +0000
References: <20230516133625.GI767028@dragon>
In-Reply-To: <20230516133625.GI767028@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 May 2023 21:36:25 +0800 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.4
    https://git.kernel.org/soc/soc/c/66bbb329788c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



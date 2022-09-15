Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B124C32771
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34F8CC43470; Thu, 15 Sep 2022 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 131E3C433D7;
	Thu, 15 Sep 2022 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273217;
	bh=Vesbh465Hzypff2gGXeX89ijQj0TK1nVj266BmfRgTg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KahR+edpJf/314pcIpnh1aO44+blFwmtSBeYbX8jGux05t3rHP19jm/Gwv/7liodz
	 pMoQOTBXEhKG98UWanRrw7AVbAOnma9Yu/h9SjtJRf7I0pPiSMhhdQPhQGc057dN6o
	 J52akp7dWA6ODEWQKNy6rzZVnrcoJAfM1gJ3XL+F6QKFT9oXmQXIAYKRMlCaHWznKo
	 8hR+GPmtVt7jxJ/mzUBFMwrWgPvpMhjqL1XRgW74+SKD1ScjhxnHRVFdnemwYeKoZN
	 S3l8tvHnVxMrcMSAvim0TzhlB5NLv4IYKtZXc3OOzAbEtXFFqzfth0F+z5gKLb6899
	 bJfbS9t/yOi9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1F36C73FE5;
	Thu, 15 Sep 2022 20:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.0, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327321692.27590.15111808584929929780.git-patchwork-notify@kernel.org>
Date: Thu, 15 Sep 2022 20:20:16 +0000
References: <20220913025043.GH1728671@dragon>
In-Reply-To: <20220913025043.GH1728671@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Sep 2022 10:50:43 +0800 you wrote:
> The following changes since commit 8f143b9f3849828870bb2a7f28288095ad9a329d:
> 
>   arm64: dts: freescale: verdin-imx8mp: fix atmel_mxt_ts reset polarity (2022-08-22 10:07:46 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.0-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.0, 2nd round
    https://git.kernel.org/soc/soc/c/7b9a516a9182

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



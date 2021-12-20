Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D302FC433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6703C36AEA; Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CDD5C36AE8;
	Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010610;
	bh=inyKhHXK27vMYrvQUL5MKCsCi2JY2VFI9dw0RoImv5I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CHoBxRygiFqdA/rt1jQJ16Tfn3zy83SdiF98ZSKa9AQItzclWwpv59hFH0YZiHMXK
	 aF/x/ixn+43hfX2O8mAlUW87Zp+HjsutibvfODHueJYMTQzfXqqIPI3uGfH49GepR4
	 1Iwh3rJP2FPoT3G71JtZegJVH0trSUtdiSzn/ilIvx0o19pdGDvl/r+UcrH47Ngtb0
	 AgVQetuUe/LPRpOZU+fUWYGsH4ykJKfuGR50iEMQGP/7Y37PYnYM1FVc5qGqlfmsVi
	 04tv2YAjRf2eAx1kATUJUVMFctHMjaJ/hKSk44ikOvLifWYu3gscuxVhKUCHAcqkfV
	 RhmriesqpdPCg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 78172609B3;
	Mon, 20 Dec 2021 14:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.16, round 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061048.9073.15768251247769548278.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 14:30:10 +0000
References: <20211218052003.GA25102@dragon>
In-Reply-To: <20211218052003.GA25102@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 18 Dec 2021 13:20:04 +0800 you wrote:
> The following changes since commit 4ebd29f91629e69da7d57390cdc953772eee03ab:
> 
>   soc: imx: Register SoC device only on i.MX boards (2021-12-08 20:30:00 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.16, round 3
    https://git.kernel.org/soc/soc/c/7ad8b2fcb850

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FC2C4332F
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 22:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A804C6135F; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 921BF61260;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634682014;
	bh=/x/1indlv1wBjJVaofPd9F9MlCKpAnwsoV2xz7d3bAk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bBWPplhNEayus/758Gnwm1nnCejB3FUIOLJulfHgv6Uq3hbKrus4mF1rS9d66C1n8
	 foGuWuif+kr6UG1NwXrGiSUuQH6eF5IPb6T47v3VmP+59KneVcbQYupIb1822SZmMt
	 rWCLc/5TQGqHYFqSA3tz9WN9y1huXrPwV7ou9YeAf9dlbm/8vGr5Sx8ew/TVbwBH1o
	 BbaYNaWjSoPNzeRbnhsfWeOR40CNtWlrzotAp9HHiq20rPaFQsuWeOZ4YUUwLEKZfr
	 YeDyWQG/z7bmNLye7N6n5Zn+pExRJ472vwjjgKhR5k8T8HNWemrBQ1J9cZR84yASgK
	 fq3m9E43pfgFw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8063460A4D;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS updates for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163468201452.1188.11940342890729772453.git-patchwork-notify@kernel.org>
Date: Tue, 19 Oct 2021 22:20:14 +0000
References: <CACRpkdYf5GwRvG1Gemk4mE+aw6UnAVTY8OudwsVNPQXThHXu6g@mail.gmail.com>
In-Reply-To: <CACRpkdYf5GwRvG1Gemk4mE+aw6UnAVTY8OudwsVNPQXThHXu6g@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Oct 2021 18:43:57 +0200 you wrote:
> Hi SoC maintainers,
> 
> here are some Ux500 DTS updates for the v5.16 merge window.
> 
> Details in the signed tag!
> 
> Please pull it in.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS updates for v5.16
    https://git.kernel.org/soc/soc/c/514d507811b3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



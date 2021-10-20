Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7B9C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B8AED6136F; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A288A6135E;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=uVXU2KyDCEUNApI8OPOsl/7cXT253keKOdmpj5UXjoM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cTesAxXHPuAYDKBYYAcJHYUacdy5CAC9YPzlQ0JBFCZ80uUTuSM8e1g+PuSQ9fO9I
	 2alUqCZuawQ3tALfY3IOgKjfojvvTluAxCyDqyYeBeJOrtQ/qQzh7Uq0cK60KRFyIG
	 1PrHPBQCeVrVbDerjcFYSTF4Gs4b+KBnIsi9UHWeAsbxXdBjhTEym6xGk86FHdw+ar
	 JEmM9rr3RV1gPUbId4UdFW1QTsA3Tj+yhUFvvDMR2UyeDBXMi+ymx8WZXtqdoHFKCn
	 xnlgW+nVsXoZpbrneBojQtLzHqCj0osTnfsB6FSMi5y8vut66j+uIFafR4eUx5wJKK
	 zIlfWiyYq8sVQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 99F4C609D1;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.16 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781362.13902.3402228460180115711.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
References: <3630369.N7QejLDta5@phil>
In-Reply-To: <3630369.N7QejLDta5@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Oct 2021 11:27:22 +0200 you wrote:
> The following changes since commit 3e6f8124a78840d074fab36853ee1f5a2e7cffe5:
> 
>   ARM: dts: rockchip: swap timer clock-names (2021-09-20 15:22:48 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts32-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.16 #2
    https://git.kernel.org/soc/soc/c/fcd9d3469b7f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



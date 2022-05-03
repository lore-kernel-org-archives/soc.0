Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40636C433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14121C385B3; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7524C385A9;
	Tue,  3 May 2022 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=7rUwcMVERKYegB0uOHw7CGM7XchFafVHQ9prX30WbX8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TILrBFMVZ+gw+1l9gNJaqANAwOsEC8hXHCbGXuNUgLvg+dp3gWt6CGknDu8t4X3Xp
	 4OW39WyO2dGfATSABFwhSjHbHDohfwRVV5FX9WXiswP689yfGOXHtX9uyaiLOpBsqh
	 XL0WjmPEMhJ1EyDWGo1tDjwUYl8lUSINX5b0Ecov9ovI331uTnXtjYV03rcz2Qz6le
	 0JcADhOKn72sOZJQY67BajGHDT8hOlcm7nC8dsJUTM48UL8H/mG3gjX9Et+SrmJQ/F
	 nfMd7yhhQafG23y+jsp7TTk9AL5Ki01Y+mkAXnPfEhlchXfLnWy4LYaOvupx3nqaEJ
	 fnaAZiyHL93HA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D222DE7399D;
	Tue,  3 May 2022 14:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Maintainaer updates for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942185.22061.5061851583312510016.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 14:50:21 +0000
References: <pull-1651061256-836848@atomide.com>
In-Reply-To: <pull-1651061256-836848@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Apr 2022 15:08:25 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Maintainaer updates for omaps
    https://git.kernel.org/soc/soc/c/211e1faef5a0
  - [GIT,PULL,2/4] Defconfig changes for omaps
    https://git.kernel.org/soc/soc/c/efad535480c1
  - [GIT,PULL,3/4] SoC clean-up for omaps
    https://git.kernel.org/soc/soc/c/89c839720c9b
  - [GIT,PULL,4/4] Drivers changes for ti-sysc
    https://git.kernel.org/soc/soc/c/4d7b3fd9f38f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



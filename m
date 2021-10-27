Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50141C433F5
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0386B610A5; Wed, 27 Oct 2021 07:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DF23060F9B;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635319807;
	bh=UFeCPz9VIz9BjPb1Cvu2g773rLcSSWF1IvNW7tOrw60=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bsnsUqe8NP4PLgMsvyLBzxKWFUxIffwCpzQgvtqnOWniaIBWeOxBHjXNaHWFz4R3E
	 mcbbHQDBDLRijHk0HNAKRrSQv7HZN/IekwI8ZTTIn6qwUhQPVY+oouGiqnhCkyO3+W
	 ep/TMAwe3Hdci04wHVNcHOKl9ORlgHq7LZeVWJaWevNaFipsym/vJZMaV9RKnHnR+I
	 wP4/D4LVMI/Itt4/9o6c6I3AIk0ZyApLnRQuwQStf2AKW+s+6zoglVimrEmSZ4N8OF
	 Ne/EckzCBnEU5+MdxQF0yL5rm1+YYOE9LhEde/ZGulYpsu1fpmpCaEOIBgw72TpUyR
	 vBq6IEkmd5wqg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC30F60986;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163531980783.3831.13249657408273499234.git-patchwork-notify@kernel.org>
Date: Wed, 27 Oct 2021 07:30:07 +0000
References: <fef30d0a-ad50-ed58-ac20-9e372862b4e4@marcan.st>
In-Reply-To: <fef30d0a-ad50-ed58-ac20-9e372862b4e4@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Oct 2021 11:54:59 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these Apple SoC DT changes for 5.16.
> 
> This includes the pinctrl and PCIe nodes, now that pinctrl is in
> linusw's for-next and the GPIO npins binding issue is settled.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 5.16
    https://git.kernel.org/soc/soc/c/aa1accb76bd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



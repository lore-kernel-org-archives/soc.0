Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D819CC30653
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B17F5C2BBFC; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C31FC4AF09;
	Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499257;
	bh=90KVEiI6+GmcYB7gvWfiXwn/+wigGPyTslJV+eYwBGY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iV0mW/IrvBnK+DmSMJCjWLacaFL1J1PD0atOfvAyN9gEPR9YKxqqsHH7wUB3Sxrjc
	 lwapujzdxKhUiVD57gK6Y/lPZj+Qu+QWvGuyJMtJ8KyI2Rpd+EsC0b72+fNR6zdBQl
	 1qscKuhZi3mwTHHBa9zbrYsrSUmbEkSzwggVcza/8aIG2IlOstYPEov8cH19P+MaDi
	 +9y7BNqk5SAMhA+7Lspq4KHLMcIfDmHRLNds+Gwd38TfoUmsBvQzxXYHTCiKwjmjMY
	 k04NG7DPmKP5g/4rrXUKd+1Eppm36f9O2cZTYjx6pwWVEYs8Hj39lTujNsq9kSPeCN
	 bQi8HGfcZcdAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 838F5C433A2;
	Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171949925753.15510.18374091442135884220.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 14:40:57 +0000
References: <20240626163443.61384-1-p.zabel@pengutronix.de>
In-Reply-To: <20240626163443.61384-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Jun 2024 18:34:43 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.10
    https://git.kernel.org/soc/soc/c/94811b400a5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



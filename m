Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13025C001DF
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06B29C433BA; Wed, 21 Jun 2023 20:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1665C433BB;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=869Eusi+YArNXKwU4JJb3t4XslzoTb4LKvgHIAHOwkg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bdbKwD+MXlAK9dmX07y91Y1fG5sFTkoueNnx4mW6oioAM2zVDdvWXhLkparUm0Ppe
	 dCrcESoJts0bQ3wUd2cjncCKZYxAu3nl4xigc2xFf63WGH24tBDKnQc7ShvUqvPBk0
	 TLvM1GwYpIwajmetCrptEMwgzrSBpx2GOsII9dh/v4/O1fshvT1zKlF5mZ0kZnXpzv
	 Zsj3K9TBBmSlyfiKYy/nIWdsqolgYc3yuBufgjb0hKOS45H1Ntif7mNjppBvlgT4CQ
	 tN9XFJcy2oA68XlYdP2UKpi+sjOkUmauX52Z8MIkNehKny8GnYgTunhalvW26Eoz2U
	 M1VmoKi0suvEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8C67E4F14A;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX dt-bindings for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943681.9834.2847807014262898968.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230610072530.418847-1-shawnguo@kernel.org>
In-Reply-To: <20230610072530.418847-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Jun 2023 15:25:27 +0800 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX dt-bindings for 6.5
    (no matching commit)
  - [GIT,PULL,2/4] i.MX ARM device tree for 6.5
    (no matching commit)
  - [GIT,PULL,3/4] i.MX arm64 device tree for 6.5
    (no matching commit)
  - [GIT,PULL,4/4] i.MX defconfig changes for 6.5
    https://git.kernel.org/soc/soc/c/6d34aab3b59b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



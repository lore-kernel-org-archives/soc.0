Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C245EC433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6668C615E1; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C0F561244;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=YJxt6WTJ/vb81AXAubZMYSd92xfM6J2w5j4L+yt2sVE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HoRjo2RTUircA4dEKKw0mLVFJgYkhtQk4hR7lVIqTUr0QaRpaUPHlD/eoT7o239L7
	 bCN656qQUxxweD1zWL5S1uCb2MYfRt4riUJhoSJrVdqt8IF3nWhwr3zsIwV5zVYJB9
	 sHzQfQsYNXXroazC/TcRNvgOU1rsbs2C2mrfITbvW+FzaCfLl5iUt5jBBPeioLhl4t
	 6GRvdCT3u9S/ypBOofl5Q5m4+CgRBPGgxO5wuGlbXY0+uSlByTQjcyLTzCAw8YGu27
	 55e0dze6GDhczb2FPKXuxpBn4IKcIU4zl53K7lp4u3u9nMMjGhF/YCtb5w1BlfRUV+
	 NuUrVMg5RCuLQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4375960A0E;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180927.2242.12794929070432569283.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210923063356.GK13480@dragon>
In-Reply-To: <20210923063356.GK13480@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 23 Sep 2021 14:34:00 +0800 you wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.15
    https://git.kernel.org/soc/soc/c/efa767b37229

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



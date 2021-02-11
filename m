Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B2FC433E6
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5E0A364F4D; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4633464F0C;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056808;
	bh=+yrFvNa+NLzdjbDAuiiVNzDWERQ1RaJro6aF+rkmxGY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FlHgMTksiVLPAvYRDdOOjZfI767gvsOkhRXQWSKXQPH0oIiPB/Bmvn1hU3JJ/fFhk
	 /oq0WVG/bNJDpZ7JzmO+pAFresgQLdgIh1ZqyKpEPg43jxYSIKh497wegX5/6XroKV
	 1rXVmzW6jKqBkVmfN2m7jGcLGHUcAKIJrQv91o1vDRcLAWawMjz2cJPusvDVjxVGad
	 4zskxpkNxb4zY/IpYyCPUI33vzBsABluni1xH/koM0QfnzCLq9jXNLFOosyC714lDB
	 z/vvjmyithgWN1sOeX1JfTGEaeKlkF3UqiMn4iRoY0pTRhSCyPjedsZXDrwatUWBMv
	 SPaTwN37zcTLg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C08760A26;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161305680823.9082.3279651368679435212.git-patchwork-notify@kernel.org>
Date: Thu, 11 Feb 2021 15:20:08 +0000
References: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
In-Reply-To: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 10 Feb 2021 12:30:27 +0000 you wrote:
> Hello Soc maintainers,
> 
> A small pull request for the aspeed platform this time around.
> 
> The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:
> 
>   soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: soc changes for 5.12
    https://git.kernel.org/soc/soc/c/4f79a8b06fcc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



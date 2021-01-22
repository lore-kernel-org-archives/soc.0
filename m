Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D02C4332D
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2E6D923B23; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 16C6A23ACA;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=UnDTJZAkU7vAf6koXp2uQifwzVbLgRuyjVOFEmKTDY0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u7xhH7rWnEVk5774KkJnW1V8D+aZ0vuYEmmcts2883YJL8ECvgjZo6LFFmpdJKUMW
	 V5gd8SF9QhHA1L0+HbaJaktFz/087nrkMTA4dzRsCCJhn0XJibyN+UkZlMbvT+L7te
	 gWvVUymjsFXC4n1bFS9x6fW0JAJe4/jejZr+ZuH7t2C+SERbQhN4v9QNCFns/WkFNE
	 ub6hs3+5V7k2qg87cRZwa3L/P2DYDcTfIKfxn9ztgi/w7UtmNvcBBMuNk8kFDkewya
	 KsmQAw4o3FaZFqsoKBmtbOY2WArwazxSWXPY2+yane5GcX9Cp5xKNEx8VNRr9J5gNs
	 PPG6u5wV9KXEA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0F221652DA;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.11, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641305.29035.1337787696924649345.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20210119091949.GD4356@dragon>
In-Reply-To: <20210119091949.GD4356@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 19 Jan 2021 17:19:49 +0800 you wrote:
> The following changes since commit 5a22747b76ca2384057d8e783265404439d31d7f:
> 
>   ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.11, round 2
    https://git.kernel.org/soc/soc/c/e49c24c8cd00

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



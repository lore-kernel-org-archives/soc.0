Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242B0C3DA41
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE514C43391; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF12AC433CA;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276625;
	bh=74dvuaY/qJXVFRMM4+manILr8YOMIR1GcpU6Goo2PN8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WonbjoAIK5/5DYqBXUZnTFTLsUtoleQhKA3yEIiOmzBFVktzNWt2E+l5AxzN39UcT
	 ltL14H5+cmhHuSs3xwvE6sxD8RdOvYruSHxGTv1AVAql82YvzyITdrawukc7IGpVpZ
	 RLEVxdDCXcaRgV9WFewMLXV4yGhwsYF04MRgVdV4akJ8FBFxDpKPYKokFB7AxzcYt8
	 e45BdhC1hOD1ySQmYAmREyGUzSUQV5/zhZS+6P8JbxC7L/ySxnNeEF2ERueGGdCqPY
	 gNttavym/ZujY0HH1N40GgQZORjgzzjLx+VdYRzJpD9lgIxRq/+0c2RahdSR7AfOq8
	 PnIn1JRMXIYlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7104E26D3A;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662574.28155.25468105898866894.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 12:50:25 +0000
References: <pull-1692158536-457318@atomide.com>
In-Reply-To: <pull-1692158536-457318@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Aug 2023 07:02:41 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/17fd01a243b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



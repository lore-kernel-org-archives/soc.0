Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D0C46467
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89769C433D2; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 735C2C433F0;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390529;
	bh=ALj312XS4oucBw6jEYyr89g5cVLwdgu233MhEiMO/U4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PjrigzVPtGEROKJiVwdLOwGBxDlCVviVPf1x8Q/WHx/gm3t04yXG6j99yV6PBOMDt
	 mwz+hCD0mdx2oHaiqNNlOSsp6bnW1oYkwlkBO/201S1KNWGnahgm6H9As2qQ5nlUzn
	 /bJuaInoQ94/wlMuWotwb7gJEfyFZkMqygcdYfd/HBHMLIpJeR3j1KYMfJib5/vzoa
	 yxbSezWbSANLyjV46PvxnqUzm1d9oGTpVGG59ozkxey4i4YccL6MUfmg3pjFsWwe5c
	 +1irKjFzvE/u2J1nRoDFTR2tQR2vk/NYZtrY71TkDqcrWfypso02yx/yWoqv52ZMYC
	 6tLtifLFudq5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CFEDE21EE9;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339052937.5083.12191863992771349224.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 22:42:09 +0000
References: <20230110213946.2183982-1-andersson@kernel.org>
In-Reply-To: <20230110213946.2183982-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Jan 2023 15:39:46 -0600 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-driver-fixes-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.2
    https://git.kernel.org/soc/soc/c/42c18d13623d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



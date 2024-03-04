Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B23C54E61
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 324FBC41679; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16F22C43141;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=HZkxalO3HBVAsFv9ywsT5aqTFOiMefJ7A1BQNLH5nX0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h7FT0u8eHZflw/8whq784Uw3bUwkFIoyLRG+n9m98heekwXUXf+0dIZ2L5WQ0YRyE
	 ZEvS3gHDPRdYexnmrukWzDPWIj/iq0LVMh7/cM5taLuojqC5a7FbdWRmO/umqXocdD
	 x5TCb1YAJtT6jjzGrymaKwiG/otARgE97i0/9LLvleqcio6T3DCU7QxnS+74P6+bzD
	 Sr2IZ9s0opcYgW3peEFqrvwMLJ5XQJs4qam9KmgW/CJpOg2iOZXm8KrVq7F3Lz/nhj
	 iyJaheg87HpuL478COlB7zwKVCJdhDs3DZ/Nqi998LM1+Q+yydX11e9C1odUrXohdc
	 35nAvvs6rhsYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE495D88F8B;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas DT binding updates for v6.9 (take three)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927490.27833.6975605459005633345.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
References: <cover.1709307006.git.geert+renesas@glider.be>
In-Reply-To: <cover.1709307006.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Mar 2024 16:32:23 +0100 you wrote:
> Hi SoC folks,
> 
> This is my third pull request for the inclusion of Renesas SoC updates
> for v6.9.
> 
> The following changes since commit 3a9856e830500e20e61b92f5ea6b8cc505e085be:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas DT binding updates for v6.9 (take three)
    https://git.kernel.org/soc/soc/c/ba5b25bbac93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



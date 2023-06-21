Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1B7EB64DD
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8349C43395; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E1E8C433D9;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=v2UhsVoQlg+iB+hfb+luzwS3xUAEtdVQ+Nc8Vc2htWo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iGwK3l7/Gj7zlTOXtg7pnrNwpJdxApNvH+naTGO4+aNFGvE60PX/epeVCtGO+GVRX
	 NsDhq8K/ipwRLsZM3BHtTSBTVUOtQRIA2zKpXJqIS8NPP6dPq4JAsFZqU4Op5du21+
	 jLGtFWAlTgwOs5OZSh95UoSu/XcYzSjx8BeHWKd486XL+duREEgyNIeEzWPKu+Kqdk
	 JD/bXR4ASY84Zgl4OvlGXkUlztxNY/hoLhmnxNiMiAolBmlzzwBoS3WJa8dgg5z0xa
	 6yOxqr/HJtEGU96tuFxfiqe+H37QUCwPXW6pxBCITVTGR/2eAAFVdswN3smAiEjUN1
	 mwyBCULQbkTlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E296E4F14B;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 2/2] arm: dts: Keystone2 updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943651.9834.10802332420826636998.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230615164127.qcgwrbwpmclx5wlm@landscape>
In-Reply-To: <20230615164127.qcgwrbwpmclx5wlm@landscape>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 11:41:27 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,2/2] arm: dts: Keystone2 updates for v6.5
    (no matching commit)
  - [GIT,PULL,1/2] soc: ti: Updates for v6.5
    https://git.kernel.org/soc/soc/c/0feedcaa0a27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



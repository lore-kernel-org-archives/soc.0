Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3A8C3DA49
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84D17C4AF17; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F7DFC4AF0D;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533033;
	bh=V8lOuyHcVtRGOP2pPj2vbVFJKj3K+OxaLNa49cm580E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EmGwcoA6l9txl8rfDiIBjM5ExdTEMkQvGIvs6wk45w+bmKgg0YUJr2ydTizMdy09P
	 53RMbVpVScihhtTZWw5S7w7Y2+DsINnPkC/XV4Yez7s4at3Xhd5g3RT2pg6VV8LNdy
	 zFpYQce4lKu7Xu1Z3T9BWup9Wp0uNfwuxVHccAAm6YEWMIf1/MD1qinrvLCUcr7IMi
	 K9GSvrSVRUOvalqjWZHDx3l0YeKUSHON0AMd+VzERtxK8EnYlzrPUMdyIdN8L+LPYl
	 a9vMMNA+MasVxcQAsVmVKPlPTnFifZtwEbVX4ABSS1YfEdp6pZRn1WYlCTwLESKFGe
	 54ywRacbBvIjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CD3AC4332C;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP SOC changes for 6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172053303337.5265.6141259525715804065.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 13:50:33 +0000
References: <CAHTX3dKMtqgNpkEvrw0p2w+SPN83Ai1_kzhefUGOO5rMkPaH_w@mail.gmail.com>
In-Reply-To: <CAHTX3dKMtqgNpkEvrw0p2w+SPN83Ai1_kzhefUGOO5rMkPaH_w@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Jun 2024 15:33:41 +0200 you wrote:
> Hi,
> 
> please pull the following patches to your tree. Nothing significant
> there just small alignments.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP SOC changes for 6.11
    https://git.kernel.org/soc/soc/c/782b72620147

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



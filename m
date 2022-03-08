Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48155C4321E
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1FB5C340FA; Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6A74C340F6;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757014;
	bh=JpZwUH/++9qjaQrnJ67igh3pZAhFAAKasjUh1c3Ixkw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ALz0mNf3dZ+6+olg2NGgYqr1o/YeIlvQ34BCvkBsG1/LkGaOVdCORG8FYj8N9KNbO
	 i6VMbDhtCq4vPzY9K/jSION8YQUy5db2NsB8e0csAMa0DfaxEOe21yONLvxFAOv6Gp
	 3nQeH23f3yW54aR7EedGkeX2sRDZWjDiWSNTGr+VJsTkFDfOpXL9++yyrPEm3xX/Z6
	 ZKbAI1SXi0jU1LN1AJWx/Lk2WssLGn/IRluh0bp9GCaTmS5ijGnTqT5FjhnNrRbk4b
	 de47VU2hBLzq4fIo0p8/qjPtyK8hog518VmlYmVwaLmyhggtBRMV3pmLqbDilU+koo
	 kP4aPNwmy+Zzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA3B5E7BB08;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701475.9628.12784745097303951085.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <20220307194817.3754107-1-f.fainelli@gmail.com>
In-Reply-To: <20220307194817.3754107-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Mar 2022 11:48:14 -0800 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 5.18
    https://git.kernel.org/soc/soc/c/fd2307ee94c3
  - [GIT,PULL,2/4] Broadcom devicetree changes for 5.18
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 5.18
    https://git.kernel.org/soc/soc/c/7b4fc7c6f9a3
  - [GIT,PULL,4/4] Broadcom maintainers changes for 5.18
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



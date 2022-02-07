Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA03C433F5
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A570AC340EF; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F4D1C340F1;
	Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644244357;
	bh=SiQvi+ZGBnlxE83EoiZLaMK0K5ThD7b82GR94SZCBgI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JhYnkEKUWibYtbgZ07PZ1ZgRKMWskWQws2hXI8LUjeO0t5gnvbJJbzsJgHT56zAaK
	 VGiRyPG72a5+dP5YLQMAph6i0NkErqoG8z6ox4yhVn7rPagImnczvOjnuFvSLr7B2J
	 m3ShqM/jz+6+N9bBjmNrzwPr58sJ1JbTVHBkrqY5LNOt6IqkEVEQpUE6cl3KQT9yPc
	 Fkz7wqMnkCdZAD3mmGdvxDeuKpaC2Y5uJ7u+pNZ0PhZi9+Sf4v+eVH4l/951TtE6Zo
	 u4Ri9Xv51nCGXBj2yBC2Gmo4EQIykXw50nvT3lDoEtejjsxMZ+SV3BDmC0EZF3u966
	 dDFA6UJnVYYZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78453E6BBD2;
	Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SoC: Fixes for 5.16, part 4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164424435748.21264.16793069460043718771.git-patchwork-notify@kernel.org>
Date: Mon, 07 Feb 2022 14:32:37 +0000
References: <20220108202011.GA1760@lx2k>
In-Reply-To: <20220108202011.GA1760@lx2k>
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 8 Jan 2022 12:20:11 -0800 you wrote:
> Hi Linus,
> 
> The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:
> 
>   Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SoC: Fixes for 5.16, part 4
    https://git.kernel.org/soc/soc/c/4634129ad9fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



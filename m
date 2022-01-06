Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07AFC433F5
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7504DC36AF5; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E7A4C36AE3;
	Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641498029;
	bh=C+veuwlEsDaYmHsaT3BW3OfvALaJ938r34zHqDXrd0k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=X1rhAI+lm01Zf/4zjJ8JTSiuHRMzor0P9ZnKcr/uaCVKYSXtnmqkt7El/qJoCr3RH
	 BG10LJ7mRWYSUd/WsRyLUHEvGcWMa2d0+fRT7mvaQhe39R7z4aloxYgLJ8doaOyk8I
	 SAQjEr+VPHoMTV2aHJPUNuwu5g8Ho7fP5iloALzDPH/zraXF2SKcpEPYrAxwsqrKJc
	 s7C+ZkCfyZowY2Vc8h6pT4N/EbDPm9MlQYn97TVl1c6IewSKWLeH6EzNC5B2oyYNU0
	 /KM9PCFRF5sHByXhd67NUw6o0RjEkTVh7VsKMBT+1j86YCtTD4IXEk/1SC52MuBMhC
	 gxMduMRPyS2xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3C690F79409;
	Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.16, part 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164149802924.26637.15970099060846325418.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jan 2022 19:40:29 +0000
References: <20211227103644.566694-1-dinguyen@kernel.org>
In-Reply-To: <20211227103644.566694-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Olof Johansson <olof@lixom.net>:

On Mon, 27 Dec 2021 04:36:44 -0600 you wrote:
> Hi Arnd/Olof,
> 
> Please pull in these 2 patches for v5.16. The reason for this dts compatible
> change is that the commit 98d948eb833 ("spi: cadence-quadspi: fix write
> completion support") is already part of v5.16, thus we need these 2 patches to
> be in v5.16.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: fix for v5.16, part 3
    https://git.kernel.org/soc/soc/c/8922bb6526ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



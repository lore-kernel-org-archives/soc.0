Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70875C6FA90
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54328C433D7; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D6CAC433D6;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273220;
	bh=iVwGv10FOCwVn6s0j+RCkl9bTjMFshdhLhvIC8gH+M4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dVs65X5YIB2p0StpkTlfjzH+2A8MFYG6nwggyJDWaZbXHtgnPkEnCVCeFWFtZZo/w
	 GytOoglXeZHE5EJWiGS5T4folUnqD9/UgfzNvQW9K6FDAI0XdxWhwXRwRen+abtlb/
	 ZfhWJ0WtMYbf3u/DRoBpBtBpWYIdnFt2uDYZ3m4Fknf3Hb6qONga4jouvR7FYNeujf
	 Fe0qqj32gSbt5NUHmY3gLyqFHqlp6sK7tlKy4Qls5m5rRbpzB8X++GUsja7bY/9M4C
	 1b46BTU/hRXu3F6fBoXJc5mdwir509OtGRvRAG7zj5cbkpy54NI/Igs8r5oPUFOgxr
	 fOnFfTzM7+F/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D2A3C73FEF;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.0, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327322018.27590.4726542631401894359.git-patchwork-notify@kernel.org>
Date: Thu, 15 Sep 2022 20:20:20 +0000
References: <20220913025043.GH1728671@dragon>
In-Reply-To: <20220913025043.GH1728671@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Sep 2022 10:50:43 +0800 you wrote:
> The following changes since commit 8f143b9f3849828870bb2a7f28288095ad9a329d:
> 
>   arm64: dts: freescale: verdin-imx8mp: fix atmel_mxt_ts reset polarity (2022-08-22 10:07:46 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.0-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.0, 2nd round
    https://git.kernel.org/soc/soc/c/7b9a516a9182

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



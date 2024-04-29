Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39999C3DA40
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1206BC4AF4D; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE349C4AF19;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=EoIKQJK2qv7yhCs7Gco2xwVmM75iU0s71oJRiytvrTU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sqN+qtYUIpmaT0XWLTGTuEjrzxDcSOtmrtX/3LSLGUxU8zwhjNIhulxCOeKLFDYwF
	 acmj2RkEjTOeGKhNNXWD4R+DkOkikqS8AH+aoTFaxU7JQDzqXwvAaoOtz2S7KnJRH/
	 3lGS9DZSAvhL+CNFOWFi5FKEBaDGCfr+JEUmFYbGf4RbaW0FVPuzI+YCGIXQa2qN31
	 grOolHXHihxVaD4deBpZOkW7S/AzcuW35+Lv7FNH5r/PtSzHAVFt8DCi63mZR57Eca
	 euZbvzyXlZXwM76Xp4f8jeMVWbiiLqRTwcInzsAuNlHR+z7ItG1yOKwKZWvInpkbjO
	 NI8CbicgAyPiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8BE4C54BA4;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanup and fixes for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888788.20509.539367485020250601.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
References: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 28 Apr 2024 18:33:13 +0200 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: cleanup and fixes for v6.10
    https://git.kernel.org/soc/soc/c/631ec3748398
  - [GIT,PULL,2/2] ARM: dts: cleanup for v6.10
    https://git.kernel.org/soc/soc/c/e8325e339646

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



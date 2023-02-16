Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF98FC636D7
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95535C433A0; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0B5C4339C;
	Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676586648;
	bh=3Tq0dopaxv23cX3beuhVbZuKl8sDlOuKq/zWlOBrluE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Z49RgY6VL0xSsaaATgtEcNEeZH1hyIsULIJNMFLyTXa0SOS069Bcwy3rNGWWIDXBD
	 CcNX6GBuro3T3k/IOnv+bChBOaKu2q5lYYQj/ZuKSVTrr7PugNJ4mR/ylwKjwM4DjT
	 B+9uZ/50t7Lck+2E2/ayEDWnQnEL1Vp9AWAuwbz7yfq5RVzloOGqzidzs4oUjLNgA8
	 CgaOrDPIeMtWWW8R8+R2z6FkJKuhkQDUAaGgnpIiXdvqZZe5h0CXb7MSm8G8BmGXJo
	 BUsFMQLGk1B/g8g8nxOUZiuu7tjgbb7s5SviEaYTXhUis8gDBM1L5Lsk+uHFYTdpVD
	 /b68HO51gi0YQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F5DAE21ED0;
	Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: dts updates for v6.3, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167658664831.10028.17703946367093835355.git-patchwork-notify@kernel.org>
Date: Thu, 16 Feb 2023 22:30:48 +0000
References: <20230216160910.509065-1-dinguyen@kernel.org>
In-Reply-To: <20230216160910.509065-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Feb 2023 10:09:10 -0600 you wrote:
> The following changes since commit 2f8ba037c45925b372194df4bc27fca85fbeeffb:
> 
>   arm64: dts: socfpga: change address-cells to support 64-bit addressing (2023-01-26 08:27:10 -0600)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.3_part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: dts updates for v6.3, part 2
    https://git.kernel.org/soc/soc/c/5be374d0d1c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



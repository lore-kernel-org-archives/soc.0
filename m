Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9385C433F5
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A34ECC36AF3; Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D535C36AEB;
	Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641498038;
	bh=TVqV6ND9tHNeeIms2fJS0h0dfo7AX0bb67GI46dPeCs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TN9vbqHg/449n0WSzKGMU+JDQG00dGou6aIcwmzrKIboOYOBATmHSrlyd4fzp1cbf
	 5TWRB6dwJHaPDBD6fkYCymPwtqjptFqYKbOTN3ZJTDB97K5VqcSdE9UvjE0hWB4sKG
	 aQovt7XkAlPNA0w52sHrGxsXPHGT12gQ/gLn85tdMmmguTzsswpHTkYo+GdT++WSFg
	 XYF4AjptP25qvTQRlwPP/EOMmE4/aAVkpjyF9sW9iV0D4KLRA5P4pkkRY4eJ2HjJ6t
	 rxM1gl2mRY1OXCtX8MtFXuSm5iu0/GJgu+HgOAraS2EAMjGXfWczp60u+iTpxlyRpC
	 M6VzI/y7OMA1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7BD93F7940A;
	Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v5.16, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164149803850.26637.13360168310192332778.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jan 2022 19:40:38 +0000
References: <20220105172515.273947-1-p.zabel@pengutronix.de>
In-Reply-To: <20220105172515.273947-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Wed,  5 Jan 2022 18:25:15 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 69125b4b9440be015783312e1b8753ec96febde0:
> 
>   reset: tegra-bpmp: Revert Handle errors in BPMP response (2021-11-17 17:22:27 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v5.16, part 2
    https://git.kernel.org/soc/soc/c/fde9ec3c1b3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



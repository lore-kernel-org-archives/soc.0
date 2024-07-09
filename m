Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5455C2BD09
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A31F6C4AF0F; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D700C4AF0B;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720560633;
	bh=NqwUpP7LxLYJ/4AzO5nt0fgDugMZAEUCGj3iUCFuuFQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cl4OHQ3v4vsx4GPzBZgRh+s4yWYeybFy/MPa0/Ob+KCR8zDIPx/lyhhdiYVVwjSCm
	 1bD8zBQNOckNOJXFLpXgGJIAjX4EumHINdAtSr01mO/vY8gMMnckNgbo6R+QVoptCu
	 VGLJw7T3y5ZJTlWQd+y/y+EVXc0tQBMsv+pvgcpaYGoTynHghEp4WdgHHI16JXFp+q
	 fgvtdUH+ptk1NCY7MgpMckS7r3o18RxiY++GSqXQHX+JxKP1SKwvjyAr/PaHlvWvse
	 GpcMxFP5Y2b3gPNe3wnPfpoVncIaPOb+Ku5KQH/v99VnAU5qnnKOOH9i4Hj7nNu+mg
	 L3wB3hLqhuHPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73613C4332C;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm driver updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172056063346.16885.10272945129289877908.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 21:30:33 +0000
References: <20240709191246.3053-1-andersson@kernel.org>
In-Reply-To: <20240709191246.3053-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jul 2024 14:12:45 -0500 you wrote:
> The following changes since commit e49380c155940cb47e291a4b3fcb7fdffee6aa4d:
> 
>   soc: qcom: smp2p: Use devname for interrupt descriptions (2024-07-01 22:31:14 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.11-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm driver updates for v6.11
    https://git.kernel.org/soc/soc/c/8cfda4059fe1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBA3C433FE
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35DFAC340F6; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A51EC340F3;
	Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646138439;
	bh=yy7NSD55e/s53nwbxtBIq5kmXiWUeBkW0JhYsi/3FK8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dnXsJaOlbqWth+b29nwwcKYROBv1pEJkzl+opxqlH03ivaNCCa8kidXuAfRPeuI+J
	 znf1yXxMSmfyUbwuk8jexez71r7jGot3gdGSQEIhHUX+hk4N/BHFIPo9k/iXEQV62H
	 I3LSkLe/8JFovExUI+fvBsV1CtE/EbnaJEnwpKlLOBX8hONzxLKy9Z6gMtkqBEqls7
	 cfs+tges7J8IaGpgBDitq27itCAr26C++S6kEKZEr1L6KyVjgmt+249YHo3V0D5Os0
	 EveYjZVGMFqMci6+aeerYG1uk5i0ZNjfFwWq49nNkjblnA1vEPO5k+e6bQpxbvuCl8
	 INLW6jrbW8ZYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDD94EAC095;
	Tue,  1 Mar 2022 12:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1 RESEND] Broadcom devicetree fixes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164613843897.23712.10570972587052795247.git-patchwork-notify@kernel.org>
Date: Tue, 01 Mar 2022 12:40:38 +0000
References: <20220228165537.1950863-1-f.fainelli@gmail.com>
In-Reply-To: <20220228165537.1950863-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Feb 2022 08:55:37 -0800 you wrote:
> The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507:
> 
>   Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1,RESEND] Broadcom devicetree fixes for 5.17
    https://git.kernel.org/soc/soc/c/9411ac255e53

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



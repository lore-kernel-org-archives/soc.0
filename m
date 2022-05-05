Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F6C43219
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 061D1C385A8; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDC9BC385A4;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779107;
	bh=u454MSdpmqPUQcRpfA5pK4iuqs4tIQzUsnUL0CcYeHc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=etIBvZN8fl04EaoxoCDHn5Z0n6q3mPTwRYmh/n2hQKgBemXezcJYxn8ol6Rbzju0D
	 iZyoIvMzYZ7xQGjz+s6T6buVl5pcRXoeiKJ5dKan5nQ2RSreptkLhGAQUYEfg01BD1
	 Pxw5JNldyd6sxM+oJYPzmAdcDl7iEjp5CV41876YQfpgpRsXa3FTFCUAZX87gHUKFn
	 aMLzhjtpHXe+rhPcVjIaRjvWS4SEtk/gbPhamd1Uncn5Kjl5smyJRkSy9q412CMvke
	 UKQkZO3nON1ravjV47tGxigH2GOXZCKC4k2ZM3bOIWiT/dXQinmTERiES/i6odb8my
	 vTLQX5UjBzocQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0349F03848;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] Broadcom defconfig changes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910778.9627.4968957698246668858.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 May 2022 14:09:37 -0700 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/defconfig
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] Broadcom defconfig changes for 5.19
    https://git.kernel.org/soc/soc/c/f68ec5142322
  - [GIT,PULL,2/6] Broadcom devicetree changes for 5.19
    https://git.kernel.org/soc/soc/c/814cc4fce8b4
  - [GIT,PULL,3/6] Broadcom devicetree-arm64 changes for 5.19
    https://git.kernel.org/soc/soc/c/1b8e9677bc48
  - [GIT,PULL,4/6] Broadcom drivers changes for 5.19
    https://git.kernel.org/soc/soc/c/dbdaca130007
  - [GIT,PULL,5/6] Broadcom maintainers changes for 5.19
    (no matching commit)
  - [GIT,PULL,6/6] Broadcom soc changes for 5.19
    https://git.kernel.org/soc/soc/c/caf10a34aa72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



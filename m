Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D5C3DA6B
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8643AC433D6; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CE45C433B5;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766603;
	bh=9M85bz2+KCi4juAz1VWWkGArnckUoTFQzVintwdjIsk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=em3CaMrrv0ymDQHAofyCTWwRUCArrcafSgeG0iFMdgO6pAgL/aEXc2ZMPNG8iI9l1
	 DgPUjz+8U+2iFXKCUVIlWDmbnrMuilConC+ZhA22Y0qNO+RnhIa2IZ7jMVCnarTZrS
	 0OBrgEPdHDUGeUONkDSs4G0Y4/+CzvhwQ7j01iDkMaLviOF67o6Vi6nWK7+CAVtiab
	 gs9Z7fE+j0rkW9a9QN/GXvq8lSJ0lDJ7DW80eFBcrXR4fZd4OTKhBHYc0HvL81+hoT
	 NtJCNeRttkaEzvwqY/qgUWOSNEgpTsD60Y3LGp9nhJNMfsPdI9iU7GAhW7pL7FYJAa
	 8d2tF55wWlQQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50C2AE924DB;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix TEE system compiler warning fo4r v6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176660332.19402.475015082517621119.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:50:03 +0000
References: <YwdHcdEUib7obbbW@jade>
In-Reply-To: <YwdHcdEUib7obbbW@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Aug 2022 11:57:05 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which fixes a recently introduced compiler
> warning the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix TEE system compiler warning fo4r v6.0
    https://git.kernel.org/soc/soc/c/a5b06d9f2a46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



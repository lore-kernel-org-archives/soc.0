Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BB6EE49AA
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E087C43395; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01373C433C7;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=sXGlnPvtKnThwSJfGdY7vvX3rW6Y7DclohmteNmEshQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=swd64EKfInK2HHBUJFS1/YP/xeez/bMp4BNidZDQKZF0LYgFvPCC8HVTfPKutmZBD
	 WihHGxJcVTwHmmK69cv4qy/F+Q+zxLesrpwF6HX7nG1WA2ZWzBbwizY+BRhETDVhNN
	 U1mMKmDzG4fXEP1oG8qrF1RSEStaJNXi9UZok+BV/V7wYr5iWgLbF1Df7G8rTb6wwu
	 Z7niRrQMO9/D0sKRmy//yl3pFXUAu8xTvw6imddsBe6zGDo7i1iNPHL6U0mUO6AUpN
	 hsUscVNcyEQiBt9Dw5Xz7Ac82PWEi+9qhfpiauIULeSek+7lQ8VgbhzA495KOfT3aY
	 uQqobDBl8MZRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBDFEE21EE5;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom devicetree changes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147589.32531.7330136240636730554.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:15 +0000
References: <20230818164539.2871539-1-florian.fainelli@broadcom.com>
In-Reply-To: <20230818164539.2871539-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Aug 2023 09:45:36 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.6/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom devicetree changes for 6.6
    (no matching commit)
  - [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.6
    https://git.kernel.org/soc/soc/c/924832b8677f
  - [GIT,PULL,3/4] Broadcom drivers changes for 6.6
    https://git.kernel.org/soc/soc/c/a9d3965f76e3
  - [GIT,PULL,4/4] Broadcom soc changes for 6.6
    https://git.kernel.org/soc/soc/c/56fdaf48e78b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



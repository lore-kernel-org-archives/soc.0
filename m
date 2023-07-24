Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0D5C3DA40
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F388C43397; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62207C433C9;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207549;
	bh=Tjg8AuSwD8vLKjcuwdDIqY+jtwLXVwLUgZ6XuWKXlkA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tiQYBMSmnAWs3y7PJ6amYvqAM70Vgo29Wa+wQm7v+CXGQ9B2jr+fKPs1EiJIVrPRI
	 KAhEGZfABcsurMIFfKeEytITEhlaI2HU10M8iHlHJ3XvbBOQF9hFAPuRtwzNC5LyHh
	 eHzT+YBY8byF8ID+LPZxkyLtWN1juOMGEpmdgOgKnyPYjl+ZFdVVwTNtru9Ej1sAzp
	 6Fy53Lc5R4CKhSiJLMwBZ1xV2Ky9/z0dT+vCv2n7KyUC/vURAX/VZVfZ5D1mVKoOmq
	 Nm/L69b2Spvyd4sh9XA6P77VSGtiNcbJN+ynZwcYkxdYsYZkZgZMd0ZvDyeNbEy5ex
	 NinzPi1MRj7uQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D62AE21EE0;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno/vexpress: Fix for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020754924.21041.5133327493643453540.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:05:49 +0000
References: <20230721112359.3369716-1-sudeep.holla@arm.com>
In-Reply-To: <20230721112359.3369716-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Jul 2023 12:23:59 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno/vexpress: Fix for v6.5
    https://git.kernel.org/soc/soc/c/74d964097fb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



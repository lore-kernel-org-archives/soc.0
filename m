Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E05C00140
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4D4AC433D6; Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEC23C433D7;
	Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448829;
	bh=STe1VTh5CnLhkzer5rcMCQf3cTNPOYS9geu+p3V9E14=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gvM+dj6CfSGWGJZ+djkYSpzwoWWGfA0akEg/syDZ0Z27zsml7thb3YhklbD1PfY1H
	 Ll7ER9WbHzMKpvO9o4OWtVFL7ROu2aoK3fXpBEu8Sa9cB6B99RAal0m6aHotKQDR8g
	 qHzm3WnFsXv/JCdTdu/FQiHZeb8/3CAz3ae0JCQZOOpHphGvWx5DYINSFi8DOf/pXi
	 Tw9UO5ogSy2Xr+JUOCJHxJiYqzY2IpdMENwLRMrnt+XBk4dHRz1+05zkWx8MVvGon1
	 IGwfktQQNlXu0ReRyNNIFB4OEs0+lf/KvMd7kmjUhHzow08hTETFc3jqcDqVv6zy4n
	 fHKDPj7NH/+Sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97CABC43143;
	Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19, part 4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165944882961.23404.7605191415317485092.git-patchwork-notify@kernel.org>
Date: Tue, 02 Aug 2022 14:00:29 +0000
References: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
In-Reply-To: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 27 Jul 2022 17:21:00 +0200 you wrote:
> The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d28:
> 
>   Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/soc-fixes-5.19-4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.19, part 4
    https://git.kernel.org/soc/soc/c/9d8a8616ee47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



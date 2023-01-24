Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED5DC61DB3
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E318C43443; Tue, 24 Jan 2023 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E74C6C433AE;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595890;
	bh=QiqGiDvIq8HiL8yMJfTfGiUo+VRidGsZ4SdzqL5TXGA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oQY3O44mhxhOwkNif4xilhEVaPGBiWJrVEKbWJN/k4hdjk8sSj32w82vf1li7hcMb
	 4z1c2dW17FIQyW1npfKwf6OY0NtU1aTZhg3R5u88vPAJB3RBpE4CcKYXOZmO1krmb7
	 lGxXyG+pjzlWE7pii6i6T9iKWwSfz6iDBOWstxeg2X86uedG6y6VHFiiuOtJhE9FNX
	 n5mb9W2wQHKFGj0sDLu0JJ8eCL1/+zrZpHu1OuBuoJl+4YtBTZ6I/1yOPqeh92VQKE
	 AwKVm/RGmEgM+r8cKgMQllKpCnYKB3oLgdLyjYxHRl36R/mCnB8Kt+B5WF7Ek707Zx
	 m3K9uHnU4TZsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC658F83ED2;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588982.12731.15555893499621062534.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <cover.1673702287.git.geert+renesas@glider.be>
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 14 Jan 2023 14:22:56 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.3.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.3
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v6.3
    https://git.kernel.org/soc/soc/c/faa4cd063bce
  - [GIT,PULL,3/3] Renesas DT updates for v6.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



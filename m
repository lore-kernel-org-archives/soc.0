Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD6C63797
	for <soc@archiver.kernel.org>; Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5617C433F2; Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A926EC433EF;
	Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673864417;
	bh=QcatPQcerkmvj3LQgF4lfdk3+62FMH0MBbERqsHqQVc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Z+rrEYtN/EvO09X91+9rLWLv91sKfOyassX2PBEr2DdFw+cL2rfwyzCGEyJpI7u5p
	 FwZWp4FLVsbaPWSLMZuuAHeAtrAAF+zGX1jEENo+zXFOwznWhvTfE74XgfeqbccEZD
	 1wS1sJa6wcVuJzThj9dDcgsWNDww7dAZdgMmuPKjDmyoTfVOXG9yeLqqGwFUhqaqgJ
	 xmNvcGf7dDwG+okAtxUKyBBB8HOA3WohlhsnxdSvLI9X4zZLoK53TFyy1R3ztSVxaH
	 iJWwKAN3QFFHOkEEQNpUwE61ROYnyvMpuFWPrcIuSNAvXhzXW5p5lW35Ue4ta/ba5J
	 Y3stpOfrflC+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 987DBE54D26;
	Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v6.2 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167386441762.5760.2833314689623880872.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jan 2023 10:20:17 +0000
References: <87mt6mg08k.fsf@BL-laptop>
In-Reply-To: <87mt6mg08k.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Jan 2023 12:08:59 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v6.2.
> 
> Gregory
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v6.2 (#1)
    https://git.kernel.org/soc/soc/c/88bcc6fa5eae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



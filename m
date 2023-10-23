Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1692C25B48
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A86C8C433CB; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87CA3C433C7;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=oee7GkKHycZo72hlQn/aqgyOue3ICh+O6ufTGXqToI0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ecL3RlR1L82u+WJ1GN7q0Gl3D53ihNrWSmJWvQiLI8zdNUdjI68fHiF7k0gojf7dX
	 ZabZJkX40bjoIPD+HY+svKZunfB7IBWQCpiVFWeYafwzh1SZKCI9dcfDJgGMtlqnBz
	 190ozstjoMNE07TEcS9UgOvaQAP9LRTaqTlT66LakX3XqStZYZQeC6puqAkIobEBMJ
	 tQI3RkmuBe4Py8UyKnBdCRZhVzxT791JSOgdGRxdFfaLxOwUbE7GYlD1QTRoZ4Opu8
	 7BvTmN15Sp0JjmWd6GzqUts+6p2HYvDCbWQSYzXpM5rJc2HFyWeY0cjy3X2+8bl839
	 iVNHWjmufr7sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C68DE4CC13;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v6.6 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943044.14534.15261387138282337829.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <875y32abqe.fsf@BL-laptop>
In-Reply-To: <875y32abqe.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Oct 2023 17:11:21 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v6.6.
> 
> Gregory
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v6.6 (#1)
    https://git.kernel.org/soc/soc/c/291c0d3a98af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



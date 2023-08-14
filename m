Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44067C04FE1
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C323C4339A; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05AAFC43395;
	Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033027;
	bh=5butHuBg+NecqX+9iBbn4jGE+hTNeLvLIM4hpMA7jdc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hsmm8xC29O6I/zBa9BeJXdGKXzxExZDoaqfdEAiMQ6PS4gAfwGnyNh0Sm+ZKVHeAk
	 l+HuOqtLbz6KDFmQSND5KtlDnW7Dh4IHXQfSEaydRiR1nItwurn8ADKBmrhcXv9TxF
	 gEaZyulA6oE9RE3qrhceAp7PmgsEb0Hki7huVZVN4GYvyO45FoTC5EkU30jtcFaI7h
	 uDN+puS75E00DPiJNawdxB2ErKVFnsTw2ieqt5mGd5oQ6ltzZbqm9qx0Wz6ZmXBmuY
	 yPhZfmzExkM8cmv5UpnRwec5a1SNYJdiHYjJxmRfxVE4O5Q5ai0wV/MkqZp7j7t9Fw
	 AQgI3wigDLyWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D62B5E93B3A;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.6 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302687.15030.3697294878292965527.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <87edk8t0kl.fsf@BL-laptop>
In-Reply-To: <87edk8t0kl.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 12 Aug 2023 23:25:46 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.6.
> 
> Gregory
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.6 (#1)
    https://git.kernel.org/soc/soc/c/7cb74e0c6658

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



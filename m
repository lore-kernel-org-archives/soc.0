Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC98C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40C3FC36AE5; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27897C36AEC;
	Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640014826;
	bh=tjuTuSSuVJehumam3uzzblu+6doNtXY3xaiJ962m524=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cG0HttIRA7byyEoS9JCRBAZSycaHNCWwHWbvNNeaXakmVdBft9grPAabwCHPcoOL0
	 u2xC2B5/YOcTT0h2kmXlJlmR80S6d6N/X6mPqcAk4j0/qWdRV6im41n2YtqnI7Dp49
	 y76uTZXqnaATzP8eASHll9HXpUVOk1nU2Fn+FJ4mNKfEwYGi9j/RPEPAlaA5FntsSU
	 gyosMqP7lltFC2y/aiGDbEKDZrigbMbMbD3pebOoMJ8AJDAI4TZCpP9tntWXrNUogr
	 BgNz6VX9ZcqwGLWdNblZVExnX/nX0HwBNaY3Uc2MNuq8AXabrUBwBMTB8P+ORq5Lh9
	 25OBKImy2lKuA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 02A8C609B3;
	Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.17 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001482600.10364.6956762190366597955.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 15:40:26 +0000
References: <875yrnm8uq.fsf@BL-laptop>
In-Reply-To: <875yrnm8uq.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 18:36:45 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.17.
> 
> Gregory
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.17 (#1)
    https://git.kernel.org/soc/soc/c/8d5c175fe19a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



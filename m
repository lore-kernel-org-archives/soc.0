Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8C4C43217
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 646C1C4314E; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42F61C43147;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=Y5JuRgdnw0C9ODDNw6W6x++bCJs6y4td3bmIgY2hVus=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h9Jpk2tVyN/5Z5rEVoS2qHtjKxrXWhTukFR74sSSdpiHH+ojcuz/k2HviIkWluv3T
	 IG1+b/0vAv9d3ItN/FSyyinm02/UJ6oqYQrb2hwpiZLF8Ew85khBs2T5USIYzOlN9m
	 WjnZI8fdNZavNWjIq+K3K/Nf8sll62hCUVwS9WoTZAXUxA9lw7+3739tioXj6s/5Wy
	 ovQ6wZtPMRxqpCDOWKGrss5+Erqxx9hSDzAWvKkqpjILMDbqgomBkZ+nZxjwvurTeu
	 OyKWdpGhle3OxDK5pNTJX/VEd6BuJ4ZPRf9/kE7DHpdvdQUPAEe4betFJ3qk9xPcFQ
	 cGRFPsK3XYfyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7B63E270CF;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: dts updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562594.11152.6715242473748896455.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <20221121163259.341974-1-dinguyen@kernel.org>
In-Reply-To: <20221121163259.341974-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 10:32:59 -0600 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: dts updates for v6.2
    https://git.kernel.org/soc/soc/c/867531d95cf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



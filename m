Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70935C4708B
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6038DC43149; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E460C43150;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=2aX/QfcT4KkscjOyKk/boh4LnJskwtxd6gJc9ttWLp4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ep8Z2DfoRHEnhSipqgBBpHlmeeUsQSbZub8eaXT03J3bf4p/md80BaV/6pqAQ2QYn
	 3cxejPa/HzOYImxZ+Gbddsx0mXew7QkCJRTS7Z7WHDXJqA4gaIPp+peixC3F2DtHqp
	 WH44z+AZlYaWQ+bzWfv95QkqK+qp8Dl8Pv3YnNnRZg8nZy5GaUVAoXGGi1sEb5H70X
	 Qi+aoNB+ztArWI68cJFWZ8InKtyQsCEDCjWahinWcpusCa+KMjfDSmGPBq/eA7JMYg
	 WDcBZQgylHqkj0T40sk6WmtN5Y/dEXSIZSUEG17ukulglJj0Ru9mqzT6RtK5QRilp1
	 xEzQn3NIlptJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2403EE29F55;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482414.7332.7482244438717960983.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:24 +0000
References: <CACPK8Xfsc8BaL_qAgV+3Rk-AFcQoDVfTpMzHvq_rR-UYqwpNNQ@mail.gmail.com>
In-Reply-To: <CACPK8Xfsc8BaL_qAgV+3Rk-AFcQoDVfTpMzHvq_rR-UYqwpNNQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 00:57:29 +0000 you wrote:
> Hello soc maintainers,
> 
> Here are the aspeed device tree changes for v6.2.
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 6.2
    https://git.kernel.org/soc/soc/c/375aab101818

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



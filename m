Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60ABC2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5382C4AF0B; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F7FCC32786;
	Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499257;
	bh=CrFQ/DtaFR7I773PRbXWm9a/fAck8lf5hKvlNr2HX9k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mPkREXmF9QRlSMCzciBFDKEkO1TKeZdQGXOkOtql4xuepM48iKjgZaofYXrRoFwa+
	 HVh0TCKTkCUz3LHwXecsCmMNGfE8kIbS2roDVuNJ792HVkt0NRxqHksCM33ORWfYQH
	 1nE17jLUfLpyNQmCOxw5KESKsRmElAPNrKaxoZK1i12xkbcgi5btHKXdqWD+gIO3BO
	 nbQE7IzfyG6O9uhV5yK1lzGlIRZCC8qKUUfi50jxUlsYdF8/mouzlPe9Ny2OaLMsw2
	 5Uowb0DiVjYAAHXMjlJ0p7L9eBPRVRHXEYyzttSD73BfEicMooM0e1hgdFBdPvZ95i
	 PWy7O6AseuaUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 791FCC43443;
	Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] drivers/soc/litex: drop obsolete dependency on
 COMPILE_TEST
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171949925748.15510.15496873123394818533.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 14:40:57 +0000
References: <20240617133004.59887629@endymion.delvare>
In-Reply-To: <20240617133004.59887629@endymion.delvare>
To: Jean Delvare <jdelvare@suse.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Jun 2024 13:30:04 +0200 you wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
> 
> [...]

Here is the summary with links:
  - [RESEND] drivers/soc/litex: drop obsolete dependency on COMPILE_TEST
    https://git.kernel.org/soc/soc/c/4b381cf4c46b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



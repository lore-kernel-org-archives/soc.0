Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB10C61DA2
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DA3AC43443; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67884C433A7;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=NLmVL79yylbp9clnS0TQ60jWgSET2ABt/olpLFlyG34=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R+sft/LVOnqk4oH32Lzpg2vPDCR9M8DQO3qbyGot7FdWQ/SQ+/bPl3OripxMcLYlm
	 pAu/YhIRIdQ1yaU98Ie4sWWt6lOzBO6E8MJk0NUSGs4b6E37tmbyoq0Rn/nR0PBnkf
	 EYnoZ6YZd+iPCe64KITqYM7Htyc4BMpfwa6Vz4K4Bw8od6eltWbBaJV5//6VdVGpyh
	 dJ4tObHtse9dM3fAB/XUFRsKuyqe0/Xf3v0Wsbr9Ck3c/5BuOGNAT5MbFqKEV/T9MP
	 Yy+YPTe7T3OQDix7EBWPbZXElBlKeD9pk96Cuu6fZT6o5EGV2UuxoUElKpqQoNGF1B
	 nyAtzBKAMEy/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 355E1F83ECD;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v5_defconfig: Enable I2C_GPIO
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083421.16533.17237791696151695643.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
References: <20230109-arm-multi-v5-i2c-gpio-v1-1-78e191358548@kernel.org>
In-Reply-To: <20230109-arm-multi-v5-i2c-gpio-v1-1-78e191358548@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 09 Jan 2023 23:46:53 +0000 you wrote:
> A GPIO based I2C bus is used by at least some Atmel reference boards,
> including the AT91SAM9G20-EK which is in CI, enable the driver as a
> module to improve test coverage and help users of systems that happen to
> use it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: multi_v5_defconfig: Enable I2C_GPIO
    https://git.kernel.org/soc/soc/c/d54dbdcfd4d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80470C001DF
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E1CEC433C7; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 288DAC433CA;
	Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690576824;
	bh=+P4JT8ObnidLHLoYH5mljhb+C5U1zxZI+6o4dCCmB3w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RlTkWK4PGzBe3iDOPkoYGDXgEMifrxNPbI/1hUMeaEYoBVRdvngKqF4+mFd+18I81
	 0YnqGInIgpyM0lap46yaMb9zWT5IUaOKHfJ8ERB+4tw8ufJ7g3IAM8gNbfbARUTUGQ
	 +Y9MGLVGESFnSl73egIdUnB8xrhFde6PJJivX2d8Vti/drudWzt0FAUDn2pYEoG3Yy
	 C92NajW7beyIj/hcjdI9mV6xHCAsba0/C2AfbdWj99/6zjUcAPh5vvRfuFltwpRNxW
	 B9ahUJuHx+jAQ/GLQD46QJZGzBrJW6+tfRiKtankM52F2LYqYilMxCRydNhyrp2Hnv
	 a3eMZAnw5sy3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 07B71E21EC9;
	Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: Tegra drivers for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169057682402.20429.8996663211598626259.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jul 2023 20:40:24 +0000
References: <20230726084811.124038-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726084811.124038-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Jul 2023 10:48:11 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Two fixes for current cycle.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: Tegra drivers for v6.5
    https://git.kernel.org/soc/soc/c/b1e052903cb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



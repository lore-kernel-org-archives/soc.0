Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A6AC6370A
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86A28C433C1; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D2DDC43145;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670448029;
	bh=19jWkM4pxW/Ih+h61ia4TIbooqiEUuiY/PQYeaU4AOM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DKYINuF/L5iYyu+12p3yd8+zuwo5mtb8lqQWtsS7zw1gROpNHhKB1FivEEVHCKOBl
	 y/GGepwaNuXEDkAN30MajNcBbAHMkaGFpwyKD2rmtTqfcCi5a9PpW85tWNahAo8Mhw
	 N2mYhBg+p8LJeJSAqzQHpV968Xoo19hhtmsC3fNog8BOj7LWpIPwezdzDTV0Scxh/Z
	 UzkUwfTdfOPQAc/is6crYTbWfrZzYJrCgBYOtUM+znHCNUggLvRUxtIVwG2i3khI3a
	 DWy2HcN0kEpkYUPCCBiw8W8u8qNMWicxZ6lG57teCMzRByWLSbfgYHoWAdBe2/3u1V
	 7CKnYDbF/4kbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3893BE50D9D;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 DT updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167044802921.32577.9240858865699503406.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 21:20:29 +0000
References: <20221207152554.3232434-1-andersson@kernel.org>
In-Reply-To: <20221207152554.3232434-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 Dec 2022 09:25:54 -0600 you wrote:
> Please be aware that this will conflict with the iio tree, due to binding
> changes that I merged earlier which are now causing dt_bindings_check issues.
> 
> The solution to this merge conflict should look like:
> https://lore.kernel.org/lkml/20221117121307.264550-1-krzysztof.kozlowski@linaro.org/
> 
> Regards,
> Bjorn
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 DT updates for 6.2
    https://git.kernel.org/soc/soc/c/c24ba5964f04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



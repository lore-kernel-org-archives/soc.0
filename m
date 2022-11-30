Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3AEC63706
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68E3CC4315D; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 504C3C43156;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=KBbVXBFH+YyPIjLvtgqiHj1pu+ZBuoKKtLZM9wA12/E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P998SfK87eUfYq337XmHLlh3iN/Zrxz9tRKk6o2RrMLZzC98Phh+lYln1svStiQx3
	 EzxJaJ9Id6ivjkIvbEt1/KWhSXUYmXYWOLNb+82llKS1E/1YWxMElkeJ/oWav3p0Jv
	 lkrQZd7gSn1GJMkZjQYDAAFkOQk85Rz47lDM4UORmuONXXUo2D7YRHMXTTHEH+UrUo
	 gnH9xqU0evqU55K82g5t5LLXedTDANc3rZEbQCpIhTR0N05SaohmzhI+Dg0XDg6pKB
	 30jVDyJnkSA+gWYY51CNjqvBj4bfV+HmySvYVAbgzTX6uVnJSAbWV6nLNf/ST6Ni0n
	 8MohhgFtG5udg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3AB75E50D64;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and
 Pinctrl
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826223.9936.15159331913250068143.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Nov 2022 01:38:34 +0530 you wrote:
> Enable the Qualcomm SM6115 / SM4250 TLMM pinctrl and GCC clock drivers.
> They need to be builtin to ensure that the UART is allowed to probe
> before user space needs a console.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl
    https://git.kernel.org/soc/soc/c/8f345960cec1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



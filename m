Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5046FC48BC3
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 245ECC43390; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EB5AC43399;
	Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463502;
	bh=pL+FfLly31u7fOBjtcBADjVf6mml4/yerT+M1Ch5Gvc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IKHt2IOTB3ar2eoOFs+UM+qLkjYM/6LPP0F5iIIOYBlu4w47fb1LuYjUoYcQw54bN
	 KKatyrTPNz4/63tFdYVg4852GXemWNtHQmKjz3j+PONnVXp2GpUkU4pVJdRRYDMGlS
	 135xP56IklyJNhijxR94Dd9hid/C5Mz6OzipQqY+Ge8bSJTTBZdmxJPzaLnC5gANl7
	 1coqV87YfTzFYj0b2TQqB0eyYBZJ/CWf4GJsX9kizFflDKh0wdYP2Hqm3vXFDDrxbv
	 g0UuRJUKniYYiFSBfNDHze7j2y6m0soUhyaLg5kXmL33/UNn3hs4OfvL5SxA24A7Oa
	 1dccpAYGpRoCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9705D990D7;
	Tue, 20 Feb 2024 21:11:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846350195.4365.161469197356599413.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:11:41 +0000
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Feb 2024 13:34:24 -0600 you wrote:
> I had a branch with most of these changes sitting in my tree for some
> time. Geert's asking about some errors not getting found prompted me to
> clean it up and send it out. This series fixes all* interrupt related
> warnings and enables the check by default.
> 
> SoC maintainers, Can you please take this series directly.
> 
> [...]

Here is the summary with links:
  - [1/6] arm64: dts: freescale: Disable interrupt_map check
    https://git.kernel.org/soc/soc/c/e08f65491c0e
  - [2/6] arm: dts: Fix dtc interrupt_provider warnings
    https://git.kernel.org/soc/soc/c/96fd598e9c34
  - [3/6] arm64: dts: Fix dtc interrupt_provider warnings
    https://git.kernel.org/soc/soc/c/91adecf911e5
  - [4/6] arm: dts: Fix dtc interrupt_map warnings
    https://git.kernel.org/soc/soc/c/f02b0f0dc26f
  - [5/6] arm64: dts: qcom: Fix interrupt-map cell sizes
    https://git.kernel.org/soc/soc/c/704dccec0d49
  - [6/6] dtc: Enable dtc interrupt_provider check
    https://git.kernel.org/soc/soc/c/78b6f8e7379b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



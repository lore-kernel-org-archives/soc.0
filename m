Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E932CC54EED
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D28C3C433A7; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3785C4339C;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=Q4NDIEbFcpENnlQBOklChiFhd1K+bfNqv6CbEHFcvQM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uT9wHSOr4RAH9PajvTwN8JofnA7WmCcEaMm4pF5naGLAJMNe/2OEMtbu2ByRkG5Gl
	 84s4O9Y1kkPOZiRqVslo+SntgfNL0spwdcuIbHDnWQ9rEKNmNL/rHS94Tsyz2iicuD
	 yBTUrVOq9wRMh+Rvv8D9cjZum3BgaZYfwbEtDiLquqbDkg6U0hkMeu0WJ9cX1xRM+T
	 AdaSvk+5ZTslJAzMOX9V5OvCwl6nSYX0sMmKWjSan61eVDPvYOJ1w1Q19f30UH1s7q
	 1QNXmi5VqPHiFNFgYFirRebPBBnCA8s1X6VDhL2KlQsuF1kLVXF+YiNSm/hLIlzWCr
	 cYtPRDwBOBXfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E84CE4522B;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/10] TQMLS1021A support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588964.12731.7302577492098297722.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Jan 2023 12:02:03 +0100 you wrote:
> Hi,
> 
> thanks everyone for the feedback. This is the third round of this series to
> add support for the TQMLS1021A using the MBLS1021A mainboard.
> The changelog is included in the individual patches.
> 
> Best regards,
> Alexander
> 
> [...]

Here is the summary with links:
  - [v3,01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
    (no matching commit)
  - [v3,02/10] ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
    (no matching commit)
  - [v3,03/10] ARM: dts: ls1021a: add TQMLS1021A flash partition layout
    (no matching commit)
  - [v3,04/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
    (no matching commit)
  - [v3,05/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
    (no matching commit)
  - [v3,06/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
    (no matching commit)
  - [v3,07/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
    (no matching commit)
  - [v3,08/10] ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
    https://git.kernel.org/soc/soc/c/af8bd008315a
  - [v3,09/10] kbuild: Add config fragment merge functionality
    https://git.kernel.org/soc/soc/c/a400c287ce98
  - [v3,10/10] ARM: add multi_v7_lpae_defconfig
    https://git.kernel.org/soc/soc/c/e9faf9b0b07a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



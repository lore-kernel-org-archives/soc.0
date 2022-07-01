Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D07CCA479
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 195D7C341D0; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01358C341CA;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=2XDj7o6wLQFMBjkTxYq/+CFV67wBfJ4PmJWn6Zm96bQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TsgayT18CelAEP8rya81Drvww6eiRgJpF3yDFhViuxGqENw7TqpAWl03KdpA5T3BA
	 aPWian/MSsrxOc2+PiLtWbp7JLypkiIAKAiaXtqECTWA9BWmv8lTKPQ2eCxbkyI2iE
	 q5M6v3b8tTVTJQ0yJSpCa943lwNI2v+r6q4gfsd2kGPLGXNEdnAlPuh9QAlnq53Khy
	 P6HX+NiFWtW6Vnbcil2B4m/vuPJgP+edpiWBNVRXZuO3q9IdQz45Gu/uKkdqJqhiiR
	 eVdtBArdg/be91EQCNRQUqz3ta3Y5VA77M0ignnHEAMdmZxv0Ci6ikNLrkECAHsRtV
	 BgKFwXqGNMPSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0A49E49FA1;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/5] arm64: dts: altera: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809691.26141.5545209147548720150.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:36 +0000
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 26 May 2022 22:46:02 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [1/5] arm64: dts: altera: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/85d616dd19ac
  - [2/5] arm64: dts: amd: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/dec1c62e91ba
  - [3/5] arm64: dts: apm: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/d57cc3b903db
  - [4/5] arm64: dts: toshiba: adjust whitespace around '='
    (no matching commit)
  - [5/5] arm64: dts: lg: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/b88d11f84da6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



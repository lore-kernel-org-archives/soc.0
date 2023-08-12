Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A2DC04E69
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A626C433D9; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8400CC433CC;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=DSVLZPCHWFQVPOo1xp9j1VyFTiGuhK9SUPzN0oGApdU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R0UR25eXXaTzS7kGwWUCIOq2V4gzyoVZrDJtv6oYHvgfiJGpfdbln4bm1E/YwVx+Z
	 OD58oRQjElIAMLNols2+k8miYryK8cDhuD1Mz1p+FB8/2uQXhOakFbB4n8POiNQm3I
	 H5GK3hTjtI6Iv+ks4h2w2nztR/aRfliJLLSGdiR8mkn4FJ31HjChk+ZWv8TS79htL7
	 P/DYTI6ptnyyiZ6O5q40omPlH1oMQvDVpGnBZKgKmXYqaxIHxPqlre2iNPBjqe7Kee
	 PCNYzeyx9g+hAp1beRuEqLepLuomvNISuBpxFM5z7QvbPEKCplJ3n0exbDEi/zzBcD
	 27OVLcBoHV99g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F7E1C595D0;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562745.32343.13258083765713499654.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 17:12:48 +0200 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.6
    https://git.kernel.org/soc/soc/c/8bb5c5fa24e1
  - [GIT,PULL,2/3] arm64: dts: samsung: DTS for v6.6
    (no matching commit)
  - [GIT,PULL,3/3] ARM: dts: samsung: DTS for v6.6
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



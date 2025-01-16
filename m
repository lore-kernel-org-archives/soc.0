Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E11D8A0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043291; cv=none; b=dk1QFP1UTD0WrjyCNZgb3urXSLjzIFCGgWhD9fvVLGSJBI3Ojj87E3edGXFGYpZbT0p9YsReNHuFLabJixwpu06GXRB5/BHYO5I4U7GvJRlxXMiLSczYFo2uEJn4i622r8Y6bhIUejx9sbqf8weNpq415NFEu7Ii+5OT8Bn9Ruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043291; c=relaxed/simple;
	bh=g+E603B5qrujisS17h5QQ6vhRDP34vLseVNpFvbDdRM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RICkPA1H9ri+Z6xJ0U370fkF7kF7wYnfzIq6fk2B0VGHOwjjS+g8Mje+YXZxGnF2chkYvqoWYZgcaIomZSas+/XX1Eph4OZGj5wOPZn7SA1AuBm2kU6WFcuISssw0WaWs90/lJVpBsWW2/kOQGqgDNB4pZAUjem8mpF7W6KBeG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvC869nf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvC869nf"
Received: by smtp.kernel.org (Postfix)
	id 3A8F4C4CEEF; Thu, 16 Jan 2025 16:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8BBC4CEE3;
	Thu, 16 Jan 2025 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043291;
	bh=g+E603B5qrujisS17h5QQ6vhRDP34vLseVNpFvbDdRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BvC869nf5hVWrQ17U9wrBgHDvVqsSitvn1sRLZhCcL4RrpEJujkHgEA+QadZsCio7
	 /MSOaZJsIaQsjMQDZyqC/oAbbBd3dnks4CjR5M0mJF+N7fHDRhilH1hQu843bibw5f
	 Z8WGN00VJmUjRDrnH1PnJ0ZI+AnvjUHPhGA2mu2tJZZF39UbKs+clwVlMETZYV1W0U
	 6+3OMbwkrmYC1BpUDiz2MSByi3PAxYlYdi6kcuCqceSSy5QNlEwsnpYPhwj7yP2yHy
	 wCX5ATNVMTq9kf0b6Ikbv2UeczY6CQxTQDybFxlXMr2F7DTIBqfogCmiHdfi8OMN3b
	 owCBROoXWyxHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EFF380AA63;
	Thu, 16 Jan 2025 16:01:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4 defconfig][PATCH] arm64: defconfig: enable Maxim TCPCI
 driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704331404.1501791.3033969256149170018.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:01:54 +0000
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Dec 2024 14:17:38 +0100 you wrote:
> From: André Draszik <andre.draszik@linaro.org>
> 
> Enable the Maxim max33359 as this is used by the gs101-oriole (Google
> Pixel 6) board.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Link: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4,defconfig] arm64: defconfig: enable Maxim TCPCI driver
    (no matching commit)
  - [GIT,PULL,2/4,drivers] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
    (no matching commit)
  - [GIT,PULL,3/4] ARM: dts: samsung: DTS for v6.14
    https://git.kernel.org/soc/soc/c/462675a5522d
  - [GIT,PULL,4/4] arm64: dts: samsung: DTS for v6.14
    https://git.kernel.org/soc/soc/c/73a2e82123f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



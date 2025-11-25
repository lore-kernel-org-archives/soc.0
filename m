Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D3CA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078682; cv=none; b=KUnj0t9KduztIX3S4UWJCPVhaAXq3r2T53frroZViNz94Q7cHYlOkMbveXSf1Fa29r/qi+dDNIZBXrcf9unqZlScVwkq/osOGtNpOYnLM9oQf12gGPwfCl0617mGjbYCwpGvfotbsmQz6hHH9Gz2o6U6lTMoX8BRrYw+TA20Ic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078682; c=relaxed/simple;
	bh=jrj1680GMK81Wy7t62xzFtHPj80JDhzY+ezTXWqE6aM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ccd6zxPIw4U8R5Rf+N4+PkI7BB+1Zfp+thYUHGfghvjl6bZkOTtfMTz3/6mk3CdWYonnw/9ux3fWZ1fbkzlj3mH6v5s8FZ9sJaffMAEd7kHNzogjQH5Lgap9lvHipTfRrymbyn1WHLxNoBCo7LBPpe5xwxgQXwUFBZF+s1fEU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cj777fge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cj777fge"
Received: by smtp.kernel.org (Postfix)
	id 5EDACC116C6; Tue, 25 Nov 2025 13:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49682C4CEF1;
	Tue, 25 Nov 2025 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078682;
	bh=jrj1680GMK81Wy7t62xzFtHPj80JDhzY+ezTXWqE6aM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cj777fgeUb4bjFbmEUePeqBM/pUcR/HJeq7ZsJwF2Ux0tD//I48s2Jc8xAEwJ2PF0
	 zC4GBQcHbp0pDduChMEwZS7g8vaG/Gi4l8WWeK/iqJHSSGK8HT6AHXGFW9bTvgAkAm
	 n7mXANjk49VbERCZWxleRjcgq4IJWFr8bZ0RqGDBoQp7aVaF1BAfH9eKlzX7oZ8al6
	 p19K+AeoEqzicUWbJ4aiuJsVh+pEDZ59wCPZAlslDiVjZ3K1WieBlRxoCV39fiDlOv
	 o+8oIcW3tXZIls8JWH7+5UIez/i1GkZ6jki23D55OzwVOzm3Iux2wJY6+RAtV1j6Pv
	 +AaQFLF+hhMfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3303A8D153;
	Tue, 25 Nov 2025 13:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] arm64: defconfig: enable Exynos ACPM clocks
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407864449.736376.15000570388627504515.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:44 +0000
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Nov 2025 13:13:39 +0100 you wrote:
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> 
> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
> implement ACPM to provide support for clock configuration, PMIC
> and temperature sensors.
> 
> [...]

Here is the summary with links:
  - [1/4] arm64: defconfig: enable Exynos ACPM clocks
    (no matching commit)
  - [GIT,PULL,2/4] samsung: drivers for v6.19
    https://git.kernel.org/soc/soc/c/babf4c8841d9
  - [GIT,PULL,4/4] arm64: dts: samsung: DT for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



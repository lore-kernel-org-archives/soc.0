Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FB1553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961188; cv=none; b=K2Tde3mlWvaUZCjaNCe3x/43Sz5pIul+Dqwhc5kYECTMPLWFwDWdj+8mcHuS0+wBxcNKOHvSNVm83LsLR51AEFNZqCThoYimNf5qD+Nn0gUz0ya7uIYS+5VfNtyMdv7MRLmzlMgCAcwabqH6a4049kNhEXVdsPrOk1b0m1JLwnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961188; c=relaxed/simple;
	bh=t4JRnMeKS2qahJb7ubhr+QHBC/z0BnDhxF1eRpNwVvA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nN/f2wPgNv6xKeVmA0hXUMolnDCyM+cB0jbEMPfHjCGfiCH9IB0ph7wnjusBjByPBzqDsDXrMcpQ2g3hvqJ73ZfkaEoaXdS5s2RIZ8dAHls69hV7CHSHPIBehfu+erstD3WbKko6vCp60QgnYFpqK0otv0awIi705sekONIgpls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2DCrOVC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2DCrOVC"
Received: by smtp.kernel.org (Postfix)
	id DDA00C4CEDF; Wed, 15 Jan 2025 17:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CEDC4CED1;
	Wed, 15 Jan 2025 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961187;
	bh=t4JRnMeKS2qahJb7ubhr+QHBC/z0BnDhxF1eRpNwVvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h2DCrOVCSjF/EjVRS0jDXzJ4u1USSUsDdYBZM5HsTjyiLQDNXQJLSobHAkMfqdjKN
	 NsMO4xVRCEa8mRJojN1eIJevG27GK8iTGiZeu2cuUTQpPPzxRP123i6YbHSNJqnLFX
	 1PeL9ENgmeArCsYTrWjghxbvgHyjFGvzLYSA3Z2Gv2Ltxs879dmDisilG+nEWEVFlk
	 00Lg+6GH8oLEEqbC5uDNpkSV6MHDgjTC347MZ5q9BuaShdqqRbcEUwR4LxORnzO0rh
	 7hNirb+y03V1tiixf8ffNs/GJc/SB3D07utSd+ghQPa0670fWCTUQyV5S+rnJIYqpX
	 LeOe3J+ftX6rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF34380AA5F;
	Wed, 15 Jan 2025 17:13:31 +0000 (UTC)
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
 <173696121049.809051.15119889321695342262.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:30 +0000
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
    https://git.kernel.org/soc/soc/c/d2ca319822e0
  - [GIT,PULL,2/4,drivers] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
    https://git.kernel.org/soc/soc/c/f16d91d8febf
  - [GIT,PULL,3/4] ARM: dts: samsung: DTS for v6.14
    (no matching commit)
  - [GIT,PULL,4/4] arm64: dts: samsung: DTS for v6.14
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



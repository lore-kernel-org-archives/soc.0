Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870C283683
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756544; cv=none; b=AmjUNBOhHcNtqXRLhV+8ifgnHjy8VGgcBWlkvz5qWg0t4woH++6zsV2LV08A+Z+viusmP+Tr7MqAUSzvF8AOMgxJnUoOrpMfjYFmOzqc+atImZtVSvjqd8SSCMihh61DSw8lJ1fMee6UHOf+X+OnHgSg8PvEByR3IbOW5njV2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756544; c=relaxed/simple;
	bh=wkiDXUTYEHBHn32x4vpT3xT9GnAg83K23BvyC3AgoGM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LiZ+8f2f3wFyQEX41jlEIoPG36hkEnS/lcHXvs4Xi7zJOo9sTJjjsHdSblNC6lj+agQ1PXoxf2v0bHZr8ScZMgn0+Xksr0VZZxrd/7WpW+33zZHkgC4PBBP9eaa159UyKXFFJ4v6USD2YKyvq5J2Eh5jGWxpPzHSm4M771dcEcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URXYGI7W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URXYGI7W"
Received: by smtp.kernel.org (Postfix)
	id 6A1D8C116C6; Fri, 21 Nov 2025 20:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A5CC4CEF1;
	Fri, 21 Nov 2025 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756544;
	bh=wkiDXUTYEHBHn32x4vpT3xT9GnAg83K23BvyC3AgoGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=URXYGI7Wv1+jOKghtF7Yx7j9zyx/8pF5DIq6YNvaCm/RzZeBsPgohOtlO/2Difmnk
	 SlYi8/uF/Mi3428F63CUkey66JC7tJOfYKtpM1NLvwgUV5MhQjUUt+MRkvvlkJ16fp
	 n+NCpZSAM6YJ9+BUTV2zRGeEHMbt246dUv4F6+EMEPpA1XxTuj1daO1NYMIrlVhkb0
	 DxOSFymWuGK/iT0Po2JyGTOWWoNkcV7FZGbVp4K6oX7VaM+FHvm3gI6JkJOtu2myZe
	 eKHgEJWTwSrVDTuIC41ooO/MhbIfJT/QGX1vmdcBa19/oytpiGGk9OoeCHtOlj8PUc
	 MRUF/YwfhG5Ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DFA3A78A68;
	Fri, 21 Nov 2025 20:21:50 +0000 (UTC)
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
 <176375650874.2571237.7294349860597298356.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:48 +0000
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
    (no matching commit)
  - [GIT,PULL,4/4] arm64: dts: samsung: DT for v6.19
    https://git.kernel.org/soc/soc/c/ab07edaab69e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



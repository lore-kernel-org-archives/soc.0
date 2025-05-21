Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55421D5B0
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848035; cv=none; b=m75mQJ/HdvYSRtE78+15Yw7YgrtzT5m7tVoYUy9y4SxflCaNjSNmByah5VWmVXGtWSWglJiflmuEC//WDHbwH53lzOCWOQE6fRD9ITlr3FdWcbFFNTmHOO9V4rqvb8Vro5r40wuy8jnFkQBNsbkXg3v2wVfYxv8qWx+zHumvncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848035; c=relaxed/simple;
	bh=aHzGDPVbtfatBHoCdMQpoLhGnyb3lvGH0RUZaxMReKE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UNWIo2rkF4oGFFJK53O6OoljhgoUcY9zUoGJx/3WsYA/Dj5yK1qZiClzL1tD4ZNu2NNxBJisdkYISQesAC7nI/zbdIFsr4UTuua6uImbx+tYHfk3vM0hrrDzIJ+VAP5DcBSzA1iA8HVRTXdCxDeNgnjrcyl+xudkASDA7mtMARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWzOzZwm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWzOzZwm"
Received: by smtp.kernel.org (Postfix)
	id 5E69FC4CEE7; Wed, 21 May 2025 17:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B0BC4CEE4;
	Wed, 21 May 2025 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848035;
	bh=aHzGDPVbtfatBHoCdMQpoLhGnyb3lvGH0RUZaxMReKE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZWzOzZwmBPHv6qTTk8hGUdfsd5HSMdQuNYx4TQX7g4ZWbQioxf0lYBkG+xm7352A7
	 txpeaXOkScl+0n3b0c1jUYAVyZ8KhArqckB23Q29Gr5XNlnm1sNNzuW/5H02s++lyl
	 18EYn2AQnTgA93vwGhVZYnQPuEvX+26spzKWdqe8PWQxuT4oVzVeAGncVY9nnCIoOc
	 0IqLLhfT8fpIJoFAx2hhCRvW0eBn+lXHkcMhbmpYB+n7A9uIBcFwuK6d9MnK01rd2v
	 VHtEBZ1fstMnwkkw0fIpGgR+Aa6xx3rEaH5CzvH8DRcZIYqvRt85jB1W6oBaVwLh4V
	 WudWdOVc6Toiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3429F380CEEF;
	Wed, 21 May 2025 17:21:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL 5/5] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784807075.2163178.2448666223556868835.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:10 +0000
References: <20250513101754.23158-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513101754.23158-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:17:54 +0200 you wrote:
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Enable the Samsung Exynos ACPM protocol and its transport layer, the
> Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
> provide support for PMIC, clock frequency scaling, clock configuration
> and temperature sensors.
> 
> [...]

Here is the summary with links:
  - [PULL,5/5] arm64: defconfig: enable ACPM protocol and Exynos mailbox
    https://git.kernel.org/soc/soc/c/93b07587bb25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



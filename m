Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB41E50B
	for <soc@lists.linux.dev>; Thu, 14 Nov 2024 00:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542427; cv=none; b=TeJ/s6LV6/+j2R2IQrFkdbQQuPCXNVwFxZF7BN5yti2O8Rse2KRPUExgZxlzgmwc2d8j44A5LD92N6wj7RZbpjq7v2DlKlOR6cv0EnXOU40i4ehhxULDByho5Zog+QmBAPGNhlESaw/ADuWVVfEYs9I14KiiG/Cx4EjsAxXfRus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542427; c=relaxed/simple;
	bh=8o85VresplYY/bW97OXbydB04SDYbmvg22QqFiZFE8I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jKtZchfB8PdwB3X5pkItYVu45fnYxV67B1r5RG5wRBT94xB/nun6pEjGVEyLEGQKb7OKfF2F35IPbEpThNqY6CMAMvhDweJHbhLKdJ0MoOGGFMe8flNdjE+WKhsZgF5vdBP6MkB0cfvgow9qNIhz8itPU+QUDIeybvM/+Xr0lZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+c2FYB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+c2FYB4"
Received: by smtp.kernel.org (Postfix)
	id 59FD4C4CED2; Thu, 14 Nov 2024 00:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448C3C4CEC3;
	Thu, 14 Nov 2024 00:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731542427;
	bh=8o85VresplYY/bW97OXbydB04SDYbmvg22QqFiZFE8I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b+c2FYB4pcm7WYYDeOkhAU+300ZQqxPjLMvG95YiY4tp8FGzMtEH61xgROhIbdZg7
	 Nr7fv5cstPmZ2VzyF3Ezm2+oNm4EjkXY4uHzKZu6wH72pae4KgAymqktYI6cpbgUeZ
	 BgYXAMXzGpYadJoYG23FehY+3XnQD6nqYLgpRz7IjBR44md8yPD0m2RZm24pair83L
	 8bpP/HCpeY+Td4osHdXHEkXxLbs4nYJhmFuuhdxIrDgv59CDGb+81Kf2Wfiw27KLJN
	 gkYLBsG8LvC/2bKLNKBflvNiwxw5O9Q7xZb7vN64KKTXNWf7c/aCfBzMQ94y827RkQ
	 jJD1DHyTfzAzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACF23809A80;
	Thu, 14 Nov 2024 00:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND GIT PULL] Microchip AT91 SoC updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173154243775.1424393.6030890802286624440.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 00:00:37 +0000
References: <20241113182050.2176500-3-claudiu.beznea@tuxon.dev>
In-Reply-To: <20241113182050.2176500-3-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Nov 2024 20:20:50 +0200 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.13
> 
> [...]

Here is the summary with links:
  - [RESEND,GIT,PULL] Microchip AT91 SoC updates for v6.13
    https://git.kernel.org/soc/soc/c/a1cc63408f72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



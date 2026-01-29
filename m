Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16E37474C
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680321; cv=none; b=KXsKrCauQApL1K3BisHKwiEkbTK70arrCXKdhvyB2DgiWoj+OLL0H1HK8ngZPXRhosQ4J/CdiVfIbNuoFrdZzxA9zPQpenxD6HYtUhnM6Oi8kwPEPd521SEO673olRSgD0I8ucSE+EWARCxfy+Yk6MoNrw2e7QWzU3EuzsuWk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680321; c=relaxed/simple;
	bh=7X51YJXIIDtSTG6AxZOL8cFjXvuNBnnhOc9qXWe/beY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hG279ejKG5O3+4ABpTSJ8+sPlmHTHOHRBn1026mMg7GAOJZXM+XqM5wdR8yOfm5nQU24pzci226GR26iAojH27jP1LgO4zn+hmgYmyl8TeK5e3J951lsJlDBhkqnVjHG1ENoWMAXUUDw/zSJ1bj5xMzZ8JGoW5kikff6M4RFIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIGFEWmi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIGFEWmi"
Received: by smtp.kernel.org (Postfix)
	id 8DD52C16AAE; Thu, 29 Jan 2026 09:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B04C4CEF7;
	Thu, 29 Jan 2026 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680320;
	bh=7X51YJXIIDtSTG6AxZOL8cFjXvuNBnnhOc9qXWe/beY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NIGFEWmi9uC8ZPcdSbU/2cTcaiZ1A5n07/UgXpBnRDRyVMiLRjeAFQEWzO+1gXXrq
	 7iqDxkVcxxbYFdWxMZoIU3Q3vnWJ3f87SkswjnEBeAI2SbvAezBJ1Vhhc8Deu2rQHH
	 bf8wbzV7harbfAn9IOp5BKYVQWn7W2X5DFKfbTsFQ8EW7Rs5OEbOe8jhRZeSsXx+9k
	 i6K0Ktk06NSJIC+SQ97DwR6L483tblCp36/xV8lGfN0/mrvieDjxDCSXoz95B0aWvl
	 Lzd/Pp6jyOloJZQpByo9JBxJYQ0HHlZFrzgdU4190ZyBvXcmmkw47fOw2RuCDGdaE0
	 L5dj6ExjHWvtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8CAF380AADF;
	Thu, 29 Jan 2026 09:51:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176968031334.2433421.13810616641737805630.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 09:51:53 +0000
References: <20260128-sitter-crazily-184c1a7606db@spud>
In-Reply-To: <20260128-sitter-crazily-184c1a7606db@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Jan 2026 19:57:42 +0000 you wrote:
> From: Yixun Lan <dlan@kernel.org>
> 
> Enable the clock driver support for SpacemiT K3 SoC, configure it as
> built-in by default, but users should be able to change it as kernel
> module if needed.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - riscv: defconfig: spacemit: k3: enable clock support
    https://git.kernel.org/soc/soc/c/574dc9ae4fef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



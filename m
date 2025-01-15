Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82BB1553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961186; cv=none; b=tm8AZ6xCsvz1zaZqAytwGNeskmfxX5OwsUALqmsx8OisxY9lypzw9kh5xIGYKjnbdOnSQahF1++uPG+QwokTeJ6dYJoK42n90ZqOFkq8ZovNnO3fymTA8sBVmLUaKOI4/reQ6aCCdOWF5dWd0Ovh9bYkgRfoSu3D/pI5LLoNYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961186; c=relaxed/simple;
	bh=71pA/6jZ/PHBbLYNuwFA5jA691NOEztQuxbBwy9llE0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=a0rOKUO1Zf0TrwueY6vtLyZZCbLb5mcQXE0kWvKlEHbotYAA4qedaMW9kklgQ1VCyTWh0jXX2y/l6LNcamQb5I+WJazx6H3nTr25dGY2iDaNKkrllcYZxozubNjRyfl9I3cGXgAMMXxcM6g9l8DraFYickLXDkXMiEtIymUASp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3XP5KXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3XP5KXI"
Received: by smtp.kernel.org (Postfix)
	id 6EC5FC4CEE0; Wed, 15 Jan 2025 17:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0A6C4CED1;
	Wed, 15 Jan 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961186;
	bh=71pA/6jZ/PHBbLYNuwFA5jA691NOEztQuxbBwy9llE0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p3XP5KXI63I5VtrThI/X7Xis7mTrv1qgWLyQn9WvM0Lr1UgG+NiWuk5jX2GTpSmGj
	 gs8jchwZSojKJ0syLKOBpsqk4cfJCTEVe5MZF1YJ5s57964yYTeq3N/WCcS+cI0f62
	 wpqyvsXxVz7wlwP2u/cujspAbJvmrCTk0adfdPcFhGJHoUfNmUD9VH1JvDE+EKKxkn
	 Af9TsqcxuKWACdMSL0a3BPjoFx/3C+s1yDT3tPBtnllHFuvi4RuwgLfzQZY/sxeZ4Y
	 9tQzZ45fCxnngsNJlyHeXgrJU77P7xbdlu6+Rqc5vu6EJRZwk1DLZyI0O7bI//ugHh
	 BYm+6n/G2HvjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F5E380AA5F;
	Wed, 15 Jan 2025 17:13:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696120898.809051.765148909932487098.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:28 +0000
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Dec 2024 13:55:02 +0100 you wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Running "make savedefconfig" highlights that some flags are no more used,
> remove them.
> Remove some flags to reduce the kernel image size as STM32 MCU's board
> embeds low amount of RAM.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32 defconfig
    https://git.kernel.org/soc/soc/c/8637f225c5e5
  - [v2,2/4] ARM: configs: stm32: Clean STM32 defconfig
    https://git.kernel.org/soc/soc/c/c556c3444acd
  - [v2,3/4] ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
    https://git.kernel.org/soc/soc/c/c1bfeadfd8a2
  - [v2,4/4] ARM: configs: stm32: Remove useless flags in STM32 defconfig
    https://git.kernel.org/soc/soc/c/90d96a122748

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



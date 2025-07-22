Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D9225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217439; cv=none; b=BPNULmIKm93LnOXPsZoglWq86iPiQyRirlqlTggSnp0QHQ7bdd4fR6AJg97YD6xeMmSeWfW3W75bF1bO1QxIARHKbgB9vfVXgLAv94XoajSR2lVmIdzcAsMfR6VqMkr2solDHIUfui5GRGzTVwM2OE6hJNecsva0pk/qi3IcCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217439; c=relaxed/simple;
	bh=mui2KkNpJ+a19QB7EY2mkMKI30KARthkPxh6Z0W5xR4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RQ8dUXyWn56UY8N1IIDtqTOCxGYaguoPmdtagQDKTFmzWDW4A+D4Mqqib9CXrvi4g4K33DuI8PsO2VT4t+ctogeOTEI4NZ3MRRIG7r5jh90uL/dV/IBbA0jQKalUtTJs8XiYMJn3AI8CAP2mclpJ9GREZA3UDrmOikDg3TcRec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D95ouP0D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D95ouP0D"
Received: by smtp.kernel.org (Postfix)
	id 993EFC4CEF6; Tue, 22 Jul 2025 20:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8360BC4CEEB;
	Tue, 22 Jul 2025 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217436;
	bh=mui2KkNpJ+a19QB7EY2mkMKI30KARthkPxh6Z0W5xR4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D95ouP0DEEM+hlKXNcjHFbgL8Xbe0DVW0zfwJ/cAWd96ZZbdWvz9MtL2OnbVbnSHK
	 ZDapUQfZKxmnPJNK5Qm9LGazoKEQcjqPk1jgI4/l30sv7EAjlTVWHxrMktfjPA8tqq
	 FavfpuQiznrTwmiZl4Hd6w57+qQ4YhtGV04206Gk9ULy5UpYCDthFzKZwmvARDmgui
	 uMoJigksktjpPhIUmJqGNTg9BKeGb1O1gZwJSuSQxbRvW2tcZo5zlDg0jAF3qPegzg
	 vDq8Isfr1Pe5kP1z+3g4gK8bLZQCA9sNk16OqqvHTC/1WqR4C+ncUbAAcgMVx2r6sW
	 9/l5rwdSUqScg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B43383BF5D;
	Tue, 22 Jul 2025 20:50:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321745482.949540.17137010341068655771.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:54 +0000
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Jul 2025 10:36:45 +0200 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
    https://git.kernel.org/soc/soc/c/73bcce043f3c
  - [GIT,PULL,2/4] MediaTek ARM32 DTS updates for v6.17
    (no matching commit)
  - [GIT,PULL,3/4] MediaTek ARM64 DTS updates for v6.17
    (no matching commit)
  - [GIT,PULL,4/4] MediaTek driver updates for v6.17
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



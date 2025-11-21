Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B1A270557
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758954; cv=none; b=DRt+n79fNo1MrvF7bfNPslp7TtujqEu0eP1jdMaRvc+E3/VvVTeQEIVG3CThWjNzyou3b1EcZyV92xl+nwEtpO/f1CWE66p6VnJ12s/vlj19kq297lbnc20vX5r9+OGMAXhr3iAPNLoS5ssHAQys5jDFVYTP7M2a8nVuwqVFvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758954; c=relaxed/simple;
	bh=ZMCEZ9s03tipZRUhiO/sK9qV1ZjV8WYXK5iYculh4Bs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U+yKqpRH0XnQIQmQpLPpaPtWfgv+Tu6OBSdtGUGhrypRJqnG7wlOmuo1tZH4K31ElgQ5qoa+fRS473N0Jz7mJtgRUGvRB3u0a4yZ5UtPTjbFL4zZ+wnBUPR7MUq1bwtZhyRsNVtvxuw9MIXO7Xu94LljYMYVJPhv/ChY4Qf5qJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaBJ4ADb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaBJ4ADb"
Received: by smtp.kernel.org (Postfix)
	id 1E1DEC116C6; Fri, 21 Nov 2025 21:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0844FC4CEF1;
	Fri, 21 Nov 2025 21:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758954;
	bh=ZMCEZ9s03tipZRUhiO/sK9qV1ZjV8WYXK5iYculh4Bs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FaBJ4ADbV5dcLUxJwxYTMyUzpHvX3FJ/BcFrBohizKSCrgKGWCQd59ctN17wsDu9V
	 M4NLhJRe+P0emoeM5r173JFeI1QqDmj5kQxdSRzATEFl3Jn5y4rr07CusgRCm1FSU8
	 63Vg3TGx5EMuNPruu1vOTpAspSa5glJR1CUbaOAKKChP+j8qkP8B77EP0vxTbYm2SW
	 0PQFClSXiSFuCdgwj9vsRV1jzYK4pgJ0KpDFuppNUjv9ubKlh0qI6OO84T6QXMfG6r
	 9Xl3F//o/1XoqcHuYMocqzH8E6eQONGfVa46mi43ImfgO1d6B7iBCgAW8NtMqDMkYa
	 0vXaKwPT3j4EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CF05A3A78A69;
	Fri, 21 Nov 2025 21:01:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: versatile: Fix typo in versatile.c
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375891874.2583629.2591089279636126254.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:01:58 +0000
References: <20251023223258.3181274-1-linus.walleij@linaro.org>
In-Reply-To: <20251023223258.3181274-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Oct 2025 00:32:58 +0200 you wrote:
> From: Shivam Chaudhary <cvam0000@gmail.com>
> 
> Corrected minor typo in versatile.c
> - Fixed "documentaton" to "documentation"
> 
> Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: versatile: Fix typo in versatile.c
    https://git.kernel.org/soc/soc/c/00465358f422

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



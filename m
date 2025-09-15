Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19579523A
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944263; cv=none; b=syhZlmUwpHv1E6ygXxN0DEwtNwdxKQwljFoQvXZ9GRQqWPIxoYJGIy3vflkXp9w1X0iaqQKaB+ezPxMbTkGbL0RoIchsIqn9NSOuBY2IyLRG7+NPRe/Ha21DhyUGAoM+nt7NLIHiS9XfvXwemOvZBNg1HkH0Q+4JaoeXJKwNSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944263; c=relaxed/simple;
	bh=In5i7iKM4NgFV2XI9+nYOD0C+3HwfW+ydkmOMIPTYhA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PXOUmaipvs29HI1DNcdpDTR99ezWOb0fmIvO06w/yXV954GaB64GzcP3j2eL3XJc9KwsFgG9EPnCvQ0uOxmTMYMy73wIRBCtycvsNZVjBuHVZuM5BVjqoRzZ99EPnTAQ/Gnhq21LLnvo5lEpng7tuxrQ88lUi7BI5gXc0iwsuz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=salkoNj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="salkoNj+"
Received: by smtp.kernel.org (Postfix)
	id 0DCE8C4CEF7; Mon, 15 Sep 2025 13:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6C8C4CEF1;
	Mon, 15 Sep 2025 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944263;
	bh=In5i7iKM4NgFV2XI9+nYOD0C+3HwfW+ydkmOMIPTYhA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=salkoNj+7600lDyd6Q5zKy1CI6+77P7pSJEwrghqGXvRiAXzPBEfxz2sl68A2WOG2
	 JYGjHbAijaYEeJ5WHXyStsTMCvZYdZcqZnpAFkQgMUNiM/1FP5dh5aI5dh6NAipYrd
	 myFKD6HG0b8H+5ekNNIOOis7Hsu1jVCboloPRmI+cCT9R8tlXZxjLtBwhctNBlTtEB
	 4v4ZMJ9x90ZQ7+xB1LWNr9o0JjHHQG1FBBdYhY2nOEaxWNZIKFATJu0T0vnv6N4Idw
	 OAR0hA6EPQSsPFgQfHmlHvCNk/RQKQh8nTyINM+iT5tDSN2/wjzRDRG18c5L81CHOx
	 exusBlpPW1zdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCDC39D0C18;
	Mon, 15 Sep 2025 13:51:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426423.4179625.14226470829136248433.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:04 +0000
References: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
In-Reply-To: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 17:04:41 +0200 you wrote:
> Hi Arnd,
> 
> can you please have a look on the following patches.
> 
> Thanks a lot,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek ARM64 DTS updates for v6.18
    https://git.kernel.org/soc/soc/c/2c58d35618c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



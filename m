Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EE22FF2B
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866676; cv=none; b=WA9mFTl47Dy7LxjtkfwbzGJlgWNEhePSBeFmJ2ZxjslL46ArWexKWS8PSgoqnPMFf0v1AUrBn6KTul3nmJAQ666GOlKI5ZbMfUBKGYyrGepmte2eGYvQj8n1LbtDN3a7iZjRBRWuInkepfPEv7BaMaVUTwAIriMcCTQo9rLIVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866676; c=relaxed/simple;
	bh=ozGREuO0JhmZ4dmVOEOxcr8R0TsjbZ2kfIAbek8t5ck=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Yg3Kb61lCKgOryCz5zOmEEIb4nD//Tx4HvO4oEEULcin8yYRk0GuNmlj68SUFYVp5LuxnE/dQP2ImyCzSp35yBr9GHWawS4eZmmDajgd1Qmc9THBNPA3sTKC3EBdOuOj96y0kawP4d0RnLd6suifeT9RI0sZfbeNm0H9IF0BSz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldjsJGkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldjsJGkE"
Received: by smtp.kernel.org (Postfix)
	id 9C12FC4CEF1; Wed, 21 May 2025 22:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864D4C4CEEA;
	Wed, 21 May 2025 22:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866676;
	bh=ozGREuO0JhmZ4dmVOEOxcr8R0TsjbZ2kfIAbek8t5ck=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ldjsJGkE0ib4D9nhssntRGfFoAQGH5DMRKiZEYwzS50A2ULhiaqkfyj8ce1CNJ9Qk
	 Uk1i45rv8A5HS4K3KP8BLVdeQTU/fau6PC+Cu29YdWK6CIfDntbwLZTjcFKNZscSeF
	 p3vF4VX05OjJFwUyoAKFWG0VyVmEOaL8N3JBmq6r9B0gFpQ28/4iEKiKaFTAWlZNAS
	 TizV3RUJneYcvLy3+m8yfMv3ge3zQEs9OB8CtVfXFszE2weH349i+gljAUskWbpu+u
	 /G03/0uKBppNNx1z0wUSxq9Evm+wKEY/VlgRKwZtmywWNC7FjrzQn5RXZpT8Gi/ZLA
	 sZRc9vzMmMh1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CF1380CEEF;
	Wed, 21 May 2025 22:31:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786671224.2299459.9114912531158422836.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:52 +0000
References: <aCaeZJ2t4S_xhgjp@wens.tw>
In-Reply-To: <aCaeZJ2t4S_xhgjp@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 10:09:40 +0800 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.16
    https://git.kernel.org/soc/soc/c/0feaf3c056b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



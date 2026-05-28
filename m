Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2E35E1CB
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006223; cv=none; b=QcxTKSdjhY5o42gygP78i6iqTtmq5n4RZYbSBgxkBhv12wwTBFGgPG/HCZZi9E0xrNm8vkfai13wYgx/zoC0g+tFYp8ZeiMePiu6PC4kngl8a3cDr3J13yYp6/Fn+3GKDUuE2jQIGLg8KPCrlcFGcs1o+mGdE43ZxxubbT99PDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006223; c=relaxed/simple;
	bh=g828inGFhyfwuqC1z6wjq6X1nCJSGK0sILyJ4EgEJTc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DcYe/Lxh0UHdcsshqqXvoPDDO9aMLdagUKdLWq5zUwwODkG/ME6d6V6nVIqYqOpYva8xO+EuT/DU8pvFfUBtbyyGkyPVk/Fww3E1e7hopt8cADo7Igv1BNJkKzPunzgJLSvSNnVuMC486Ea1bhBf+XG9smspgqfNS1tLcfzei4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoCg9Zrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoCg9Zrt"
Received: by smtp.kernel.org (Postfix)
	id B737E1F00A3C; Thu, 28 May 2026 22:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A2B1F00A3A;
	Thu, 28 May 2026 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006222;
	bh=5ZEJsa0TGITY1x1ubUZD/p/kJLoXVV4CusiFltQgC/c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BoCg9ZrtmXfLZ3zoyqBZBQ014YqRTL9KJjWWDWkh3NCMUuC3YRcQXptIdNe7/N3SF
	 SjkTue7DGwTia67qRHczYnatTMqE196D1z5Lvt+bDRoM0kPxjxg4dhAVyqoXqA5beV
	 UXWoO49ukHCmgev75DaqadIFBGskAEC1zb0MQELjDu/YYP1LTe9Xir4dimUgBkxIu0
	 UnRyJy4i9YbzjgcJZAZb5v2SyZA5H5Xb0GERYBrqwUl6bnqQ4nhMD5g49+7RKcWw9f
	 zxUlvwVXh0OwsJg0srSlx2ZuRyLwp8MVXOHtRUuPgTfPeclrLjsiogjmJXjkXksquW
	 6YFTNyqX7jJKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1993F3811977;
	Thu, 28 May 2026 22:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000622663.1533055.15769855435349783549.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:26 +0000
References: <20260521140219.GA1707515@rayden>
In-Reply-To: <20260521140219.GA1707515@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 May 2026 16:02:19 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull these small fixes for the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fixes for v7.1
    https://git.kernel.org/soc/soc/c/9193ffe5b478

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



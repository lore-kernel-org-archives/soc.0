Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204AD254B1D
	for <soc@lists.linux.dev>; Mon, 12 May 2025 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040391; cv=none; b=SzsSX09FIwFKzNw1tByB3ed94BZM1VDlz8C8z2NoluYgD2gR0KPQtwp6+1EkEOkg5yKu9EQu4mKH8VJoH2+WdlxN3B/VUeaiQ/M6IaPakrTm7NVkjfF3EnK6GSJQQ4cHOUIgKKR++VrvLRI1OH3QlCDzVHcj55Xs0QB88xEFbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040391; c=relaxed/simple;
	bh=mSId44FE7dOlNIm+RCt4anT5h7JIB5IqnCL6fdMA0vU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kS6EzBJS4PPiJ2vNx8parVgr99sxSacnKMnyIaptiyialT1DudlMRMZQZ/EmnY3kKSdfy0HYRgrXWjcb2Ltjo+AmIousYOdmVLQNhUiAqAgQjg1nTUXYwzw4ubT3yLgAwhnja0bHlZQ/8IZ3YrFQuEWzm18fUhwReOpt/P5h6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RifX1JbU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RifX1JbU"
Received: by smtp.kernel.org (Postfix)
	id B4944C4CEE7; Mon, 12 May 2025 08:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CA4C4CEE9;
	Mon, 12 May 2025 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747040390;
	bh=mSId44FE7dOlNIm+RCt4anT5h7JIB5IqnCL6fdMA0vU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RifX1JbUJORSl03D9f2kAiEzjyZxq2AuKJ6VPnDStFVt/OUGnCu+EdfyAAe1ClNS/
	 /XyR1lL62qypX4FiaDfAD9WT2KM1RQsOnd47OqjNTbC+usZ1b2dcQ6G1mPLpdlvmky
	 pvP7fdUdbNzO5qousd2Q7OjuJToY0fBxiRF/nMZNqctA/ruJ2OkSUmH+Ihx9vE1uuu
	 YFRMt7H+A6Y3RicSxFn7MYtoZJecAu9MuNuu6eqYzM1jpBNZq8HZHYEUgYGJ3taWbF
	 mPJ98rftYklU5azCr5yNawF0cC3IDLira9edGMQLyp1lW8VHneCUTuz6zBrDKs7fac
	 EnO4RMX3x4pIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCD439D6548;
	Mon, 12 May 2025 09:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OMAP SoC updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174704042850.517485.17473545536149072451.git-patchwork-notify@kernel.org>
Date: Mon, 12 May 2025 09:00:28 +0000
References: <7ha57jrtkl.fsf@baylibre.com>
In-Reply-To: <7ha57jrtkl.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 11 May 2025 09:38:34 -0700 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OMAP SoC updates for v6.16
    https://git.kernel.org/soc/soc/c/2b3949f526e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



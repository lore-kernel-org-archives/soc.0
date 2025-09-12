Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177E03074A2
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693407; cv=none; b=ZngLCqjK8P5jUpniCzRxP1CFhtX5BWp+ed1JMHywJENezx/kSODcVOSBC4hwLuKPqxuuhbBJSqwVm/6pnjO7bpr5OrTNp9ZYNXTvmsxw4qrW7iZrlh6Tfn6F/GQj/FPEnZ5Tr34NlIOxAsKASN8pHYb9mvevihDQSSr6NYisZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693407; c=relaxed/simple;
	bh=kiUo+C05m62WJNHZj59YIpcE/M/JTfUl+jzHojD5eqE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aAza7d5oCXEfSs0bJwbT3f9xZ+sshGYrndaTaK8CwtlxvX4IX4Ldx6K4QMMd5+p+3c/ANbYpw/krOJKg/yTRag/bvJu/xHtnNIvRnANnFqo1d0hLSRvuwGArDdTizZueqUatYtuUQHtOFQQDqHaHS94w6wWqKRrXVqb7jIzBtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu8T6oWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu8T6oWS"
Received: by smtp.kernel.org (Postfix)
	id ADCB6C4CEF8; Fri, 12 Sep 2025 16:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FDCC4CEF1;
	Fri, 12 Sep 2025 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693406;
	bh=kiUo+C05m62WJNHZj59YIpcE/M/JTfUl+jzHojD5eqE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Vu8T6oWSmQgm3favutGX/Pu5Cz1m6Q1EMjBnyVdNs+oLHafeNesQ3yGlfzIiIX+9t
	 39DvOqNnxYJiC/kNMcu5jthxULVnExiy/lXVSDgCLxcoz5vEtFtNWmgv8uZb0PYDU7
	 YDu6ebywWWJdFP9LQ2wTdNh9d8uCMoTtaNGLpNZFI63G7YbjQPh4Ql3RDWz/A7eiiJ
	 2nQNlpFdtloBwdHun+GA3dKLvJQupriZiqZBooWaz8Wsi7DIqruWCf7eTUmbkGiH2B
	 /hzDZDyaSXgWeESxWz5mr5e+TmnnmbyiqcVCjYlQoPF3Lc0/b/h/4agr+Kcc4r6wXe
	 q/ixh1Wy4JdxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D01383BF4E;
	Fri, 12 Sep 2025 16:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769340900.2998972.10343216327961294954.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:09 +0000
References: <20250904153345.2374313-1-p.zabel@pengutronix.de>
In-Reply-To: <20250904153345.2374313-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Sep 2025 17:33:45 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.17
    https://git.kernel.org/soc/soc/c/bab62f5bdce4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



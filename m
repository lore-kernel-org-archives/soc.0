Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ABC366814
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081437; cv=none; b=dOA1KGBpalhS8qyYeG7UHe553SOTfkBLqCsyJeN+AHqtxW4DCXnLT8nR9V/JG7tRB96RHNcPGhp/2rcFkCpcEXkad2O57JoD83fazv7y+7pBVjz6DuD04vlhep+d6/skt89bGR3ddq3Bqr6mKV14ei6DDZgqgUA5VqGtAPzCZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081437; c=relaxed/simple;
	bh=siK8OEJ/Ov70q511jPiY4c95u4pgo4EHJ/mTqeMMpns=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=isp+b+KqnnRwyx7TBV48XIMuzAOy388Vzr1f3IJfV2p1rCgAHq/fP041CMzzEbaFxm6xLVlPmedHtKXgbxGSW8nYOhlGc37dh+T3qSHUtXDzSs/OLUZMWA0ZXXb0CpWbgxNVaoVcsND+qeFTQD93+R6OeIZtrSIx6I3n33IpDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6lpJttX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6lpJttX"
Received: by smtp.kernel.org (Postfix)
	id 58E17C116C6; Wed,  1 Apr 2026 22:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBD1C2BCAF;
	Wed,  1 Apr 2026 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081437;
	bh=siK8OEJ/Ov70q511jPiY4c95u4pgo4EHJ/mTqeMMpns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G6lpJttX4Pk1IH9+pn0roR/h3+qhOa0Ro08Nhvzp+AjPu2XLucMnfeWvcIQxoahTk
	 sZNt12Ostn/sjPFI1JI6iWThkIysgtBs8MjXMrDM3Duav+9VvdNDkj/ZVEZ/aPE1zE
	 UKnXHP488c4vFPAwoaQ4HFYrbsPsFJ8t/65ojowflwN/RRQQpbPhtIfjTjdT36Mfh7
	 qFp66o8KFvQUAYyjfytGDfZYYNSMtouvfepxrnS7r6hMf4IiUCqi1kgP7ELgjzawSG
	 49RctkobTpsTSyIPAwtDXa5NuQ4Q3nDY9mOh9uVdTAOEpTnNRpaE4iykFdCWimv8AZ
	 NzhF8HJClQ5jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE663808203;
	Wed,  1 Apr 2026 22:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508142003.3882930.12493991782362720956.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:20 +0000
References: <69C62EBA.6000608@hisilicon.com>
In-Reply-To: <69C62EBA.6000608@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Mar 2026 15:16:10 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] hisilicon: driver updates for v7.1
    https://git.kernel.org/soc/soc/c/033d5c6cea0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



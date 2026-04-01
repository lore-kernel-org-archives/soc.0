Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1C317159
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081436; cv=none; b=oxSVLISCKCR4XwL6wZQjHgXxuroZnUTwpflpHIkprEL1glYzNrKbDCAct2gHWOB8wHwgBku04+BKqs2sU7f9cmxGCmSKWIGcGioj7PcpU8jlbyibLvsL1jVYqF84UBj53jJfH4lCfYd10NNIEZPvNIalbJwWLD92NMFVkit4ZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081436; c=relaxed/simple;
	bh=YNeBTkGnr4edkNHR8dGM4AtLqOuk4w5uSC9UnP2uxPI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ubeC/T+p0Tx4w5EL3tZe95rMjbRRIZT3eEWqHmeHVpQ2Xsa5hpFiUgMQ72wGgFCCLF9GO6N0vByktqrCt7vpPBVbboKIN/dAllfHHbAmA+0+7k3i7JCe0v+DsmptLgBSbwtXlmgL5zlyeMrEyWDAg0lJgfMH+PgV5Fy28IdI73s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wgg8StIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wgg8StIK"
Received: by smtp.kernel.org (Postfix)
	id 18161C116C6; Wed,  1 Apr 2026 22:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0289EC4CEF7;
	Wed,  1 Apr 2026 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081436;
	bh=YNeBTkGnr4edkNHR8dGM4AtLqOuk4w5uSC9UnP2uxPI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wgg8StIKxN1l5uH3T2LgOOmQmLrB+VN9m7k5CszU44mLpcraXxVLsUFZwnv8rMhPN
	 RIl0MkqS0cx+A3v+kwrir+AhIkSLeZVjozk5B/7dksEdhuwOz/y/2aax7rx9uAIc2/
	 iL2MHNvHxDF9vCrnI2CmfCG7YEzWgk4GjIknlOs/N+NGfFeeFTcoVq7AVNguQSNiK8
	 VkZfMYKWX2mXgPhTP2JHoZMwUvBjgtJar40VIgay9pCqfnUDLmR6d0/tPJpy+0Z12X
	 Z3XazhM+xrTvwM1jFtgo02oyeLjka63bgbb2GjU0COWrNQs1tK4Jwzh6biwG8hQw/3
	 KeKv8WPvlihaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DCB3808203;
	Wed,  1 Apr 2026 22:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 3/4] i.MX dt binding changes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141853.3882930.10046784043242663213.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:18 +0000
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
In-Reply-To: <20260330141444.3789193-1-Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Mar 2026 10:14:36 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] i.MX dt binding changes for v7.1
    (no matching commit)
  - [GIT,PULL,1/4] i.MX arm64 dts changes for v7.1
    (no matching commit)
  - [GIT,PULL,2/4] i.MX arm dts changes for v7.1
    (no matching commit)
  - [GIT,PULL,4/4] i.MX drivers/soc changes for v7.1
    https://git.kernel.org/soc/soc/c/84a5fe2ee01f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



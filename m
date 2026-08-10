Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1C3A1A3C
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352478; cv=none; b=JMx3WO4y4/+vu2BocYDNl53M2qo4X4yi9smPKrRxa+erUsTCI7YRlJIAw9VVdIW9pLLKZLQffWBOsK/fbsKPi2igbnGXyENNXgENJcJrdlMRxqh4J8Vy1oP/yb5AuqKcEGiKpPieY3fnDqsO5HH9ZiCLZ79M6hF2W4cPALC01PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352478; c=relaxed/simple;
	bh=XtjGL3NGIBdDlb3QtgM3/kqJrf8P1V6S9mfKFX+rCG0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b/E3gYeaIn0qXvYIPZad11g8UmKHjwR7jPNXTAPdsVh5DCwsRKBfaCgJfu7Pu2SeSRJAQJImP6XANJALlnJy3EiG9Qy5YiPLHY+YNb/2CqkE5vKRTXVVDG/mLPlk5sXUzfWSqlhTLd69UnSStoepQjZz+Un2UJ4o9UerkmeqIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGRa/umu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGRa/umu"
Received: by smtp.kernel.org (Postfix)
	id 0E4661F00A3A; Mon, 10 Aug 2026 09:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D3B1F000E9;
	Mon, 10 Aug 2026 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352477;
	bh=u5pAB7sJ+vO16MYh5g3F1uhYaivB+dT47fg0eQlseJM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZGRa/umumMT0LlS/zqooSrv/w/sk+5dkVp7GTmIOCfVx/knUWYLRMOERkTsLj+u5z
	 pMoShWQFrvaQZmR1K/FuFfSlrvPBO4CgIkKyUXzrw+8XRUhr4TjsVzU/bnjAiBIWa5
	 UrWqcORPtYyE8mxU4bz2rShIfZJMMkfoTmkbyYXwRy0HzxN1R6ul5JQcJl/uL1lpzl
	 U1MYSPPQSueUgcGoFNpMq2mJPhUnoxtD/mT+J1nFdT8ZmHoM0DdLKp+HQMQg4Ix3CI
	 wnJ4BegVQ//lal0DVDORmVccEtF70n4lj81of3KNeUrAV4IwmrWKDmnjgl+gf9KN78
	 aD/DcGmPHEDyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198FE3924FC2;
	Mon, 10 Aug 2026 09:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: OMAP2 updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243372.3658557.5655604878207977839.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:33 +0000
References: <7h5x1rjj6u.fsf@baylibre.com>
In-Reply-To: <7h5x1rjj6u.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 03 Aug 2026 08:51:53 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: OMAP2 updates for v7.3
    https://git.kernel.org/soc/soc/c/7554814adf09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



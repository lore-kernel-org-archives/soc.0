Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F63264E9
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080256; cv=none; b=r8zChyDY0YJN3gt+Q7/SPwTZ+5iEDnMGjfsQ6wXx17WyIm3JIdC71VtZI0OAOppQhBao3sG7YgkLBQ4U0s9qpWGGymksBuKEOSEM20vBLE+UzKELOGXf/yj2Wn8W/h8eDMjuUojg1gh2WO4p5IOQLZ12s8FfPz3HYxOheZ9GR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080256; c=relaxed/simple;
	bh=kkRcp7IKqGG8M8Ca+vUND4JZhxWh4HcFmytTPUmQKKk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BSykUlU3I4nOMxrszCfiMPCxiPVGm3TF1J8A23y94ty3rcqPPA6ixpJIcHbkApkzNghWE0n7kfnQQ1JIBquj9iFmiKmPn85denDkR0ZyS3H2HST8ya5sYqo7av9HI4BEcQUmyk08YW9JruKquxESwBOLcNqOzVfCwgETLCZX5P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwKm4eoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwKm4eoT"
Received: by smtp.kernel.org (Postfix)
	id 933E6C2BC9E; Wed,  1 Apr 2026 21:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7DDC4CEF7;
	Wed,  1 Apr 2026 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080256;
	bh=kkRcp7IKqGG8M8Ca+vUND4JZhxWh4HcFmytTPUmQKKk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SwKm4eoTuLsK91FV0D7g4u5OX8A9gY83UBkXaOUZvbKt/P+eYFoLYdVfXrUBdzLQl
	 kZv33ox++rm25inIqljjUwJs2M8gvrjZ86LOQgfVO956E1oR8TiozJdCx12AjtmC8n
	 ZQdHgIN+8FlsGhCqoYii1eJkG7MGoadw1v2Pcm2Ubt66GnNmjBDIs8e7AaRjkF9rjW
	 5WRZ3lEkIs3rQ5CQ8+e88XmtuFbBUQBh0eUnBMgepPZnJEsPoc+eC5Pu9aWcFt+HI1
	 z7qu3PL9JA+jn3KRFytHb58gKwyPiCowfcO6EjwRRqEJW+KPOPM2UlJSdICOJW53gr
	 Hp+/Y9K0VC4Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE263808203;
	Wed,  1 Apr 2026 21:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 7.1 - Part 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023928.3876275.6886864500219345374.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:39 +0000
References: <acktk8WGYYRGjTow@home.wens.tw>
In-Reply-To: <acktk8WGYYRGjTow@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Mar 2026 21:48:03 +0800 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Device Tree Changes for 7.1 - Part 1
    https://git.kernel.org/soc/soc/c/0a1f536c9ffd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



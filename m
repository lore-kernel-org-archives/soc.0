Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521923BCFA
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826224; cv=none; b=TRCk3IsaGDk/E/LY56QA0EpWzE+IjSxXAcEyHSePBiuosuZkeZLRg00tcNjExURQAWdI+TlW4B8yWzK81uTf0uapnVXVAnxwDgDctofUdXHfxWVSB1wDJPPZ9L8nVORuWnOODaWwTpiw3cjKM0udgXQZ6Nyn+7vromSLcW92afc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826224; c=relaxed/simple;
	bh=sCypZd31LFz7PkGv/0XgAs0ok8cC0PiDkZ9uCazEWZw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XY7wBCfcXFFn2ofKpwljADBLG9PnhV1PY0f6Wk6LUSs/pCE0484Bg0fnLWiXsNZSs0bJ/YTBrYQotrXy9E89bqQztHfYExMYBPeo/ZnqxBkhfnLsymrFV8sm/c9+t7NJXp68aelX0AIbC0O54hy5Zu48/z9ym+TrvTZT7CcUXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqxbUK76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqxbUK76"
Received: by smtp.kernel.org (Postfix)
	id 69008C4CEEE; Fri,  9 May 2025 21:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F018C4CEE4;
	Fri,  9 May 2025 21:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826224;
	bh=sCypZd31LFz7PkGv/0XgAs0ok8cC0PiDkZ9uCazEWZw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JqxbUK76zdJiAybscZ9/KCDk+pR/vZzllDVmumdR+SDxzBkXfqJnsSJ84ddNRDKrr
	 /T+aZU9laXeAcoqfUaT8rs0izsbVnQuBbCtekHlmPLc3Ol1WUGPxVXNRVHid55HiEb
	 6WUvfIZYzHGAogwr8tv+bWfvR1t2byk58b2TtcpmkoiJpzrR/TLtgCiILB7Yrv34yQ
	 H0GWBzZX7OAl2HB4OCSoEkLTL65A0rLWBztHwQpItk64bGLqVqxpBngit3MFlamJGv
	 fQPpORu8RlMp5tBEl50YspTCeNRUKNADs8O15XVQ3kuVdZZIkDtmQhPreNMi1uJXPu
	 fqiTm6Y/TXClg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACEB39D61FF;
	Fri,  9 May 2025 21:31:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682626249.3817276.2846152065123728349.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:31:02 +0000
References: <681D9FC4.6080508@hisilicon.com>
In-Reply-To: <681D9FC4.6080508@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 May 2025 14:25:08 +0800 you wrote:
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
  - [GIT,PULL] hisilicon: driver updates for v6.16
    https://git.kernel.org/soc/soc/c/fd11231a7dfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



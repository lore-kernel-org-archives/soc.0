Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEC37A834
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106433; cv=none; b=jD8UFu9MfpJ7lhEOZVxqa8dGxb3RHJUh9a4D7Q83C9lgLvJxiU0mhgKBem0JJxz3hWwie3GX2bTpjV8YmXEBd9W+Y/+yfMqOdgtowzcoDhvRilnE3vN8upL8JhGpUV1deqUA8bzuC9hvjdpEZduxm8ZHpSb+rpKfcxs2vfhjPrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106433; c=relaxed/simple;
	bh=IuNjoNc5BZc+F4fkQNTnbEZjKr9evzXCHJAy0iQ4cSY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bHzhNmk9WLk4sD4/EVh1TWmB/Xj0LqNcbEW33xjwvyFR4d+Irnl008l+9aDSqFTuoeoOxa+5Q0zjAzG7ZQd+4bF0/nLPl1z9ySi0jS6vAm5fkonDgpG42SZ1aF94Gl1vWZLEN/LTDNz1MpRP9AtwPDkgZcuJIinnmiENyGdeKMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ68TyhD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ68TyhD"
Received: by smtp.kernel.org (Postfix)
	id 958B71F000C5; Thu, 15 Oct 2026 23:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1DA1F000C4;
	Thu, 15 Oct 2026 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106432;
	bh=FcASQTMnFkKiwFHlqhxX4YQXIL1myGTI65zO5whIOGg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JJ68TyhDjrlqLlt5bMI16iC0SxhPC8af6WG3sphW3nnJvoheDHnOYETc5lhILDtLw
	 HzZwtLLeSLEmqUf7b/Yfw8tdGBae+w5yQ5p0vsIehoy/Xr5l2CuiXnCA2Lm/K5zBS2
	 qIpcN30mGHFZz2fbPSfLt7BLSYJf87xobm5eDNl8IiNL7qYUNzcGgT5bI9dclk/Z/H
	 rAUsMspyG49LeNoxeo668o6Y7nzGdlBbwq2an1S2Bvu0h3sp6BPSM/a71i5ShPt6nc
	 O2fPAmckNnVH8Qv3ZCkEPL3ZcBTIhWqsaTo/vmygTZ5nWEksF3QpQyN5Whk/YrZvVy
	 NQj7a94wcbhMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772CA3808209;
	Thu, 15 Oct 2026 23:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210643101.4150336.1277983070498094776.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:31 +0000
References: <asZZLRnqygKV8hMl@home.wens.tw>
In-Reply-To: <asZZLRnqygKV8hMl@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Wed, 7 Oct 2026 22:37:33 +0800 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner DT Changes for 7.4
    https://git.kernel.org/soc/soc/c/e0d81b7e6540

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



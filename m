Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716129B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023235; cv=none; b=dpeKN+pJPFgwkZORnLf4tjDOplAbiNpwuZ5X06/P34aHnM2z+xutV/Sj0SIfeHY9LXtF16aZo9v+Bdv+rAUJd/ods57WuDvF2HCjQx9r8OQk7YKlTZ+NkN+eJ8oSEbAFlVOO/yelbHSGK9WOMpQ4IoGFmeOW5YYsRBg0oTdjMuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023235; c=relaxed/simple;
	bh=sZZGeHB3cngrK6/SLg+1/DhCp2BRqG1U+svyweYibi8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q29ALh8ekBS41YSTIY3OeKw3zEcJMGC0smEf2e72SnhfsR0qm4TP+fgjHyklgbgjHkClOa+QptBYxFpVj/uGX7vnSJzGV5bnc7tc2ikbQtaauTataGXrZ7HWNs6LaOYXpoHQ0dNUMB3ePdgEXcW9jvc1hB3rFuB0SUsfjWgjO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMG3wwah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMG3wwah"
Received: by smtp.kernel.org (Postfix)
	id 201F51F00898; Tue,  9 Jun 2026 16:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4DC1F00893;
	Tue,  9 Jun 2026 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023234;
	bh=wJVxjM40pfeW05/cnod4rWV/l1XuaEMiAiH5LtJlBnU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SMG3wwahJ8CdehbQXYCIWnPHiYiNbksfv0ioThEMV4N7kxUwaygzc0Nb+NcFmi35I
	 Zl/Fn/YOwo+fuDk0rFPMeACV30AZMOwLBf3U9S+Ji5OJpSA7/aHv5TMTuqdZ6HtstF
	 7P7ujZUEuf33kIBJ75ElDYJR5y1p8xyDxdnr3grduayJNvlrStottN9uhBTJw1kLXV
	 tQT4FiL6AoVHs81GDAHsL+oZzwWVWVF14mT2RMANgDYp/CouhBLcNhSBxH/4FjXPTw
	 xhBeLRk0wx8Mb7SczdrCkZdEIpzCBN79Z/z47bW1JloME3E9uR4tiJYbJJKqYGQhdN
	 Pg2/66vcMpL7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A023930989;
	Tue,  9 Jun 2026 16:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.2 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323213.2135346.1473477658792199932.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:32 +0000
References: <21578066.fAMKPKieAE@phil>
In-Reply-To: <21578066.fAMKPKieAE@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 06 Jun 2026 00:18:53 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip DT changes for the merge-window
> for 7.2 .
> 
> The most interesting addition is of course basic camera support
> on RK3588 which enables unfiltered camera capture (i.e. without
> postprocessing for whitebalance etc)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.2 #2
    https://git.kernel.org/soc/soc/c/a9219ea848a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



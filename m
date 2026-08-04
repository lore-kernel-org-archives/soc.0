Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA083ED3B3
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874865; cv=none; b=HLSqP6Tl5MzVfZd89j3aDOUjcjEHtqI8JoX3peshdfWte34YNECdgOTbAjLDkrULEi5mXt7ZB11l20/ZsMv0KAVVLHPLzroLKLWVuLEoQRUEGLNDleRUeC/+BRllCySg1DEDneYyTTBFAhxYRycphp8aUxrsvP5nZnYUaB5KKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874865; c=relaxed/simple;
	bh=m0zkvjFD9lkqMENP2pCs+QW+zjyWHMKANPWns1jrv+Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OZiq4SjfkDG6C4Ev8gvIA8605h/3Yno84vBYMvJTLsqa8eGooLR6TVSaIbg+qcVi//DJiTflDbWsyhS8eYrNeZNju8xcdRE183qKMSykfymbN3rEX85Vglx9t/p1BQFCuPVzfSn8rMFc767T0V3eztYcmNPDfglQrZnO+IHsOy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKOlkEWf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKOlkEWf"
Received: by smtp.kernel.org (Postfix)
	id BED621F00A3A; Tue,  4 Aug 2026 20:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A896A1F000E9;
	Tue,  4 Aug 2026 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874863;
	bh=M/wlxAPzak4dul1amN06mXvlRahopuoMOM7OtkMZTqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DKOlkEWfuRcIC1hOdtbEohr02sv1yqbGY6rKVSVGPTUGBMU7ShTBK98Yr9w3/8wo7
	 IWHTfLciNWfhKBndGwbjiqX6ZBYMp0pMul4gjuZ8nC4cb25AAf4rBHGXuKUsKvIS1s
	 JtJtk1Ftwi4b1Sc0iUr/xS8YvMcGmu3vmvn/DZ5loMVdiTGyXHGuuutxt27+XJ/fEW
	 9kyqmeocvNfl6tgmGqc6WYo6n1LnwjOIcREORzKSM6cz6pj+sO+bAWQ2B4uG1W9RHg
	 R7imyTOtgPxa0Fme+TTXGLN0Ngoln8J2cd4HimohOGGSR2/M3TaV4gl7fIIzGcaoIw
	 JHkmh4KPtNoUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5687539263B9;
	Tue,  4 Aug 2026 20:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Defconfig Changes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482388.3769923.2379783498601304483.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:23 +0000
References: <anC_IPRrMwKHzc0e@home.wens.tw>
In-Reply-To: <anC_IPRrMwKHzc0e@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 4 Aug 2026 00:17:36 +0800 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Defconfig Changes for 7.3
    https://git.kernel.org/soc/soc/c/ec26714d2205

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



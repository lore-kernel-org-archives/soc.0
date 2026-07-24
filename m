Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65556443A86
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911250; cv=none; b=Qdhht5P2IHeZF+BfrwkWvwSjoycu/sSAhml7YUYSaHPhzcY5F0QIzKgkNykhn/zuF5SEjTRf/AY6l63wFkB1hrhiNuYLH/E8pf5cVbCENFXliDfXCSDcabOAjLHtFBDvNqO/tMe92+JSR6bAcGqp/Zb7vtI+nzSkLv48AYKrppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911250; c=relaxed/simple;
	bh=y0IWv55m72Cwcs1CScNqvDzdAo5vpa4FUsgB+3Ecr0s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cX/MXJiGn+FJ3kriw2vrRBO0A76zyZJRO8SRSwIYFkCo0daUJBEAOqgzxXyLWajqEoB7fUlwTsZoeCVMv9lmh3GA/XuxffAouWz3NpzgCgLF3uBCzCpXkvRtu5gPC5CSysIrKn3FmCSEI5Szt/w/m74fbHDrFV58PFKV02uprek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dokO6N6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dokO6N6F"
Received: by smtp.kernel.org (Postfix)
	id 624C81F00A3A; Fri, 24 Jul 2026 16:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C17E1F000E9;
	Fri, 24 Jul 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911249;
	bh=4Q4OjhV4ZojKFjBsgYwe+xF0o2uppCjcsAR5w8JspDw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dokO6N6F18IlhNQOS41MmT2D6VE5d6FquogweCxm/XIYgAA4ynt15MHeRZjL45juR
	 hAaDPUoAcH012vNv7ajbXxlWbjvbP7iefPw6/MAkNSfnNc+fRP608S4PIqr8kqS6na
	 yl7oW55NeYCVM+kjNIzVV0IBTcPrLF4uswjtZVyuufiv6jLwP95yhUDEDq/3RxuZkZ
	 u5oix8AwkKgAtHpgti5gENoOWrKJgd8urKR/HFSLiYrG7C9BHMHiGNKjF90ReoGqaO
	 JiNXsOCf6flZkbjcJRh7Cav6fQqHwEvVIRdpitFh7btojzG0Y9vRRTwOmsyQyVxfZQ
	 +04zvpGbJpS4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D098839263A5;
	Fri, 24 Jul 2026 16:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx ARM changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491121638.3229915.6248304628756281240.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:16 +0000
References: 
 <CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com>
In-Reply-To: 
 <CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jul 2026 10:07:01 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
> tags/ixp4xx-arm-v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx ARM changes for v7.3
    https://git.kernel.org/soc/soc/c/9212f660d34c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1857343894
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023245; cv=none; b=DtKId8LRKi9e6xcG17BLs0eiaQ2fzmbzJHgyAn9s9vovm0H2luid2KqIK57UL/QZ/0c4OpPHmUzH//ScsTLBOoaDU3CfcsA/ER1gyXviIixKgXQYPgtU5EOJYboorVDfHgLxNUhqLgdbrKgTY5In/2Z1JpEocaLFo+giRFbvTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023245; c=relaxed/simple;
	bh=b78zp2WjtPV2sFmcIqBO9ccvSMWu3eA+fkX2LpDJSLk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YP8cesk4+28kMMB2Tr7zW7Z1Bp3HbuIwPREa0XuDi7EkTlm6bRbA21n2eRJROc8LSHtCXniIlPC4fiR/yM318oMWlM3ORjsPYkeg1TDHF03WvIinPsN+HNrY4rv1W5VlchhmUbgCYdnxwU8C0KWKDD6E8FoAzbDv38/w9ER/zhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DITxeRnD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DITxeRnD"
Received: by smtp.kernel.org (Postfix)
	id 98EBD1F00898; Tue,  9 Jun 2026 16:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BB81F00893;
	Tue,  9 Jun 2026 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023244;
	bh=EYDkVr8aJ75my5iyTWb7DxwwPtiabATuPxNXVA0UwIU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DITxeRnD/8nAWNaOe34Caw44JKQmtzrkf8tMO8JLt7h50SmukNuXEbmfy0cB3WhaQ
	 YkgJ4XNdJoW2+DC8Wi4GCQUc16ftqzughmNPavDTooslb6XN0d0d9c0KtNRuv3wRxW
	 OyCKB5KDhTJfrclQs8NLywG3L2DkKpM4H77T6W4DTCe4srTnF/hOmCQVLfA/vobXCg
	 f9psBz/iOIen7dZuyFb0j8XTayanHEBZBwfJxmmjSaqXV+1dWFkEb4+nOdBCmk6LXy
	 hmPRat3KQzFA8U0KSIP/fPRh93qItfPyX+1v+23HsLP6qExXexIFnhcA8vE/wzo6i1
	 O27e4bi5Gn2fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199763930989;
	Tue,  9 Jun 2026 16:40:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT changes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102324263.2135346.15685770650902973948.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:42 +0000
References: <20260604102600.3790-1-sven@kernel.org>
In-Reply-To: <20260604102600.3790-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jun 2026 12:25:58 +0200 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT changes for v7.2
    https://git.kernel.org/soc/soc/c/b55ed7310686

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



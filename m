Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517A3E40EB
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033832; cv=none; b=Ug5XKSjgouGMF0kX+J2yFr0Se296+W2E2wSi/luvT53klg0fhvdLN78r3N4Thtv6/NHHZeiTfbefeMMzLC6oI19Ie7EV5q+CZ2Dq0Oz6YGH8LS4ZzfrTjg6yngrLhzKSxbLV/ViY2EpZ1u4WE4HvWhcIhfW0sRpMKISsKkozlxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033832; c=relaxed/simple;
	bh=2bWpmQmtQuKXrN323tXIt5pEOJO3xsBRZZqXZJuSccQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oHuNjRoRPag99HT8dD9O/WIh6YiJbAgxEcyWv+w+TW5swjetpy+9eozQNr9obXetXmyzKc8EsqQN3qPDw/cOe30ukXytmMlk4QYJ8dBzscAilzXbxV2NIJHdhsYa+TTP3Idr8Ac0rFc1gLJeqFO12AxQ7qH9nUAtkTlDn5iPuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpuLMygv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpuLMygv"
Received: by smtp.kernel.org (Postfix)
	id 226F51F000C7; Thu, 15 Oct 2026 03:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4F61F000C4;
	Thu, 15 Oct 2026 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033830;
	bh=AouwVkgK236QL6JHp/kPkZinWKxId0W7uOcrNSwrnGg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LpuLMygvnIxwLja3t26ta0iTZqRyP8Z2twb8FYLBnfxwack1g04J2N0JSgDPIU6K5
	 N2zMhq2CuCWuidg+YNG2QU/peATZSiwsUIsM/utA1FjskHCCR9hGRyI7SfxBNj7pmV
	 05k2BbxQifHtum8TKZs8s1cQutDXqb1iDklCoaOo83ludm2UJp1P/8PNEPScLum38i
	 PmWEteiS1mEzrNsIIZOjBqTLLaXHaGNDf+iuT+p4pQaHIUzPv00UVQ5Gmf1wVjZSq+
	 +Tz0wMQ5GWJU/rbJoOHsvY6E5gzQkzSxFM+s9n9LQsTrUt2uq382Imfb5pA4Mtw6id
	 QZ4ygs7WF7jsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1521392E992;
	Thu, 15 Oct 2026 03:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v7.4#1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203382851.3155468.9541892301905386115.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:28 +0000
References: <44917365-a20e-484e-a252-f420f566ddb1@foss.st.com>
In-Reply-To: <44917365-a20e-484e-a252-f420f566ddb1@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 2 Oct 2026 15:37:10 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT changes for v7.4 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v7.4#1
    https://git.kernel.org/soc/soc/c/32ac8f2a7246

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



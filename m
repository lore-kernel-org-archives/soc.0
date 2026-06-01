Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6473F44EF
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345803; cv=none; b=ZzxqOG0q/avpqwyDAXaaxgZ+42Kt1qNO0P84BlSuXafpZa8jeL/BOOLmPSUAbva4MlFLubvCviWJ7CM1iLOrQztX31mvKwNcHxBrwWclG44BRmLP1VQDwDbLBzenY/CCeJyruPLgJzRDABKzaLCW8FexSsTsbw2ZgW18j0nyilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345803; c=relaxed/simple;
	bh=/G1sQD0+ciDy+qquKnmSeckZepS+f6iFqCCnKNo8Wlo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ml5v3la2ihDQ2keX6W+4haHgc9nDaj76p8r9X24DssE6Em0bGqNs79PLyPKmMd6xCZf0qXrxLp7UQGKoXP8k1QfxgwR4jmZJUpU8XmWMpydqAt+Jkj5tGu5eqzX013Bemv8cnBol9xjRiYG9TDVrW3jarX95vlbBb/7ULyRsvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLOvbzv0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLOvbzv0"
Received: by smtp.kernel.org (Postfix)
	id 201981F00899; Mon,  1 Jun 2026 20:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D3F1F00893;
	Mon,  1 Jun 2026 20:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780345802;
	bh=toL6WGg2FQNmQIWMBV0nOx9X1beOJjFj6q7oYn5UKtU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CLOvbzv0aBYFuGfdN9DiLTLedE5VIFdfxzwoy9bHV72MbiuM0USMQFFBOR/Nt8Myt
	 DbSdbhL70raV8A37At6lNATv/DWlspnGYBWXZJjrSRFY4F5B0Y3Us62+u/Y4Qz1DK2
	 qKgd9oc9kf+AqUpSsqT9Ri99V6LpIh/JLXMVcWdnnMY0/jp/9FTd05HqgmHy3KQJ1d
	 XHkqUGBjwYFNo+crHd1EjhLOj6rk/KSoe9j7WAkahGnt7rus3+WvYyedBii/XNWMNP
	 VPjGQcxw2sTDSuP9Au+jvFA+9FAdtVETFbLF9g5NHOgqtQTFZNhQRz/5ZFyUp/skje
	 6XW05xK2TBntA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9397138119F4;
	Mon,  1 Jun 2026 20:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178034580439.84967.5472680964341700469.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 20:30:04 +0000
References: <20260601114010.2652407-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20260601114010.2652407-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  1 Jun 2026 14:40:10 +0300 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 fixes for v7.1
    https://git.kernel.org/soc/soc/c/d4715546cc4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



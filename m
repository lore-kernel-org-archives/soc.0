Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F522258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162564; cv=none; b=t0XFuiigRs4JvFSJV2SdPN6lw38wqQdbLDVxCznIDAS0dRFAb/NtDR1d2Q+7pIsebcKurx0QxSTi7QOx6GgPeEkbX0D8cnw8jtgZLAQ8wxZII4IVebNmsSEv8iNQnY1ZRcO02EnFT08TI7PWQcbTKAPx73zJm3z3h96thyYkMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162564; c=relaxed/simple;
	bh=e+n5y42YkKyL58WunyNEuGfZpD+gsoqbMAfx3/gFZPY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IAmtRhcaGaudvwFwKvYwJPgo3l84X5iQ0wCntF5U4JicLWRKuOI+oQs+olzjfzZCI5pb88DOgeeLhd6Qjm4YLyBoBLE7pFdjQy3vT+TF9YU2bxftynxV3mQ9Mx9mlnGB9s3HowT8rYr3xtbMw3sI+J29P47ZwfDjZYvnFwbignU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hyh2ko8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hyh2ko8m"
Received: by smtp.kernel.org (Postfix)
	id 37BB1C19424; Fri, 14 Nov 2025 23:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C4DC19421;
	Fri, 14 Nov 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162564;
	bh=e+n5y42YkKyL58WunyNEuGfZpD+gsoqbMAfx3/gFZPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hyh2ko8mC5E3my+AZTo8b4AP4FryuujLflKrDKYNWjtk9FOevPcvHZ+ayGfWGLzwc
	 IqsjPty0nOdqXypB0P06VpiN9yj1j+lQZRpJ3yRw7ToHNcvrvg2Vs9ffjIFcDzr3hK
	 2k++qUjU9QWHxwhOtQubcYe4wed6V86ZL6Rp3PNXJv7p9/U6c6sD+qDwMqZYGxi39N
	 tqQ4qDItIrgFaB4C+DAWIWvmpi4g2gR5xvWxAJldbbXMPJI4vCvZoNJ3A94GrrqciA
	 ZSBAS4h3RoH7b5Shmm8aSUE/7Ga+t5m656RXBJkNikxaz3Ul+3i93yqGAfU8lHbS5j
	 5yYzZfnpQ7tpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF2F3A78A5F;
	Fri, 14 Nov 2025 23:22:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fix for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316253224.1867843.10898713432130271791.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:12 +0000
References: <20251114073627.GA1362600@rayden>
In-Reply-To: <20251114073627.GA1362600@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Nov 2025 08:36:27 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small kernel-doc fix for the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fix for v6.18
    https://git.kernel.org/soc/soc/c/124c98b10001

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



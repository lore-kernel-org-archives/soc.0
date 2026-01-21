Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220E276058
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011233; cv=none; b=bAzbu4xwK4/RKaS8wbkMuXlSBStQzDsDAtucvuz2FZkoDU+y6TNBrXEQhXReIr/FHvsWmsGfCpypbbKetAnEGPnNuO7121DHqjOjx9a7FWsU6VUyRHYBZr3Q4ldG9zZLLsRex8fKaGV39/VRxQtjlvFDINqO4qFla3XaWq4O4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011233; c=relaxed/simple;
	bh=tdvSvPW1Zq27UdAhlKSYT/4qctiY0l9dGn3TuZunMyw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ay8THNiMhovJFs60GR900TlvI1Re4cKOEumPtG/uaUBk7GkApStuXbW3cazFQICInNI+sxWV5AD7XU283+nqzzOCVyIA4lWodA222ERRdtaybfyHKGNiYXcA4Xm0kYfWfHY3fWcu/bD3d3E1osI0wnDkQCtXuZuvJdLxTh/stv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzvhmE19; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzvhmE19"
Received: by smtp.kernel.org (Postfix)
	id C8C11C19424; Wed, 21 Jan 2026 16:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B5AC4CEF1;
	Wed, 21 Jan 2026 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011232;
	bh=tdvSvPW1Zq27UdAhlKSYT/4qctiY0l9dGn3TuZunMyw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mzvhmE19w/rtU8qXbLrEI8t5lwKX8/A+qrcj9ULW2UIwGJ83o2NZQZW2g91e/a6fU
	 EidK3bGrhRysIa0QcQzVoA7OhZ/6JKv1pq5qVn5nU31527/NImhbclw7TIltnuXkbb
	 m+Tx03eIrShLrd5rk1zLBNaTk1Vu5BN8AiH41KvgdLUJ7XtM58wbXYWUsUIZq8bD07
	 dYDlILGjZZ8gOxeaMRE+KjPN3AotAqsUaGoi7f/QKHHn6M92ns+MPYYGw2KDl7PP7q
	 caDg/4ZdQax7Teq/j6+TtJ1184ONw3mZg/JUy9tH0lhTKWBeuaHKvqrec3XZMx7Ef8
	 qnpsu8fdZyUxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11BF33808200;
	Wed, 21 Jan 2026 16:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] QCOMTEE fixes for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122959.951664.15178025782118586682.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:29 +0000
References: <20260117115312.GA255115@rayden>
In-Reply-To: <20260117115312.GA255115@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 12:53:12 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull thes three small fixes for the QCOMTEE driver in the TEE
> subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] QCOMTEE fixes for 6.20
    https://git.kernel.org/soc/soc/c/06e981ae1648

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



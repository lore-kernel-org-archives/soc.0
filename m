Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CB2D6E71
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011219; cv=none; b=RdWmUQzE74ziQix10T3Kp1G9WJ1rSLmjTTu4MrVJIKju3ZJX8GhuJSC6/3zbeuprXzGdMTucbgExWAfHhOv2cLu2wiz+8ZVoVpr12edt5Tv63dbbvvwsh5WNBJWKRoh3IvJM+9I5OOCbapB5H1Aec+zirDfWCKnu0/jA+XKxQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011219; c=relaxed/simple;
	bh=QPLWN6bjAODbCjg1Uw1QepmAnnmfWOEle8cROilQjnE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FSLTSnwnBy0VDwiNEdlqQxa2uq995zLu3M9zMxkDMf3V/ReYpjsCTZw9FEmqbDWxZwd2M9fCHvDcQZZm6ud3jRiROV5lG3tkdrso4rwsT5utdXZdmymLFiR+tTc8fpaNX6rCLhzBDkneDdQkh5eG1jOCLMOHBlXhrmEPsAJNsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJsEme8C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJsEme8C"
Received: by smtp.kernel.org (Postfix)
	id 9117FC19424; Wed, 21 Jan 2026 16:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC3BC19421;
	Wed, 21 Jan 2026 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011218;
	bh=QPLWN6bjAODbCjg1Uw1QepmAnnmfWOEle8cROilQjnE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fJsEme8Chdd50R4buQ+BZSv1UX5T3k/LH1vE1QfhDdYmXjpGj38Jb1kNnCP84GHyI
	 F8QcPrus75PFCijG/LMr0ZT2Om9cl+6I7ERMbVBJfU24CN6zSx04Qp0AD7PoUgeUyN
	 NA4/tanXcde0oqlgdSf9GcNck4MQXThtEwnuqiM9SmUzZzO4q0JTemAdNDI0laZRZN
	 1W+6T4mqDh4yGjsHvHlSuFiQUyDcugWP0qGrd0RsMIm9TpFMIZttmA4ndkgLdkhwy0
	 V2cuqzd4z9VYwkApFrodbpxZZFMSYbGptD//qkdcJFsy1u6r2sATDqWg968Iz0M5kl
	 DIeJfHRGcGvWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8D1B3808200;
	Wed, 21 Jan 2026 16:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE update for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901121534.951664.17507297318401858361.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:15 +0000
References: <20260117120401.GB255115@rayden>
In-Reply-To: <20260117120401.GB255115@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 13:04:01 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these three small updates for OP-TEE driver in the TEE
> subsystem, and for the OP-TEE mailing list.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE update for 6.20
    https://git.kernel.org/soc/soc/c/08b67ff20fc6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



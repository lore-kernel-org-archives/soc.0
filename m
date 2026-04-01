Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544003218B3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080255; cv=none; b=WFSp0rlnSI35UiUqsYNIofJR1QwPtkuKI+dcVEqvcCrx+E7ZzK+P1YlJu7U9Zf3L+bIa1fVdkNCYTLMpy9K4rpjAPbKEGuajXW2DI4kCM6ERXmb68ozR2fDrHYwM1YWraF/MXIGWk3TyYMlVDOXG1zShYTiq9jPDSaOWQOEt7+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080255; c=relaxed/simple;
	bh=v8p1PzNDOjKlrhz8I3pBNWG8JWsIoqjhklSluKmxh30=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SbR1gK7V7eDvRQz6IbKGqLPOB0oIreVtEKKPQgdxmin674bOV6z/x9KPBNw/RWwu6JdRzR1sb/o4mcm9TTXJK12bgQ3qXCVEmymnkSUyELh4T0KIbyPtL/Vcq/GVrQX3W+kyPwb1pMkasLpyHKHcnGx0uU/h33wHQGZcfbp8bxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsnG68Dl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsnG68Dl"
Received: by smtp.kernel.org (Postfix)
	id 4CDC4C2BC9E; Wed,  1 Apr 2026 21:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37455C4CEF7;
	Wed,  1 Apr 2026 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080255;
	bh=v8p1PzNDOjKlrhz8I3pBNWG8JWsIoqjhklSluKmxh30=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rsnG68DlR2euvj7+BR0D34MclgHB1q6ApUO5xQRy0tT+dnDKU2SyO8V39Q7iXauUH
	 KR/3A18pUfKviWvPdS22IBxZ6/bvA9MTvE0R5LnTKfCOIrQpapo+Wu/d4sHEg5bNH0
	 VZpnRCjhb7tM/xT6RT+j4HcIzWTIAGUQ83p8TkCEfZlGlmNnA7gMWeGrmf+iAaj2Mm
	 dkdzNcV/hmwxe7clYJgMvhkGPfea21ONZ2LZ6A+zGrkG/LU5UOPQHS5RC5JfkDIGqh
	 Tyom+FA/zJqyo3tINAd+MZ63l0Pn9W2Z4HS22qc7jl4Knddz0iwM0XOmSfl0b+cmWM
	 ifL5GGKFrjNBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDF23808203;
	Wed,  1 Apr 2026 21:50:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v7.1, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023778.3876275.5441452397728860776.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:37 +0000
References: <acly+68IaK1lWE2p@x1>
In-Reply-To: <acly+68IaK1lWE2p@x1>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Mar 2026 11:44:11 -0700 you wrote:
> Two minor improvements that weren't ready when I sent the originall pull
> request. They have now been tested in next. No problem if it is too late
> for this cycle.
> 
> Thanks,
> Drew
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V T-HEAD Devicetrees for v7.1, part 2
    https://git.kernel.org/soc/soc/c/9988201705c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



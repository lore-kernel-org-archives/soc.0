Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219A2376E6
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303199; cv=none; b=ttVe+m6124zqpD+EbX9ETVGu47y+IfsedKlAPZc8mOMptsD1tlcJ0hF/S0x3XCL+Z07VWBWUp9td+bnQvSrctAf4Gx2fACaIQA+N4HrR0b7GQ556pZ0BMu61nrblw1De0UUXaognvdK77xAX0aDFNZywJkxIRMRB77b0GaGfYMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303199; c=relaxed/simple;
	bh=CccH6QVFNkIMmMRWlHhTsrmB1bRN3IBVNSsSIWeDAc8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VP5KvPgE78q+eISEfLQhupza+2IKK68CRUKY3RlfvK06IyvICki3pwfF1rdbgLEAf7ccCi6KNNkLgO1obDUqoT2vGGk6/PQK4VSJIuesP0vVN93P5sBRsGnKOLKMXmmtkUGOUzrFaqVFsteLlku3Ck/buKFYNQPyimrjRwHyqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofkL/oPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofkL/oPG"
Received: by smtp.kernel.org (Postfix)
	id E3A32C4CEF5; Wed, 23 Jul 2025 20:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE766C4CEE7;
	Wed, 23 Jul 2025 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303198;
	bh=CccH6QVFNkIMmMRWlHhTsrmB1bRN3IBVNSsSIWeDAc8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ofkL/oPGJmWzuhiptiQzy50ev5CNwb1Fyr43bZjM7SY5kjOCiQ5UxkqHsjxQcywvU
	 y7S2OEX6C5K2sXQyCJPEzIEbelza4BIIbNSmPoBnzAm8+cJlCYZ9n1082migIOD3eF
	 YKsdWjpuKB5dQIJqJnylMUBTeNTMwzxgHyAcca8ha4lRvZE1DsqjIODDI1szPAzsQd
	 WmnYgG/fgXAWz7fODxkAPxIlfGDHJ32zsXPrIrq954BUPhm09X906L6hSi/LehSS/X
	 Mk9xig4KjrouBpln8c4iVZLJ/h2sQ7oo49FwQ9GYhuYeM6dO1g7ymaeZUzkemMcNCv
	 g7tjc1mb4Ys5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34D4A383BF4E;
	Wed, 23 Jul 2025 20:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM Sophgo Devicetrees for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175330321699.1775141.6908282038454738155.git-patchwork-notify@kernel.org>
Date: Wed, 23 Jul 2025 20:40:16 +0000
References: 
 <MAUPR01MB11072C4B088AAC02268044E95FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <MAUPR01MB11072C4B088AAC02268044E95FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Jul 2025 15:18:21 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for ARM/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM Sophgo Devicetrees for v6.17
    https://git.kernel.org/soc/soc/c/05a623030b3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



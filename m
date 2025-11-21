Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFACF36D505
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761844; cv=none; b=e9TFiblejmBxMBa9LAgkcuiRMQovsA5UVyfNwT/d7VNvPOzkX1ZHZSW7Veq7dIMJWgSVxHH+y1d1OLQo9o+tzRSnBujRx2r8ZLCkC7sx6cnXw4v5Lou4xOjZ3He9oVNFG1wV4JIeBv6qGVmma/ktwgcNorGoKy4eiyei83RAedA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761844; c=relaxed/simple;
	bh=F8CStY0wgRYBvHxK2Pjl3DhrV2v0xgsSuX0nHlyPI5k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Fb37QIRdX9b/1O2bhBVjdo6l8sMRCMhKQUXTqGvUm1PIrJfDfcEgaNBFKZChZubE0AXNdIxVVk4m83+s9CcseXDS8azS4T0F2u4jCoNR3jLCfqUspcvC87kbulxjlABmQxHDOe9SNIwTHhma2t7HOSn04wqEt/yshLRtOamdmP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHflcZDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHflcZDD"
Received: by smtp.kernel.org (Postfix)
	id 7591DC113D0; Fri, 21 Nov 2025 21:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60395C4CEF1;
	Fri, 21 Nov 2025 21:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763761844;
	bh=F8CStY0wgRYBvHxK2Pjl3DhrV2v0xgsSuX0nHlyPI5k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BHflcZDDrOsYub8WR/d7wMTXSabqaKJynAZ9ldquXtoXOgihiUAJWEOAR7zXXK4Vq
	 JD3xnFdw/69wQXOx4EZcKaRtMIOzE+h/F2U6SJB7UBVIP8TMIOugXvJEdPqQXsknWk
	 46o9acStTYdruHGnuk/4E4RtvsP1msZnZKm4yvGBfCEibwlwo53XYvt+R6MyrTYLTt
	 TvDqTuIOoMKv1eJnWqr5yZqULIeBd4ULrQiFNmW55LsaCBQXN9cBHa09YlSVJFWnQE
	 RUjlgIrcEwGSNnjfvtFyRV7/lnQ9AL3elbb6ZDDc+hFdOGw0xDZadGsoxY2fGNs+xH
	 I6MgMTc0+bmAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6A3A78A72;
	Fri, 21 Nov 2025 21:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: gemini: fix typos in comments
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176376180874.2598359.12288313490177095032.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:50:08 +0000
References: <20251023204737.2716443-1-linus.walleij@linaro.org>
In-Reply-To: <20251023204737.2716443-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Oct 2025 22:47:37 +0200 you wrote:
> From: Julia Lawall <Julia.Lawall@inria.fr>
> 
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: gemini: fix typos in comments
    https://git.kernel.org/soc/soc/c/d6ecfc55d4d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



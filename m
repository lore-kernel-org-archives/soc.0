Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F521DFFD
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688431; cv=none; b=Zul5zV0QQD5NiotJJqqhES3gTeYWq2dwo6mAEzMiMxzcmXJ9WcrbaEI0VkPWcvEgO8xl0XCri4hWgek+Si3hnhrTYQ33DI9B5lsmPpfHRLwnvpGt8jlaMmssa4h6jdds4jRSjdKMMPRXijd5u+uVIV6TGS3lWzbGxmES+iweQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688431; c=relaxed/simple;
	bh=hzZjB4Zl/RoSyFNZwY1AsHmdlVVOYJR61bRj1g/ksNc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EX1wVemwu+eWxtG/11SCRMuk+HHtsq38HgyP+HeX2UGZX/lJEMhT7CSL+tjP8nc7RRcx0yI25sYM6Q3R/h2Fvh6FcpwOF7GFMbDyKhyhwshp0PLaviwooiDanp8wI2rO2Lq+EeNr/Qp6NkL1VaC21CSa7uU5ryh/B5tGLSzFqeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEs+yzWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEs+yzWm"
Received: by smtp.kernel.org (Postfix)
	id 09F401F00A3D; Fri, 10 Jul 2026 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D411F000E9;
	Fri, 10 Jul 2026 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688429;
	bh=nsVtMG+K4OZCp82ZS+sRaaoOgw0TH7MO1JLjPWe1k3s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AEs+yzWmzZ/S7QPP4XsqkED3xEZH00ZalzJFWcEZVMozmSw3ne3qM9atoLa64PvZA
	 L/82xXJkeNb3zFMZ8dnTNx4z4Btm7Fr3mSXP4JVY+b6MBdGQdFvKtlmZwfu9G7Zv+v
	 d/kM1QRAI7h+0yzXcZuwByzM1DSu7uqx9qWc12LaEYsnJ1KO2+S9lacPbKXof6Z3Js
	 h/8vDNmalIT6cQSY188Nl3FITUZwMdjTSwfXf5PkRAS++goOM+aCVjbWWwHghi3bnd
	 P1mIwcE8MW0eyle5jYcCUm9AN2kT6H4xr2qYohAIwGki1YhhnGEzPPo7EZSaX52KqD
	 nIpwtu9aKJ9cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05E8F3924F93;
	Fri, 10 Jul 2026 13:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: Don't let ARMv5 platforms select USE_OF
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178368840788.229479.18046046056193574198.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 13:00:07 +0000
References: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29_=3Cu=2Ekleine-koenig?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  5 Jul 2026 10:50:00 +0200 you wrote:
> USE_OF is already selected by ARM (unless ARCH_FOOTBRIDGE || ARCH_RPC ||
> ARCH_SA1100; these all conflict with ARCH_MULTI_V5). So there is no need
> for an explicit select and it can be dropped.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> [...]

Here is the summary with links:
  - ARM: Don't let ARMv5 platforms select USE_OF
    https://git.kernel.org/soc/soc/c/f9eff167fefa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



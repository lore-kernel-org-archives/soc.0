Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C930E0E5
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720703; cv=none; b=pon0BPfQYItg3+6PRc4dhZl3cMM1yk/62tb262ycmTfQvtXi57O4PBr8180apJir22dCIq5hgD6ETMvH8cCq+ULroFkadcMU/PjZmL/+zp/daX7Uxgr9yBauxTn4vaUllbxOdiu3+4egzmZsI6cpNlUyKvR2tv5nfExY7fKTzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720703; c=relaxed/simple;
	bh=KW/7za5xnEKvksykLKyuTW0Rd52vyF99ZQSWnkTRT8Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=V8B9HxCJHndX0lIp3+KITfn2t70ZyMi5JVgBJHYX+7n0TWFaDrJMGCKKVo1HDaH1uf2/bc60OXFsKncTuBjX+pXUv3zFsByEoHMChMHeT0U39wV6JsF8wJqtNPhDBUAZxKWFYqo4wGfePbSS9brj6NqzKO/YyVOAjfGUsz/+mfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5xkBwSk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5xkBwSk"
Received: by smtp.kernel.org (Postfix)
	id B71F3C4CEFC; Mon,  1 Sep 2025 09:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ED7C4CEF7;
	Mon,  1 Sep 2025 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756720701;
	bh=KW/7za5xnEKvksykLKyuTW0Rd52vyF99ZQSWnkTRT8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i5xkBwSkP7rgThixBncp1U+mHQ/ezFENuxyclPGxJTrgbX4HftIAuwOsPAAWTS3Bz
	 Iyf/3JphrNW9z7LIeLoobWsY+zaWj+hxk/ZoC5LP2i/r5FkNAaryzqbPvsIjMmRH9i
	 KRPpY6U6d922U9S6BGrRguZsqkOGsoT6ZwSPapbcg+UvY8tdWLhxuefa+NEGOHf07E
	 9VQ4IS1q8NfL8JBqSg0ITShlNjGeblq+87FXjsPTsteptPO7speC3ZAsf43mQg5//a
	 XbddH0pCT+9Z23zrXOD9LkBp8bwUP/wslyoLhaKk70dWBWCem1k0CQsrm7wG1uD6Pr
	 +By+UFrQZynvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE19B383BF4E;
	Mon,  1 Sep 2025 09:58:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] arm64: dts: axiado: Add missing UART aliases
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672070723.3637164.12448480234097551575.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 09:58:27 +0000
References: 
 <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
In-Reply-To: 
 <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
To: Harshit Shah <hshah@axiado.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Aug 2025 11:27:49 -0700 you wrote:
> Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
> uart1, uart2.
> 
> This fixes the probe failures on the remaining UARTs.
> 
> Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> 
> [...]

Here is the summary with links:
  - [v3] arm64: dts: axiado: Add missing UART aliases
    https://git.kernel.org/soc/soc/c/75e81743e381

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



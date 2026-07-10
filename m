Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D040BCB6
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695033; cv=none; b=tQgcSES3PO44fZZimiyK59j9cFfhPRFvD1d+H4H/rjeVuFhKuii7rkleVOmQOOpDXtpBZ8AMHjvC4sCtCLMs8bkiFtqrkInl7vgUjcjQbbDCjwEJkZO9kuX1+1WaSBFtH61pM/c3WJl5ZIMHhJEGE6UgMpV5/H5j4F88I41fOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695033; c=relaxed/simple;
	bh=WXTx7M4fbfzPEfxRZRUNfuAXn8Hs3QpclfmXleMBdyY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=I8gUvQiQeXJBdqfdUT/bLxYq2Cxw4RJTsV52bLF00yECGK9n637K03lGt2VFVfrgTuHa6faLOvwIIWKabFCJPUbpfggF6LNMTItvD0eY1PqYwvOp8imGOR6qxP5R4jItCXvImH7nrnDJ26OZzX/iGSRc4ES2KqNUu3E3RS4cfLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEgUsOwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEgUsOwo"
Received: by smtp.kernel.org (Postfix)
	id DF4531F00A3D; Fri, 10 Jul 2026 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96BC1F000E9;
	Fri, 10 Jul 2026 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783695028;
	bh=Ps0k2BteWcwvHWP1Tuk9hRqzA30R5Tmvfz2SEktYRWU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CEgUsOwox5ht1EE3Nix07J/Mij1lx6QkxhVOT0Iir2EFRPzlAo7ySLjfUSN9eq9O0
	 DqIdxyu1sTFaCzWNHgW3JCfT+3ijPoF382PCO4POmTjqTxCKzzPwDz3vR4o7ZKmX2h
	 R2jQDlds3hqjO794v9M9KkBAMTonSCghZg5OQWRdDK0QNf8I4Q6Vs3zOWvoIatBbqU
	 rOUncE0+18GzN6zACihttbwwan9LRYe9lha2XNBP/m0IRD5JvgINEox3F+UAl6bTbv
	 6UoMWw7nR/Vr4oIFC8HKYxAaMWzqe2TfiOElrkU5p5WkmqcKJBk+1YJKR3COcd86Uv
	 akojtR7oc9CIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A6E3924F9B;
	Fri, 10 Jul 2026 14:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: dts: st: spear: Correct indentation
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178369500665.720071.15970577717616198770.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 14:50:06 +0000
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  6 Jul 2026 12:18:24 +0200 you wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: dts: st: spear: Correct indentation
    https://git.kernel.org/soc/soc/c/b8e1c0a7a197
  - [2/2] ARM: dts: st: ste: Correct indentation
    https://git.kernel.org/soc/soc/c/4830d793ebdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



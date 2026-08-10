Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A1429811
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380680; cv=none; b=ObcNJAVk1xrZU0aIWydYhzaPvW3Sa8+riVsYXM5TquZifU3lSMN4g8t3kX7zwEMoasV0YMmNYj2XAp+mZdEjqR0LyFfr5a6TQ/ppgxNaMUu5Yxiapf85g4BjflIgCyp0NrNDUARsZPvwqI3z3xHxmMKCfY0eADV1bpbLE2Q1bak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380680; c=relaxed/simple;
	bh=VQgc+A+6aBd3G+UYqfYYDHUjwBNf5rZQC6ryg5sth88=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f/9Dq59OGJ+7ZSzM3FJP0CCaDxPVztrm0yKN0fQhVEKcVK2yOws1pxmqQSFTKTN3T+/688mirML+Y/N/AxHEW8bBX1LhzN82V/o+8aJQlrwxrHSIFvalbEI4yqtpVGWhzyT8ytiPQkVNEtklSTRw0X2Y3ygQz2s/h6ms1y01P4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvjzKFmm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvjzKFmm"
Received: by smtp.kernel.org (Postfix)
	id B45BD1F00A3A; Mon, 10 Aug 2026 16:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9FD1F000E9;
	Mon, 10 Aug 2026 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380679;
	bh=faknNCY36LYZzJNAmgpb03TjaD1+WpFbAKgnmdl+8Do=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FvjzKFmmfgceVe5ptzIyK9JwlZeCLN9e78LsOxEQhl9YDTAoAvvGprZgz3V4FNvzR
	 ZWdUK9wmHs6HBb1kIrDdfCjdN87j2kkQR6c+QGiCiZppVdJDYxbXgDLGoxdD3uhrYo
	 6K5QvCfqfGFK0H+iSTthw6E2hSesPcaCXyVluezcEyGQQ+fPbvgDSHPjvRbBqd/YNF
	 4XvEON83orhZPe5wp2asp516bATUYPrg+A/ikzA/JpBCmQk8M0K/KmK/89D3u0Ia7c
	 zbFFKkpCuXYKaHWjjSA2iap65gv68Jx0e0GH7ndOB0v1ZFI+cO5JPB0vmLEobJUjwi
	 1AZOE1Z2fkJMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9398D39253F2;
	Mon, 10 Aug 2026 16:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Mention
 expectation
 about dt-check-style
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638063613.3872609.11472046670400541260.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:36 +0000
References: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  3 Aug 2026 11:17:41 +0200 you wrote:
> Any new DTS code should pass dt-check-style 'relaxed' mode without
> warnings and should have addressed most of applicable 'strict' mode
> ones.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/process/maintainer-soc.rst | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - Documentation/process: maintainer-soc: Mention expectation about dt-check-style
    https://git.kernel.org/soc/soc/c/9e758d3be022

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



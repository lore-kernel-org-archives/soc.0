Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAEB2F39D1
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281599; cv=none; b=M/71ejCuv/CEl7s62/oujVL5PPzgpPkkG9E/7VFMEufOmetuHgExAjjsO8bcauwVa97Y85YaCLVABNxNniHK4lM15hVVesChTR5DqOYvawWE7pExXdFgZhjrZo28jjop0vpXYgI2gRrtgOB9kmbgSAOv2LjSqrZwjdNg2Kp0Tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281599; c=relaxed/simple;
	bh=4Y2r6sG2WZ5LfT3/maY9nEKOZ54uQn6kMi3LSZZLFCY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bJXUQbACRR3Fui6nz0a+dGQ1fAV3Kbo5/jBYk8hmw5Xmi0c5cHcyBmKBqDJSdNsaaLvQLFykA+/fVD6scwry3zTTRMBm/I7FuwcgDD2Q89/p5qPv90Bc8QmLwXCtaZ/oupJtluISGz+HUnG/be52IzV2KZZxPiH9CX1kMHFQ7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbyyWACl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbyyWACl"
Received: by smtp.kernel.org (Postfix)
	id BB41EC113D0; Thu, 27 Nov 2025 22:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA8BC4CEF8;
	Thu, 27 Nov 2025 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281599;
	bh=4Y2r6sG2WZ5LfT3/maY9nEKOZ54uQn6kMi3LSZZLFCY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hbyyWAClOex915t1dYbLQ08Tc2hpb+huAO5l7Zrx8xnK/ZlS+nZBXWx4MVrWITjng
	 zmJ5HJnpragM7IHBCoL6OwQxOnGKMS99eZ+/BcaJu1M7v2sOoEJZ5yY9IjwdJvjHOj
	 zkZH1gGvaSjLoR4gwvJUz8o989MmYDFTMQhEIeFSlQPulEhLlwD9u3ws2BKxoEjXmo
	 5PAUJjPs6sm/k9O36H6C9BYUA9X2iaXXvcn6vekDVi/3+t8M0Z6Ep9QmxwFpOpNbkw
	 sOXrbRGOBmhLaSEhJF24gsLPbbQ4T9JtKnJs6wpy2IqJMYzQduPb6h094ar0RMwXoO
	 FQat7N76zR3yg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B94A3808204;
	Thu, 27 Nov 2025 22:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix address range for JPEG
 decoder core 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428142177.55019.8813632096296716842.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:21 +0000
References: <20251127100044.612825-1-wenst@chromium.org>
In-Reply-To: <20251127100044.612825-1-wenst@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Nov 2025 18:00:42 +0800 you wrote:
> The base address of JPEG decoder core 1 should start at 0x10000, and
> have a size of 0x10000, i.e. it is right after core 0.
> 
> Instead the core has  the same base address as core 0, and with a crazy
> large size. This looks like a mixup of address and size cells when the
> ranges were converted.
> 
> [...]

Here is the summary with links:
  - arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder core 1
    https://git.kernel.org/soc/soc/c/ce48af13e638

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



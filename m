Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611D221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848032; cv=none; b=isUkTzqRwffDQEIyQ9D3jZTpQnNg5ybePBXxWmhuRBepeN1Lkq7xrFkDnmXf2T0S7krq+RnmCLbnEA1iz/2OiTDXjH/ETBhTed5e2LEaHOfPjldL1DLM92/MzfCzJ3S0qpDQCgORBtXHT+U+FHSktB0KJl39Zhj5JXujTjGK1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848032; c=relaxed/simple;
	bh=S6sOSeGBgBycpZ2tphou+s9uBliuaXJK3QUpyN261JE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TjVlE+4EwlQC5488lSFXKel/keD/Pa7Uzwgm1PqIPTvU6ImsZ4O7wu69lzBPaOm6BIQ9NER+5DqdHDkoFwfqpXRVX3447N1IayotOVcA6iUak8pFuia3FlDXomOqgmfFz/Om5c8rQ56zwNS4baVMXJfzM8QvwfsF4PXuDu59wPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kc4xjXjw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kc4xjXjw"
Received: by smtp.kernel.org (Postfix)
	id 5447AC4CEF4; Wed, 21 May 2025 17:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6F1C4CEEB;
	Wed, 21 May 2025 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848032;
	bh=S6sOSeGBgBycpZ2tphou+s9uBliuaXJK3QUpyN261JE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kc4xjXjwMvxielBEC1laEgMF+g6IAKN3eIj9cw/CQLNPPJTYmkPDbJ1+/o3AaE3RC
	 R2y9ibYqIaa4hlVTxYBya9JnDDU5siMjO2QzvaUTBI15oAYyJ9TQr4ryzxIBQnOnZB
	 WSVM+UfqDUt1u5noJqS7hZyu6AmTMub8Erdd2mqBSdzd318xkZ23umZTRT6gEasmjD
	 D+JKsIrWv2nQoCV4jZDbjBHttB0sfy8HCZfd2z1E3zRfy+qmAh0Z/GHxOfxALaQTrO
	 YY/NgyHY4t+yI7s1BUuTCS/+v99hVd50RbknzuVJlexdJ9ai5qyOg4Cr3Eo40oz/63
	 oqhJ6sWP2CL+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 343AE380CEEF;
	Wed, 21 May 2025 17:21:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806799.2163178.5535951951642784648.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:07 +0000
References: <5f7d3fa4-2d9d-450b-b384-abdd903284dc@linaro.org>
In-Reply-To: <5f7d3fa4-2d9d-450b-b384-abdd903284dc@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:18:32 +0200 you wrote:
> Hi,
> 
> Here's a quite large changeset for ARM64 based Amlogic SoC introducing pinctrl
> for the A4 SoCs with new bindings, UART RX/TX default pull-up to avoid issues
> with debug uart connectors, same for I2C on GXL based boards, finally SARADC
> support for the S905L board, clock measure support for the S4 & C3 SoCs and
> Reset support for A4 & A5 SoCs.
> The new Amlogic S6, S7 & S7D SoCs initial support are introduced with the
> corresponding Reference Boards.
> Finally the S805Y Mi TV stick, known as xiami-aquaman, support is added.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.16
    https://git.kernel.org/soc/soc/c/53c3712fd5c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



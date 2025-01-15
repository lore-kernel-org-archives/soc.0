Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A71553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961192; cv=none; b=OGaA6z8lUbxJaNdbDwOSqOhQnzrx3YTcdxLVmGOMCta1LJHzTk/y1hP5bJUANb/vJrh0Znv/1rkI63l+hTh4hvGIfiC9l8RuYn0MIf+m92sCw4itxN3ENeUsAE/71xjnlNhpiXNGfNjQPGxcyTnySF3PUeuyoAtCcrqbgSYhrjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961192; c=relaxed/simple;
	bh=6Tvs5Xr6vw2oY8nMOI0SCtEEgxTF1CYY/n1su7lew6Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KaZFGRYmqSTnR1+fJcPkvah/wCnT5OH3jlSB/YQTGu3V0GmzNzDPY1Al3W2Hk7ZsguRxCD8VEucZ+c7kEiM9hOdsqQXAZIc2JnNA4O5kiQS6cOG+IGo/LDiEEs49cPjRO4g/6zUfF2yPTJpcX1JebRtdyV2qaBfSIv4K3NyliDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYEo0Iz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYEo0Iz/"
Received: by smtp.kernel.org (Postfix)
	id 272F6C4CEE0; Wed, 15 Jan 2025 17:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114ACC4CED1;
	Wed, 15 Jan 2025 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961192;
	bh=6Tvs5Xr6vw2oY8nMOI0SCtEEgxTF1CYY/n1su7lew6Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oYEo0Iz/vQiaTp7t7bmFKJtEySwSlO/VLiD+Z++HqsWuc7ClniO3FI0/RKNVBi23X
	 eCGWLZMxIeLWLaY62hBG8viK6IDT4JOz4I4ZG0+Oa61ss5RWWaWkRUN8pU8nyxck/W
	 nWF8XqbLDXPZSypgWacefaDb7DzCVUZITx1FiVepi+P4T5ucHMu8cgoleIeLmGNO01
	 E82gctcnKAYDMTCcCpSbpqY112JwYq9Fl/IbI5cO4O+T58F+A0hIWnclS9/2x3tgUX
	 sG7AbPmAB0oAIfyQ/JP54YDQ6sNDVntHHDR+S3WzBqmasECaDLDBCCIWZLEe9p6F/C
	 cFqj+cBSJO8Sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C72380AA5F;
	Wed, 15 Jan 2025 17:13:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers: for v6.14, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696121473.809051.10688415440965594787.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:34 +0000
References: <20250112180846.64154-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250112180846.64154-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 12 Jan 2025 19:08:46 +0100 you wrote:
> Hi,
> 
> Previously I sent just one patch alone. It is not included here.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers: for v6.14, part two
    https://git.kernel.org/soc/soc/c/677184d6e430

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



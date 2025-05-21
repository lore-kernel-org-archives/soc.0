Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44082BD03D
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863010; cv=none; b=ar8GlKv/j1lxUQxoaNcjAxVfQii7uEILVaq+9cD79WgCQi9xkz9qXLDSLZStLydw1qji/IxH/7VVPKpXws5s/tKLpAa40I4h7y6xb+xVdSHPr/QGN69F9cDs07ppg2/LKPX/cju9xK40JdV0odoDSKoYq76ziI659si9ptf+PEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863010; c=relaxed/simple;
	bh=yZFenmmLGtQ2Oo+hi8EdNXAIqbWIGUPmH5GTOu1UL7E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TTaYcCUJbA0iry426fJDgtK+becyjrp0qYUUtvWByXT2SWCAg22j1mNZalGRoYig8vl07lCDkQxQhvgVZ6qXi4XaeUpQxIBhvn/oh/V4pPPTSVxupUZc29gtWqthTG2doz7YNBieV1k8mPMoobL3yA95LOip3oG2GL6W6J/FJ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEMyWteQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEMyWteQ"
Received: by smtp.kernel.org (Postfix)
	id 31076C4CEEB; Wed, 21 May 2025 21:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBDCC4CEE4;
	Wed, 21 May 2025 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863010;
	bh=yZFenmmLGtQ2Oo+hi8EdNXAIqbWIGUPmH5GTOu1UL7E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jEMyWteQwxTYF5dgpCix3OLO2PNDrNpSYmStdPzFoOt3AJ/7ek+aIdNo8G7uYsWkf
	 FbnAJEOCWzySFKQV9n0m498mXh/0tx+ILHE71oMPWT6+37rFBrsLShkCPji76N659M
	 XwtpIcwaM8d2gYJxDhUhjb9V+Xc7P+CZGSYHx2NiViAAKk8jKQgs+D1aSbMOYrZlR5
	 s5fuSzvfRZtB/n4js39ng51B448YmoAi9BMinIWOiZaqPfvvjDm5qXbIWh3ruqJyIi
	 jetosYA2AnsTCkKeGuawypBerhY5QVZm9z7cYaB5Ty3BIKgor5EXP2wmEp2XnCoZX6
	 7LV9nHfvXObjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB394380CEEF;
	Wed, 21 May 2025 21:30:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers part two for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786304574.2284637.621494487457586237.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:45 +0000
References: <20250516082037.7248-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250516082037.7248-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 10:20:38 +0200 you wrote:
> Hi,
> 
> On top of previous drivers pul request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers part two for v6.16
    https://git.kernel.org/soc/soc/c/7148b42e8542

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



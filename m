Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1B3CAE73
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169060; cv=none; b=F+I7RP+Ouz103mc9C/hjaCy8DZhwxFOISwZOciolU/Tr4wx/6KzUMA/L6BA028ACvtvgl5Vc4T6t3yTnv1Vk2STElFF+SS+uBCPnPUKCL/7tae01OsTiGF/1k3N+/9KPxgUOsesYrc4kp4kM8b4wjoxwzQw4Y42WbgvDsJglyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169060; c=relaxed/simple;
	bh=WQ/on4zdDNIt+fmg/t02/BCF3ReZzv9wBWw6KUw+2gI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VUBlHlmt66w3WOIpZA8coPneD7oNy7XSxa1E/JGR0eF6w/BwLlEX1c/CCVeqhNYeHVtoAf+SGDv/4kLu8vOpilrbdidC+2FcYBerWpvjlBbB1BvMC+bbv/LwG8PdZSlZx4qKJv3/jUysn/Mjjd9o74PZHnf1sgsprM0zBgrsXSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kU1i4nvJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kU1i4nvJ"
Received: by smtp.kernel.org (Postfix)
	id 7758CC2BCAF; Thu,  2 Apr 2026 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8A4C116C6;
	Thu,  2 Apr 2026 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775169060;
	bh=WQ/on4zdDNIt+fmg/t02/BCF3ReZzv9wBWw6KUw+2gI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kU1i4nvJqfDAYZp2ovgr74KB4ZHzwYCCacwSU++xztf4tSEhxGAN2Rrqs5Bxv20H7
	 oUPzOL3K+xQRFqmvtOnC7Nc0V6X6gZorzefqBTsKUsjHT3qOr+No/YLt6ChwhET0jz
	 19M+MfwEbaS6BkJYAhUcd/HSlZNzGVzhsLgfZ5PovkDgFgBl+Z+Rh64h2wqmHGfZhV
	 bMLzbUdRQiE1Wqg01fpCdem/QOFQMUs/sRLrz4UGtmTivLiQnWME1tfAxeXs1xf1w6
	 cYrS9D0fKON7NXdxJGVAPsqNDoKA+0bW3cuwb/oq0fScl9uxswM8TnLOuZ8LorM5Pj
	 Pmtx/t5jq4xCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF353809A09;
	Thu,  2 Apr 2026 22:30:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to
 dtschema
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516904203.642994.8604617050661985818.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 22:30:42 +0000
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Mar 2026 18:04:42 +0530 you wrote:
> This patch series converts SPEAr Thermal Sensor bindings to DT schema
> and removes the thermal_flags property from spear13xx.dtsi.
> 
> Changes since v2:
> - Reword the commit message and subject to correct explanation in patch 2
> - No changes in patch 1
> Changes since v1:
> - Changed unevaluatedProperties to additionalProperties in the binding
> - Reword the commit message and subject in the second patch
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
    (no matching commit)
  - [v3,2/2] ARM: dts: st: spear: remove undocumented thermal_flags property
    https://git.kernel.org/soc/soc/c/e00482b58f6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



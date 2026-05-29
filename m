Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A649377031
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094405; cv=none; b=IIj8zP86BN3+z/yeqXsubpgZKnpHPvoZKzZfcUHdHMQi/+jsmg5DBaOmZmE+BndXDYKTwfGSPKPXYJEeBwZaexEocuVo8xRBSOReOOoImQDM4iPxwLTRaohBWa8kxkPF6AdvVY4189kUGX7OA879EjukWoq9pxrtU0zy5Usg4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094405; c=relaxed/simple;
	bh=k6/4Vrha887OO4OVHx6CUps3K9+8WA9C+2RbB0v292c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bmhPnh5NRFAXsYflVz3fsYNxbBNZuDl5DnIDBBhzRmiM1gtWKm3Gb4ulSf+1kdHERsQDmTohglycoX3qjywBfEnQC2AaGK9d1xW5Dg6tRNV25kJh8iIIBPDJHJlsIRhaASVeyBqYz70jJFgMHLURNzS+AavZpf4QERjnk3rDNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fdc9Rz8B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fdc9Rz8B"
Received: by smtp.kernel.org (Postfix)
	id 505AA1F00898; Fri, 29 May 2026 22:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4B21F00893;
	Fri, 29 May 2026 22:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094404;
	bh=j4auBnMBSHkkWYkfRL7EZSTW4mzPa1tUilNeAX+2iNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Fdc9Rz8BlmjezlBsr0qXVELhv+nKo1cqROfeSKfybTDQV7TySM97Fl4UK6irRcc6b
	 KT6ApuxAAy8ITnh1ncOZ+7pxOzx3nxDMauyWmEy0r8jxnFkzuRxkUCpO8jXt6/7LH4
	 +S7VdO4OcAmr7Es0xPNjhN0fGXBRNcqttOrcaUsVde8dOczI/1xKuNjsRC191wJkTg
	 NaWOIqfuJenz7G+a+fX58iv8a+01OQGJYZByA6O+Xg05/HKBxjYjlei2JxT97fW2zN
	 z36oGVwZIlyGvTcEp99Ed989I1mU8LlSc9Ce/Ldb8f69MzUt7wALma8BiRQhtsx7mB
	 b4aFfr/HJM2/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1989D39301A3;
	Fri, 29 May 2026 22:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers firmware for v7.1, replacement
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009440772.1985625.10936705769600667640.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:07 +0000
References: <20260529121757.13224-2-krzk@kernel.org>
In-Reply-To: <20260529121757.13224-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 14:17:57 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> This is a replacement/rework pull of previous tags/samsung-drivers-fixes-7.1.
> I also dropped that tag from my repo.
> 
> Changes against previous pull:
> 1. Drop commit: firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
> 2. Drop commit: firmware: samsung: acpm: Add memory barrier before advancing RX pointer
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers firmware for v7.1, replacement
    https://git.kernel.org/soc/soc/c/f5e70b3f30ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



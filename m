Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370231353D
	for <soc@lists.linux.dev>; Mon, 15 Dec 2025 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831531; cv=none; b=ZU1GFBM7mnDw8ofvecGahMVy7mXHiCOjXTirc7hTEo7jCFU4uGOOcAMoJQMHEm5Ud4rnVP1gu9AdfOgIcuRLDQQkxdGTLiyLwlUglah3rHhnIibIzyraM6IPvZqdO9faBeJlBDAsYIz5D9nFfeBbU9AGMkKVZLZVy2uJ4F9t+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831531; c=relaxed/simple;
	bh=vF2BesZBIxNqMYcYN7bi6buUT60fa7mojEAB+PVSz6E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tOV6teMoSn6KlwGKmvf6fS5HaWsIpH1TcGBYV72wAcLNwfRgph/s2iLt3IFJxg389dtMFFtAYS0EDmeDKAeaZwGz1D1kxAfuLZvP3dSpTspNbOdnmApTmbc55Wy/HPx+Gmbkj+03rwN2baOwR/cPdDguOBGKmpmsO7CYIECr4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsJRu0Di; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsJRu0Di"
Received: by smtp.kernel.org (Postfix)
	id A7B31C16AAE; Mon, 15 Dec 2025 20:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F8CC4CEF5;
	Mon, 15 Dec 2025 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765831531;
	bh=vF2BesZBIxNqMYcYN7bi6buUT60fa7mojEAB+PVSz6E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LsJRu0DiADYc72ttRGY/yF1yvBB9sgwL+g4kLWouF+V2LfwTvbSYfmJCEBnJ7AkGK
	 3cyZTzI15XOzJUEa5NsLWNSIzb4AKQtLr8xcOkOe3K/xDTxf8OUmgwByTFyVBG+1p/
	 qQsIPlrjgk/D2ZyFY55Sr+1Sd/07j40rY3cWI2DJQDY3y6mhn4tXUXpqlEqC5oS/pa
	 4aSDKvc0tqS5ZGZy9QHeGfZGEGp6BdzN2pE341zjesVQub70PAuPpKRJTDpHtAj+ct
	 5eMTjnFtpj6jAlRD3MYCuH9dWBHltoKHr0jaq/un/e2r1+gVXUpCL2bBnDX60tPZM1
	 m2nAPoaVFI0/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2A5D380AAEC;
	Mon, 15 Dec 2025 20:42:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176583134279.289481.11326067756379641054.git-patchwork-notify@kernel.org>
Date: Mon, 15 Dec 2025 20:42:22 +0000
References: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
In-Reply-To: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Thu, 11 Dec 2025 14:05:01 +0100 you wrote:
> The KS8995 switch was unconditionally wired to EthC (eth1)
> on both MI424WR variants, this is wrong: the D revision has
> the switch connected to EthB (eth0) so pull this assingment
> out of the generic MI424WR DTSI file and make it a property
> of the respective variants instead.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
    https://git.kernel.org/soc/soc/c/ececfba255bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



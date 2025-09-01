Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556ED2494F8
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722599; cv=none; b=csUwisu8eCpfodRs+MBC8aLolVYSEa18EMjKwVwl+0LWbOKxPZHrqvouLMJIHfI9ZH5VhX78EFquIlvP2QYj8hIGxrAlxigm6H/GA3mRflKurplN7cbVgxUE3rKnF+d9Tv1dN4ffQiiI5eA3SdXVRQFkdTmlMhV2vetuGS9XxX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722599; c=relaxed/simple;
	bh=L7Pu5ho8TyaJvQX7cRhFAbpI1ioC7Q8qdBbxkKhwA2M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GNDmfZFjJMYg/JQ2RN1nCiLS/qynBTF+nllcRiXGickCar5PTRrCIddCr9ZbEUcjighFiDG/6KR6So/c/L01IVYMew1x2pioHZ0mrdZL6282MGN882I/px1nQW65RpmST16F0A8nZXCVdEcS5PhF64kBGsfz9+2s12Iuse88/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7sTaxEN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7sTaxEN"
Received: by smtp.kernel.org (Postfix)
	id 3FC97C4CEF4; Mon,  1 Sep 2025 10:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240E0C4CEF0;
	Mon,  1 Sep 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756722599;
	bh=L7Pu5ho8TyaJvQX7cRhFAbpI1ioC7Q8qdBbxkKhwA2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H7sTaxENgkvpMEjFtwqmlhCXOa97aB0re3pLLvLqAe1wyAC3BeWof24b1ZTyjyHeE
	 EZfNqx1W/yBZvKGjOi3a7j6wDDC6R9tLr4ra3A4JudvsKcZnOtfQygSQrn+WojVwWB
	 64E6EHKXzPe/nlKde4drgJM2I7ImFQe030oftb5B+DJtwu7vdRzYWg5Uc+plbfayG2
	 eR7RteGMiPw3uOVSZidcCbRupSp7N1yskTWOA62yTcNY3s6lJyqWYRXKoFlJcPkDzU
	 UDFq7QAfnn9VeZdrJD8uFO+hGZNcdcSPnsETV5x1iNPAYK4Nei0XzM8eqSW8HM5uld
	 XpMj0fWaSg5tQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E79383BF4E;
	Mon,  1 Sep 2025 10:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: exclude defconfig from ARM64 PORT
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672260500.3678624.4210459096985387469.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:30:05 +0000
References: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
In-Reply-To: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Aug 2025 23:08:04 +0200 you wrote:
> Patches for the arm64 defconfig are supposed to be sent to the
> SoC maintainers (e.g. a change in the generic arm64 defconfig
> required for Rockchip devices should be send to Heiko Stübner
> as he is listed as maintainer for "ARM/Rockchip SoC support")
> and not the ARM64 PORT maintainers.
> 
> While we cannot easily describe this in MAINTAINERS, we can at
> least stop it from giving false information and make it behave
> the same way as for the MAINTAINERS file itself (which basically
> has the same rules), so that it just outputs the LKML for the
> ARM64 defconfig.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: exclude defconfig from ARM64 PORT
    https://git.kernel.org/soc/soc/c/750b54513f69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



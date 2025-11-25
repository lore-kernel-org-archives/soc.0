Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15318CA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078672; cv=none; b=Ugo6P2kwQWFT18vwGt1RZbwURzHsqqhYLKDA9iEhasivbdAFGdHKIBhndxo2EZAc4Fi2Sae1jrntuZtT7dXkj0vCo6TXkzpOCGoVEafAEHvuvAddDzwbfWrliTo3MaOSQqRQklY0lYG0ItrIsBIy2pF7SDQoMq0YgLzGuvoYN6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078672; c=relaxed/simple;
	bh=K2AxCAeTmnHi1l4dfeTM0t08YTGPnKX8g6kYTEGSO5E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VXbvFUA1XAohk7Zq4/f9pbxwAWvFpmjTWKuKZq8WdBcm87sf65n6VeNQZjh5FN4KnI9U0idrZf0tDApdsXOaPAmseO2OpPK78tMBP3MiIrMJlZL/U2frajzgstebtLfFfZKEbwYcZgch1rNkH7rQtzeCeQN7ai9y0J8p9Gf1a9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B63cjGCa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B63cjGCa"
Received: by smtp.kernel.org (Postfix)
	id 0B852C116B1; Tue, 25 Nov 2025 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B14C4CEF1;
	Tue, 25 Nov 2025 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078671;
	bh=K2AxCAeTmnHi1l4dfeTM0t08YTGPnKX8g6kYTEGSO5E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B63cjGCalB/zK+5ft1uSXozYqf46/XyQ5HJUMI3qns2QYdC7ONtdhBcK46Iuh+l4h
	 VddmcrLBd2WoszWSv1/9LX7wAbI1tLxWwBdgzPjD97AcYzv1tth45VVGGFCEjwEPbv
	 nVb1bTrxqyWBoNUd2lDv7eiHWoR4iZnw/SsSKyfswIjks10AXp0vJjhrX7pDhpW/Q2
	 HGagwVaFr38OM5J1b3J5xrggZ0I1pJ4MBTD4wxwCJPiiwTKaPZMFgoRAa5aB+RSH1e
	 JKQGVlO3gtByu6StqrE9ILttK2YFnJWJ7bkIp3tA414d5yJDY1LZQyxBsBXCHGOf59
	 gDrx3X5XIAN3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE14C3A8D153;
	Tue, 25 Nov 2025 13:50:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: sprd: sc9860: Simplify clock nodes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407863424.736376.5371396278510340150.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:34 +0000
References: <20251124210031.767382-2-robh@kernel.org>
In-Reply-To: <20251124210031.767382-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Nov 2025 15:00:31 -0600 you wrote:
> The various "syscon" nodes in SC9860 are only referenced by clock
> provider nodes in a 1:1 relationship, and nothing else references the
> "syscon" nodes. There's no apparent reason for this split. The 2 nodes
> can simply be merged into 1 node. The clock driver has supported using
> either "reg" or "sprd,syscon" to access registers from the start, so
> there shouldn't be any compatibility issues.
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: sprd: sc9860: Simplify clock nodes
    https://git.kernel.org/soc/soc/c/d86a4e645859

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



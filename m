Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85033BBCC
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220498; cv=none; b=Hf/9MmNRQMI8OttHAtKZbH8d1+dbgrKjWGP001MX9blwtPRe3qE3ki021kFHOvwPhz1mWdr/GKeBAYg1oe7seKcmm9xUMKtceFj/kbZtfM48ve/b/0NwB8sfjtC+XYMJTshVo1TY2oXEH9GDxqecmMytskiIDzB0ikzJtPA3YL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220498; c=relaxed/simple;
	bh=1bzFXLDc+p0Eba5320axg5za3K1cg/J04YJeMrprsTw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d8QkHfTU1I2W/opa02H1o9BrthpRXs4wzjVvnYGNNtemHrqFp8CZQzZV63ziZCeBotCBwCj7gSkIJUyoRaKRQdHISicovl+hO4OzvLsPd16Af0yrL0AmJIPs+YcHu0HZkBDNKPNm7nP2OAHIjaT4qmYChDH7YefMmSpqPUK4kho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEEKSrKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEEKSrKX"
Received: by smtp.kernel.org (Postfix)
	id 0ECF01F00A3D; Sat,  8 Aug 2026 20:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC5F1F000E9;
	Sat,  8 Aug 2026 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220497;
	bh=qRtKJs8oGt9Df04s9ZdPfDEUs2cqXG1MhgQsXAHqbsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EEEKSrKXKBK+xCqQSsKmeigKcVVq9WP4PEz3QPB6m6cIO34Ij1bS+mvIuKZSHfZMO
	 k0ZA0PWLntPglO4kTuvk37LuKbjyY5NsHe4HwqM+LqvbZkjOpUKuVj48wi0MAhTb4r
	 T+xF0463qmYy8QUuuXJKrZ8r96bLgv/7z0z692L5/eYPTqIHgDrMnpOh4YJTTvB0LF
	 V0SEdFFSLJRuhgnerJ/igbs7AKWPYzzI8Uz2mDGn2F02CHLWHwfy0mf3jrdo4rVPeP
	 9Hdp0ddVTrFA31IxDrOT9zpDCvqwxitnQdBNtVyJwWUMmOOei3LYfGMV2XBZ13EvAH
	 dn6VhCp0Tg0Dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1986D380CFFA;
	Sat,  8 Aug 2026 20:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622045464.2748994.15099413616518593183.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:20:54 +0000
References: <20260802024052-KYC1424545@kernel.org>
In-Reply-To: <20260802024052-KYC1424545@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sun,  2 Aug 2026 02:42:43 +0000 you wrote:
> Hi SoC Maintainers,
> 
>    Please pull SpacemiT's DeviceTree changes for v7.3
> 
> Yixun Lan
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v7.3
    https://git.kernel.org/soc/soc/c/0b02b8f94191

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



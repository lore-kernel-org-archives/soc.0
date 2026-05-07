Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4512DF136
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159588; cv=none; b=rGzwVAk5f64uBxBjp/bqv8eX6fxit4XNwNPj3X5Lvxs+qR39I+2Qa00mkwNqjc4+ZGUwg68iEPfejA7fmIT3cyJB0M00286BlML3DJqJqzM0nNRuNVoyvqhpN8RHzJgbUOkHx51AvNkXaNot0OhhamqURWt/tY71H4sPkMM1xeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159588; c=relaxed/simple;
	bh=ldiEo25RUsJpOyfrTfmhlPXZWY28kmvyIy8mEcTJ9BY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kfNhnyupzgUh7DufgwMTxHqQHMlqW+QoKK/Wn90Iv84tWQeqKAO/YBrdeEGA7eGczXnbz9KVHl3RztcbhtDWIobCFYXLlq39mZyRkDtzy3UERTSxKa0M6Xb0hAxqS5wYx+ESoOXG7foVqMJkMg0ZM6fQSjCCwl+Jx99byCuDgXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxTovssT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxTovssT"
Received: by smtp.kernel.org (Postfix)
	id 15F6DC2BCC4; Thu,  7 May 2026 13:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00475C2BCB2;
	Thu,  7 May 2026 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159588;
	bh=ldiEo25RUsJpOyfrTfmhlPXZWY28kmvyIy8mEcTJ9BY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mxTovssT+RKDF73F505tlCOZwHZfSvoRXp0M+AncW9XvSyQoRd5ZwgjMeXGIHgyZE
	 LW+x3wDGT9ImEdP01wmEwS22jz8s8isZBkJ1OdTcJkHZL6eCnFSY3c8qZFXMcxdCUS
	 +N+sCYN762DA9zDhSRfOFzyViAhU/T0JBl+Ro+5BY3B9A1bcwZbpznbdVITwVWIz+1
	 EdOsOzYzrj8KXAG2UAvYzKBtQc9l8EEyOS2S/VvBRy7L2ZKFosPpOkYHDbXC6OukRL
	 XkgHkticlDzLmMDIDn/y+BN3awCxFjpK383T9nOKYC2d9zHMCs+QvTP/JVgUwsYMDb
	 jxplFbP9ZUpGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDE039308F7;
	Thu,  7 May 2026 13:12:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] ARM/Realtek: Add maintainers and pinctrl support for
 RTD1625
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815953729.3933061.12408064514135691650.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:17 +0000
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
In-Reply-To: <20260505103955.1010130-1-eleanor.lin@realtek.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 5 May 2026 18:39:52 +0800 you wrote:
> This series consists of patches that have already been reviewed on LKML.
> 
> Add pinctrl support for the RTD1625 SoC and update the ARM/Realtek
> architecture MAINTAINERS file to reflect current maintainers and include
> the pin controller drivers.
> 
> Best regards,
> Yu-Chun
> 
> [...]

Here is the summary with links:
  - [1/3] MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
    (no matching commit)
  - [2/3] arm64: dts: realtek: Add pinctrl support for RTD1625
    https://git.kernel.org/soc/soc/c/50d92732d10e
  - [3/3] ARM: realtek: MAINTAINERS: Include pin controller drivers
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



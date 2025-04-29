Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A82C2D1
	for <soc@lists.linux.dev>; Tue, 29 Apr 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944999; cv=none; b=sk77N4gXb337dmRq8rW4FL/G+meom06qeF/MjUkFRJPWHi610CrSiXJBxWHXFPbT13DKssgVbWY8Ab/R6l+V/w9aXMbsbEhFgVPbKX5+xB3O4eNyRXrC0WSwXzfzQ/stHHr1xJM5A+b7KEQbaMw/kKgWqgwSyCn5aUN/nQstVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944999; c=relaxed/simple;
	bh=sJwyLysnMvbMtwrQjtFP9O6LjwtJfCHK59Z3sKrLJRM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gVVz8Su55/Z59Xf7GL2Kd2N3CcerfdClmW+8cBZVlXUvmWrFyIKHFoxZ3U57JuV5LTW5F2N74WrOqYst7q1EwdcldmNSGWjVEsyzvriN+5E6MjnKt00mXifvr1zXdsJ64I3FcYG1q7YrKSu2Mts17q08ljw8zbe+/5tpSe0ZGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZXYaIus; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZXYaIus"
Received: by smtp.kernel.org (Postfix)
	id 6469CC4CEEE; Tue, 29 Apr 2025 16:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E897C4CEE3;
	Tue, 29 Apr 2025 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745944999;
	bh=sJwyLysnMvbMtwrQjtFP9O6LjwtJfCHK59Z3sKrLJRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iZXYaIusM5Ljxzg8Fo+Br5dgHjP07EO4s5LHpYodXLkZuyAEB86tW0kNKU16c2WBz
	 24c8qKXRyP4z8YhuHD+mKXDfvAunzx9rUjImVqieHGtBToJ5Gq9GEy8oZ+IXz27g/h
	 8snDntWacPslUAsDtyCCZw16TD+mz/up/vdWAnSXrxtfQthyD/y6SadF61GUr7BPzK
	 JpqgqoKLjf/GuBlLvh/5JU8aYEkneYFppAJ27zxDzs/9/HIg6w6BiFLI27nkyzMgKa
	 5s6j38POUq4dX16n67UQF0P1xwJqAZKfIKt7fgWzxjeNIyuwMLbeo7pe0puIEllAlq
	 WwZGycpTnruRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EE33806641;
	Tue, 29 Apr 2025 16:43:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] Fix interrupt controller node for STM32MP2 SoCs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174594503825.1672898.3869436411128426932.git-patchwork-notify@kernel.org>
Date: Tue, 29 Apr 2025 16:43:58 +0000
References: <20250428120703.1392456-2-alexandre.torgue@foss.st.com>
In-Reply-To: <20250428120703.1392456-2-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Apr 2025 14:06:57 +0200 you wrote:
> Dear Arm maintainers,
> 
> Please consider this first round of STM32 DT fixes for v6.15.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [1/6] arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
    https://git.kernel.org/soc/soc/c/de2b2107d5a4
  - [2/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp25 SoCs
    https://git.kernel.org/soc/soc/c/06c231fe953a
  - [3/6] arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
    https://git.kernel.org/soc/soc/c/02dc83f09c72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



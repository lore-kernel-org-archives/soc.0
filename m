Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130C34320C
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948419; cv=none; b=sqPkyCkxq/5yWDMsrh1IpQZnjvSD54bWeoW6ZAPT7ItsrouvbAeeXqlx8DcPU9k+W5Q5XRbRiM+UPre1EmVLQyoIst64JGVjsh7nTCnucyhjClWYTGu/6hPOZDrT2uUF/+rqZykuQWl4MiEN1uOSZT4wEH+ZrZcWmwskf2xSL4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948419; c=relaxed/simple;
	bh=xijNi9mmPTZkEfBhFIwN7xCGx/tBt/67FAmphA1bT0I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=niWLEcURFWOeCZ7oyjh2OC/lw8CbiQiVm4vIdP5EYZOwybm2cNCwJ3BsDJAQSn0W5xrg4C4BwMe+VmHIt0/zQaRM6WQbCDgyg451TDYjcGVK5INAIQ2ejvE+/Naz80dVUQ+sSBklNLTBhVNTH8Kq3tCRW5bRJyBeFsCM3bns1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qc33aAHg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qc33aAHg"
Received: by smtp.kernel.org (Postfix)
	id 8849EC4CEF9; Mon, 15 Sep 2025 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E9EC4CEF1;
	Mon, 15 Sep 2025 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948418;
	bh=xijNi9mmPTZkEfBhFIwN7xCGx/tBt/67FAmphA1bT0I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qc33aAHg/y1uZxIIqNCcDUS5DKYzJV5xxUfYso5RGubz5YDzXT6LkJFvtAOhtpQvL
	 Ud9FO0zPm66rVOVqXyIQAt4+L64zLyi5lPp3m00EpPwwFiDKv2u84qNeRpcSzgbbB/
	 UJ81gPlmAaLAroYMpLs4QyVxkgdvojjTir8AJDLZh9513B/6YE8PBvj5MgryDcVsWw
	 A62xGqXFkJjYJyEu1QsXM4JfqpxnWX6xKTWN3nqbO5AJ71Dss7sI+MoPqO4MQttDYK
	 Y1w+OftC9YPODEy7B6ReMcSAlVfVL/fkFgrjjG9FvwdY0iJHAfMhMLqqpsTl/L/CtO
	 Fff4wJHSXJIcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CB939D0C18;
	Mon, 15 Sep 2025 15:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm/arm64: defconfig for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794841999.17822.1086124766034771064.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 15:00:19 +0000
References: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Sep 2025 20:01:26 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm/arm64: defconfig for v6.18
    https://git.kernel.org/soc/soc/c/92be260308d8
  - [GIT,PULL,2/2] arm64: dts: samsung: dts for v6.18
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



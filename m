Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FD3B4EA2
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094403; cv=none; b=D6uEixac1gj8kxq97dFYipHnCbRnJfsmCMR9U3X8Ojaw/jNpOzajp+FU7FkVdEG9pU2ZDNxypB72znGYsMzU3b9XQqx6Vn1+P2aZA4IoiSoMlkd42NhXr3qDpetZAHQZbBvKHQu4G4FpXzNYYBH1k3mmYlvK8BppqKCAaj904iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094403; c=relaxed/simple;
	bh=UoiFoHWkCUjLIFgdeSaGMc7dtXGIEtLf5AVlt/3xI8A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=M1uw0BUHr+cletF32CnSOPgjVIuKkK4xz3xeDyIz3GMCW/hhVmLgYOGsIGB3C70VnOENyySGYzhhYj9MtT73kTQCbCwPpAw0XAObaF/BEj1igIPy79/lDvXHZBtqflc7/LapdanmznAqBWqcykmrkeHPM1Hz28r1FCYOaKHK+Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWXyTQ95; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWXyTQ95"
Received: by smtp.kernel.org (Postfix)
	id A52C11F00899; Fri, 29 May 2026 22:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3971F00893;
	Fri, 29 May 2026 22:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094402;
	bh=7Kr+FQS/yT99LWwqIdKuhowprXQKixkb5xiZfagdQLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NWXyTQ95ebVeZ88F93g2QXmYmgyt1G5yiwF4K1mZArR8aPJKTwmVf6InH9kTgKzs8
	 reHPstv5yYOCO14htKDU5nVn7nDihqHHj0P02akHf7fG+ujnYG2Ay8j+JAyS04NaUi
	 d+sCAXcYXurpK1GjRYpADOU4h7JeV4W4JIBTxG4rjkdl2cXHhqKXVYYikQ/8N34KqO
	 2KfyPzm89TIdi/L2oxEb1fHhXD3RT2eSNGUOxCXBEpRvebc9mm+jUKfPRr/D9S0HRF
	 3m5PoRkV9sgmEnRUsb6Dsv/pWxWquDUvGhvvJwf5V9bJfJgZyrSsOL4goSi9lQijIB
	 yQfOwTUdXUXOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A7139301A3;
	Fri, 29 May 2026 22:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: driver fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009440589.1985625.13555330605398101400.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:05 +0000
References: <20260529071949.12520-2-krzk@kernel.org>
In-Reply-To: <20260529071949.12520-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 09:19:48 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> I completely missed I have a critical fix for v7.1, apologies for sending so
> late.  The actual issue was introduced in v7.0-rc1, but it causes the board to
> fail to boot.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: driver fixes for v7.1
    https://git.kernel.org/soc/soc/c/930c88202003

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



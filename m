Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89F3822A3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080240; cv=none; b=s8QWVo6cRXIbSzOtTCEeA6TL8iPniUnG/8Wp72Yhc8wfKMMMZzrRjoavRuSp0oVl/c0+L1DO1Fq+RaK5lHbrwhhypMgNJn9bixPnHOzWInq/dN0REHT+SVoeEImRjOZZ9ifnKBZyU15vkAnltdO5qV9rxFE/Z78wpJjUiQCpHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080240; c=relaxed/simple;
	bh=4CcMmpe8gL7yPXfZJxEVvEelHNQoT/pX8u9msD60Sik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tVNC1ezN0hask5GNB7lJU38NiE3eEH+t8ANVtHdIsCET9mlwHY6GD2FP6F9A6iRJHQCiwOk1zQSLx+6Bf2qotZ+H9+IshomZNBfi8g52Qpdrf2XmD5S4125xmz6D86g4hzUM0G74f3FDThpXtL/zQRFHMvWwIL7FyqVTHUNHnPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ag6N9ps3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ag6N9ps3"
Received: by smtp.kernel.org (Postfix)
	id 0E89FC116C6; Wed,  1 Apr 2026 21:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9232C4CEF7;
	Wed,  1 Apr 2026 21:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080240;
	bh=4CcMmpe8gL7yPXfZJxEVvEelHNQoT/pX8u9msD60Sik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ag6N9ps3ECV4NrYz0UBBaMpt17giEuef1mgK70FG+vdZhx80lHkM+ebkMXaVo9E9E
	 ImF6b3EowRmQIuc6Cybu1I6sUcUDnh2Y/H7CnFxv4p5k74368aoUAOet5yV29ElKX5
	 AZq1wKqf63LB0CospHDhM3OhqqOgJovN5fbQW3hZ8PDi0whMLPjDUoFw7FPz+ce3nZ
	 Yk/YKAlrt324DzylGrzbO8Uot8kLXCqF8BCKKJPotuVSgSQwlC545YxmEK2150UVsZ
	 IQHEGsfvayyKeua1tQbwIHg84zOwHrtBpw8uI3gz72a4jEY7RFpF6nqB1Gv09WO6pj
	 /aTOwdLzLZ4aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CC73808203;
	Wed,  1 Apr 2026 21:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas SoC fixes for v7.0 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508022278.3876275.9673578014245328227.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:22 +0000
References: <cover.1774606482.git.geert+renesas@glider.be>
In-Reply-To: <cover.1774606482.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Mar 2026 13:10:48 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> 
>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.0 (take two)
    https://git.kernel.org/soc/soc/c/b09719b9b067

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



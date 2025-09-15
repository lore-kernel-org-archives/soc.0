Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A961F4C8B
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944247; cv=none; b=farcHnlshqQyAC6wTWEtTli+m+Zc/RgyXHXRypvXRQRUv3iEGOoRmC+bYZM182n8V7Hu5ovMP5hoRnUT72DrJnpdObTQdfTUUkiHP2wqJpEwVzN1la7rZvH5s8CicgmAAOVeQK7Q5XvArw+9otMgLsYcu7OK4ljlysDhNWYYSDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944247; c=relaxed/simple;
	bh=AdyarLByHqczy+731/tqPMEtCRnDAo1YtZ7aou5/T7g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LA5rnbKZ2ClFFDk1ERsKIjHRA+vTR+QIS1tgp7OqGAPUIOjTeEeYKsBzxM1spL3JHAV8FbHq/sF/l4g6Qj1KjtQYh3Xa3/A/VsnhFDYjFyNoQrX46F9cvF4YUDGOSNF0acSkbjdTm/LFaygeg3bwwxYjCrbwEUm7AslpqZt4X+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNY4Pp0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNY4Pp0v"
Received: by smtp.kernel.org (Postfix)
	id BD233C4CEF7; Mon, 15 Sep 2025 13:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EEDC4CEF1;
	Mon, 15 Sep 2025 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944246;
	bh=AdyarLByHqczy+731/tqPMEtCRnDAo1YtZ7aou5/T7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pNY4Pp0v7xfjqdFhkHKnYZshnd5ICUAv/8/f+h4Vtqa29c3pYJaLTd78ON2F30xkJ
	 6pQlBEeScsI5QkX8x75QZQeH1YQyrvuLlI/YGSMP3vlWrS9khHtZXB4NCpY0U7+ye+
	 IZFNkBuZHCiv+vyfadxdEDYh2qCY00v0CA7JJqkzis/pDb54aq2iMMjPtkWHZ4se7R
	 wBQJELrfFqbi+T+FgB+p/sYYph8JwcUiE98uR+HTXmPmtF/V6SlbE8ub831GTvXfGK
	 dZzS/EaLfkNTliWK+C+YshA0xSpET6qFl9meiWM9Yr8MkqlEpERW/pHDMm71zyLvJr
	 SS3qM3cP/yBVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D5C39D0C18;
	Mon, 15 Sep 2025 13:50:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794424798.4179625.4238611246178657477.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:47 +0000
References: <20250911220940.3023575-1-andersson@kernel.org>
In-Reply-To: <20250911220940.3023575-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Sep 2025 17:09:39 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.18
    https://git.kernel.org/soc/soc/c/cad0261fd040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



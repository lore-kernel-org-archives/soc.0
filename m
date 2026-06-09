Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA9343894
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023247; cv=none; b=DdEW5QMvLEdouEIE9zCrsIji+YlmaGF+2fe7GjgCtJ3W+6OwWW24UigshuGRp1HtmyoMI4dGgg7L3V/kSUfQ98CgGMYkRF500Uigb+PsAkGCnccf8F2BusPSzOAEfFJ1ZCPflBflk07Sdp4Qh/9iCON+zPDzYyuzu5PKnl1un4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023247; c=relaxed/simple;
	bh=+MivWD/PT60zWB6FR6DexGus0k+aTNE9rnRCOLkuZ64=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ewXl6fTfLXaTrnJAXA+RLSVrOLVavwNZJktxTEOmi9PH0as+Sa9WmruRKeVNUgTfc2gYm+/pPLNA7rzaR5ppXnhLVKv2RBPzzK6MW0AdLRlqVTtEaprpuHWwtgA3XkWNqsKWe7wKBnaU98wzIKKmlC9NJeWkmxA8mVT/MOrFDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rh7AmVb6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rh7AmVb6"
Received: by smtp.kernel.org (Postfix)
	id 1F4A51F00898; Tue,  9 Jun 2026 16:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0870F1F00893;
	Tue,  9 Jun 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023246;
	bh=CeZRVTWjLEJ542ZTKRnzeLVwxOQ6cArKHqLt26y9JFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Rh7AmVb6EWf3Nl2pYc1aHiZm7nqISgW5jd/XLpxFhllpt+o73Vd1qAC5E8oPk69s6
	 QOHQgxRYJuFtkAzizbdzuQJJbbE6KsdRIR/eLbDpx3qB3QEZMopirBS78azuOJd3es
	 8mMcyBv30Kh403G7tRDMhZOizuIdIQT3cG5kt4dr+7B+1jog9tGFC70KaFcdabuf9G
	 eMI5wm8qUVbw0CMW0pRomNTVHcsA9h+lizHuW3iqNGrlsAH1894n9p8ZAJDjVn1BjX
	 gUsVz3lzuEaCc/fl0q13DlyXnEBPax01CzoNvLIgdtpWmvrXukm4Fs7rbRN8xdfHol
	 87VGoEwV1abWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939983930989;
	Tue,  9 Jun 2026 16:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102324413.2135346.4821507700470663148.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:44 +0000
References: <6A228A6F.7010502@hisilicon.com>
In-Reply-To: <6A228A6F.7010502@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 5 Jun 2026 16:35:59 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v7.2
    https://git.kernel.org/soc/soc/c/0f6455d1cb22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



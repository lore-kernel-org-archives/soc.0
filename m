Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E72FE581
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662474; cv=none; b=CiKjRMjLWizf5BZbIrrAqhRV2tC/RPKxuL5XpFA3vNG9RuDnShn9GdyFMZRn0Fc4zxNAd4DkSYyOPJ5aHx8nSoKPziCTNnxGk06C695NIglAjWUGUYrEAm2/58TtGAQd4iOLCMkb4LFtNWC5EZ6qt6apTQBEmDpcH4U7U9lgFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662474; c=relaxed/simple;
	bh=nwXKu0ofNl0HRqOjpcQjv2P8xS+81QJzT7Rg+EGxB3E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AOQ9YCbRpTIQKJhl0PNy4l9GfcLL0RjyPeQnYXhyhhp2XmLiTEvn3Np/FJLcuvbyJ6ALKoyF/vQ2ynfZZ0Sgfw8BbAIQxAgfnHxD7yJsRrs9fLaJrEPmvbm16+g7puSjgbBZ6ehYUFJ9cewsekqv2xs0A6mD52TzyKRMD8zHhAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/r/3A6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/r/3A6z"
Received: by smtp.kernel.org (Postfix)
	id 0B11EC113D0; Tue, 23 Sep 2025 21:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C7EC4CEF5;
	Tue, 23 Sep 2025 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662473;
	bh=nwXKu0ofNl0HRqOjpcQjv2P8xS+81QJzT7Rg+EGxB3E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U/r/3A6zHCTwnZrXqRpqwke+9HDeTIFxoJhTQVD4c3Y1ooH+WUQlve8u1pEOEBzNR
	 4OCa1EajL5KFUabuhf9d/zJRAegt6Hy493Q6NUQ/M4QVno1KaeqT6uTYovaubHS473
	 4+8s+sf3pGrxu6FlrELuTSVfiOIctA3F2BV57OzLhGgCaiQCEUGEziTJYjmmh8XO+8
	 HSCqOEPJvEP0sSk0kWfu1cibzwYyOjQo5g36CXNK2ipOuVnVmvR35Zpep//norw71j
	 g8ts6IgMyNw0p6QC4R1AfeV2a4qLE/Qp0rHNjkaqZFdeQF856fDW2fDHdV7UesHna7
	 dqt6HTj/4hN7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BE939D0C20;
	Tue, 23 Sep 2025 21:21:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866247073.1926563.16233255917739080785.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:10 +0000
References: <20250919055525-GYC5766558@gentoo.org>
In-Reply-To: <20250919055525-GYC5766558@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 05:57:59 +0800 you wrote:
> Hi Arnd,
> 
>    Please pull SpacemiT's DeviceTree changes for v6.18
> 
> Yixun Lan
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.18
    https://git.kernel.org/soc/soc/c/ec1ede181e16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



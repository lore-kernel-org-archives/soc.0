Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5615265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662460; cv=none; b=BN2CfV3h6UUcz91rpBa7Rqt4t7gHJ4eEGMqa54oX8o/U1voxuABhnF5/PKSlpbpKRzi5bEqXrgesrJT8HIq561x5h/A45FivuUyK0ZTzUnxm6haw3Z4XcBOY8Z7zyby6mitPi3RfBX+6TavmkGJQcSUPZesdy/wBtcpbDudm8ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662460; c=relaxed/simple;
	bh=BZPtWe63ILQD5rjP5BXIJJlWkrBijqQjWo1yMu10LSg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Jm1U7y2rD45xw1NZxKOHPRHZXHJU9mcgWEpsm+fC90t18UYj4RZavZM6+jGU8rZrztr+0Xwy98eUzrv2gKS7+kcht2YDi4Kv6wmL01bfRTVt7FKFj581LzlcsyxVLIIWpVa2NWmsAq2ldIrEHurdP18R8F6q4nZ2PP3i7ciVoRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLuLEPpG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLuLEPpG"
Received: by smtp.kernel.org (Postfix)
	id 9310CC4CEF7; Tue, 23 Sep 2025 21:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D255C4CEF5;
	Tue, 23 Sep 2025 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662459;
	bh=BZPtWe63ILQD5rjP5BXIJJlWkrBijqQjWo1yMu10LSg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZLuLEPpGKXpuYMqt4qRZD7XWwlHY4P/ggpAUz4GwsotDkdzv9GcT0WH4psdY2YI7l
	 zCpVkr/fnEzpiHMGPTyY4qod5I0pwGieWGRZ7Qu9EWcGHYxcJn0kn/jJAlEeZFe5GM
	 dHEBRvxW+/QzTldAvpVFUvIzIQRbrGxZxYfPGujHO7XfzIcsiuE9WgVbI7qlr6n+Xw
	 uhbNbSakDFFgEGychILnGUlSyBotV9z9UCwBNx4/8PjHJo70hxNJFK6p3MTzqBA9Yt
	 YYTH014SczlGgozRU4pzd3haBhpb5AU+XG7nkOBpgp1AF6xyQ9TCBCikhgHMi3aK1I
	 klqM1hqUJYiVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE14639D0C20;
	Tue, 23 Sep 2025 21:20:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: OMAP: SoC: updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245649.1926563.9791494863700149394.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:56 +0000
References: <7h7bxup0ob.fsf@baylibre.com>
In-Reply-To: <7h7bxup0ob.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 14:55:32 -0700 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: OMAP: SoC: updates for v6.18
    https://git.kernel.org/soc/soc/c/ca8f96ffe67f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



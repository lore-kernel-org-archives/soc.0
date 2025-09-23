Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC75265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662470; cv=none; b=q2/C788XJTgISqQJ5xBn9eBXlSGZGWI9b6InMlO8R1eresEbQysi9XbKsfFgQB1nbh04b5UssS9EXz5E0SmlbZdLK43GRY6pjNLfcTpJf2ksEEZb49mnSnU1HT822vXCdVvuSYEuUMgIYjkf6c7cnIuRDe7/1vVTxdn4M7hozv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662470; c=relaxed/simple;
	bh=lYD+ryTWwNGnVy11oTcx65icsXPIFbeCapHgIiHSW5M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kbj03n8qgVJJQvgt89T9nhOfxo2/zpEI+eKb71CzIS/pKqUHtNqXc4xPUyG9iRuQguy5SvAg1lawEP4FYQJfTnol4EkyGaQAwDGhe1CuNpiCFJcoz0hUXoLsUeSOnkfK350NjPwqi9n0hFlOTszY9I6Eg2NNJczzQYoCK6n2m+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0uIRi1Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0uIRi1Y"
Received: by smtp.kernel.org (Postfix)
	id 0E70DC113D0; Tue, 23 Sep 2025 21:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED61AC4CEF5;
	Tue, 23 Sep 2025 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662470;
	bh=lYD+ryTWwNGnVy11oTcx65icsXPIFbeCapHgIiHSW5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p0uIRi1YNpBLq6u2RE/4b1Y3GA5fyVQL+1VoJeiXUzfA+WD95lLTngko+mHuc9CVT
	 stRjvmp68/XBALz2AK1MEfvz0Ar5aXjgKcgsAw+EaAIaxfTqwqQOVHQMQZUdwe8uRR
	 4xKNxFPM02zmjndj9dVoPuSURK6ZKOgEuT8jcHvGLPnb3mOZz7iXwu+FATT+vsk+6j
	 956C8BODLdvPZDjlqJi//qA7+P6Vu3O5jAlixMxHGw0yK4JylCEssQano6bPEu7tLC
	 cjJuqKHtPQ3sWj9J0tDwlrhfSwVy4StCqIrUhYHDz7LRSQCFLWVkxmV9TQaW/DnEoW
	 IYLTr853VZbnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6239D0C20;
	Tue, 23 Sep 2025 21:21:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.18 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246664.1926563.2834052891129056648.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:06 +0000
References: <2079092.kXSN5OTJKJ@diego>
In-Reply-To: <2079092.kXSN5OTJKJ@diego>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 21 Sep 2025 23:01:02 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip 64bit dt changes for for 6.18 .
> To go on top of the first set.
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.18 #2
    https://git.kernel.org/soc/soc/c/d1f862c0b960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



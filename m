Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFB3074A2
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693408; cv=none; b=cl4/GFlyn0d61kmvdBIpIkzPhZDfHFormA8elm9va0SE2rX4uMEuGx//aMT52I5fUnrVFJRXZKu3czuZH9pA3sIWN6frWUGLwLV1If28/4F5uBP6OGa8jMtOFY+VLJiri/0eRm37P4mLB/rSMPUfLnTc/t5utdZYB1yeonjKV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693408; c=relaxed/simple;
	bh=/E8g9pypq7TNGPa+jgeovioukqQZw0BEDZYpZCC6caQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fYs2Ved2sY6CnUk5FbLKJHcPMbfcgWCzxQqfbu9b0bgN5St8tBraQOzQpnV6p+cRmXAJW/tnMmLTPGgHo0RFK/VN176QUh73p0XotkyjEZwMBRWgndjPnZmcXljwN/q1IIlVVJbzHexFcDoRw5XpZKfUSIeH6POC1ZhZL+UD2sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUWwkFg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUWwkFg8"
Received: by smtp.kernel.org (Postfix)
	id EF6D1C4CEF4; Fri, 12 Sep 2025 16:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97CCC4CEF1;
	Fri, 12 Sep 2025 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693407;
	bh=/E8g9pypq7TNGPa+jgeovioukqQZw0BEDZYpZCC6caQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KUWwkFg8sEby2ztcJuOUXKLKTCw4AljX8oCQ02k2tUAwvkAtIMqCA2dtdrvkIbe7m
	 tEoI0lZgXnVxtfShCxt+aHsuvCexK/ZvCUnqo4qw6gQIGaKBmgsjlJwn74g9MYqxA5
	 UNVZtQz2OowM7imE5Xr46yjFyf6gaz6bl/a1Tk7EL2v+nvqP+jKCKq2CavsFYPKx5a
	 OYk/BDOBtXXkTUs6fCF4SE5FqkRUuK6Uje9A644EgWBw3WZmRYHV0Eiu/djrfD4Y6M
	 xRAyYoW7QehtADEVjXQTB8Y2IajxUB0lRGpQZdp3NhfnHnTw0f35WIN/9EfBHtsFwj
	 cJvoo++PoX33A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FCE383BF4E;
	Fri, 12 Sep 2025 16:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: fix for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769341024.2998972.7366009193918990965.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:10 +0000
References: <20250907123058.175447-1-dinguyen@kernel.org>
In-Reply-To: <20250907123058.175447-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  7 Sep 2025 07:30:58 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: fix for v6.17
    https://git.kernel.org/soc/soc/c/32687c066375

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



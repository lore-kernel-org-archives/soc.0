Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95523537FF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977808; cv=none; b=H6ei1ixmHNQYPGMoFLQwZlq0QVRWFDn2ZQ5fMX5qUmENEOWi+A4HWwrJBdpBakr5zWBL6UP2QqcjK6YzUXP6Rpt5f4kv75S2DokcmaOpM5MZbCDwypwCqJbEnOXeKQYQry73tQ4mhXwDJkuJJVspu6+WFg/XI9kRJ3y3Bq8BV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977808; c=relaxed/simple;
	bh=5KScv0A4C+/53EXIiPCss6ekkrq68NMkuOY2pVj6x/E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E/4yVqWnExp0phMfmBG3Lc60i4cEIaf+bX/BPS9foRZM7KhvBMkz4qmqZbsOfDGMMPGKw+B7FVLhYFQvzRZfDW0a1tUgxbphG+Em4pdqe2bmyKI7JDxlCTB6kuHma9sLQM0vH76qoRP4bMjvzv60GyRg5LUZZxIFw9kKe5VHrOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZy0rXk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZy0rXk5"
Received: by smtp.kernel.org (Postfix)
	id 9AD091F00898; Fri,  2 Oct 2026 21:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840931F000FF;
	Fri,  2 Oct 2026 21:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977807;
	bh=ubkNAiTbhBlSZyXkrtufABukKj2i3U+LRTcfj5jHfMk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bZy0rXk5J8F3+fmGDAhut7nIE5x1KAP385SeWXUN/Sy4mMHRTsm7SS87JPnSnNVHy
	 wTjnMN2gVeN6A0maPdd/+DpRUFHZR6+qZd6Whz207uLipgPzJAsEOhey8PL7ZAIwBx
	 f6u/gMJwGDXNX9Wv3woTHXtLEghJGQaUIznjYpSV50Nj7ZVca1nMsh5vzWba8Ldfhi
	 /4VfecTqR+6wZc6iqFJBJYvv/YM/AP2WIDB7RUCRoJNEQLndieXb5S6IpwfUIbTPKY
	 yxkwtWZt3fzi84u9siS5+YYJNBNlxiMCXYzgKgYNfUa9wYRc5LNr0/H55hdR0o0M6E
	 kpm0XEFjz6iUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772AD3811A72;
	Fri,  2 Oct 2026 21:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] iMX fixes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097780628.3602058.12183694900865077651.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:06 +0000
References: <20260922145600.2249087-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260922145600.2249087-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 10:55:59 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] iMX fixes for 7.3
    https://git.kernel.org/soc/soc/c/8166a325157a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B15339872
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080247; cv=none; b=AwPirG3fIRNff1xp8ysiGyQcbZPsf568jMgzT5rkBhLWuXsbjUHzRCf4sVDyq75g7P2CBs6QfbucGYL90HIgYDqBEaZGA//XEwoZaqs66eJujHAJmOUqYjgNu2hLV/CEDFbiVcbDfJ/Ohm+qgdFZHEVTjbWSnQFJnaryAeR/XkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080247; c=relaxed/simple;
	bh=VVyrdNvNKFjbL86QI+zi3b3m9aAA4gFgviE8hyMnpo4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Y0ZtCEx9xDMQzCJQBQNyuzH51Ied1v2ti7RVMh9iaqguIY1v2MVTQQ0ylfs7r4DAUkqg/5z/mShuruEE0g7UqMVJHCZCjRSdQ37+ey6p8ySeaJ4Isor66g9jRYmqLEexTKSW7/ljh0O0ZQz9izTKgt7WsWjqt33iyX4/G58xB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGuun05I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGuun05I"
Received: by smtp.kernel.org (Postfix)
	id C4C2DC2BC9E; Wed,  1 Apr 2026 21:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF69C4CEF7;
	Wed,  1 Apr 2026 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080247;
	bh=VVyrdNvNKFjbL86QI+zi3b3m9aAA4gFgviE8hyMnpo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gGuun05IMXNUbW2cEaaYOWESFfa1OQ5Jw71szfQHRrzvEMDsoadROTd6PvxhB7QYb
	 ilB3UTbfoeDyjxX5ZzR9NTfE3pzqnYx7I++ujiwp/oFm5WYLa+eVARVZuasBa41zKM
	 c5H4gzoMBelwX6pil98WJTmn1UH5QK9oo9hUlWRmUEZiburzsoX4gUNexcLktjRMEf
	 SRRlRuVLq6oJyXbm8FCN9FMdTM4WaQ1iYUo/AMyp0UbU8Skl1jiv3JRVJdVxf4UK02
	 Q8hTQFL20C5FuBSnG/mNkbUglli/iS2qHfofnMA/XQpNfIQowffosHtYQunm7VzX8l
	 ut99LZZPdHb8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F253808203;
	Wed,  1 Apr 2026 21:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] CIX dts changes for v7.1-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023028.3876275.3848377971167790815.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:30 +0000
References: <acoy5sx8l17P9jaI@nchen-desktop>
In-Reply-To: <acoy5sx8l17P9jaI@nchen-desktop>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Mar 2026 16:23:02 +0800 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v7.1-rc1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] CIX dts changes for v7.1-rc1
    https://git.kernel.org/soc/soc/c/d2be897ff931

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



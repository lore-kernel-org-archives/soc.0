Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAA191F89
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944260; cv=none; b=Ya5c/SNO4cFE9oEMqOCwCc8CD5NSOXWgw9dfUhPrQeZ3b7ppF0innl87LLZfqG2lkUenV2mJZzq9KmEmikXcshLvzRy1C0m8Y+fkSaEBvKIzj+pN+v5PDa9iSJ5ph2Te7Q560SSbt3w4s8+piZa+SHRhgcVR2USFxFK5yo0Kufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944260; c=relaxed/simple;
	bh=E9Dp3l8GqbSsDGGUC1MLBhYgcfW7+mJ5z40qqAZvxUU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HWPkLYJG75d5L4akAkNubzq7HBiEK47cPos/W7Jxory9rbUzC3IH90av+r+PWnHlgDKzR2o1fKdbdyDwr8gUVc7M/dBbKe4dSvYga4xWuxj9e305bM1WCWeOaiJiuO5NFJdRooicsR9BFtVnv8hHrNPw95djcFA2/DWGHOKRYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDXDPRcP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDXDPRcP"
Received: by smtp.kernel.org (Postfix)
	id 1AE79C4CEF7; Mon, 15 Sep 2025 13:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75BAC4CEF1;
	Mon, 15 Sep 2025 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944259;
	bh=E9Dp3l8GqbSsDGGUC1MLBhYgcfW7+mJ5z40qqAZvxUU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TDXDPRcPrNRtTh/2uaNSZAQEXJedbkewrJT+nW29Y/0+TMsgPa32/5rFlkPW07liu
	 L/Oml9B8E9rjflukWzehyqb/Hjzofd/VTfws5w8+U9r1gzLCOxjnz6kNGRCUGKOz4G
	 kv6ws3wSiATkUYbn55MLaEX44P3L9cMKwN9+xe+eEDtYBXOP03YRRH4BdrPHLzgjbW
	 9B4f6JBej2PzAWhH+6IauuM9PJIX20MvXCVT9KYYhXadgliEYMxtQ+rbYF5n5QppBu
	 jVDFvmA0lKhNYrw5AdDUz6l+AD5kPtpaxnrMWbmVVkpHnaH/MHiA3RhmBqcfC3PQYm
	 QctHNTBoFJgMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF3539D0C18;
	Mon, 15 Sep 2025 13:51:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: mach-hpe: Rework support and directory structure
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426123.4179625.15660215322664851936.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:01 +0000
References: <20250813170308.290349-1-afd@ti.com>
In-Reply-To: <20250813170308.290349-1-afd@ti.com>
To: Andrew Davis <afd@ti.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Aug 2025 12:03:08 -0500 you wrote:
> Having a platform need a mach-* directory should be seen as a negative,
> it means the platform needs special non-standard handling. ARM64 support
> does not allow mach-* directories at all. While we may not get to that
> given all the non-standard architectures we support, we should still try
> to get as close as we can and reduce the number of mach directories.
> 
> The mach-hpe/ directory and files, provides just one "feature":
> having the kernel print the machine name if the DTB does not also contain
> a "model" string (which they always do). To reduce the number of mach-*
> directories let's do without that feature and remove this directory.
> 
> [...]

Here is the summary with links:
  - ARM: mach-hpe: Rework support and directory structure
    https://git.kernel.org/soc/soc/c/9685b2975972

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



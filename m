Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B4285C8D
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218606; cv=none; b=oh5VswpnqJmINJblwxetzD8/UBVgXm5y9vyByN3ZtSI75hKfilEUZ5TKdADIQS2M01P9iTEDEOnqckWfpz4pkc4XithoGbI77Iy1TV8Lf6OIxvwfAEUbEbmJrv+SZryAKeSxknJpxmv319BFZYzoFm6DmkjsDmbfRlyo4i6tGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218606; c=relaxed/simple;
	bh=APhpqNFKrHMuyhX0lCHH6HXM5F9SOblrwwlGYBdLtHs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LSOyoHjXynQCjL+yNvb1u1/f2uTg7uqNRYF88LkiYvcEl3mv4Tk5CHUuxcROMoeh8IxYHfzKepYZzEcHzP+6+8OjsIcbWMJUgrxPksGxavM3dtxd6XGL+22cHkA3E5e0oq8rg9abEivPc1J56Uajq+wjzc5kp9co6CzeXrjL00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGSkZKU8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGSkZKU8"
Received: by smtp.kernel.org (Postfix)
	id 1994BC4CEF6; Tue, 22 Jul 2025 21:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C37C4CEEB;
	Tue, 22 Jul 2025 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218606;
	bh=APhpqNFKrHMuyhX0lCHH6HXM5F9SOblrwwlGYBdLtHs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hGSkZKU8TkmNBJvFdO5LBMLe0y+NRXDLYh0Jfvy9Bapx5NjcIvBCge4zGFFFOCRqW
	 N3lIIxMS58x2A6bN3ynp+WRxSZXMr6b7SEYI5ogklZu+PaWGAhhDIdNRNr1mJsJ8h1
	 tdFvVuSZ9ThKfXPHOPMXXOyeoLKJt50LUVsrdOXesKaYDN8NQ0/RhU8i0ThHvbqNoP
	 cxnnUBy3hvYvOKpDvb4niCvOKjlaR3VN1fx6jUPY1K01ru8GCO5PDHNtqdn+UhTc6b
	 OKMn9zRQpldYPHMWkqqKtbqZwl0Y1zxyqlYfDCt6WxpV8e/10cLorRtxVQiyd4VIvL
	 4GTW/RNJqoixw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB89383BF5D;
	Tue, 22 Jul 2025 21:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321862424.955963.14217960660011072753.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:24 +0000
References: <6879FFED.1050002@hisilicon.com>
In-Reply-To: <6879FFED.1050002@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Jul 2025 16:03:57 +0800 you wrote:
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
  - [GIT,PULL] hisilicon: driver updates for v6.17
    https://git.kernel.org/soc/soc/c/b8a1036ddeeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



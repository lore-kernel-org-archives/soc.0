Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD313B792
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473392; cv=none; b=W3e+8DpRl4fXMZlLViBmpYbRXWs5h77p6aKK6F+pZNoeFyeo3EzNaNZ4NKomZBG84svC6k6wAIASDV4aizlIN7Va5DLq3b3cuv4F/syA0GEkBmcI1yY0Gcp79m9DrSRJEDUo/DAtW0hCGfuYpCNV6CUHUoFPcGiI/w5DpmWzRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473392; c=relaxed/simple;
	bh=oLj89sOvsuBnt3CU5JGVJgvFn82ssm2KcLwqYjbNDOE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fk0JsaB4r++6LuvSCM9sv0nSQuszueNCnlhLXzygvPcIxpqyvl2KmjOQNU+rsrOx0Qsazou17765sVBm+P/T8k22fE05e0cwEn9TDLqx5n/IFoAyFUZP43drnpw954JJv1lnPRktNvwkWlRSZ0MeGHGeDGoZ89gKow5pK+GyCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv8kLZpv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv8kLZpv"
Received: by smtp.kernel.org (Postfix)
	id 4B509C4CED2; Fri,  1 Nov 2024 15:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35944C4CECD;
	Fri,  1 Nov 2024 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730473392;
	bh=oLj89sOvsuBnt3CU5JGVJgvFn82ssm2KcLwqYjbNDOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bv8kLZpvjDM2wTa9fSb4qimF8g7mZhaWcpu3GNZ9E4SuuI3Tz8VhDgDU+Z8RSIPUx
	 eSXcKQ5n5kDYEyL9X1vY3qer2k5yp4QmWc8tAeP1YLG5rcWvcqTEag2JHZBYWJKrV1
	 rGdZ4bZQoNkuJHTDisDP1QgrBHrvAa2K6qr2y7eRtKCh357LK88XJkxB8B3q+4+p1a
	 IIfCTukD2wdoxwkgz944+3P3RVksrN257OjEDx9xWlJhUPLGaa6k4nEXZXGZo5Xuvs
	 tSxR3hweMWfmjrHlHmYJ8pXKe+QnTk9bQ2AjVeT3NFWQOa0k+fccvdqF14MaeU9YbS
	 6cxJkb3N0jkGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71E933AA7F3B;
	Fri,  1 Nov 2024 15:03:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173047340025.2666840.7049076348333145934.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 15:03:20 +0000
References: <MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 26 Oct 2024 09:30:59 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt fixes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
    https://git.kernel.org/soc/soc/c/e29c29343a89

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



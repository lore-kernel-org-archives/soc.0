Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54F3218B3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080252; cv=none; b=bN48TcULgrXge0yIiPHN+qb5F0v0AGSnB39Ecj+7ru+um9/9AXQhVRH8IYhHB3XyXU2BZHuWKn5uqNlsLmCq4GtBfCnGJK0zeL+SZo9P6SZ0dqgD4TUji7EOf6pyiDMAFHex6t0YZfrae4Xr5wBYdPwE12PluQh9HehHSuMyWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080252; c=relaxed/simple;
	bh=Q3kwz0T3/gQbc3ExoTJpDWBJJ4AUTPDlqSyMxphEr64=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ryNBmdAPniCQe8ISPi6hxixS7UVrnglWOawoOyByiE843XKTVsacABvsoN0ohofyQaVgdSXVbdxpTzrSBQctyrLvsSbHtelQ+ff+NDAmgBka8nZAdSoUYFLt4LyA6LRQt+9G/cGzPiei7K+ctsP8noaoPqThcZMCr7GxdF/3jJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcLiwc20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcLiwc20"
Received: by smtp.kernel.org (Postfix)
	id 4802FC116C6; Wed,  1 Apr 2026 21:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320A7C4CEF7;
	Wed,  1 Apr 2026 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080252;
	bh=Q3kwz0T3/gQbc3ExoTJpDWBJJ4AUTPDlqSyMxphEr64=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DcLiwc20B1kbdcD558jIqO8FnPUetsBpSkBCHp9IT//MySqvK4OC4UqNhftYczN1U
	 6LtIGBb7xsYS8Bo0FlJZshYi+/JC9P7NdejcUicgM6AdsXUUPUSURphbl7S0h/QO63
	 RaphFz/gbtGJ7JHGzFRVwERp7CbRkwgYLWT3FYHndKKC4bjpy58kYGA30AiWE30G5A
	 L7DXBtuKJqwgq1beDcG+Ukuai2yVrFhQyKH9huKk6n2GcXZ1NE7t4/Iyy/TJHjEsMq
	 peZtfmsjQFjYVQcnHYBzSoZ3PwYe1NqOTUZt8mWz2uAm2RyrCamD5jtft2JUlos+8E
	 JpCRSS9vLVKPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD503808203;
	Wed,  1 Apr 2026 21:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023478.3876275.3265875301169374278.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:34 +0000
References: <20260331205318.952913-1-andersson@kernel.org>
In-Reply-To: <20260331205318.952913-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Mar 2026 15:53:18 -0500 you wrote:
> The following changes since commit 2c409e03fc04b5cded81b7add9ce509706c922e3:
> 
>   arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
    https://git.kernel.org/soc/soc/c/b986e98ccd0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



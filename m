Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731A330330
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841813; cv=none; b=M8zY50xv1M4pS9m5ADcp1enanOJ4AIyL/TIC6adXhJck2KVW+0/RrYeJ9MdWD/un9uovTWbJdKGaMrZR5tIL/9VuNB5xBK10k8wkpFjlh+iNEMmj/wl2yVAa2qgH3dsgrjCakIL3OiZdE5C89lwgwPD0hTduRVMy0JKdwkXXSts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841813; c=relaxed/simple;
	bh=Qj+KXJ80AuMPzSv/DLL5iv92KC6q7XjTCp/iuW+eNy4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PpXSJt5Li0OYUjzC+mbfAe6VSVHPGoEJ6cdxcKDbSX9E19lixEZG07tCKaJPKL6ZtULefFzYoa4lBc5MqLk0JYg9SXcQ3HHXV6Bzsos4W6DWnxAXTOdwAJFuw9Z9ZplpmeLfnopNjRnGqfMdj667UGCwo6dCj6Be3vAQPNV+y9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epcgnTdB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epcgnTdB"
Received: by smtp.kernel.org (Postfix)
	id A5D39C2BCAF; Wed, 18 Mar 2026 13:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F243C19424;
	Wed, 18 Mar 2026 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841812;
	bh=Qj+KXJ80AuMPzSv/DLL5iv92KC6q7XjTCp/iuW+eNy4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=epcgnTdBtTjE1Gsqa4a3AIQTzy6p/5NTjw1rhIN+DDYcKsDjCJA4zHSUC+YLZ1ANw
	 BzfSAubQ5VyLPtQ6vi69Mo9XySOIe2bvsXK4L95hvUhEYaxcuv/c6ADBVNafejFdg1
	 fMfWDjltxXSC9jjcyKzIgFonhMh/DYmGxMZ9rRZ8sE4fqv1oDxRrwVV9MviEivQVG3
	 lYbRIQBZd4djzTDqY1KIDMpdkD+dfJp0katKswxT43bT9COxJzEBoQfQx0hSdcnnu7
	 jn1qm0JpdSyY9bHqem6ofep2/tgp5QfxVdvqlZse4+Qxb747rnv/CThQxAr2vgy0cg
	 rtfglqqvPtWUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD6D3808200;
	Wed, 18 Mar 2026 13:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177384180428.304324.493500439383225722.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 13:50:04 +0000
References: <20260317101115.3873019-1-sudeep.holla@kernel.org>
In-Reply-To: <20260317101115.3873019-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Mar 2026 10:11:12 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fix for v7.0
    https://git.kernel.org/soc/soc/c/dfc80d650be7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



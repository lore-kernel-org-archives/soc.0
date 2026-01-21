Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6427123A564
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011234; cv=none; b=RVNxbOwPsuhrbpjsrNnHde5h1+buoaWSBKgqespQGfsEMroanzbI945B+TRQWm2YGXodzhFifFTqhekOtfzgIME+FlWculxR+IVLzPJE8AcmXYy+amzJvzzrjlWQ1I5XXetxaYKKTMwvuZOtP8vq135z1w96Lqt/1ucBrXFFTyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011234; c=relaxed/simple;
	bh=iJ7PXjOLtwXcsYlrMfjX1WSuk9Xb42h+e7kEfTi/xOo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mcka+MY+Nkb6SFyBcsnOOBH/LBC77PgfrvG8UuJSGrOzGsdUxCk8U+Fj/dmA4c9WmhqXk1x7QRqEY1428aiejLZtp46GJK9bWBKhBT7s9oRgKv7upBGGvejtgK+DBXSYbCFwBlHC0ZNEIgBfJZ0br6ihJDrhhAmxa71avMqBYkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVmn0nH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVmn0nH8"
Received: by smtp.kernel.org (Postfix)
	id 54A6CC116D0; Wed, 21 Jan 2026 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE44C4CEF1;
	Wed, 21 Jan 2026 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011234;
	bh=iJ7PXjOLtwXcsYlrMfjX1WSuk9Xb42h+e7kEfTi/xOo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GVmn0nH8VzoyNVIu/AlZmrcDBR376x2m1dpw7OYaez+1apATpIHzpx4/1E+KEC8Hp
	 HkNxdsdXH8JaVLDItoLifmZXadYc6JSQyoPfmBzJkmVyZzQyXoEDeJRznr4RqCpMVX
	 cI8OdrvooCX8O/VCjR6CcNcvOW+WJHMnH/mSPXYEtoCi72p0nwjfp5dD4qRJkJHa2Y
	 XbphnJqch8tlaUE5obuvkp0spAodprn4x1b9iqlFlJLCLZ/flp4xucs8lloKu5sCmd
	 fYgffDl3m9AlUIcXcf6YqYX2+HESK1Rj9JrJBUw+7lakjH6keG2pkCDFWgZJh2wS5q
	 BX5Sv/j7u0+jA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BCA53808200;
	Wed, 21 Jan 2026 16:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers pull for v6.20/v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901123109.951664.16149108270204082565.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:31 +0000
References: <20260117180406.9361-4-krzk@kernel.org>
In-Reply-To: <20260117180406.9361-4-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 19:04:06 +0100 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.20
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers pull for v6.20/v7.0
    https://git.kernel.org/soc/soc/c/ee405f1a3bab
  - [GIT,PULL,2/3] arm64: dts: samsung: dts for v6.20/v7.0
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



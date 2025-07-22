Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C327EFFA
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218603; cv=none; b=aPNZ5M+EdPDxkdZDcLI21iD45FtPrsiRtKJiorc3NppF1E5B4lTUwwbwz5ankh6jrDKARAo8KbDsWzyeSDC7Hb39fA80CzD7nsXnDJm9AUswVhL+0G5L8qxTvflTzVR7u3DvSi/hFDMierLa1ycTy6PcsKB1VpeEHsdfCsiKUJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218603; c=relaxed/simple;
	bh=YmrjnBmesamu21eGqvUYShnDuKJo8hDj3VwJt5pHe78=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=US6PzFY9hnJRCWV5mFYm7woeRXE+AO9dJlF6oeG3QHrXcNyBRT/o/qrwy6Pxvr35TgMm68jQH1hdmcYlmQ5gCm2wcZ0cWfHL5futOVQXGCk2zk6exXXkjjo8x8FInhz7Hk2q5pMH6i55caaVjPQTrwhuBEjwSZdD4nbeb+io1xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9Fqlbfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9Fqlbfb"
Received: by smtp.kernel.org (Postfix)
	id 600F5C4CEF6; Tue, 22 Jul 2025 21:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3BBC4CEEB;
	Tue, 22 Jul 2025 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218603;
	bh=YmrjnBmesamu21eGqvUYShnDuKJo8hDj3VwJt5pHe78=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n9Fqlbfb91EHYJHrL0GjGwWNXZefU0EV4JBzM+f9AGsTmJ+Uw3B44rUURSuxjqRnH
	 anviI69GSV06Nk3CoMfOuCManeOgnaq6ieyO/vyXqFIFNxosZX8Va+iAlEJa8GAs6G
	 zfzRqPwRe0+kDsLsYLuePLvAk9ykCj5BGt7DRWhr/mOTu4Oux7KimaM8t+cZd8vWEO
	 3bjMdPxmCpV2aLgnURVYcOKmjMzaDKQ73t32qspHJ1rQ2Hd/SIQw9S6cvsmklTATUu
	 ywEB2uKokftk5/9+95ev/mZF0T/nk39lWrmnUXxwg9+tYKTau4cyw+a3mlDpSU0A8s
	 gkOG4zSiclaJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEB0383BF5D;
	Tue, 22 Jul 2025 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321862150.955963.13816713180844790314.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:21 +0000
References: <20250720030743.285440-1-andersson@kernel.org>
In-Reply-To: <20250720030743.285440-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Jul 2025 22:07:41 -0500 you wrote:
> The following changes since commit 9f35ab0e53ccbea57bb9cbad8065e0406d516195:
> 
>   soc: qcom: mdt_loader: Fix error return values in mdt_header_valid() (2025-06-25 14:31:31 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.17-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v6.17
    https://git.kernel.org/soc/soc/c/5b8141596b06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C61553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961185; cv=none; b=YRm6Pvqhi/hFTVkWwDU4HQKO9yJ3kMd97nDenmxTDmISU1BcEU1xCgh/VMRpa4qH3WCTrSO5jN8nkfsFY77P/+Z5KcW3Ay0pCQ/62eCNfnN704pB4JRt9Kb2Mi+6u/WXMtr0hQEhz/tfb2BsvSjD+P8mjkh6azjX2QnmMSTlIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961185; c=relaxed/simple;
	bh=tl20WAPi4TbA4228IiTMhrM9EDJ9whm68DZtkeeqmVY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FtzODLIDeVd/2tMvgU2ZM/mJoRfCTpNAC++dOaUmUpEAPsTELPfFL4sWiUEsdxAhUCxiSo2UNYlLoxT9agvNcym8Zb5kxzlTtenjHj7tb709UaTyvvG/UKyJ4QOaP/X7qDohYXaeWKl3wQbl4bbA5f4W7oVcE4Y4/hqZvfRPR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsAu4ugm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsAu4ugm"
Received: by smtp.kernel.org (Postfix)
	id D6839C4CEE0; Wed, 15 Jan 2025 17:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C107BC4CEDF;
	Wed, 15 Jan 2025 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961184;
	bh=tl20WAPi4TbA4228IiTMhrM9EDJ9whm68DZtkeeqmVY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YsAu4ugmIPFftnhSKiGcQB9wBPfC2i9K9lS39UBm8QPrDT4Mfsv7hXxrl/fEZ0I1e
	 tPcYAIz3Gn28rGLXJTTvVRDM9POa+75km0zLnHgNUiVC2KSKXd87BE6jghiB3ywSc8
	 EPkOLQVpnnokf5H5H4DgETokf8BQ8RqET5i11SmQTP4IX1lKW7ExtBQx7XEKqgUa2q
	 oJ3TCywKX69Rm6qFAjvf2pm+Jf20uaIYiOb0nAtKN7QyP0BltL9rd7XtZh6MDZY1gf
	 tA1EEgeksVIB0rqdgR5nvqVdOo+w2lbbt8LPwG2Eh63YOcu+gdeDu+UJyp8SFmcXq/
	 NeWhGBDh0+tWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEDE380AA5F;
	Wed, 15 Jan 2025 17:13:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696120777.809051.254585036144435288.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:27 +0000
References: <20250111172901.391774-1-andersson@kernel.org>
In-Reply-To: <20250111172901.391774-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Jan 2025 11:29:01 -0600 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.14
    https://git.kernel.org/soc/soc/c/97d139585aeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5F1EF091
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 22:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758751817; cv=none; b=tudrD+APAOKYqXOM6ok8HhsEKZn6F30sat/vdxQ8gnzjoHt6jHqXLbnlL3njhLflc3+mU4IiewnRtEErKyOED+LTKCc6wFEPaQzUgcWaWnZwsX+FAfGntqiSjcCZcyNxUBDdkrMJGSXvWJ7Xmvlgn+GdgG+hY3KQIioILWZpiHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758751817; c=relaxed/simple;
	bh=gBnplG3/YvrEM1JwVbr2uQdKFid9dedoS/wRjPcx+6Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A/TWv4kojZFIHZ0dhxsVfl+ZtpUVkiHvlTuQQ4jbcNO23DNYyP4LBfgmKolVsq5vFOQutw5N3tIuRBcNhQRJBSZF0y4onMHSUdBcoZOCA00Dqr+t75O4I6ExjwkHhr5uzcN48buxIaOQFD0rCK2N8OL9xZv5916IqZZ92TkF2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUhTqo5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUhTqo5e"
Received: by smtp.kernel.org (Postfix)
	id 6A974C113CF; Wed, 24 Sep 2025 22:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F52EC4CEE7;
	Wed, 24 Sep 2025 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751817;
	bh=gBnplG3/YvrEM1JwVbr2uQdKFid9dedoS/wRjPcx+6Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hUhTqo5emtElaY20ZXY8eFy4VM1jygGw9oxdCmXtpHL4AfGbU/wAW+L6ODzL8WpLO
	 wWLeTUI7H9B0tHyQ7Wm3lf4jR6DtI4YVFkdKJtoCRKPb+UDCBNOEiM+nF+f9B8wHxO
	 R4adlAOUf5RriqxQ/FKGFKVd2o/iDwflOU1uEqmJ6Kd9a4QD46mk6QMedpSU7gf/Q1
	 ytEBQ4ijxayOvK/2oBSllTJlNAr5DJjFqv8cXESU0wemr1DT/H6nGgJGUu98QPMeID
	 orSpGbVF/9exgbeyehdYw7uZBJY0ENl8ISZdbh1zvladtOoqg9LHgEssbDxXj0EciR
	 5DNNtSYpCRUhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC7A39D0C20;
	Wed, 24 Sep 2025 22:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V config for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175875181373.2716298.15948366207771596782.git-patchwork-notify@kernel.org>
Date: Wed, 24 Sep 2025 22:10:13 +0000
References: <20250924-unenvied-armful-5fcc80c23d19@spud>
In-Reply-To: <20250924-unenvied-armful-5fcc80c23d19@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Sep 2025 18:46:41 +0100 you wrote:
> Arnd, Paul,
> 
> Arnd: here's the soc-related config changes I have for v6.18-rc1
> 
> Paul: I meant to come to today's call and forgot, so re-mentioning the
> fact that I grabbed the savedefconfig reorder. Pull this if you need to!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V config for v6.18
    https://git.kernel.org/soc/soc/c/072c35479790

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



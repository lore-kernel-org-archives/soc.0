Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F6288CB5
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234597; cv=none; b=jpeT1LAIq3X6kfF2zxZma9pwR3Mmox80SIhiwUwdMl7s7/yM4wC7HDz8HEcbYHB+rV2UvMWTpWg90cHQ929NUyZjFPgXzhjrwJgLK4GLpzzASz259txez9osE5DtBzAVa8wn+w55cWwjpGTGSDdmLfdL/xD1NiWs6pAFMByv0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234597; c=relaxed/simple;
	bh=CQt2JfqXF/L3UdroeqdhHpyZmF7L7TtkyxxCIBB+Cu4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dtL8Pf8lbM0y7f6y9ivy9H3duBBao7cUB7MoPS6zFrIsa0URnpFob4OLvZytOWZrJvOXxA/5suhA+IL3fkXsKgSJgEJowVxkyUlziqrnCCBLgJ6QEhG4eshaJWBaaXY5agt61MV6CUEOSXwMv5PfieNYLsWlY7hvf0IvF3d7Wfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNrYZ+fL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNrYZ+fL"
Received: by smtp.kernel.org (Postfix)
	id 859BDC4CEF0; Fri, 11 Jul 2025 11:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE2FC4CEED;
	Fri, 11 Jul 2025 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234596;
	bh=CQt2JfqXF/L3UdroeqdhHpyZmF7L7TtkyxxCIBB+Cu4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LNrYZ+fLnEoPNvjF0GUk+WXHbyZQYJervRFAjl6LPb34vfy/dY3CAYfg/5ENCFHZM
	 y4JF4pgnud4yWkm8JQRXw3ziIYW/oq/hdrNYj4xqb0fVWnmiK0TX5S6PHDBp26EiED
	 PwqgBaCSUXinT8R4a8DtJbFdN/+EjEMdAwlg7Jv1vZIUmSI9Ly2ssitJoCkpLoXmb+
	 jwxz5bg+gNkYESlugxRk8Xp7RH33FuNE4pe+wdO5anTc1gtLMdqFsINm955tRwbyWE
	 sg9R2Af6BIgZZkNme/w5FrPMevPSWDPGMUhfIoDOpgx52Uw0W8LZy2bKMRUXMTWmxH
	 RPqkAD12Ug8Rg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADADC383B275;
	Fri, 11 Jul 2025 11:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm DeviceTree fixes for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175223461819.2239616.5132641228518844463.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 11:50:18 +0000
References: <20250710175434.6201-1-andersson@kernel.org>
In-Reply-To: <20250710175434.6201-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 12:54:33 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm DeviceTree fixes for v6.16
    https://git.kernel.org/soc/soc/c/f2ebacd34eeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



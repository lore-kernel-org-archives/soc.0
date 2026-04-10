Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE13382D3
	for <soc@lists.linux.dev>; Fri, 10 Apr 2026 22:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859631; cv=none; b=sGq4VyncGQVcGcipfuBNeV917eZoGv4p09Kg0Pegzf4R5SOVlc/cBgZAymMOZELGWRqOs9w5+l6O9kIzgxFqo49y52IZ37CNtBW1704DUPi5NRFIW/3SytFFiqDvdnbs0AjFVNLt43y2tu/8ql3I1wKmlBOFtA/iCUPp14S9IwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859631; c=relaxed/simple;
	bh=hUpKNFAPaRvFHQ+ceamuKXWAIH8T2YfF5CEhiSNPMW4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uqEYn/GMH0DAqOgUXBYeO9i67LOWIyrSGL63iL4LKWDrGMOwDiswPme/F3d5pKnA3zDxhDuZe3ZUSn4ZKGuWuflXW2kPwK9t4JyDQKuEyuxjHqtgeRjdJ22VHWqbjP+fRGzP4XOpJ3IwOvLz6ds7qum3ZN+CJGRZhTDvqofyE6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvTcr69I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvTcr69I"
Received: by smtp.kernel.org (Postfix)
	id 8E577C2BC87; Fri, 10 Apr 2026 22:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784DFC19421;
	Fri, 10 Apr 2026 22:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775859631;
	bh=hUpKNFAPaRvFHQ+ceamuKXWAIH8T2YfF5CEhiSNPMW4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LvTcr69Ib9g6DE8HfsNYsbNoNi8fibAvF+mcJ3P94vtIE6t3/EKkHFREbWUdlwS7B
	 e2rBGNVapB4STaQ8tnHiCcxaiM0UopEaN7QFNY8/SQzjxMc1HrFDt+/BUhwjAQtuSo
	 EMIsIWUTHcKn2UXajQc/Knd919r9O3A+2yzaNeqIi83NcjK2pa9+3Utoa6qrYAOUXY
	 fnOi7S2Zm1OlgRVEQ6aERnzWvbLeAcsiLSHGTqoR/nGdG3Mu7gxbYoDd5iWah3pUvf
	 YLQ61t3fFQLji7XXwu8knpH/X7nFxVa6iRSF+4oU86Ab7VrCXIPRjZ4Ap+RxYH8Vvn
	 huizHgsq1eh6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D0C3809A88;
	Fri, 10 Apr 2026 22:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177585960580.2663266.11385627002619568935.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 22:20:05 +0000
References: <20260403123040-KYC0145825@kernel.org>
In-Reply-To: <20260403123040-KYC0145825@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Fri,  3 Apr 2026 12:32:06 +0000 you wrote:
> From: Yixun Lan <dlan@gentoo.org>
> 
> Hi Arnd,
> 
>    Please pull SpacemiT's DeviceTree changes for v7.1
> 
> Yixun Lan
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v7.1
    https://git.kernel.org/soc/soc/c/0ba8e918c7ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5C2010E3
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450706; cv=none; b=fzCcC5dIYcpe9eDjJP8bnoLcEPKKE9aDAs+q+Yi5gtnxhNR76mVkZEgBInrwRPv5tQfB1EwK+9wFM2UrAet48G0j362Ox75pu1GgNxE47zzzbEMqlUYJXlwOkcAkNJyxnqVYY0yWGNztRnU0w5dkymhRPbn3Haq83C01ATnvtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450706; c=relaxed/simple;
	bh=HhaMUTS+TVrdOyNJnD1/QHxEat+PeIQq081iYSlrh48=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PerCeim5+D3KvlPdwMkw5TZXyQrbbnUWw/Q1rKx0olHSyzd1nCL1rWv990MXQqDOTs9dOY1+Uhm6dJlMrG/4Ws2ujdGQq+X3qB47AeVfAABq7IW/Yh2fgHoXiTVmMwLmcji5yYvHB1sFhLp+dIzv29mTNZ6ecufZ6j167pVn1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFk1qJ+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFk1qJ+a"
Received: by smtp.kernel.org (Postfix)
	id 5190FC4CED6; Tue, 12 Nov 2024 22:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7EBC4CECD;
	Tue, 12 Nov 2024 22:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450706;
	bh=HhaMUTS+TVrdOyNJnD1/QHxEat+PeIQq081iYSlrh48=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NFk1qJ+atSPxJKbRy3G00orPRlWhXD8m011VNBWi2Zi0oLk+9Z+IEy7R3WuvY4p10
	 AZIeTjJ7vXS5UuDLeJqF7vDbyYrF3oyZuholZ1NzurzUBEZi7V9grWNCjMVHNmMnRF
	 Rn2RN4pApu+McnSwcn9Cfw9Xy/J210Fc3/O26ZlEFeuCbfPMdjRlYwyTe0OxOvoyJC
	 6Aviya6R7Axd2jWwbmk8HcdmDOWF3xLhG2haVsG7qyR8oRZVZHrM8G3sDaxnpJCRXm
	 pPkoieqGgwJeofEwQrAjlXX+TsvSqc+miv1llJdLgz6H4iMaHvScCPxogmqkvsp7hX
	 tJVOtpb5n1RQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE4523809A80;
	Tue, 12 Nov 2024 22:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071623.694695.8061017031050405757.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:56 +0000
References: <CAHTX3d+x1WrXhsp6+PQbo-B3T9q21tqE1RkhVsh0r7my3vH37g@mail.gmail.com>
In-Reply-To: <CAHTX3d+x1WrXhsp6+PQbo-B3T9q21tqE1RkhVsh0r7my3vH37g@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 1 Nov 2024 13:42:32 +0100 you wrote:
> Hi,
> 
> please pull these 3 patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for 6.13
    https://git.kernel.org/soc/soc/c/8b474333fcb7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A81B481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450720; cv=none; b=Gu1XBO0kwAt3d8I7EJnBrP71nunoy9xzpE2QpiRYB9k8DRVdPc+rAIuh9jgIbbHg9kW27DZ343M8pe67Fdbr3E6zefU92+QUO03fwQwCA6Z0neahCeSCIrBU7FeY8re07Aix2134OOdlJAMmcqUX3M1XIDGybYdBxYWaguRmu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450720; c=relaxed/simple;
	bh=0bV1bhTEnlYIL9PrhtUnPxXk+xuSZNvHhOQKYvFMy10=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f0Thlb5gXNZ0ds39O+jL0TbwTy0FOBaveoXeOzA7G44GiND1QmZ/8VNVmnojEvPdNHPVW15RkbZ3SOK45oV7yHJ3dwjGx/v5WOHzgolzK8bXsA6/2kNY1WKd4FARIqaZns+P1s2tADRMjcU2wzELuM3j2K/oIE2j8Xxbojd+pCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFAeMVOF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFAeMVOF"
Received: by smtp.kernel.org (Postfix)
	id 51514C4CED5; Tue, 12 Nov 2024 22:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B83AC4CECD;
	Tue, 12 Nov 2024 22:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450720;
	bh=0bV1bhTEnlYIL9PrhtUnPxXk+xuSZNvHhOQKYvFMy10=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lFAeMVOFJW5gu9MluHVvlZ/LsPyQ1t4/mMFDUoN440ov2DEEuEdE1VNljDK09jhx6
	 VMm1iUGdR5pcVKYJLRx0ux8VWfYJLnJVmezyKiVcN7HM1I+l4YiDghU9ziNX5CYk5V
	 YFZYvzs2ezUC+Xkt6Sg27YFLdEDbhIo+yXBRQLGRMN1qaodMIVhNFc1gv+G7j2r4GY
	 LIR4MZrLyeFHvHwYrT8bwBbRaF5kMuGjGrZJN+qBCh7Q3iVn3QgjNA665dFEp8rvks
	 ZzLTzK5QV2gRHCRG9GlthbKmqfr2NzO/KmmrEl9OENMOCJLTNp9jgfjgua35YFwmGx
	 ob7hQJNYAhvEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBD43809A80;
	Tue, 12 Nov 2024 22:32:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145073024.694695.7988075181683054174.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:32:10 +0000
References: <20241104034744.14378-1-andersson@kernel.org>
In-Reply-To: <20241104034744.14378-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  3 Nov 2024 21:47:43 -0600 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.13
    https://git.kernel.org/soc/soc/c/7e2574fafdfc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



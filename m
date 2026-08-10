Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4463E5A2F
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380682; cv=none; b=o6UyfHtghHlX12b8jHprYp5Cp0HbRCloIiiDvgWxm0F1slo+aEAA4jY6xAmf8sBwD1CsdWEAoTtXwpLJlP90ZrM5vNK6yFQ2Pyl1iLANS0G2cqmfsx0HaoBHNTlYMEcyto38d70xfEcmnJZGHuW79YNmFrNFdcemlO7c+INntFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380682; c=relaxed/simple;
	bh=v5xvxAtQobcQ3ib+LtOjEIoVvmqZg+q+cNwi4wbur38=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aaviJrJAjug0XHDLHi+lA7tpJAsRmLO9ix6/vhtW7cdJJYhfhptV+5NGLqUyOtZkcnDeDMnCFaJnGaSXiJnOUDu/NR8T8arFxUVaE3N/YruH8t1+tREBcy/MZqAOBtKXK3+SqjHJ7oxJ/h+GBcJRoLh+RImMwSwYgVdBaJOahpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSdqxMFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSdqxMFc"
Received: by smtp.kernel.org (Postfix)
	id 389FA1F00A3A; Mon, 10 Aug 2026 16:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B5B1F000E9;
	Mon, 10 Aug 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380681;
	bh=JJmfOj5w2Ss1Ml+sn5+1qsozl9ufsSh+X2V82gvzGrI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fSdqxMFcq78mZFUx4U52KPmfKHmCWS+YaESDEilBv4saUcRil57ZWb/lNatqnbOnr
	 VXRQ1U9VE2hYszpvvRw2AKsJFYjjVqjWVtyo1JYuKunTfmBdhm3Fk2K70I1tjTit7g
	 a4iGcnnaL4IoTNEkIKktp9HgycJrsp7iADQMYGS/OagcdoNaxS3lf5c6DycMWW9F47
	 6KnpcX9hn3ELVN7wBY4BxHZSIh02nksh/ck56j8aBi+w+I2wGgfn/uYWDB8104CaHD
	 /GbaO7KY8jAGEz4bzzK0B/MN3MFBEEnFzhdB+HU8SUyvA9gKVpX72IsJ3ZPtehf7yO
	 vKXLpODLLBkKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1988F39253F2;
	Mon, 10 Aug 2026 16:50:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638063763.3872609.9920540210952957691.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:37 +0000
References: <1333a916-da71-432d-99ae-69cdb6061add@linux.dev>
In-Reply-To: <1333a916-da71-432d-99ae-69cdb6061add@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Aug 2026 08:52:02 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.3
    https://git.kernel.org/soc/soc/c/545ecc3577d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



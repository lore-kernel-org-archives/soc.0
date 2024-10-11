Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2019F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644374; cv=none; b=QN/ygF3oGUOswj14/AWJO+Jcir8glEFcJpZsdoRhyTHx/MW7K4OYXZmGJqLvJ7DB70CPZQuhQ3mwAEIzTQanakswR4OHapWb7GAp+AvESPHSlSbHxsP7KJBQvLuVRn4q7+KMhklUpLwh4I8dElWp8Bq/hthNqXit7MnF+LY1DXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644374; c=relaxed/simple;
	bh=i4oByrxVSiV5fCZ/k/SYer1PWkgNA5PFrg4mKay/kgk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X+tK/iHe9FFCyiXD5q2iYTyM2Zs9gSQV1o5gU3Bl++4tcfm7k78pxg8lIFuwsnVv3SLb+JG7QzmCmvuoWoGnXmgyza0ZpEUpERXYOs6DocADCMB8EkoQwIQnvdBEWuIhQy6OME/+Mm1woM+x1FS5r7djPqpCDf5Ow1pMHg3kD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTL1wlt7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTL1wlt7"
Received: by smtp.kernel.org (Postfix)
	id 475ADC4CECC; Fri, 11 Oct 2024 10:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BE7C4CEC3;
	Fri, 11 Oct 2024 10:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644374;
	bh=i4oByrxVSiV5fCZ/k/SYer1PWkgNA5PFrg4mKay/kgk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XTL1wlt7zUEmBDcMAq3IETsfy9rtTzVp+yXtsKjp1CT8i9xrxahqzjhOrfgW0posp
	 4o2+YplQCBZaGyxirJzWEHjOFu8cWmHcxO0HM65+oIArxyMMSI/7aPhNpINvstPWpc
	 /k5bH1XsEa1LurGNo5j+Q2RgyGdrkhnXoXJFBDg80zz/QOuQTgldH691G+fZDUug3K
	 dzgskEhtfgMppor4KCj+nInU4AWLIOXzwcdgTarrKJsL1KtX1ogszp0NoBYmOPnV0A
	 ulaqSFuuEMPl6g+gIx5oCCSYunL9FVw7wi2OU02VmymCnH4/7vLqxfUmPJ0I/j5jfr
	 rjQJyoPVsmQGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB12B3822E4C;
	Fri, 11 Oct 2024 10:59:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864437873.2676212.8228577511209809187.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:38 +0000
References: <20240827122926.30794-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240827122926.30794-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Aug 2024 14:29:25 +0200 you wrote:
> Hi,
> 
> I might have one more smaller pull request coming later.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.12
    https://git.kernel.org/soc/soc/c/3a059ee6553b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



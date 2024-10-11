Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB419F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644350; cv=none; b=O5kke2j3HJgpt54b1sOk7Ze2rGV6523r//wfFSa8hwm+416ct65CNnT9li92Cn/ntIPzLZ2Z0+Wrw+4UxTD1B4C4IqH6UEaSxq7+3PEXNbh4cv1MkscMvWGlh4odfDsbBSUJ3g2UO0xXX4v56YrQRnBssnWa89kT1wrffb3Qwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644350; c=relaxed/simple;
	bh=Uv1NJ1W44Yc1oJjcYnb1xU4P76C+lqpl0kwBwPhqI6A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EWo/JOgSELn5ADDWszVFdBrcS60QucdYuz4wqC8QdB5iXWFbzZlQY+0sOIgwesZCFcOWCUEqPszVIymQzztWDEX+/TeGRVSUVVo+IazaAzMwFTzCA386g044dyOXL/ORA5QSNYUBNbbVhSMqrmM4sik2i8rJDzeeGBGQs7Z5fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlXkTaN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlXkTaN5"
Received: by smtp.kernel.org (Postfix)
	id 4718DC4CECD; Fri, 11 Oct 2024 10:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEB1C4CEC3;
	Fri, 11 Oct 2024 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644350;
	bh=Uv1NJ1W44Yc1oJjcYnb1xU4P76C+lqpl0kwBwPhqI6A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tlXkTaN5Pu5tv3KqxXrDbriJk9NSwMEGs4FR1zPX03ytvuoCVUJ487f84qBnu/Knc
	 IuV5OaTJ4ZHPBTWO5BrgZ+zLJgmSkFa6mNoW02svm2oVlZWoqamkvDKMmvS4z0vfoG
	 ICnaHtK3eDneauSBTSpHM7n8jBoac47NTrLDevRE+WGPt5kyrD2A3RptVifjFiski5
	 6htH3C+Ws/wJH8Ld0MtwUrMFw9L2pWhWhXq9IpmFh8moKq3XZPnOaeVgQYCdq16ksW
	 04mJ074Du0j/bC/lYONRc9xGRbivxhnkKb2l0gzp6MfmFMUVUWVuzXEa826N+STGf2
	 AVaMMU89LH11A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEB53822E4C;
	Fri, 11 Oct 2024 10:59:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL fixes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864435448.2676212.4621083183503289847.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:14 +0000
References: <c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu>
In-Reply-To: <c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 3 Oct 2024 07:21:24 +0200 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers fixes for 6.12
> 
> Thanks
> Christophe
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL fixes for 6.12
    https://git.kernel.org/soc/soc/c/dec17c8b365e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F602141AE
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645268; cv=none; b=i/8BUidVhBw6d7dfxK66iuBhJVfUiUYjtNuyQ0Xs8e+ndrdi5XzbgM6xWfSTm6wXo20qlSWytNerTZ7JqzxeonnhgvvzhZLIbxPxsYApniWSKYEjDXrJBYrFYd5u8h7ai5iV0PKSwfsb3U/xT8FeWwiCgj7ytaucS6SSuRPnnVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645268; c=relaxed/simple;
	bh=0ESoSow4yqMjWEBvKAjxtFuBTQsdWUKLHKqwmV9/qMA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FnJnOSsXlu+Tz+p7/1KUnmKn79us64YVvtdFU/sW6dyxBEJA+mmbxy76zSKFN64QDpi82Qzka1BTH2i7gcmi8x3uYl/MUCdXz/wi7U/4jZii9wHMsVwRuqss22CaUneoXDnvWn3PlmDZ/+0KrWKNSJx3uJk5SMlgRSIsqaDXcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fARchvAx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fARchvAx"
Received: by smtp.kernel.org (Postfix)
	id AE476C4CECC; Fri, 11 Oct 2024 11:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853E7C4CEC3;
	Fri, 11 Oct 2024 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645267;
	bh=0ESoSow4yqMjWEBvKAjxtFuBTQsdWUKLHKqwmV9/qMA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fARchvAxBlMMA/y0nceHuGU4Bnl+327igiLNdt2EYFulysbX2UBwpB7HiN0ohgTzZ
	 vCRktqEDloyATHeF6DP9UpBNDRrAObGJselnyiklddePPNN9pRI/mrz7lEvK8tNZRV
	 m2QewpNfIvwW5XwG6NipoFzvY4HuA568zDXsFI0eTLp+NSYB4rfW5+/DUF21fPaTxs
	 FoPd4ox62xa1VBsCfcDR6xX6mA+ah21CwX4Y315qC8gYPH63dTm613uLasjcSuBBH3
	 8a3zeUQJg0DES5466VqUq5pYn0R1QqguVvVQpUvOxnwDnXxtgpRIryi1MIOcIKcuiq
	 5178Hko/dkBpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CB13822E4C;
	Fri, 11 Oct 2024 11:14:33 +0000 (UTC)
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
 <172864527164.2676212.18175215672232911612.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 11:14:31 +0000
References: <c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu>
In-Reply-To: <c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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



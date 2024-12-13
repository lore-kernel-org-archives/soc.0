Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0DC1E1C3F
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 15:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103415; cv=none; b=nkCo64R3v6RhpRekv9Cx/ZPF1m6vaCf2X7iIKrW3O4mAmqyIO32UA4DC6cTyR/T1jLvyiaZyDjyn0AGw0FV2uZEOzWk+kB1QVNSHGHA6s6WbTrRxdRkUDtLdEyAUg7gGlaO5u4MNoSmuKlC81CmM7IA8e9mwM3uWOfIU9iYu/28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103415; c=relaxed/simple;
	bh=jsjknfuPD6O6/eQuyArCMSd3SDdhC7WwimCX37Eyd6A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=swkz82aaUm4gTzXDH1NWSztVG79q5dJ3bawrP1lEmDBSQwrRxfpkt15fAKgYur7Wa68zfsOvnw71PZGXlHk+6Ld+kVx6PzNaNEv6gaSSlVXSuMUTLxXGWptKDbh5w+s3qE9u23rM2esmKjx2Vx17wwcB/sd9ldSIIfphh379KwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIjIabQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIjIabQe"
Received: by smtp.kernel.org (Postfix)
	id E764AC4CED6; Fri, 13 Dec 2024 15:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CC1C4CED0;
	Fri, 13 Dec 2024 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734103414;
	bh=jsjknfuPD6O6/eQuyArCMSd3SDdhC7WwimCX37Eyd6A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cIjIabQexuQJ4tDJBRwTX59uOefOtHlrBRD3keuPwihFDptuuqw09ZWQA3Jayc3QE
	 Sg3Z4/2F1ehyKCept9/4pPadl1JpBPtPoMW4pq6t/I/GDY+/o9WlxKXCXdViLMFF7Z
	 YaDANTvkUmxEZfPQ6/jrb9EocZS3dSH+nCVBtMCk7mAlBn5ehd/2eVfLY6nKDdgaRt
	 S9GXbp/BrwTig6Sy6eWh6PPB9lrRtoJLrhFYk60DJrok4mpMsI4F1IJ3ACx+dpffvr
	 0pHuqwDwzxQhVngCRxRPh7qzukmfWrnmGtO8V0EuI4YmXO/xbU8jnYYxEXHmqyrQTF
	 66PxigPoCTYvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DCA380A959;
	Fri, 13 Dec 2024 15:23:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410343123.3014960.16872896021225030447.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 15:23:51 +0000
References: <c3c4961b-fe2a-4fcc-a7a1-f8b5352e09a2@csgroup.eu>
In-Reply-To: <c3c4961b-fe2a-4fcc-a7a1-f8b5352e09a2@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Nov 2024 15:08:23 +0100 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.13
> 
> Thanks
> Christophe
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.13
    https://git.kernel.org/soc/soc/c/b77587ac51d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



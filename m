Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1442BC56
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380688; cv=none; b=sFuxvrupUzvPF2Fs1d7QRu6a2/TZMDytfRjLr19VVBaZ1eRmKqV0M5lf3H7KAaLB3gaLtFNqGuOpz5ZDFXw/gMVG51OBn4lev9xNz8ckKcWZh5569bYeo1s4aYH5IjJS/2FDxuBgPCJ3RrEc86ZGJMFnkQQxCtqkVd/OEjM/qC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380688; c=relaxed/simple;
	bh=LC+UHzMoO9IAKS5Y3+BVdlc8zytCcXNlUNx8dcJEmzI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=manzw2NV4obsdGcoM3+GJ8H0L0SK8PWGY6+bUI5XMGz8FdeFZvl99KFx1sjZWNSDNqJoXm79HwLyYjOVC0vq9bgsUHFoS8yEgFNQwtvxwbzSBje1TCfA3dkb1LAaR6BhNGX0sBZqfC2PkzvgFJKhGgnPoeX/J8JIS+OID9TWejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRgFhlTQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRgFhlTQ"
Received: by smtp.kernel.org (Postfix)
	id 7596F1F00A3A; Mon, 10 Aug 2026 16:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFCB1F000E9;
	Mon, 10 Aug 2026 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380687;
	bh=pbSDjRHvLlhcx6r/ImGPG2x0rzXuhXpTF+QQ1Ak+VXE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RRgFhlTQOAQKN2oSSX5WIBTUhAGBGhMnrxHEsL/T9Xy8PWzKgUbCL9vIvTshIoHVj
	 itIvkp1I0M5+eNHn/4aKB6ntxMF9zMErQCjkiqnMrPG74jdAjLafCQuylmaVd6ezaN
	 2m8jZluSFeJ7QJ+/OKTQmFzUznYivj4TxGteI97TuvWqXLu4T5WoMbSd3hG4jSFyny
	 XYniwgdPOKeOfJBkVYmVnzjjXljd8Qp46DGRCUdsx+zd0bfCXfFFvl7fgpOYg9PB24
	 ZLcE1cwh7+36+RA+maO3P9LHoCDiX+iJmbxDKW8ABgOsmceJ2H7EWnSeZwXtAbDDe4
	 QPblWsZ5lkSXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5699439253F2;
	Mon, 10 Aug 2026 16:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: AMD/Xilinx DT changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638064388.3872609.13366556627188842162.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:43 +0000
References: 
 <CAHTX3dJYaEKp_3WH6Xj_t6qHNGUP_nvRNcASA8hrToadsTeDQw@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dJYaEKp_3WH6Xj_t6qHNGUP_nvRNcASA8hrToadsTeDQw@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Aug 2026 14:48:16 +0200 you wrote:
> Hi,
> 
> please pull these DT changes to your tree. I have put together arm32
> and arm64 DT changes. If you want me to split it into two please let
> me know.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: AMD/Xilinx DT changes for v7.3
    https://git.kernel.org/soc/soc/c/26a73983266a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



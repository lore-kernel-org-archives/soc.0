Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1042A7B7
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874870; cv=none; b=My8tZass4FQtXiJID3k2VenGR901moiPGN1TYAV27BSyDLT7dhDQwqvx2bbToiz3bMx7Y0UZt7U/zNNlWK/W2TZlI7IF2nUVUOL43lYM1jz3ptmmybXk005aoAiYgm/FpNX8oKY2SGJViZ7MN96zGIAf+veON3VMd1fFTRY+TZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874870; c=relaxed/simple;
	bh=eDMEafOVVotizyan/3g92NSqU9pwbzgowajlUX281YA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EgPfrzNIaOT+cq5L7z8uQ9IrtH995r23Z4cNWkEZgpD+lUa9Q/l7wx8P4PwZpSekaAQSmQJ/ifBh85o3fodPr6Ug/QnDTtjiuHCvBR2ZqmDV32spODqUvVly+M4FqVWOu9ejdjEyP5F/om0LxsHh0oVNB/PxxrQvOqfHC/UIwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4dGx0ej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4dGx0ej"
Received: by smtp.kernel.org (Postfix)
	id 41AB01F00A3A; Tue,  4 Aug 2026 20:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAE41F000E9;
	Tue,  4 Aug 2026 20:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874868;
	bh=EbOwvv1WzV5AqbnL0Z/wDqgKWE6sx4+csKQgMOU7fh0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=V4dGx0ejvnc/dwekbwk9YUnS7SVYoSy+rshXKZUh07b1sCqAuEO1QLjSsxt+pUZvI
	 nYlulkcrZSbjQJ1bf2+nrYoy88r3h+i0WyIo5FxQ80DpYbJub/2MbWnel8qkQogGkB
	 TxuBDqJ3NMIWmepu5yJCrsjG6Mxa7iXZBvr2UkvWnz55kxqDhrGYRLFkgeXG8C+IMD
	 XG3XVx9m6fTq6pQqHpyEf070+k0gTw+MimSygthqWT/V4l7ZQ83BnvSrm/4DUPSrBS
	 TMIAc66SGnKiw/xmVjfGD/qTnk41pyNVOcMl0RIeVd94QeT314xISzwLQph+CMxT2z
	 aOci0LiEErK5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D08C039263B9;
	Tue,  4 Aug 2026 20:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of driver fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482838.3769923.9301738956295078158.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:28 +0000
References: 
 <3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au>
In-Reply-To: 
 <3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 16:14:50 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of driver fixes for 7.2
    https://git.kernel.org/soc/soc/c/7140eea2470c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514201E3DC7
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644353; cv=none; b=GePbt69a9gHKs3JdoIS6fYV+jcMznjVQbLatjZ0iA17UClr5uZI9dmhAECOGzrQvadQdMiiMsecJpf2rRCZqJHYUJZ8L3wAu6hW+1mqCVQaGjejg3J1tRlcEk8I5urYmfklKJng0ARPwjH19aUnXXgMxDCuYUDVVAy49/FR12rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644353; c=relaxed/simple;
	bh=TXUeMnopHX+SdBmbXKX6JIkbuMNSVivpKXyYjNgFW+M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IhuWrbd1MVVStyy6Wo5lmh+tUo3+DLoVFi7YQdRRLeoZs4FjVmZ0VeBqUb6oXsNbt3YozjO5z/7aM9Q/7EOFPtvTjoN3QrT2NrQ0U3uFJR4RwhNSJ3sb+Yg9C7+Er6KSdKxqBR+hHeZ2FuYB6pgGMFaAxiv2ElcucagcHMf/qFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMGz3EBy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMGz3EBy"
Received: by smtp.kernel.org (Postfix)
	id 44FD1C4CECD; Fri, 11 Oct 2024 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB50C4CEC3;
	Fri, 11 Oct 2024 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644353;
	bh=TXUeMnopHX+SdBmbXKX6JIkbuMNSVivpKXyYjNgFW+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gMGz3EByQLDkbhVatXFNEZAkRh96rVGxRpdUFkjW928238w1eXDFINORTitcLayGs
	 nIIgRIz/2NXcLLIXJDgTCH5aZ3rOvs0ilnZaEidY21kJKFrsaIuduat4GDxQNgt94E
	 +tVuUdbfhxMZx2h68cM7itlikiG98I8Z5lSYuwpdRmp2tuuz0l9u5J9VGoZmNqgifV
	 ZCWbQuykH/HKTD3a4NA+wacQP2ru210zX+/AaDN33Zv64ezi7uJ0wfCTn6raGXmiZW
	 kXQaseSSO0iL/LFlbwbDcfSbER4IHOciN2A5sNJud3OD68JlLfvB7LF8WLe5KjUFHZ
	 gXYa4nbab0d/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF513822E4C;
	Fri, 11 Oct 2024 10:59:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update EP93XX ARM ARCHITECTURE maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864435748.2676212.9175054280951724215.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:17 +0000
References: <20240917163401.6501-1-nikita.shubin@maquefel.me>
In-Reply-To: <20240917163401.6501-1-nikita.shubin@maquefel.me>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Sep 2024 19:34:01 +0300 you wrote:
> Add myself as maintainer of EP93XX ARCHITECTURE.
> 
> CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> CC: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: Update EP93XX ARM ARCHITECTURE maintainer
    https://git.kernel.org/soc/soc/c/a481b9d2baf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



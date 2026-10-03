Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480112882AB
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064208; cv=none; b=oi6D4H7OWcouCDVyLzEdJNhYi8uX0God4Tj1YzYc7H/Q2fsGPZkJhpoR6DfqJ2jLkCcW8zAzS5+4njMPx/UKTYZPYUwixhiKvXRDdtUtkxX7rFlQd/i0U0HA1lBN08J/tPwrwZY2125vV+X1G0vbgrCYe7vLpW1g/ztsubaNbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064208; c=relaxed/simple;
	bh=hO/AZcyytE0EKp6WilBQ1oFqpCGmknD8dIVrP9kq6Yw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YpQ1SMBXRU+T+tOKkD1VgtTlfxa96W9eKJUF6F5Zz1foN0fi0WMrX1Ke+OUHyWyiFHT2n5iK7xh37d3yCJSY2wREbhLifBwxIcL6TM+/8HYIfHUU4bVSJCLw3Kz2qQItS3E5pDT3a3ewnpJwppW+MgxOe/D8KSHbOHK+OhpYGwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWbb5gAB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWbb5gAB"
Received: by smtp.kernel.org (Postfix)
	id D5D861F0089D; Sat,  3 Oct 2026 21:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01D91F0089B;
	Sat,  3 Oct 2026 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791064206;
	bh=fGkAQ1eVpW40dK9jWziqbh9v4xcfgWFcszGrSYpHjag=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BWbb5gABEQncEmpwYbrlTsX1deJm0D2DixoFiltGCXiUEM3XEiA3Xxrv4vhbQcTov
	 vD+4b9j2kpqVVoyoQSypM2zujmPCxeb77VCqOJAnt45rFFY5WPKvLRLrNQytM0lSqA
	 8gGb00jWtsopg7IHI68neAXrGwdeEqqAP8fQEf62GJ1wc9qbjuvnBB1Z1Fn3/IGLqQ
	 adN2IbFFkmpvYpgNW73MT1Hq9lJdmALMdjOvij3xHe+D/eyTEi8NV0GcaehNNblo71
	 rbMaYgGpFm4QoPeV9lC7PoiSLJnXa/YIEplcRXYi1GXZQO08ZARs+qA40VShRWQIe9
	 ecUB8H90CfIGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F73924A65;
	Sat,  3 Oct 2026 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE QTEE fix for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179106420553.228056.13826288124733180890.git-patchwork-notify@kernel.org>
Date: Sat, 03 Oct 2026 21:50:05 +0000
References: <20261003143338.GA928803@rayden>
In-Reply-To: <20261003143338.GA928803@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 3 Oct 2026 16:33:38 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small kernel-doc fix for the QTEE driver in the TEE
> subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE QTEE fix for v7.3
    https://git.kernel.org/soc/soc/c/67c050583f8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



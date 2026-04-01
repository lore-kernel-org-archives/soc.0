Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E435CB61
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080254; cv=none; b=IZF3ZFQI2o2cy6wIRfLVKFkMJcEv1UZtRUenT0CNeSVAlpp2bK8/Aj+FEgHiMaiEFJrUKNjmN0je+V6JYKKraiMw5Yh0h5UhGw85kuZ+fOpTzTcSPabSIwsDC9UdpX/iEHJrVMonR8Dbt3yJucxO3ULYVq2AW2W2/HwO2gzQOWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080254; c=relaxed/simple;
	bh=T5ZnAXT03aaW51e3zPCOZ8E3ngTlRLUEhbzMXkf9se0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E6lTONnTz5Yj+EPT9spG70fbT1EDf3gHOI/A0dnYY4cDcq8b4JPLuvxGSf7S608yPfCahlsLAWpJ92/5/4ZqSzV/18jwrq4APHLX9ImsuwAe/ryptvoqwwnncCGh7Xrdyo5KfRrPY73IdvigKeEmzmgIH2djs+tJGF5NU60Q6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSEijvQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSEijvQe"
Received: by smtp.kernel.org (Postfix)
	id C113AC2BC9E; Wed,  1 Apr 2026 21:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F4BC4CEF7;
	Wed,  1 Apr 2026 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080253;
	bh=T5ZnAXT03aaW51e3zPCOZ8E3ngTlRLUEhbzMXkf9se0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nSEijvQewXOEbdBeNw7j+BADSKzOTuV1k/A4oyAOPoONBZCE6R0azW2Qh+OB/PsYn
	 UfHt05XdlYJmgCoqdf0k/V6MJBv2WTPy5M5aFtXtNcAS3CHt6UqxsPfK+V4JNc+CPU
	 GkVCsfQ1bzxsnQVdCHoyisJBkvStF/VFuPl+k1UrnwCpPXBECWmXQEC4ejtUFfaEvm
	 1DsqrtnU9RXeArvr5cxPZ1O8zX37rCYllPFWeX3DECCEtqoQUsSfGdyWskE3NZboxo
	 KzVPWFE3SBKhsQKO4j9E5OE8iXf4g8zLJi2T7/Jel2F90/716buuawEmLwYrab5CPn
	 +4jw/IidT9ing==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0E43808203;
	Wed,  1 Apr 2026 21:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023628.3876275.11223350165453779002.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:36 +0000
References: <69CBAE1A.4050509@hisilicon.com>
In-Reply-To: <69CBAE1A.4050509@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Mar 2026 19:20:58 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v7.1
    https://git.kernel.org/soc/soc/c/e0c2f14a3680

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



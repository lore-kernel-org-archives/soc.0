Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16DE40DB2D
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874848; cv=none; b=gVGPtmmS+ykUioD5StEf1+B3cDbTrA4uvvixGSYAU5rb0D9aBQ62GcTlBaAkm787Fr7fy/EqpTAMRdUCbYiqq1P8FEvwnj+A4MqKDzQylJ3gLuibXxmlZqElEociwkSmeVCvuQdjy1sG47EGxmpm/oPO6KWsYSd4/N+2mBzzH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874848; c=relaxed/simple;
	bh=6mwMEy6t/J0Uq+Heo8exGX3LA6SOs4pc4BVfF7iJiSA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HPXRekR5LF69AhfZgwodYonUFoxn8JBJlpIKA+R5u00spgEs+MDJixh5hMn+Lm7xVkfG+/VsC85RAZeMtwsxdOXEnLYjH8bweyxqcOGPkZNCN0tdS8iQdKb9y0kXEYuHX7aN2E4QgksGaqKcJonzZxi5ENbX1/kU91FyVk08e4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlCxKYb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlCxKYb7"
Received: by smtp.kernel.org (Postfix)
	id BE0481F00A3A; Tue,  4 Aug 2026 20:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82671F000E9;
	Tue,  4 Aug 2026 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874847;
	bh=RSzzx0KDXgt/c7FaO66Uw32TqT8ZJTPMPy+rca3Bzgs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZlCxKYb7uPYMmiOKbdKwLTKMem16mw5VQyMcxH33M2cjqsXbuqScOWy56z/NYKECD
	 XUfgVtV2O1/u6Jdd0jYtsQ+1vZquDFRab7X7/W9+5W2lA7pxbGKNMaTiQLBAf433Ze
	 yd0KS5MvbkMcQgA2XgGZLPYCkTOCPp1qDa+w68qtnDoJvUC7LE1xWlYWttncOp1nbk
	 mJuuFibLzX2F1NLCc0zqezwuRe4cwzqsjqRzcmrMmDzErFa6F1HwbyevIYWHjU/0sc
	 WPE59OtuJtbbNULsnSsSWUfdYUCerrVSxoOndhUYS5OEwHUx9wVSo5AjVzJpY+Hlbu
	 T+4yIK8ros5UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B239263B9;
	Tue,  4 Aug 2026 20:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: First batch of ARM arch fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587480788.3769923.423815441175669575.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:07 +0000
References: 
 <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
In-Reply-To: 
 <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 16:33:08 +0930 you wrote:
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
  - [GIT,PULL] nuvoton: First batch of ARM arch fixes for 7.2
    https://git.kernel.org/soc/soc/c/c73d40a1e700

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



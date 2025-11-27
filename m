Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F792AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281595; cv=none; b=TKU3vAymh0PMgDxrqapQxppnSBKHJgbxX3xCi+45BuP/vnYt2FvnBJI25dLqcqWBqPdJpjQMBgNs9hkBMt+qVucL5YRhKBmnipdYxFuLrtpQAj1ZLcR0kMaU4TNmwuHwx8NjIlDOC8CU30HhC8QR4v3vAJSDVnrSo6FsBbDvSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281595; c=relaxed/simple;
	bh=zPOLxnIUwEh/0au1xFcURwbLgUU5To4KroG+a8d/Mwg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oziS3K48aOiC3Pc1z31hrJqHTd4SRbAIoCx8Z+wU2ZLF6o9f+ql/rXh7ESOzvNyjua4cNjd2gI/mCo1As++y0C8ncOVhbRyVRuT4hXD+w5M706FzsmAmUe79s2ZjFCSiYV4hAN4emnl7TK7BmauVI9qxLoqxCJb5akG0vzBMn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akjbNIvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akjbNIvn"
Received: by smtp.kernel.org (Postfix)
	id 76010C4CEFB; Thu, 27 Nov 2025 22:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D80C4CEF8;
	Thu, 27 Nov 2025 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281594;
	bh=zPOLxnIUwEh/0au1xFcURwbLgUU5To4KroG+a8d/Mwg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=akjbNIvnwViYSIUX8iB2XBLhmrDYh7CQlLdtZ1et3L9mT8XRvyWTZ8tV4QIZ2OjuZ
	 Om0SzigqImrNdFgvBb7zVF98lzG5l6bu7hVRLkt52Q3cIonZ9GHulsf9ifCT2SPVnM
	 wkNwbIt2BuYWO/R2sKSAryFvid8yl/dzLf0RhpTIFlcC4V2fkaxH1XrX0ZBBpNRqTE
	 o9brwITR8EMeCc8ajt64XZRVwiNTG+692Tr5GuqpmZcKxlW33X7ywbeSXdpK2YB1a+
	 GFlFthUNb03i8PLcXgv+yoYSFcBV4/GDY8q9CGYU29fVoORrdvUtWl6jUp9CBnfiy0
	 K20DS+L4aM35w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F29D73808204;
	Thu, 27 Nov 2025 22:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428141652.55019.8691418254764566396.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:16 +0000
References: <9e0a76ed-8eb5-4820-b64b-a0efa0f91170@linaro.org>
In-Reply-To: <9e0a76ed-8eb5-4820-b64b-a0efa0f91170@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Nov 2025 09:40:50 +0100 you wrote:
> Hi,
> 
> Here's drivers updates for Amlogic SoCs, 2 non-urgent fixes for the canvas driver
> and support for new SoCs.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic drivers updates for v6.19
    https://git.kernel.org/soc/soc/c/e9191aa446f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



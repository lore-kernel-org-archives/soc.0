Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3A3BBFD2
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907856; cv=none; b=M2SlVe8H/+r2jlp8qrHiUeY1ABaZxnd5fAu29IrOCvhXKgAPNuDJvS3vaWZXYasru1ma/zueeeSmkXhEyx9oLqToXhO9fVjMr/SdngqloRK5aEdUTGxI0O5pmbW8ohEJpvd/fnSSaR9FLEgLS3GSgOPD+8cdppf2yFBbW95hOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907856; c=relaxed/simple;
	bh=35xsXAqu1kJE1hHkyItRwTpmgqTLSkrJ3lmyQJ1Ipzc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YJfE0g4tqLVe6VmsKhtOTyxE6swvoEmY8Syv1Oozlq3cQdsQW4G+ovTusjpc/gFxmtJLb6qk83Y6yLQESrCXYBF+BjmhHJTLXfpvTuLKyPbzlYP69VTPo22NLN/OkBA+fI4MFNtJwJMKkVRg3k2HTQKqPmVhnzPQx8z8figKczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEmEpDUH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEmEpDUH"
Received: by smtp.kernel.org (Postfix)
	id D2BCC1F0089C; Tue, 13 Oct 2026 16:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6EB1F00893;
	Tue, 13 Oct 2026 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907855;
	bh=+VPQqHCKmr+9mEYvNtHdx91JE2API3hoXlPSs6CkdJI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QEmEpDUHsqFEpAPoXNZ9e0qRt7EY5KuyRMxLZNqWs4M5Dh34oyWBk2dHvOh89Sy0Z
	 3CFdWrZp4ugHayNc+gM+PRXQrlkk1YK5HckLVj7XIKDKKQmOaXYkmLJOAilIYLXRWZ
	 L6eNnU+OCgTSWmm5LhfYlLwO0H9siK9zFmPHrwwnGP3GgVkJSZHHW8kw/aAWMsZmv9
	 IDmCnSq+Cnr/IWiNPNL2ZnIacjIg8a7NcYrGC+y15GSTaagav8glZk0wZZARu4DXuH
	 PY86wLO4QiE0SuJVYsaAhrZX+lywPmM04mF0R9k1d9A2fxPro8GCizwAHAgL1c4y6r
	 L5dMYoANIi2kQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B430F39D5FD8;
	Tue, 13 Oct 2026 16:10:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190785426.417156.16651381160522609341.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:54 +0000
References: <20260922130653.357615-1-andersson@kernel.org>
In-Reply-To: <20260922130653.357615-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 08:06:53 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v7.3
    https://git.kernel.org/soc/soc/c/586d98795f13

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



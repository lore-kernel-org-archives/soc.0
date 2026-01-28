Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DB313520
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769640610; cv=none; b=WUA8tF58xJWw6G2WyCI7KHww3IlTbqHyM5EpsuoG+hgTR0OhZvsUwZT++W1grUu0onn162HdLH41sPksZdzFCMlIBVyI/f8ViWugvSEJ+mw6tCKFJYpYp9PEdEf7EChyputJGtAeXKqSVd0iXB/3tTDbdby548bxbTeawrTn61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769640610; c=relaxed/simple;
	bh=oPjJdM+gAXmAyiZbizmAJgbvhPtFvf4qZawPm3mW2WE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=eEcWHvloLRnueZ6HItTLD6ysorAAz8QtKSXpKUEdKRriwmtyMmoi9z81SWnRLxHYxrZSU24XNxNpDAFNx3IhHAc2vkPXDCh1XRWpjdY1UsfN4xP32tkxaoxEwD3gkeerYufwcfDFxr8WYpfH6PdnCoDfGb1VYy6GCtFRYhUQysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fr29rSQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fr29rSQ1"
Received: by smtp.kernel.org (Postfix)
	id 6F5FBC116C6; Wed, 28 Jan 2026 22:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A046C4CEF1
	for <soc@kernel.org>; Wed, 28 Jan 2026 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769640610;
	bh=oPjJdM+gAXmAyiZbizmAJgbvhPtFvf4qZawPm3mW2WE=;
	h=Subject:From:Date:To:Cc:From;
	b=fr29rSQ1hMHJSPTNOoynFwOPIlH8r/i2/FaTjbkx4q0R8MMkb1ynZDlKvUCj/ZVN4
	 POzPaUPZiV1Il0waVBVr5gQnSZjMsZGJEIhLfXt/v2KgB3vpxAlbgl2ZniPZS9Jrfd
	 lVuJ9eaQprk29jJ5rqw0fr1DikKb+p0mCZso+4emmZI/GR++J8ktj8LdJ9kDabITJC
	 bocDWVpglKG8EVydUv6nUWoI7iMsXFeop/GzEWJ5Ez6Beik4DmziWbj1VXRpQJyjTI
	 LT+D72Qg4vWYJj+5eev5lLCTA1J+Oc6cvdmXkoSLkZti8UpitCIeJf9eN+f/9CoH85
	 6g08SCvvJD09Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CB80D39EF953;
	Wed, 28 Jan 2026 22:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176964060331.2263224.12762284728687505858.git-patchwork-summary@kernel.org>
Date: Wed, 28 Jan 2026 22:50:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: dts: Add support for Kent SoC family
  Submitter: Yu-Chun Lin <eleanor15x@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1047404
  Lore link: https://lore.kernel.org/r/20260127071530.25426-1-eleanor15x@gmail.com
    Patches: [RESEND,v3,1/2] dt-bindings: arm: realtek: Add Kent Soc family compatibles
             [RESEND,v3,2/2] arm64: dts: realtek: Add Kent SoC and EVB device trees


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



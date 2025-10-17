Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524263396EF
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760711742; cv=none; b=qHV4DZnCTHUV2avzMkYCqaa6vnwXMw407eB78H0OWXfRpWaFa64b5hm5hXZpIXUnneetHbh1tG3CblSAUjOnpRXLbxAXMTT1YujGo3Y5bmC49nKIeQqXqYS5y+9nKnhbb6hGjSbKwWe3Npv8Hf25VXbjNtj3EG98fczJ/0ImKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760711742; c=relaxed/simple;
	bh=gZR7ieXRRdK3QF/1sDGKdE9y72mQgJpYGIFUpXKlRgU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=jEzUTn14ooYu/mbKeW8qHAwM/5WmG6LNO2TYJYXlOjj3UpxJG79CGe6EAEuC4c/mcnqeqjP2r9WlXPpCsy7nB4P4Ez0gfVX7hIzMH2SASY6AyYie8iAsJJg4WOaNjCF6AfMBhOivVITGoj2GS6ue36pH4iUyLqUC2QQDbtARh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjUtZ9vT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjUtZ9vT"
Received: by smtp.kernel.org (Postfix)
	id C8384C4CEF9; Fri, 17 Oct 2025 14:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B240CC4CEE7
	for <soc@kernel.org>; Fri, 17 Oct 2025 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760711741;
	bh=gZR7ieXRRdK3QF/1sDGKdE9y72mQgJpYGIFUpXKlRgU=;
	h=Subject:From:Date:To:Cc:From;
	b=rjUtZ9vTb2rieKRUnvB2TyH2N5kY0oc0saXNQZ28Xw28FIfYSipLIkmu8hKncvCBa
	 Tb/5mU2SGLZ25ggUgY79Iiq/z4wS0ECuXXhJpsKJEAN5KXdjhGl1kQJBRDIkONDyy2
	 GPl7NV0QcTX9hDF2nO1AznuZHvI1ycmm9WGPMrspQ55wTEFPCx1DWqSniTjXjVeFAk
	 3C0dUnI+q47tgz0CT6vQw83bd/2hYjIIRK4LkjxlGHWuCVin3Uy2ndxCJ8AbAHLSZy
	 78+bfJu4XUl9y1q6EbBlL5fr31HWPIZwgHI040uusIw1pmk/046SbKF1DjA/fFgcw6
	 JkBNFNzFxYuog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 74B1A39EF976;
	Fri, 17 Oct 2025 14:35:26 +0000 (UTC)
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
 <176071172515.2229063.12665899201720186010.git-patchwork-summary@kernel.org>
Date: Fri, 17 Oct 2025 14:35:25 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.18
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1010872
  Lore link: https://lore.kernel.org/r/20251013173543.2489346-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.18
             [GIT,PULL,2/2] Broadcom devicetree-arm64 fixes for 6.18

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1012245
  Lore link: https://lore.kernel.org/r/20251016093346.945036-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1012246
  Lore link: https://lore.kernel.org/r/20251016093448.945198-1-sudeep.holla@arm.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



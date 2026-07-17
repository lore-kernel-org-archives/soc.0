Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375B42A141
	for <soc@lists.linux.dev>; Fri, 17 Jul 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298035; cv=none; b=tbyA2SCThtCQZmCtZCeFdGzwogjftBJfpxp2+gcbgI5nitBzqDd+Z8CMiIo/ulikq08W4n38Vkzd5WVKPtPezrAhRii1Z5MRLyYevNdVvAyq5HlGcdRXAyT4XC8zBsODmaa5y66t3lNWfSe/f0YbVSeDpevq9l5Pq6Ri4dblCJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298035; c=relaxed/simple;
	bh=Tn5Iy5LxsBWaGv3lI8hDvdj3GCLoJfPIywWWC2BTKlc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=USAqtUNr6y7GRCnTk9BeEXmQ05uxr0R39fboLKuYi1PywxUIUZLeGXwMENSPiWtM0Tg8hAIbn63OE0dch5JBQ5bsdVW+IznaCoHQow7ElqQIpcB4s0KgZWtJEZ9Z/CNCUbuJBaxHkRFD7TbEXqqL+pFCQLbXiIceqHsYOWUL0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBbqsJwH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBbqsJwH"
Received: by smtp.kernel.org (Postfix)
	id 088FC1F00A3F; Fri, 17 Jul 2026 14:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E773A1F000E9
	for <soc@kernel.org>; Fri, 17 Jul 2026 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784298033;
	bh=QrRSeaQNRoDaUgiETuSGZ+6PQWz5Y6XnZHVnSKZR2RY=;
	h=Subject:From:Date:To:Cc;
	b=lBbqsJwHZj/fbYsXCEhHl1aVHDUeu7+h/0Goaur4heE2Q4fw0HIQFCF53+ZdNzdvC
	 /PkawLYBxlFNZIDQsu//llhCakqOI7GWGmFg/5TNeE69psVAfb8E6Byafr2v9pKJxB
	 KUgU8qkEg2njV66OTFw4G88ZorR5BKVYlbYDcCon6yV18/9PRdK63HHlHTVKUUL/y3
	 zrpa8+VW13+qfgFAj4oFZPedEDDw9PIltEhCAJheSG6Ild+M4eQL98xeUX93Nmy6Fc
	 GAxSD+gMGz5Qg6IFLL/34nICm7Eb7EUkSF9OjkU5lBEeluY5Y2b6QlGTaxw+n4BebO
	 NjqUgG15jrp6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93884380CEE7;
	Fri, 17 Jul 2026 14:20:07 +0000 (UTC)
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
 <178429800629.1738088.4902536231272354346.git-patchwork-summary@kernel.org>
Date: Fri, 17 Jul 2026 14:20:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Renesas SoC fixes for v7.2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1128688
  Lore link: https://lore.kernel.org/r/cover.1784193843.git.geert+renesas@glider.be

Patch: [v2,01/10] ARM: replace linux/gpio.h inclusions
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1125625
  Lore link: https://lore.kernel.org/r/20260710211954.1373336-2-arnd@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



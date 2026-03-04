Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3C272E56
	for <soc@lists.linux.dev>; Wed,  4 Mar 2026 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658044; cv=none; b=Kbmdt2rwmwJoWpxt5Kdiw/otbt3WnoG0b1yVQ39Hx78eIBotV2oXUYCcn8EZ9nVBzlIiOaCj03CPOHqKoF1U8glObvsISOmfHn1fHsuVvGG0H2JD44QMlVQ+tC6CcSaD98ACVwvChXxp5dEP/LONkk1Hpx7T0EXyuSjalxfRQrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658044; c=relaxed/simple;
	bh=VBoTlKzHTUPEqkzGieuCpEfFY4dyXzhQmEImFjsu3Qo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=oHfiuJzOqZLVX1WvrXJDQnl6Ob/N8ui9raeihc86uLhnOlmhk+0ALXg0gwx/k1mdWgnm7uwCVgBU4DDi0uMuBHLHMGBjsIkJuQvVEZno43C/XRUqmNP2hAA78Cfvvk045fpXvkiR+7+x7EHVvj3w3FO8u+fgqTr0yNVFh7tDFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbY7FKsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbY7FKsY"
Received: by smtp.kernel.org (Postfix)
	id 727A5C2BC86; Wed,  4 Mar 2026 21:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C57DC19425
	for <soc@kernel.org>; Wed,  4 Mar 2026 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772658044;
	bh=VBoTlKzHTUPEqkzGieuCpEfFY4dyXzhQmEImFjsu3Qo=;
	h=Subject:From:Date:To:Cc:From;
	b=SbY7FKsYujEtA2bEbsfWBAyrJSnTtVMYx3xL3vpuPmLZNtzKQrnV7wKpyC98vfLbE
	 GZ8Qwh0saBl40wWKGGvWQANV1ezplSLDeIEgcLEPhC6yuObAeWm+sSOcXLREBHabZA
	 9nD9t+EnysBfsZU6C0N3rlFCQdsBQFs+VL4tBklcQbXkFDyhowl12aO9LALfFzPDqV
	 6yLPqH+oA5PHACrIM4GQqAz+YcjuVuP/ZMtgt+M6B6uYlzlFTGonPEmpvzbPCz95L9
	 pvj4RETtjzRSCI+ohuvI7hNXOd604FIxxQkWzTBIrtpHmLv6A7dAWXKj+fsUmwTUVW
	 4YaEnJy5quk8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05BB53808200;
	Wed,  4 Mar 2026 21:00:46 +0000 (UTC)
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
 <177265804449.2385795.15327161406737797096.git-patchwork-summary@kernel.org>
Date: Wed, 04 Mar 2026 21:00:44 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] SOC FSL Fixes for 7.0
  Submitter: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1057232
  Lore link: https://lore.kernel.org/r/741919dd-743b-4f6f-b43a-8a107fd31754@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF08395D99
	for <soc@lists.linux.dev>; Thu,  9 Apr 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725026; cv=none; b=e+qqL++I7lrgRtEp/TRb78zpc40hyqllV/AUltbdfkLhoLAnTe2rPWlpdDPPV3YKhFBScepfQNReP5OMYjJHNpqpQO7oS966ahLkIP+M/O5p4yVRQvHq0E4gmYxyLsEEHJOBLhHOYfeDuP7kdL64SxiBINl0X3kVv0kZrAbYkpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725026; c=relaxed/simple;
	bh=XZnCYxm+FjM2hOWt5ptiHcHJDZbAGqnvZHlsdU8aOYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mg1MHDEWHefd8kYC/XTVKzyAZKwHv+5X1jZwNEIjeKMQbf8v7ZZnvb4eDo+7HNkimofWkQndp1nnDu2tS/H3WqDjGG79/qfoiCP2UGWyWYH7Npm5dLaos4Su24lbXUD9xcED6Lqdxsli52Nmi1MlW/TB3zuOjDjPlg4NY3tB8Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SxCsDT9A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SxCsDT9A"
Received: by smtp.kernel.org (Postfix)
	id 5D04DC2BC9E; Thu,  9 Apr 2026 08:57:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3975C4CEF7;
	Thu,  9 Apr 2026 08:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3975C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 63BDF4E428C6;
	Thu,  9 Apr 2026 08:57:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 325845FDEB;
	Thu,  9 Apr 2026 08:57:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39CAD10450269;
	Thu,  9 Apr 2026 10:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775725019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=V4G9clivTCOBNDyXno+rGyGLMHPPjMdcWkYABxM2zhM=;
	b=SxCsDT9A8FvofNq/CSqO7DGk07IOuXsLQhkPL2bM9i4TAmPdKj9KiebmbZ61LV7MCoaMYF
	LH43g/x14Y1HInP5gNtSjiDQ5nkC7sOoF8Ec0AGyG66P06iGO0iL+HX9fSrOz3s6p7RJfZ
	rwrFsvK2VLeZaOmDmdERBseLo63+S/ulzLxPKeQh0utI6GPj+hWl0Jo/WurvNwKGHGFXiv
	OtoB9fIbjHlslRIqooKARtAqUcceZAQl+FxgH8NsSwDQ6qrh7oi1QZspmBPlpML6PEumrD
	xOT0T6NFfQptzXOBEv0HCu3RzzjxA+rHAB0L9eEJLpJpjYyvAMNDu1tNwOGNIQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.1 (#1)
Date: Thu, 09 Apr 2026 10:56:57 +0200
Message-ID: <87qzoo3412.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt for mvebu for v7.1.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.1-1

for you to fetch changes up to 29d8a380643521422a9907f3e982e142fe22d19e:

  MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC support (=
2026-03-02 16:24:43 +0100)

----------------------------------------------------------------
mvebu dt for 7.1 (part 1)

Drop unnecessary MAINTAINERS entry for non-existent Marvell db-falcon files

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC suppo=
rt

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

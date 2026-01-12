Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232D356A34
	for <soc@lists.linux.dev>; Mon, 12 Jan 2026 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218640; cv=none; b=U3YIKwZMLR7HU9p4MLxB+Raf5mHMN8PWoUDX6USMOqO/tPK6dMprxTxIG5413ntx3yjZEyGh163TfDI/oFrRaoS3rytXUfHg5bKV7BLwFU/enHdiNl5IX//luftszj9qPKiImWM9JoVDNWmlbUBwYByJkUz8FpdksABN/gW97bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218640; c=relaxed/simple;
	bh=mPu89r/lrfCDozGn74Iefk4F2d5tDHWeYJ5jp8MO9/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X4DtSdCmnSBj6o0S9KLisKa7WsQhBGlGsostB7MD4l5ZmvNdTFAuIbeqt675aPbw9hDRzsei0SidmRj4kKE5A63qWyYAHDBL5d585NE2ZYNvYl3tY9fl2Qs4ESbEzJTNfp+i1lXNQ2PjUtXCSqbRBp73TBtWqM9h4TuEsZyr/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 0D787C19425; Mon, 12 Jan 2026 11:50:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id F1259C16AAE;
	Mon, 12 Jan 2026 11:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1259C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B33A497;
	Mon, 12 Jan 2026 03:50:31 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4047B3F694;
	Mon, 12 Jan 2026 03:50:37 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno/vexpress: Updates for v6.20/v7.0
Date: Mon, 12 Jan 2026 11:50:17 +0000
Message-ID: <20260112115021.2551442-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112115021.2551442-1-sudeep.holla@arm.com>
References: <20260112115021.2551442-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.0

for you to fetch changes up to f0d0f087227c4b63538e4ed8292f1fa26f8d6633:

  arm64: dts: arm: Use hyphen in node names (2026-01-01 17:31:07 +0000)

----------------------------------------------------------------
Armv8 Juno/Vexpress updates for v7.0

This contains a small set of DT updates:

1. Align DTS node naming with established coding style by replacing underscores
   with hyphens in node names. This is a safe change and does not affect ABI.

2. Add support for the CMN PMU on the Arm Morello platform, exposing the
   CMN-Skeena (CMN-600 r3p1–compatible) PMU via the standard CMN-600 binding.
   This enables PMU access on real Morello SDP hardware, where the registers
   are functional.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: arm: Use hyphen in node names

Robin Murphy (1):
      arm64: dts: morello: Add CMN PMU

 arch/arm64/boot/dts/arm/morello-fvp.dts | 8 ++++----
 arch/arm64/boot/dts/arm/morello-sdp.dts | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

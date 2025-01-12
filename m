Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00DE4315E
	for <soc@lists.linux.dev>; Sun, 12 Jan 2025 19:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736710528; cv=none; b=ONrAAjwuX1LxtBFdIEExIc005n9IGO211G4KpMYb6d2I8giAIPFCCyYjsCaUWhabwhg7JyLYxtShm8fDbdVvvigt8Ku0hzhdo+5+0ciQCoiaPJESqv/DljlcrOOX2IyZV4aAOkyp3cqCRW9H462Ufdwc5UMO33EbrAek0Yav/so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736710528; c=relaxed/simple;
	bh=IslOYzzEkkmhRdaVZhls3hZ2/afWKWvmHTgI9SDxulk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tM+vrAevCYSq1YlqHns7CAhF200ntSXqNUWPGmipGd1YMMnxfPd9xJteUXZOI10GbxS7O14n6jx5WDpUdQ3qxbUITpusKGKAykXaBnPYV/IUx9kAM7Np7U5oYi8u3gVT8cO6+gWwVOVDLXCgdU2bo+e5d2+VUJBp00YA0uuiwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YaPPvibs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YaPPvibs"
Received: by smtp.kernel.org (Postfix)
	id 5A881C4CEE3; Sun, 12 Jan 2025 19:35:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F0D0C4CEDF;
	Sun, 12 Jan 2025 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F0D0C4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 842A4FF803;
	Sun, 12 Jan 2025 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736710517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ZtBqhdvDtSMZSifwdEtbxuLavEcjAiJgqkWtN+G3/74=;
	b=YaPPvibscYQZa+LJLSt5HaYahNFKdc9GFsiNmqWvpniX7X31YicBAri0U+ReH2HOOBSbW8
	odWpyJzU0yKdPHxnS6c15XzH9qXCUePHMfC7QyJdPbnwonfFWbKSvyKgqV9+ky3PvFN1ox
	13P9kT6Z2Aj2tw6eG35P2qKIErdbW/G4F1ZkWXT3JDVSXQBe5kkgbjNWQQcbHPK8cB/0RD
	rlY0mQGhYgsFP01NYsPS3RK8kFO6hvw4mBEHJt4+cXJUpzpYNV25i0fqdMcccafq/Mkqpw
	uF1c6UP2ioGgSBIfbAY4HpkpoCBoL4ZSdusPUReBB/2Z876HbvUET59ZU92UtA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.14 (#1)
Date: Sun, 12 Jan 2025 20:35:16 +0100
Message-ID: <87frlnygej.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.14.

Gregory

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.14-1

for you to fetch changes up to a34c9fac85b2fe9d2a4191b3d5cc3a459823124e:

  arm64: dts: marvell: drop additional phy-names for sata (2025-01-08 09:24:38 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.14 (part 1)

Fix errors reported by dtbs_check for sata related nodes
Fix cp1 comphy link on Marvell CN913x platforms

----------------------------------------------------------------
Frank Wunderlich (2):
      arm64: dts: marvell: only enable complete sata nodes
      arm64: dts: marvell: drop additional phy-names for sata

Josua Mayer (1):
      arm64: dts: marvell: cn9131-cf-solidwan: fix cp1 comphy links

 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 +
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 ++
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 5 +++--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 3 +--
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 ++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi              | 2 ++
 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts               | 1 +
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts         | 4 ++--
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi                 | 1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi                 | 1 +
 11 files changed, 17 insertions(+), 6 deletions(-)

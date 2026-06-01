Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54738F230
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305161; cv=pass; b=h3F3Bvkist/oJZYwx6sZ9lsk+P6sCS/cKCBJ7I35OsFmXLCoaZqFO1BRaOanCe+/Z4n+Q7ixwQqlQXssGg65+/EHEaOK1a43mFaiSQZq5vWVlQJ+MpJHLdp88nAml76Gudr0OQosadp4miIJfkghOa0qLsLL2d6Pw190KL4iM6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305161; c=relaxed/simple;
	bh=3EBzF0o7UMrIWjYtGu04a8kA/zPPANrCK9tLqcFMPCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iP4vx0kwPvaiyF7WyOssbIpcfMZDek5OLzGEdLFNPGKYHUEhDRWbGgQ+ybvXisoxoTZVhYuxtUqn3gGvNsrViRgJz1Ze4sdvGg+CgCMe8HPo5f4Nkom+3d100QS+gnkc/FhrWJQgN/E/y4lAYDJ8HXRx/XIOCDr63xujPkL8boQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c5kJ4FU1; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c5kJ4FU1"
Received: by smtp.kernel.org (Postfix)
	id 1BF401F0089A; Mon,  1 Jun 2026 09:12:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780305160;
	b=CHmI637l1ez99mGPW4wed1ZzMcqb5rnifFRQmSMdq4X+gDNWjr9GRViN06uZ/zj60rfi
	 kUkqqUzbxHj7XB2ypWPp6FNSkFi/AWvap5QRZr670ftxLR0Ht0XJu+hneQHrVcCM4OpgT
	 PiM8LuIzZB18y92hU/E0wjJAsd+Tcr56fqd0uXDBbi6OMdeP2hqVQZpqEDGLpLo7uOtbT
	 dpiz+BFb/7AaNQhT4iBUHgcazQwsXp/yDe7HiicBY5a9gH66arUdULQx4FupCMzg18PxB
	 kC8nJgJwvBt7ljLOkHf2AhJt/ln20Z+zjx2naSXhzd0alnJ9zZBlsEOI3VeJApsTL7Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780305160;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CNCluDpOanFg1v+YVv1UW9l5c1iZx+9+vsAQtqKL0SI=;
	b=YT1u6oVMxOBD6FlF7uqDz/w7kXR3imFsxa5SSH5+mBSUf7wXD6E2bO/XjKj4Dq6Y0OpQ
	 y5CwTn9lHyE8t+9EpRLVi0fTBO/w6SiFtr3UGIk+kkqmUTZWMKGVl+U72vViCgCvt7ro4
	 GU0LJ7eg92xfnaTsP2WBJNibZzD/XXxJzET2744D7enkqZTtSMftwiwenWAxCychA1my2
	 y7H1hyA/fYZ1rBQDzOEGL6QdLuL5NTbG2b8soWK3WcBPsSOR16xZxdOOtrxPqHL7juw0l
	 E4twZKz2BpguEZoAk0ivbCGKGESGfkwuZLg3bORMgXj+HH9yafvnIueovJFevChRhPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c5kJ4FU1;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DDEB1F00898;
	Mon,  1 Jun 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c5kJ4FU1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9DDEB1F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780305151;
	bh=3EBzF0o7UMrIWjYtGu04a8kA/zPPANrCK9tLqcFMPCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c5kJ4FU1M6cLL7Ci/otmQbIOa2DZbdSPZWqYr+DSCGm7pSsw+xSUBCcMKemg9UzDC
	 G/mDvM4qmKD4Ppg1mXcC656y59QFIrsouXGv9wAF0yHdafaAYnhYseCfffYa9Eutk1
	 9maZJmu1Z6H5185nWk5aRx8zmQ25MUkDGRw5WGN08kptD9dN49S5WUbrtbL00l5J+6
	 04mYEbqHLQjU2hJpKtQYfWSFXtdEQmp9aUoP1XXIuIbi0s75Zw2hC2KJMuChAg9rU4
	 G/qrAcXL+hbv7PVPFbeNUBdIfoBENcgy7XprjZW/w8k+Uyu0DauM5Ev2Hg+29IVRJP
	 kKUc7ZyjYKR9Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB0C717E0566;
	Mon,  1 Jun 2026 11:12:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.2
Date: Mon,  1 Jun 2026 11:12:21 +0200
Message-ID: <20260601091225.5223-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.2

for you to fetch changes up to ba6afff1d9b70028a5fc3df2d3acbee501c20a53:

  arm: dts: mediatek: mt8135: fix pinctrl node name (2026-05-11 11:39:02 +0200)

----------------------------------------------------------------
MediaTek ARM32 DeviceTree updates

This adds support for the ARMv7 Timer node in the MT6589 SoC
and performs a couple of dtbs_check fixes in MT7623 and in
MT8135 devicetrees.

----------------------------------------------------------------
Akari Tsuyukusa (1):
      arm: dts: mediatek: mt6589: Add Arm Generic Timer node

David Lechner (3):
      arm: dts: mediatek: mt7623: fix pinctrl child node names
      arm: dts: mediatek: mt7623: fix pinctrl controller node name
      arm: dts: mediatek: mt8135: fix pinctrl node name

 arch/arm/boot/dts/mediatek/mt6589.dtsi | 11 +++++++++++
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 64 ++++++++++++++++++++++++++++++++--------------------------------
 arch/arm/boot/dts/mediatek/mt8135.dtsi |  2 +-
 3 files changed, 44 insertions(+), 33 deletions(-)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD874A47
	for <soc@lists.linux.dev>; Mon, 28 Oct 2024 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087703; cv=none; b=TGX+DE5oEW3M1AxNmtcYLSGGQYK64qTdmQQj/QubK0z/bJwgTQ/hpS9Ism1VEm1EZ7usfEJ6WJZEvF+pWlWd8TtklldRb0DOIqN5XL+ve/LLSOA1xtTl0mWScQ4jJUDhBjRusoV1lhNjmTTnky+g9MBL4n/tnns6qIHm5db72Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087703; c=relaxed/simple;
	bh=K1SYdMufPEu4Pz6UKbEUR4wqQsMmcb/g32ziiy2TALo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Evnk/GdFi8a2R85TuGArazoCJqEzpsSHCv8sGRaQCYm0RcWOHJ+QjFe9rizYzicVmJuvvGX5zRnpHMUlMgEYtTj2BfxMJoaax/cxtkPIDPT/Wli9QlFbLaZdKC85cHEM6EeRpgTMpfJyx0wvNsG+ZG5Q1smEFHFdsgEVpVuNbs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=k1gU0/Ub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="k1gU0/Ub"
Received: by smtp.kernel.org (Postfix)
	id 62FBDC4CEE9; Mon, 28 Oct 2024 03:55:03 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C4E4C4CEC7;
	Mon, 28 Oct 2024 03:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C4E4C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 416C0C0000E3;
	Sun, 27 Oct 2024 20:54:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 416C0C0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1730087695;
	bh=K1SYdMufPEu4Pz6UKbEUR4wqQsMmcb/g32ziiy2TALo=;
	h=From:To:Cc:Subject:Date:From;
	b=k1gU0/UbquGHYFXStJJpIByA7sBpwAX34sbe0QiycE+GGBfVDawcamexwAkpWip6t
	 V13JGDq4rLMDSfTujLibcGXIzt5Yeoqx/QpZOrJ92wPbOs9bl4VZgaGa8OmaO7z5tT
	 VlsM0OXhVu2Cul3R6LLJOdghJTc9OCqcq+zSMRug=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id DEE9918041CAC6;
	Sun, 27 Oct 2024 20:54:54 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom defconfig changes for 6.13
Date: Sun, 27 Oct 2024 20:54:48 -0700
Message-ID: <20241028035449.734504-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/defconfig

for you to fetch changes up to a1b87bee1bc2259e8178c40fa914b3237836f7a9:

  ARM: multi_v7_defconfig: Enable debugging symbols by default (2024-10-08 15:01:34 -0700)

----------------------------------------------------------------
This pull request contains a multi_v7_defconfig update:

- Florian aligns the ARM64 and ARM multi_v7_defconfig by enabling the
  kernel with debugging symbols by default and using the toolchain's
  dwarf version

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: multi_v7_defconfig: Enable debugging symbols by default

 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

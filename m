Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007D43151
	for <soc@lists.linux.dev>; Mon, 30 Jun 2025 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310150; cv=none; b=lMWXuqO3jmgE02c9jMqubdE3cDxGxJPDdMFw/UhZk4zjlNqE3kBYABMNb3t/5/Z8eOjPVMuXf3ccKdJImYp0j4xyNRUgg9Mb9meXCHyrv0gPiHMZRehHg5vFbzTfcWjsN3u23Lh+U6zrs/48Pq0F0UELNSFpKt7EdT533LHSyws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310150; c=relaxed/simple;
	bh=FJ5ZT1ESgpucVBNUqPiViX0zjhQKsXr4qEmPO8gEdVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qoomf93bFaD9J7WEa20e8cxxki2t3fTjkymGHAQev4yO2ZCj7WF2njXkQ4gjNr3x6jKMQyvubEhpHsI/UMNVUSEJqxkLoPlu4ZMdmuxx7xfg1FW7BvKLYjD9UT5TgT+8WaZqpIVY9/w6xzrN/D2MkM07wEnY2oF8po/hlxlAipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=kVl8gO/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="kVl8gO/C"
Received: by smtp.kernel.org (Postfix)
	id 1557DC4CEFA; Mon, 30 Jun 2025 19:02:30 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D0AAC4CEEF;
	Mon, 30 Jun 2025 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D0AAC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3083AC00210E;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3083AC00210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=FJ5ZT1ESgpucVBNUqPiViX0zjhQKsXr4qEmPO8gEdVI=;
	h=From:To:Cc:Subject:Date:From;
	b=kVl8gO/CmPfVDSVhaSqk+oFAsGDsaD2GvFJWxwsV1kl5gPlF1gusaRFs9ZC3eKCcP
	 Ta2Z9B/aDuVBJG6u4QALJM9h31z48McbekibFlKquHUNs+Z7r3iFwfk2p1cll/W+eT
	 Uz4LPN+F1879a2V1H5J+rJqtehpsflrC/9JG58i8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D38FC1800051E;
	Mon, 30 Jun 2025 12:02:21 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
Date: Mon, 30 Jun 2025 12:02:12 -0700
Message-ID: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64

for you to fetch changes up to 44bba869d25985eb2212beaa4e353f6aa476dbf0:

  arm64: defconfig: Enable OF_OVERLAY option (2025-06-09 10:10:06 -0700)

----------------------------------------------------------------
This pull request contains ARM64 defconfig updates for 6.17, please pull
the following:

- Andrea updates the defconfig to enable the RP1 misc, clock and gpio
  drivers as as well as turn on CONFIG_OF_OVERLAY which is necessary to
  apply the RP1 overlay file

----------------------------------------------------------------
Andrea della Porta (2):
      arm64: defconfig: Enable RP1 misc/clock/gpio drivers
      arm64: defconfig: Enable OF_OVERLAY option

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

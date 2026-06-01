Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCD35AC0C
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345800; cv=pass; b=KpQCW7rhad98fCCYAEyLSLihJ5n8lgfN30912jx5mRiyUDZSOAO0hFsm2WmxxznrmYwtTKhH3iAV29L1eySh7wjTohO4JUqPf616iEODepIa36a9XWOecDu+8QMdbjV00r3hI2EnEdeYcXsEbxNmOAU4tpE0pSY5474+NFFFI8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345800; c=relaxed/simple;
	bh=iMta9s/9mDkRPLWFlvFYKz5OtGb3VgRCNtGqVYpFQwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/FE/VA4sz1TL9iUc/QO6IGkir4xbdb7Us1XV3PlJ1pV/BuHtUGEgWmgqFjyPk476WW1uUj0l1Su3ff3IwOUaA4AxEIafAyUvJBUtSEZORhfgT7KLjORRqUCkUcnnFX/oDVSJixjUbM4EuHpuDMSij7z2VOKMM9oyp8hrklqrJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JKvpao5i; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JKvpao5i"
Received: by smtp.kernel.org (Postfix)
	id EDC691F00898; Mon,  1 Jun 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.19.144.205
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780345798;
	b=xW6jsfsPkMoqgwc07DFDOuf3crqpGZhSV3YSiYa/EXVWrbfEGuLRwE2d192TvDXOV4/X
	 Cblba5oYT6rslHbFOd2p9Eqdk+KK1lGw2celHa0YAVvoroly3jT1hmnfGxr7J5nsGB/3v
	 IZ6paPQ/wGd9IUR1uEpFVklD3BLE+5m6EeUV1eMsnahKUBNnK62nBfx7qwWViWQEF/t9M
	 nLWD0teu2K+3pNOWsuJieiYidjSTy1fzFjG7QlzcXceJdv2th7hlWO5nQcItu54DQkMAl
	 wMwb3XUZl3V2D9w9cDmSKzPyUcf/FoS8qxQDOcKwetKCVdUzpc6VCNZjibGuwE975wg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780345798;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/fDCx2wauG1rJG+aqredz8TtKUiumMgk4/Dso4HOMAU=;
	b=2quuTY3pEtFwv7RRDS9QMfur8RPNN/Li1AJGgfCgCzysJqJ2Vqin/AQnDjaMkENoS4MY
	 oW1FcbvpIAbCg/3dzT3V7fbaTzSp7FflZSJBCamLT5C/7zvNTMZXLkxb909rNNlVLsDxr
	 nOqya0tcYs/jpf3MrxKWeeGzi5zO6mrKq4wjJ+35CYywFzs7HkUKSKZ4fFrFDDqksWxSk
	 Kjk8zQ4RLMexj5K8cQKj4eMeDt1r8uZAmeQB889ZACpukvARZilllx+PHaFHDvPGUq8F7
	 9NingY3nTCeoNxvZwmXupiHfsUeX0faRtk4CF4TlR2CvHZDlmC2opLIpV8SmKwY6Aig==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=JKvpao5i;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=192.19.144.205
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CA981F00893;
	Mon,  1 Jun 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=JKvpao5i
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2CA981F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8E78FC0005C4;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8E78FC0005C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1780345791;
	bh=iMta9s/9mDkRPLWFlvFYKz5OtGb3VgRCNtGqVYpFQwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JKvpao5im8rGANlgbFdqDN2XQJQfQkW7ROfjS6Cc4jliXUyoS1/3j/p094oHiHM0L
	 62DhrPIOKjjxIIhgWGS63Y8Y4J6E7mlDD5J/IIlwPV5AO1Cjf90kFVDn9BuGp99xyi
	 EoIOpBS8TZ6+LeLfOGAK/zGshb9Ekxr9TmKoG870=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3DACFACC;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom drivers changes for 7.2
Date: Mon,  1 Jun 2026 13:29:45 -0700
Message-ID: <20260601202945.1195228-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
References: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/drivers

for you to fetch changes up to e8f908b91550dad3274b5ab3bb0e779ca9d80aff:

  firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST (2026-05-06 12:35:53 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC drivers changes for 7.2, please
pull the following:

- Justin changes the soc_device driver to be more modern and consolidate
  the initialization

- Chen-Yu updates the BCM2835 firmware Kconfig dependency and adds
  COMPILE_TEST

----------------------------------------------------------------
Chen-Yu Tsai (1):
      firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST

Justin Chen (1):
      soc: brcmstb: consolidate initcall functions

 drivers/firmware/Kconfig         |  5 ++-
 drivers/soc/bcm/brcmstb/common.c | 88 +++++++++++++++++++++-------------------
 2 files changed, 50 insertions(+), 43 deletions(-)

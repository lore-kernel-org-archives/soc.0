Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C83427FB5
	for <soc@lists.linux.dev>; Mon, 27 Jul 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183125; cv=pass; b=fH1tMMOatDwfs1THPYyTUnWuqX26KKmg/skTXGf7CxUnpCMOX10qYA9PhpM3/ARL0NXJyeFBx1M1uXY0YVGJ32KfDSQpnX5Q3GEj/BaD9z6yI0gSnWDzp3/8P7c+h0+tBclcUsuJlMQ0HzDGlqbT/Jcef5Ad2kHrTjz1oOaYyTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183125; c=relaxed/simple;
	bh=295z87T5W5iAPJSlT45FNq0uBFxv0oR5n5BJAPMJMOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qTJgJPQ3hlk/YLfi7MAI9fbU10X2eb1xtLp8IYQ67cjtdBAu1cWwarSgz+SthAhp2YTIgZyxAjsEkMmuSPTh36Xe60cnNPw4Pz7pYMiHQd0FaTU25K8k07thRC4C1BX7neCqlTC3kjNhqIM8VbisuD4MJpxhdiFNMcqJyN/8Cv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=vUIzpQv1; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="vUIzpQv1"
Received: by smtp.kernel.org (Postfix)
	id C05DF1F00A3D; Mon, 27 Jul 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.19.166.228
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785183123;
	b=fcMybv4Cc3TZ3TB6TdB1rXlu3addIg/r3fYCTPrPFbsSh7VRniZB321IuQM+vYrTfHnZ
	 UuPvHvTjP3H0vUWFPiU2j1H2VKm5l1HeppkF8XZzUAhmEofM+ZDwmXPvKb8lO9RjD+e+t
	 WT7TuF8g4/wGHXwAnJqKWpTVs3IOZnwBChtxpZ96fkrYxmT7Rj4enrqUMaI1pUMJcRaAq
	 5QrBs7PVwWn6bzw+R0lEzSccaG3WUuZtvo4dZaI7kTVWyhM2r2MLXAO/sbBVejNGdg+gQ
	 vD9lcOiqo8ab95TWk3iV0G5MSaxvJS8HQnZTktku1hN6iP+zTPiDD//4BUyRDW+emDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785183123;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9lLf0y959h2WWLbHfr5C24AnRQHGQvqNzJlvXw42mcQ=;
	b=uIizvMjAGwkyWIPOUoQpMwHGcIoexiUHhFWe3ussqC9FFhC7334RFakDyLBMg1vxEI6S
	 z2KS2Cz8j58TafbAMsEZqvwG1IwlghnmHDFm9/lzUkxTPLCnc8kn9MJw3fSRAVXqbDz+H
	 9HQ5LBst5K0CLO7Wc0orVgf3xv15cVjAhVSgRIB2AJL3nsAsEewQ2alfw1ZsBW4uKClG1
	 fjcGzpouk4Y4sfcUOnAiai8YrWXI6uha68pRaRIHI+Bh4zxhlr6aI8PsP/WiiChoMRJ3k
	 aepHd/4R1m/lwaOI8HUSPIOUWJWzYqn/cknW2vHWt7GZ8Gr7Rye+ztT89xr75lV/9IQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=vUIzpQv1;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=192.19.166.228
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E406E1F00A3A;
	Mon, 27 Jul 2026 20:12:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=vUIzpQv1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E406E1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 07599C0000DE;
	Mon, 27 Jul 2026 13:12:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 07599C0000DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785183122;
	bh=295z87T5W5iAPJSlT45FNq0uBFxv0oR5n5BJAPMJMOY=;
	h=From:To:Cc:Subject:Date:From;
	b=vUIzpQv1gLqMOnse3MjN+JcyiXKyLQIEqvn1TRxYOWbJwinpnqfSSPiUjkDP2rx20
	 HuDZp3/SKX+s1lCKsjILLhUbH+CpsXABwtNB3FZS7NBwkYv+wRTDhosEE+4dXI/oBf
	 ZOG84YIWbxrSMv5g50Qe05U8oKDHAOCKXdHh+Y84=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E1567ACC;
	Mon, 27 Jul 2026 13:12:01 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree fixes for 7.2
Date: Mon, 27 Jul 2026 13:12:00 -0700
Message-ID: <20260727201200.2441827-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-fixes

for you to fetch changes up to 5916638dab4de7dd062234eef2ed66447224fc67:

  ARM: dts: BCM5301X: EA9200: fix NVRAM size (2026-07-27 09:58:55 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
7.2, please pull the following:

- Rosen fixes the Linksys EA9200 NVRAM DT size, the 2nd PCIe controller
  interrupt that was duplicated, and finally removes incorrect PCIe DT
  nodes 'ranges' properties breaking PCIe

----------------------------------------------------------------
Rosen Penev (3):
      ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
      ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
      ARM: dts: BCM5301X: EA9200: fix NVRAM size

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi                | 7 ++-----
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3B1C861E
	for <soc@lists.linux.dev>; Mon, 30 Jun 2025 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310149; cv=none; b=o2hCsGKtkk4eWZqn02td+/1aWAWXW8TrZv2BwRNPTYeLGA7+PQ+MfRXjQ9LoN5DnfbjDHrXNKtOYLxxIVIZGmvgMrAt+iBNxBnP+kp1DdJ3qflXvaaLK2N+qkm/J5McRZ1Z6MdlaRS/89ZyNg2HC+S+cLH40aWrLdMd51eLRUQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310149; c=relaxed/simple;
	bh=JqlyPedRZUhsVo+NJJ45KcQXUcPxZUrlE9NB6DPaZoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l60vFRsKYIiuRADPERqffkw+r9ntgCzyQZr/OLuDetk7QEzX7DsEhkNKKRXJYAgcTodnK1PSIMJVq4YhWlRfDftWpHumdUd3ENOJ3QkhYiwtZsVO5L30loJtfpmLVAr5kdUFlZNp5q6BqRRsoZTl+rzuQSckvuzbGKU447iRlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=kBPv9bHr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="kBPv9bHr"
Received: by smtp.kernel.org (Postfix)
	id 5A152C4AF0D; Mon, 30 Jun 2025 19:02:29 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 727CCC4AF0B;
	Mon, 30 Jun 2025 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 727CCC4AF0B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9F765C0008FA;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9F765C0008FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=JqlyPedRZUhsVo+NJJ45KcQXUcPxZUrlE9NB6DPaZoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBPv9bHrBKHu5kdDd61viFvVO7yOXSpP/wAKhHRhnbbk95LdHJAabSqT1JpHGDnAO
	 1EnfoGJEIhMMU823Y87JyHqipcB2ANNt/2f2QOMdSu8E900seEXZza9VW8IPI9wJgl
	 PcgYxrpigT6jxpuvzw8wzj+trNfDS9HHEmw7qyUQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6A9F818000944;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/5] Broadcom maintainers changes for 6.17
Date: Mon, 30 Jun 2025 12:02:16 -0700
Message-ID: <20250630190216.1518354-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/maintainers

for you to fetch changes up to 4a525d5d3150a3e387cb841f927f07eb4a98c368:

  MAINTAINERS: add Raspberry Pi RP1 section (2025-06-09 10:11:39 -0700)

----------------------------------------------------------------
This pull request contains MAINTAINERS file updates for 6.17, please
pull the following:

- Andrea adds the RP1 entry for all of the drivers pertaining to that
  chip

----------------------------------------------------------------
Andrea della Porta (1):
      MAINTAINERS: add Raspberry Pi RP1 section

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

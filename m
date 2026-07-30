Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FC73D9035
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 23:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453932; cv=pass; b=gz32PbS1axQ0M5yEglvCjtF16J853pDvPQu/kdXz9ZKPGjzePR0UWzCe8XUTP9AxFG6bxGeumddQ1FLAqfKcDP1d3OXT7lgAEohYNwJJMwOiyKyNQtoxc9IdW5uXwJMfp6GIzDX8m3zhCbMhRxNVS72dBZdZTBG5YeU/Vn/jAzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453932; c=relaxed/simple;
	bh=Uc+eyvzGbvvd3Oto45mr6JOPfvyYJt25U56/YBpbzmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IlUkdmdL5v3IXBv6fPoSOIDKBhL/ZHdQD92VI3p2RmbWsWyONz0YMvEqru88OeA8CFoc9X5Ywwid281nkST43xW9sWbb/Ig8GKhfXQv1pj19OGpVXZ6Ws9Bt0LmIp5wdQyPR6V32cdwqOsJ6aVIAcjSVFUCE+yL7J35Ess8k9N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TQQ03YQF; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TQQ03YQF"
Received: by smtp.kernel.org (Postfix)
	id 0BF1D1F00A3A; Thu, 30 Jul 2026 23:25:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.19.144.207
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785453930;
	b=VbNQyHxKh+6SjNYuYuOtOVsI549iDAUcNedih2VcsrjlxXXjxgKra+/5cTa14Dy2acrs
	 jzc9ZkzgAxOcV4qaTtNIRsN8N2bDIMFXtLznvwgtSQFAkgHRCo48ZKzV9TW+mc7ced/e8
	 PQfF4qE7s8esb7/D5mv4Xq1hbliSfY9VepRMAxlgkIwUvlhZXMPzGLt6faRhS9HBaXQve
	 8QOtqYSnpN6kmyZMVhBxBRXllMuORjF+Gaa3I6O2YuYa9FIvdYGSFmgZOIWLMSDQVNswI
	 ef9vIDWDg6DkCJatfWSLGB4QPMwEC2DtZXiEhm4eiPAZGbWlZrcRoSLUsI03cWP7CPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785453930;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ug2PFfl1kVCa/AMMLBmAuQNsYDTChSLFPxolpp21vS0=;
	b=jLXCJL2nyrZ0JEK0him+ld5DUJ0kxofWfhSr9E/lCfATHpuOTax3kunaxzULjnohmUw4
	 dyArzjDj44tBkpqsizknMLFSLeGoTWIgdHU6iNzZbHOygUSncTLZO2kOWueww+Y+ND5Y3
	 1iVnF3S+5qNQOpCPUnZ+ugn282ecb+0gqv6IY6B5qHUMmKDIW5r1dmgj/I+V1hD+i4UL/
	 dbDuwn63ClT1aHnPEy2O6QEmw68XUNPob6B6ZWeO6RSAN0IQk6PrjgYD61V7UTw68EkOa
	 gqZUuTyeHrHHO8sp2Ps/PorxJbx8sStpgDR7sYVxv8mIjwPrAu4GGvdrP7Ak6Tt3qDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=TQQ03YQF;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=192.19.144.207
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4918E1F000E9;
	Thu, 30 Jul 2026 23:25:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=TQQ03YQF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4918E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9C40DC0003EC;
	Thu, 30 Jul 2026 16:25:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9C40DC0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453922;
	bh=Uc+eyvzGbvvd3Oto45mr6JOPfvyYJt25U56/YBpbzmY=;
	h=From:To:Cc:Subject:Date:From;
	b=TQQ03YQFsvFtaxSNFTx2n6vyK2N+vyQYNXXQDzHA7mEzd7GjCNXWCpt07hiyFcDd0
	 qhmDqPOdSC9xNAaGMm7JIpP7YCwAz+hq9uhyfX7YrhiGOg8kIkgNnDZ4cBQnXb/j9c
	 qf1Y5beAPqzKwMpbU/a61fB2j0ubW5w0Xp2KKKsg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 520ADAD9;
	Thu, 30 Jul 2026 16:25:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL v2] Broadcom devicetree fixes for 7.2
Date: Thu, 30 Jul 2026 16:25:19 -0700
Message-ID: <20260730232519.2706487-1-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-fixes-v2

for you to fetch changes up to 6de6732c4c784ce64e2457630ca800dfe5efb774:

  ARM: dts: BCM5301X: EA9200: fix NVRAM size (2026-07-29 15:42:57 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
7.2, please pull the following:

- Rosen fixes the Linksys EA9200 NVRAM DT size, the 2nd PCIe controller
  interrupt that was duplicated

----------------------------------------------------------------
Rosen Penev (2):
      ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
      ARM: dts: BCM5301X: EA9200: fix NVRAM size

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi                | 2 +-
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

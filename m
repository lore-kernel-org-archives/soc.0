Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4B26A0DD
	for <soc@lists.linux.dev>; Mon,  5 May 2025 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464302; cv=none; b=evc1ZrXYiCJTTLkrtDnW3MnVWVNrEyXcZsu8Cic7dFV/hPSntQZt9duWUD0XLfLtxtNgeFlFBzUwYmA/3/wPJIDcHxWbixd47oqr6ghJ68ayNNY2I9iYWA8OCiFsHHeBDHcJGEKhtMtFHUCrFtxn8qAB+uugvNfVpuuG5uPiGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464302; c=relaxed/simple;
	bh=sTUeceWJnk252WaHsNSVB6NIhfPcsKmY74JxFMSgfD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piXimBM/EcJW9he66BfeS8qPhovRq3iodu0rJ1VDwvsvTbwQACtuvGU8oR+uhEWf7iFrBByyVB9bxTdNsQusz9bG0OjAlcasyX+HY9rH6kH1XOzlQIPK0uzYbWiaO6TtPxZLBakXDJfGC4tHOL5P2j2zJe410x3S3AqhUPkCVCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dnwi+q7p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dnwi+q7p"
Received: by smtp.kernel.org (Postfix)
	id 7884AC4CEEE; Mon,  5 May 2025 16:58:21 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92832C4CEE4;
	Mon,  5 May 2025 16:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92832C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 71380C0005DD;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 71380C0005DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746464292;
	bh=sTUeceWJnk252WaHsNSVB6NIhfPcsKmY74JxFMSgfD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnwi+q7pSrmquR+KOvetVtMzYCrQaZ+bO3Ux37FyOtQGLE7wXtJvSE2kIefAfSFMM
	 1kfVBkNMMgQvZztKHUv5cPccoKL1kbqGYWk0do1On4DEWF9ugexgvtT4p05NLQrJqI
	 mD0RIDfponG+qu1oF2IVwvYwzLz6pDxhdzCLcZuM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 257D318000A4A;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 6.16
Date: Mon,  5 May 2025 09:58:10 -0700
Message-ID: <20250505165810.1948927-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
References: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/drivers

for you to fetch changes up to 29f526ed681551e20928169ecfde5a576e20b900:

  bus: brcmstb_gisb: use dev_groups to register attribute groups (2025-04-07 10:35:43 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC driver updates for 6.16, please
pull the following:

- Ovidiu updates the brcmstb_gisb driver to use the dev_groups instead
  of manually adding those

----------------------------------------------------------------
Ovidiu Panait (1):
      bus: brcmstb_gisb: use dev_groups to register attribute groups

 drivers/bus/brcmstb_gisb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

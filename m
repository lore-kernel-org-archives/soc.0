Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4FA14E2E2
	for <soc@lists.linux.dev>; Mon, 13 Jan 2025 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786207; cv=none; b=EYtYuIdTNgMrP/6TUNn0ejaR/MUq3DcgjVd33bwogxi0sDA04VQvM3c1SNJyxDegdTk72cLNNaRA+V5nXT6UZK1S8/rfmZhkBcpSwhXSHADknhjgle191i5euz8OdpwqMT5ovhF6xeYwDZ3kAxP+SHU4voEC7WN1kUqFvO11GGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786207; c=relaxed/simple;
	bh=QCxQB095+VdojJc+b7HFeBCRx5uGO2LtCereuWTCRn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tfUho4sOw4Gz+nWHNqztvR9RJxMLaZCduHnzGAtqWTVidw5SQt/+ANLUC1pYEYSS417md98JIWSityPsVT65jEBPqLZD3Bip+403jE8pYtWm/pV9Sb1xKMM8gBLuZQ0ZfjirVIr5sp88wiceMkaGAMhM4UfZ/WfGiFjQPQjRobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DFAA2C4CEE1; Mon, 13 Jan 2025 16:36:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06A90C4CEE2
	for <soc@kernel.org>; Mon, 13 Jan 2025 16:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06A90C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tXNQi-0001XT-Ck; Mon, 13 Jan 2025 17:36:44 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.13
Date: Mon, 13 Jan 2025 17:36:42 +0100
Message-Id: <20250113163642.1757160-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.13

for you to fetch changes up to 1f8af9712413f456849fdf3f3a782cbe099476d7:

  reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device (2024-12-06 16:51:28 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.13

* Fix rzg2l-usb-vbus-regulator lookup by assigning the proper of node
  to the allocated platform device in the rzg2l-usbphy-ctrl driver.

----------------------------------------------------------------
Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F42040A9
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970647; cv=none; b=a51NyOaQBiyaQYwDiQaY3RBZwMR7a5WjX3qi4VPUc5/n1hUKyBzsh/jTMo8tBjQM4zUImXEMFTIUvhpFitT+EDrGwlIO0aQb+0TnCxTEQYialwit7FppGKaBPUVf2dN054POsZ1VFipDFSMqby1c73+nSACp7YksMFZ/P1Iz/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970647; c=relaxed/simple;
	bh=GPLlpKlSre0Bghhdk+7f4zLOyYue2wA7XaFPcAsqfE8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I7K6Jt8/LC+otZGNkWfqRu7tEuMv9lCdJ7H2tJOTEjFrSZ7wbdU2z0UV3v7YMGpEYZGHana3bgA+sFw8+I1ZhH6G18wAyRCqqvNDSo+3Sb+yvWXKr+xqUDdOB5VeJ6e+jHvIIs6nI67zZ75djDUT/eTVGyTuDyRYRflwEbGw6FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 15903C4CEE5; Fri, 14 Mar 2025 16:44:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25F1BC4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 16:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25F1BC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt88g-0001Jn-SR; Fri, 14 Mar 2025 17:44:02 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.14
Date: Fri, 14 Mar 2025 17:44:01 +0100
Message-Id: <20250314164401.743984-1-p.zabel@pengutronix.de>
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.14

for you to fetch changes up to 0e2268f88bb27ef14ac3de1bc4df29ff12bb28cb:

  reset: mchp: sparx5: Fix for lan966x (2025-03-13 09:40:26 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.14

* Fix lan966x boot with internal CPU by stopping reset-microchip-sparx5
  from indirectly calling devm_request_mem_region() on a memory region
  shared with other devices.

----------------------------------------------------------------
Horatiu Vultur (1):
      reset: mchp: sparx5: Fix for lan966x

 drivers/reset/reset-microchip-sparx5.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

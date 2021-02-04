Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EC8C43381
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C31F964F4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C31F964F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r+mNC7gQYI6TdcY7uzUWy7MqO2Gg/rnwilt6uuojtXw=; b=0mg/zhJxUpdao9Ara2CA4SKYOW
	H1FHr2tEdCOHEzZ4ESn4tDByNDvCFfm+fSjZw7Ht0anSMRt4OWuGuhgsc+Pg2ft5mmVC0R7TfJ2WQ
	3bdce9YxN3UwL0bAZHEag0obyekDrgGv6VZMtCoGDeqZNrp3fuB2tSIw2u4JsRZbcgMBlDcDQH/FE
	D9hui1xP4+bQTdm5JZuApFHFlb2yeteo4zSm5eLS/YjKdb677sPSz5WcYhEPzYz5Fs8i459e3h1OG
	GsKulIPOplC01yyvg0GiCKlfgJuXXWmTCsUE3AuCM5HmrLrgkd/67XIE7kJYvXUTEuayccKuuK7vg
	5dkbkaIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7dKq-000698-RY; Thu, 04 Feb 2021 12:02:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7dKn-00068U-SQ
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 12:02:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA13464F4D;
 Thu,  4 Feb 2021 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612440123;
 bh=BjGpwOm/oSJcyhdaM5HDrSC979lO7T2fcJGMIbGp2Fc=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=SQSmzow2lE8Yf1AfVwrXFv3oVo6WoaG2WLbLKRPV/hZZmRplbCH/ziQQ+sjAjqQXd
 SKJWHj811dOwlYoup3bRiA95rD36oFLdE2rk/noSgph9WdPdP0k9/ZuKOKO4MzsaUZ
 7mGAFZ7fGuRVoCSOS79vyBvuMYs91+2zSuG2pncA8izEo3WKsA4C5M2GPaoOaKBqXW
 JQz3C+gdY6h0mlr4unHR+t03bBbjBHo05sCjjD3r4yAofyWZfJsadALimg4h4u9pqF
 PRVLaawTfIWxDVpPgYCCVC9e1//j0USLeAt1BisSRWobyqzxar1CWCcUAzMR3hYZKM
 xfDLm4X1/uHLQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 1/6] i.MX drivers change for 5.12
Date: Thu,  4 Feb 2021 20:01:45 +0800
Message-ID: <20210204120150.26186-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_070205_997055_05E9C758 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204120145.3Nb0jt7uWirDDTO_H_d5ku8xzX9gelZJHQdVrdNKwSs@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.12

for you to fetch changes up to 7d981405d0fd3cfc0de052e4791f516235d8b858:

  soc: imx8m: change to use platform driver (2021-01-11 10:46:09 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.12:

- Change soc-imx8m to use platform driver, so that defer probe can be
  used to resolve dependency on OCOTP clock.

----------------------------------------------------------------
Alice Guo (1):
      soc: imx8m: change to use platform driver

 drivers/soc/imx/soc-imx8m.c | 84 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 72 insertions(+), 12 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

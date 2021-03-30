Return-Path: <SRS0=+/G9=I4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8DDC433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 09:04:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9431861929
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 09:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9431861929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=spxHYYsxUGfcA7dq8gASUyuZ37oGsgh+k3m00gQcZNs=; b=fMfkan1nfhHiyRXmWXsXElVr7w
	KKE3lT5FwcuRXFdz3P3LiNXsFykzthBYeZbRb27bnkE7h/yNV6csDp7Q/9fVSvzkjVjtBGNEKH3oH
	LjLixV78hKGsd3Rxda/0uySMG2cKibB2BeI87e5UdjTdMcupmuMCvv0Cqy+tnA2zbhQUkvpfgUy1U
	wTXwFf4QiAciKCggWbN7evdv2AXUEJ1Ne9JNknOQtw4f5B7ggLv0zstMYiMho0sPlLwc0OyW7zbyj
	gF/s9+GuVb/gKSkBHpx9cb0Qn4uSkvYcJz+PIKF+WQV/QzB8jZQNgww32k8RS1qDCcnnWvBxLubCW
	VbQIBzrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAGw-0038GD-Uu; Tue, 30 Mar 2021 09:02:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAGq-0038Em-0k
 for linux-arm-kernel@lists.infradead.org; Tue, 30 Mar 2021 09:02:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F105061959;
 Tue, 30 Mar 2021 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617094962;
 bh=hFfoYeoBQFX/shr1P1K4yAz0eDeOmXZxekXBwhAUJAQ=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=FQYzKZ4xnQagchQoOtkKUM1617vJK8SUXVaaM/nVeCnCe03QRW0R3TMgdMQ53n0Kb
 hKooO04IczNIR/mOgWB/fcvYuyC0/fduGn7g2JFUa3XV/N18CRpn5RUbki3CFwszpe
 gP0MOyHTlg4kCKn0j9CdNnjoN+fMqv2xZkgS0P2gXqp+EdHKoy4fRwFJSL+9ODlPvF
 M1OSSyt4mCW1n7DnzXi+mhrWiwMvhq2slHXNwHfxLscTnHlKB8zdXTwznQR2UIbu6m
 MI5XWwJWIInScpWt5s0u86KKDYQ/amPR5ytX7gk5sTG6N7YN5uvBW71a35XRGJaPw7
 VFyn00BEfUWwg==
Date: Tue, 30 Mar 2021 17:02:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.12, round 2
Message-ID: <20210330090236.GQ22955@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_100244_347875_39E6B41D 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210330090237.rcfX2AbJITT9i-im8GRt_eFpJHNcpc6ldzoKauCdJTI@z>

The following changes since commit e4817a1b6b77db538bc0141c3b138f2df803ce87:

  ARM: dts: imx6ull: fix ubi filesystem mount failed (2021-03-18 12:06:28 +=
0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx=
-fixes-5.12-2

for you to fetch changes up to f57011e72f5fe0421ec7a812beb1b57bdf4bb47f:

  ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces (2021-03-3=
0 16:35:28 +0800)

----------------------------------------------------------------
i.MX fixes for 5.12, round 2:

- Fix a system failure on imx6qdl-phytec-pfla02 board when booting from
  SD, by adding missing vmmc supply for SD interfaces.
- Fix address typo in i.MX8MM/Q IOMUXC_SD1_DATA0_GPIO2_IO2 definition.

----------------------------------------------------------------
Oliver St=E4bler (1):
      arm64: dts: imx8mm/q: Fix pad control of SD1_DATA0

Stefan Riedmueller (1):
      ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces

 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi   | 2 ++
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

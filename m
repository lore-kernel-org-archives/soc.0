Return-Path: <SRS0=qDBO=FO=microchip.com=Lars.Povlsen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66CAC433FE
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 12:12:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A95DE23C44; Thu, 10 Dec 2020 12:12:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528D423C81
	for <soc@kernel.org>; Thu, 10 Dec 2020 12:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528D423C81
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Lars.Povlsen@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607602360; x=1639138360;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=qcs0vP++s9/jWYyApeBlg2MnU6kdvbG2oa1qH8lIUMI=;
  b=vbTBp2+jAr5Xtx6e0le8GKo04jvGNfmqSrgZrWqwBnOl39pJn5v1SguM
   RIt9RqIxpRBJxNyS1AjwPMxzpgo23tWCa4SvpRBYl12/YA4SD3OIZv0DH
   zPkVP1s8CRdxtAu5T1lCimUwe3tENoBXiVsdW4ob6t8FjZX9C9twMF7hJ
   JYJcftP8owzeY7bgwPYWbWeF1MKUWSJNAYKy7mkPe8fJ5HFd65DOFLBo6
   ya8kmzSBPZcUCkT/ZoyFS9w7DRJJ1gkeDFQhRlb1iRXCxtpTqaEuROhmU
   ykpBfvd4Xqx5xlX+No6GcMc/svgs0At9Vlnp5YFW1ja0gvNpu6OyiHOd8
   g==;
IronPort-SDR: 7qCZ2cM49s5EvOmoQeygAFw8aQOQpBDRmbjeS6CDnn/vL4xiKJLIG1PPJa8/ipk1Rd7VRvv4+w
 W7+hSU+3al69LKzoIfd9NWsbQkcMOdENhTmwYIyl0Ot2CGEQc6/SiWrb1pI7mIXtmOOcWdPnD+
 9NSdFz6TgMkfKczIXSWfRuUcoweWHe4q6CxIyH6p4eLVlKWrYAkzvWX/EQZKdk9kZ5KY6yIN/u
 F4rTQYfdtLaR3P+SAwpAC25J3iVP++e1ILtB3TF98IDhHfMvOXHvPDlTdxIFNgDd1cBzChSkvA
 xVc=
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="99350785"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Dec 2020 05:12:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 10 Dec 2020 05:12:38 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 10 Dec 2020 05:12:37 -0700
User-agent: mu4e 1.2.0; emacs 26.3
From: Lars Povlsen <lars.povlsen@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: SoC Team <soc@kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>,
	Microchip UNG Driver List <UNGLinuxDriver@microchip.com>,
	<devicetree@vger.kernel.org>
Subject: [GIT PULL] Devicetree patches for Sparx5 v5.11
Date: Thu, 10 Dec 2020 13:12:31 +0100
Message-ID: <87ft4dq2q8.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain


Hi Arnd!

Alex made me aware we're late with DT updates for 5.11, I hope you can
fit these 2 patches in. Sorry!

---Lars

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/microchip-ung/linux-upstream.git sparx5-next

for you to fetch changes up to 7e1f91cbfa0d330fad61c621389373cff81898fd:

  arm64: dts: sparx5: Add SGPIO devices (2020-12-10 11:55:31 +0100)

----------------------------------------------------------------
Lars Povlsen (2):
      arm64: dts: sparx5: Add reset support
      arm64: dts: sparx5: Add SGPIO devices

 arch/arm64/boot/dts/microchip/sparx5.dtsi          |  96 ++++++++
 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts    |   5 +
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    | 258 +++++++++++++++++++++
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    |  55 +++++
 4 files changed, 414 insertions(+)

--
Lars Povlsen,
Microchip

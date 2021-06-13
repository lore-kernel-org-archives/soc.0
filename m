Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15586C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F3961042
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F3961042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOYyB9N5b36SgG23U2YfwVrYnGLoi4GpLe7rgPdqTL0=; b=jmB9rzmRlomJVq
	9RScyfBS2lLIIJSFXUsy4YajFr4rb0w5vuytGycWMpDhLxRDDzQ65+vAGryWHyg63Aza9UlcoJ/S0
	sMqGUCTCgnblb8rp4lLdACcWBRWXRblwMh5MevkOo/aVHnvcnvQnZ6TUmMpQtM8zBm5dRmJ5idhV3
	OU3GZx3bn2hJx5BY4E6C14IPM1n2bznOcyjoFz/z+04kebAOIFIvygzAcoMwE/sED9cUVaJCVXRTj
	I0Aa3Y0+HBbn7DxX/OE/wyQyCfzmmiAl47osUw+vnzKxv7WMJuHujY3bbi8V0mZdZZY8HyTUmoDeY
	IG1CWm0cfX/YerEdHPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsLSG-009wYM-RC; Sun, 13 Jun 2021 08:26:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsLRY-009wQ9-Lu
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 08:26:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C30AA61248;
 Sun, 13 Jun 2021 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623572768;
 bh=u9Jwpx++SXNrZEdO1Oq8f1ITcbNUJUkJdX08YNK19iU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnqcCvp+9e4U7I+zrSi07JBFuBlvKvZDmE9lL1H61mZCCAklNyH3Iny69islFG3Sn
 XYQGGYhkdyc+9GyRroPgXv5FCndkBov2+2i6MxwtVCOIi2b6sBcuoUafpz9TFYtspw
 rOA8OvgXkBZSw/DfB0WtTuA4Q87SdD+PD0EYJU7FIRvDRIVSrWSSEowU4WFbHPuEj/
 gCzMGsoyJ7G3C1ucCu2CBWkvy6lhlRfMO6eTtNsrNcJq5bLttOzTPUu2aVA+yW8d8A
 ijdX+CQnB+vlESeXT8RaPz4kSmC7EH0EqBmVAEDkdEgs9Vca3pE9rCC9GoBR2k8XsG
 Fj1WaQ4+eoKnQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.14
Date: Sun, 13 Jun 2021 16:25:44 +0800
Message-ID: <20210613082544.16067-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_012608_753435_F5AC6372 
X-CRM114-Status: UNSURE (   4.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613082544.9meII76EuueQb09JOhAjZvnSWp2Be6WfIOm96C3IEVE@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.14

for you to fetch changes up to 6252a42b0fd70b03aa17c58d218dcabd863cc02a:

  ARM: imx_v6_v7_defconfig: Select the Wifi ath10k sdio driver (2021-06-12 15:42:40 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.14:

- Enable LT8912B DRM bridge and Layerscape EDAC driver support in arm64
  defconfig.
- Enable WiFi ath10k SDIO driver in imx_v6_v7_defconfig.

----------------------------------------------------------------
Adrien Grassein (1):
      arm64: defconfig: Enable LT8912B DRM bridge driver

Fabio Estevam (1):
      ARM: imx_v6_v7_defconfig: Select the Wifi ath10k sdio driver

Michael Walle (1):
      arm64: defconfig: enable Layerscape EDAC driver

 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 arch/arm64/configs/defconfig         | 2 ++
 2 files changed, 4 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

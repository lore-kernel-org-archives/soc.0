Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5968C48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B252861042
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 08:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B252861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpiUKisO/VhpREfj3e2CcuyVCevTkaWyDRUkrYexb+M=; b=tuGJj3ErBJr3HG
	w59UAZXGgHNmQvPc1ItSwbsj0fPTAdPyjLkyQcO4KTpscaKfoENK6LnFmzMqOK2FxnwWmmwn7slDB
	nwn5ciJQ0+Tl4gWXxKI9iVNJvT+zkIV2SQAg25LqwlZo+hxWa0aktQx9tYVwcgF610ppUCPebruoS
	07ifISXZ+Z5WLU52R0T/dF85jQzU+tEqzLHoxHmdtdiEl43N5BgIy/n5MdRtOsVT1KbQN1uyHTebr
	XAnS0edEKDhumPKWHOucBz0J/K1xlgfBYU+ZrWnv8p7TjP4a7+mWVQVwJNuudjd1B0lOTGbOG+ePS
	z+gvJikbeNTaoVRFAJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsLRl-009wRQ-SS; Sun, 13 Jun 2021 08:26:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsLRS-009wP1-8a
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 08:26:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FE706124B;
 Sun, 13 Jun 2021 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623572762;
 bh=jJ0NwJa/BMrRk20HsOC+mQpr9w+f7M7WNwTEQd0hEek=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ge4XTfj7FV3Xj7+KnWfY1lOqI+LdNBZwdDdH9bRtUBxR35CECfolhCK0GQm/yq9IO
 bbUtFUutObOfez7wvNUWw2FvnAkCMOTSGXWOaxP+/EJ1WlXy+YixmCz5g/Sc8PhqdO
 ZbQi17HOOdeR30IG7tv9VWl/QwkKqFpy68kY6Kou8Soqj0924riIXpVhZ0eDGrD9GT
 z/v6iG9vWDuemoKUWAGUQiSLP7HrF4QE6D+XaLQ16fAufGlsBp37X9OdyvZeTuH1Qg
 1MQ7vGFMKeYcjsJGwKmJ2Lx11hZ2N4G66h6zbDAeBtL6dsXI2aybDZ6/BnsqTJb9KS
 XGb5nF4p4knlQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX dt-bindings update for 5.14
Date: Sun, 13 Jun 2021 16:25:41 +0800
Message-ID: <20210613082544.16067-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_012602_338311_2AF13353 
X-CRM114-Status: UNSURE (   6.44  )
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
Message-ID: <20210613082541.UsTEP5sLM4T3in2zuMQCIfDPWKL6-k0be0btiw-8P5s@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.14

for you to fetch changes up to cd044eafd7105275220f6b7140a8a8fb64e0e5af:

  dt-bindings: arm: fsl: add GE B1x5pv2 boards (2021-06-12 17:57:52 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 5.14:

- Add vendor prefixes for congatec GmbH and DaSheng, Inc.
- Add compatibles for i.MX6Q DaSheng COM-9XX SBC, GE B1x5pv2 and
  i.MX8MM GW7901 boards.
- Add an optional 'resets' property for i.MX GPCv2 bindings.

----------------------------------------------------------------
Dillon Min (2):
      dt-bindings: add dasheng vendor prefix
      dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC

Lucas Stach (1):
      dt-bindings: imx: gpcv2: add support for optional resets

Sebastian Reichel (2):
      dt-bindings: vendor-prefixes: add congatec
      dt-bindings: arm: fsl: add GE B1x5pv2 boards

Tim Harvey (1):
      dt-bindings: arm: imx: add imx8mm gw7901 support

 Documentation/devicetree/bindings/arm/fsl.yaml             | 13 +++++++++++++
 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml | 10 ++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml     |  4 ++++
 3 files changed, 27 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

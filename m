Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C02C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 07:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 332C661360
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 07:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 332C661360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBqZvOhr33BlSEVxAy7zXzpkeAljDlNeisbRp9h475s=; b=Thj2M6Tr8v+nLS
	na8Iah4o1kvO2aDVz1jA4fw/j7/0N2YC5UGxp7pdYgQuANsm/cLwmTmmKmy9q3FD/YuJnSJP5VrOX
	9bluwWMOj7MulaSZviz9DNNvgeT37sggcXB3CgE3p79dt+gHAxMEc9u4aqXlkZ/H4XkCMl91KpTzz
	JwsweNPLtfdLE4iW3S/PP3L/T3dOwMROBHmQCqCtpKoKHpIPowq8UKshq1jY+V/g2pW7JSP9I9TUH
	S8m5RFNgya93UOROtQOpVo2SVUBN6v0GAJ9uACyYZX7dOg4g/9mzz4S4YeJhnru006P+/Tg4Cz8d3
	VQrrFF8C/XvgwJqRVQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ZiU-00CYfz-7I; Wed, 14 Jul 2021 07:54:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ZiQ-00CYfc-42
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 07:53:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B21A06135A;
 Wed, 14 Jul 2021 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626249237;
 bh=mbg8J04ooRjG0u3tte7rd9I7gItkVa3cKltqn6+sYtU=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=LEEhUn5SITGAuBD742pvd13yGfnNLi75bv7N1kFLPPfEhmJw4uI/E20LU7jad88JH
 QXxqFXIByrVTNuXmWQQ9Pp9DV7kTCUud+axwi08cDTgwtbLSuP6GvDzkmRI9GmiiXJ
 He8JI4u4DFPynnXfUlbNvHJya8staP7dJtVmmkbaC2k0QEr0XBClu3DU62vCbxlGo7
 CTGsLMWe6i3O/16GN0Et+3b8+UuzpiGfFu8EkRSx/rtiloERuOFoZBxpWpQKZ41Vk+
 tuhLdocBEDs9g3cHqb3YnHkssBziunPcliWii5BnP7rU6eoKdfAKNcOAba63p9i2mY
 FIuacRQvsdLQQ==
Date: Wed, 14 Jul 2021 15:53:51 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add SolidSense boards
Message-ID: <20210714075351.GH4419@dragon>
References: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_005358_223885_D028AD53 
X-CRM114-Status: UNSURE (   6.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210714075351.qnivE6HUGBKM0-ZuTVbvyvdCMbxY4QQGt_LWBdUgJQM@z>

On Sat, Jun 19, 2021 at 04:55:26PM +0100, Russell King (Oracle) wrote:
> Add SolidRun SolidSense boards.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Applied, thanks.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

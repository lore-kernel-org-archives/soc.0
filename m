Return-Path: <SRS0=OWK0=KR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C36C2B9F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 May 2021 12:39:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8F26128A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 May 2021 12:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE8F26128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1M95C80CxsmPbAa8FlkTnW+PtdSLLkXIsRT2/fJxpw=; b=Ue2XIxyzxDmnisLBVgSD9ytETG
	qYhawc/qVlbdG02A0Mrxd1p7+oMjBSkMY9fIM0H1Y9U4bqkI0YL7Svei6fbe2NC/E7/fKSU3wI7xE
	S7f1S/SMc1TKsQulOhvqP/tfpba+lmNIc/Qc/h5LSKRZTxbvBuNy8RfPZauDwyQe4Ko2XsLl0LoCH
	kMO8e5AHB3NRyUiKvogDv1p1UjAXK0/j6EN9liWxfJqkNBu7HZs9H9wRPn22N9gUvxqnHb0WGcK+D
	SPlp3yqNVLZlXlR143cRtmhM1Onzfjf1y8F28H0kBA77a0ANvcUaPHSJ48r47wFKLb42BOAAOrkFl
	/VVs9K7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkQt4-002SFp-CO; Sat, 22 May 2021 12:37:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkQsz-002SF0-TY
 for linux-arm-kernel@desiato.infradead.org; Sat, 22 May 2021 12:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hRx6XS+qCWuCqpislAzxKE0h2mT1asd8qqHX5J5MXX8=; b=H5J7oxgZAW7aBrTF3St8TdRWUf
 U9B0IiVDDRknrZ34QtFI9YB7mtQkGCJCbE6BIi4wShoBlPTd5Bs0b+57X6oyAqmFGhjB7uWODxFLt
 veV34LpC2lihj1+msgqxoY/rTrw7cRWKhNj6H3GKKe7/AmT8oG3b6jRNiN99PAa4/euw4EDFFHh1p
 KOrBYEMFLOPGpO10fkprJp6UcDHXKDW+61KO8diZbId3Zn4lBT2XkXsnZCkJ2UTrmntxg9ZVUgvWj
 MOhZYZIsAAEkfQbQlveI6dth3CVahYjTWHMHkVyrisBNsKPG/FaIm6ZditoCOR84aKRC+GK8Oopr3
 S/5JODIQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkQsx-0006dG-GH
 for linux-arm-kernel@lists.infradead.org; Sat, 22 May 2021 12:37:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 270EE611AD;
 Sat, 22 May 2021 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621687063;
 bh=hPvJRi/4YD//sBf0sK2WpeQ/WH/A56zewUfTgUKlz2A=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=IvFmp7nItbd2K2+6CnXqQV9F6k84vHhKy2yVJXo8PispX5scQ/sm9qa5S6zFaMjcn
 wFO/b6dVJGhEd4AI/UrP3kZQ1ztPepcsIW+zfcv8i5TI9adNT7a2GhLoZvPbUzCJxU
 IU5sJfwuMnqdNptnfJRz8g1106qxDext6UbiP8MoXGtvao/1Bch89fueP4P29+gHm1
 qv8bfMEVSJMKLyfKPPMaFlrHLC0KShmET8jiqD/3TtZXGgVMfSVDapys1giEQ1Pw2o
 PugVh97noHAb/PwnmgXTodZ4NYh0f23xJQQdOpwmzhFzph966LF+Q8HL+RxDFYuIVC
 ptwyfaYuuEAaQ==
Date: Sat, 22 May 2021 20:37:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: imx28: Add DTS description of imx28 based
 XEA board
Message-ID: <20210522123734.GB8194@dragon>
References: <20210518142857.26170-1-lukma@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518142857.26170-1-lukma@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_053743_578098_D6D7613E 
X-CRM114-Status: UNSURE (   7.90  )
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
Message-ID: <20210522123735.8lqW3fUjJC6G5xpfwwgwn8qGpJKgnu-jIXE26vgrXoQ@z>

On Tue, May 18, 2021 at 04:28:57PM +0200, Lukasz Majewski wrote:
> This patch adds DTS definition of the imx278 based XEA board.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Applied, thanks.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

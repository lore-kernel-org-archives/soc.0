Return-Path: <SRS0=AMt0=NF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43D9C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 13:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9482960EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Aug 2021 13:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9482960EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+j2+6jbqnmqoGjF1i9xxstf6nC/6AKLVLiMlr3zrqE=; b=vrJuRgz5I0FbIK
	AA+VeA5mnn90//hPoKlPZVP45QvI7/arNzs/kwkdx4c9QlHWaS8ZcgbB7qJAQZRlHBHM+9UUL7tqy
	L3fClZrjWZjr9mJRGgTg0WUipNqtgDbZe/d6qI43cDXKAZiRVlZGhU3MJMKo+610MVjeiXSkp8MF0
	xVzBfPeyPqU70HHnOHm8EGVIATKjfPZ9z77MUY7Id85N+Kb3SECfjKwclH2WM6B14FRTaLjQH/4Vs
	w1yrHhBCN7xA6SDLjnZM1LgE1EPjlQKG2ZXqL8WAozOa0qf02y00DSCxBJSRRvLT9XbytP8Wmv0V6
	R9LbnLkT298UaNcQ6Uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEtt8-00ECxP-08; Sat, 14 Aug 2021 13:39:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEtsb-00ECtz-CH
 for linux-arm-kernel@lists.infradead.org; Sat, 14 Aug 2021 13:39:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EB7A6103A;
 Sat, 14 Aug 2021 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628948357;
 bh=zHbtbeKUJqo0sHvc4hxV+jhPtYhWxMhgdp6htMvVLyU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nOfRLEL3QXmmmS31BMkeHfC+Wkd9tWI4QntwWjnAieO/JKmZel87RU3gf9Une3O3G
 GVPJBKfIJb3P9BRPy0FDROXdnsDo3l61yy9nR2/h4neUHS48YJ/OP0LQnj/7aKCwFb
 1f+2rHnD3qMk1vhAVFnkneJUhaC66oy8kM4PrMnIiR5bQA+07hR0CJL/DK42Vnl6yX
 X9Gsn2wYSlZ/hRKAXdyqLS+C6ivcVh/gt9s9vXSDNWRlr8cKeekyfsGBRM3rTjVaIY
 L4bBY+5Q/FQEht/VBX01ikxSB9sx20dJr+Gk6T7Sho881M3Q1NF6ypR+B7p4hADuxh
 WYFe2486zq0/Q==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] i.MX defconfig update for 5.15
Date: Sat, 14 Aug 2021 21:38:53 +0800
Message-ID: <20210814133853.9981-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_063917_518613_6755147A 
X-CRM114-Status: UNSURE (   4.73  )
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
Message-ID: <20210814133853.Jx0iLDljuDi-MXYIUTeOCDUeyOhjyH4wv6Gy63SBlf8@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.15

for you to fetch changes up to 7fd19c58e48fb774de9190f27f2b06a6526f2d3c:

  ARM: imx_v6_v7_defconfig: enable driver of the LTC3676 PMIC (2021-08-14 13:38:42 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.15:

- Enable LTC3676 PMIC, SCSI_LOWLEVEL and KPROBES support in
  imx_v6_v7_defconfig.

----------------------------------------------------------------
Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Select CONFIG_KPROBES
      ARM: imx_v6_v7_defconfig: Let CONFIG_SCSI_LOWLEVEL be selected

Pascal Zimmermann (1):
      ARM: imx_v6_v7_defconfig: enable driver of the LTC3676 PMIC

 arch/arm/configs/imx_v6_v7_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

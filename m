Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55DBC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:55:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E05223AAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E05223AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6bnmXwdG9rnjcLzZ2k8REDfaYi9KGy5cgT1UwbqTNJ4=; b=zMTsaKwYRS42gpsAKwlrjWnHm
	qnD/y/fge4nsctfMy0MTh5gRUHSV9+3jwMdYej9QnejbS5d91rmhSWzjOLE8pknRbNEwXmlLPgiKr
	tbmzRT2jjPE9Aw2UPXWlDkGv7SS7L5jCwOS8ef05IRPHrnz1R69d7ZNvgniH3daJI7glNBlNVVEkK
	Xrq+hlPLdc0l0w5hXsg3CxXz5nJo7OTvDWFa0kE5xiJLEdl9qoykr0UM3CraaefxT84JFEyeBP/kJ
	KAm056QHk7Qn/ddRVm0juzGEi1UGMzu9UhnGzfPlO5kp8F3GtUZW8x+I5Zxxi0BbpOXP2r2amHL/X
	1QyHW7CYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l35Jh-0003Km-JM; Fri, 22 Jan 2021 22:54:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l35Je-0003K2-C0
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:54:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B22723AAC;
 Fri, 22 Jan 2021 22:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611356045;
 bh=BFX2HYev1d6TjynEtQaOr/i6Ffu/KsVhtXwLDJpBj0g=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gGx+O32ys9uN5xc/ukmkcN8JGi/HxUhOUV0/z/WFAsUEkrtBeoOq1bhKiesyUzraD
 ch4RzxiyX7AhvzrUHpSIzKPGrHqZC++m6Ne2W+gNIE75hlhwETYWfkaDJsAindtkgT
 U/DVlj5YLevKDk5YkFz9pKC8HVEOdXHtyNe07Suev375jEM33ciUGHRCKzJ/kSSYzd
 XohtRiRryVRMkkGfnslNMqJGwn1jFX+NOxYKk8dgE7zi98tDbiNMptGhmNnBpMsuHQ
 MP1+jmES8q+UGuliYgyUqljBMbACxobftmJJgE9863lrLTjgzxOU3BtDrnbn1vMewS
 nkTFt5m9PDZ4A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Subject: Re: [GIT PULL] i.MX fixes for 5.11, round 2
Date: Fri, 22 Jan 2021 23:54:01 +0100
Message-ID: <161135603548.1322254.3404706975452422521.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119091949.GD4356@dragon>
References: <20210119091949.GD4356@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_175406_482067_79143C41 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122225401.ilBJprn0RGbaCVf-LXLR8g-9tdJ_y29pKz8_0XekwaU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 19 Jan 2021 17:19:49 +0800, Shawn Guo wrote:
> The following changes since commit 5a22747b76ca2384057d8e783265404439d31d7f:
> 
>   ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-2
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e49c24c8cd00ea9d7471520fff562fb4e7e9f61a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

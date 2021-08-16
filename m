Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F2DC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B0F60E97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2B0F60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfpGmPY947kUo5aGH0yRZIBYFQ3SGwS4naujXAwIEjY=; b=JCL34hkaI13gZX
	FVyrAEpa9q6D7jWXL/CwtQP27SPQW70o/HGaETBnBq6k6S0H12ut9am9ccnI6IIQj46jvlqrxTTtg
	PHjpC2fYur7g+kDl5mYSZKEefb75D1GIAQe0Sk59YYiO/ZXHBK9ghPiN5niivTK60XN2+tvWoOkWE
	rQPHGeYW8iaqEyFFNqYNRe4u+zEYfYrj9Nmxqhb8i5kpqblDj9Uifv51eR/YgfkdOqEHU8OBbQDX/
	8ond37YKtpUvlSSsNypRArh1dpJ2x0dzma8QWtiw2JyY2EqrTgH152qAzuJs7cbRk+dSH23RaPaom
	R8mGSgtZ1PJnXBwXIhzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk3y-000Kv1-Hj; Mon, 16 Aug 2021 21:22:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2a-000KOR-V3
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:21:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B887C60E97;
 Mon, 16 Aug 2021 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148864;
 bh=Vf5zjb4Z1qIlo36eCK7cNzo8Q3QPU2Z5sOLdOAQnjsI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QtyknsGc1Rl4r8+b6N2pzG33gCMLu+kw+Q/A3fBCJ3shyo5dMZHiU2UqO1Q+WBVVw
 FOO7YTsxQm7qWSsakM9AUin18GkNQb79k3HSrNXaCYhAE3D0dz+m6d89b3UuJj2OvX
 9zT/Bmo1nUZec98Fw5GVK4LJtfAbwdTswIfl1lZt8HiVVxqO2raJbZ3U0iCGNb0AXB
 DAJVUBZgLegueN0rhq1leHT8ULyhv5u5S9MbBTvyImJ7QdB9kj6rN3NlkZ4TsqrWA4
 4dull0L/VjQYH7B4PKUEXbAtCCQgA3qLGQEuDqOnDAOs/9FHeYBiR7WCfM4EYD33ZS
 9OMNY9sOMbBFw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com
Subject: Re: [GIT PULL 3/4] i.MX arm64 device tree changes for 5.15
Date: Mon, 16 Aug 2021 23:20:51 +0200
Message-ID: <162914852275.237905.12467380733542319999.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-3-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
 <20210814133853.9981-3-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142105_069562_61B7859C 
X-CRM114-Status: UNSURE (   5.90  )
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
Message-ID: <20210816212051.LrR9USzBvsP4S8c2hdz3CgdAd53-WWwoxxnESJsWeJU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:52 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 6d640913126db109f2e3389173f0fe42413a8183

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

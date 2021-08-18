Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FFCC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 752D56104F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 752D56104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lyb8+2Sc8yMrkwzPzsQWLViISuxFAfDthNCHmkAMkHo=; b=p8tj6oPhX8NE6k
	tpK51yO2hahI0gEcs8iJEfPCL1Ew8hZ4Nr6YztBLX+D225TZW5SMKvaO5WZUE636wBtBTcdN49drX
	jRFVANqJld9VHh8zxskyXkPu2EjPq6PqjcMQpj3orFGqNx6fb/Ud0d1si/PPn2UYcW9ochAKFtbrM
	O1N+ikydRWShIbuhC/af942fKy7sK9hggjb7aewsMMbGNpkYCS5MQ1o0joPmvdIZL4KY6BpnNoqqf
	DV82e9jLrp/yviEqlS4ZwmT3dTXoklXP0j8xZbyVZyqLw7TkgSR8wKETd1yIUbBOAVOIiHyXlEPXg
	873E4JjBGRyqEywvsNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLqr-005kDa-2l; Wed, 18 Aug 2021 13:43:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLqn-005kD9-7r
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 13:43:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D2C26103A;
 Wed, 18 Aug 2021 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629294204;
 bh=osQK9OGP8q6iI/2T3iNZcXe3HDO93vfu/OQwZ7g6PR0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cCJwlaSSYg07dbCzLyItTS6Qn6pPq31AL64y8okB2Emo/l9MoCFPG7/EhK402s3C4
 K4MvTp13fOsoIvRSuPAeDMzJJoAWrmKmI0fmmfmoYQjg0qRBljmwxd+9si7kMCLudx
 m76ZqigEzhitrhZ0n07z9nHCsW76JFxbTJP0JcqbqULgEWXo7WOcY388azInPKgqGS
 MPJD59oVvsc1DRI7TPBFC6IyKGI0ITbrDdOsaMdJQbfeUYUsZrbIOBM1iBGCk4uUm2
 s8iJmpQAXCtFHFkX9uD/Gu3FA9/dKnnrRg45v6UVE0bH1jh/87/SQfM6DP6qVPhIGG
 fyoXBa8SxLDsQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Imre Kaloz <kaloz@openwrt.org>,
 Zoltan HERPAI <wigyori@uid0.hu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Delete IXP4xx boardfiles replaced by device trees
Date: Wed, 18 Aug 2021 15:43:21 +0200
Message-ID: <162929419377.379314.14504743675400378814.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
References: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_064325_342531_94EA4954 
X-CRM114-Status: GOOD (  10.90  )
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
Message-ID: <20210818134321.wbygnqiqRwasy_6pGLskNrA0OseyICSLTxJKtFg1EH4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 15:14:01 +0200, Linus Walleij wrote:
> this concludes the first big chunk of IXP4xx cleanup and DT conversion
> by deleting a majority of the boardfiles now supported by the device
> trees.
> 
> The details of which boardfiles are deleted and the two that are kept can
> be found below. The idea is that all devices except the Omicron ones
> will keep being supported, but as device trees. Omicron has publicly
> stated that they have no interest in keeping supporting the boards,
> if someone anyway steps up and need them, scratch device trees
> exist on the mailing list.
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 0fbd7409446a8ee76ee701ec846ede917c6c89fa

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
